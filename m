Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SAkIB-000404-BX
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:51:11 +0100
Received: by qcso7 with SMTP id o7so1363442qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=8Z7YLg4PHjQsoWSPWZlNL7IJSfn6GSNipvrONREKzvQ=;
	b=G//KnkQVuwEzTqwexAFkQeuDECe91rMbrxNszunVgQBa3ccBRRWHbuKSt796nRADmd
	5H47fn4ExL7qscIkS71B7yvS8dOW/H12KXZozdh3JLgw9J89qPiVqVpe9zE1KXmjD6M3
	2DxXLp0drugc3CkrQjEXFzHJ6ws8dz7UijnivXpkluwa2zhW13apSKSMXyA9eUnJmg1F
	UbFqABp47jpoFVPEu7+aWz5qcny9XG+Cp48w/394/HsinPegd6Y6SSq9+/rIjZGoEY+1
	Gnaa+++gdijHzZyAoWRJv/c4oA0n89Ex41w67l5I4jScYmgFiJt7f48kEohqj9RQDQhY
	03EA==
Received: by 10.224.205.130 with SMTP id fq2mr11396569qab.53.1332430936077;
	Thu, 22 Mar 2012 08:42:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.103.147 with HTTP; Thu, 22 Mar 2012 08:41:55 -0700 (PDT)
In-Reply-To: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
References: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 22 Mar 2012 08:41:55 -0700
X-Google-Sender-Auth: a9_F55gYaBATdsvKVe2XsYsz9yc
Message-ID: <CABcZANkO1Ns=1S_=nVPNxmfEPO8UrmPLQNaH+q_2V28kTWrE7Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCHv3 1/3] buildhistory: remove duplicate entries from dot graph
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 15:51:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 8:25 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps=3D`list_package_d=
epends $pkg | sort | uniq`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps=3D`list_package_d=
epends $pkg`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in $deps ;=
 do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |=
 sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |=
 sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recs=3D`list_package_r=
ecommends $pkg | sort | uniq`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recs=3D`list_package_r=
ecommends $pkg`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for rec in $recs ;=
 do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "$pkg OPP $rec [style=3Ddotted];" | sed -e 's:-:_:g' -e 's:\.:_=
:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "$pkg OPP $rec [style=3Ddotted];" | sed -e 's:-:_:g' -e 's:\.:_=
:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> + =C2=A0 =C2=A0 =C2=A0 cat ${BUILDHISTORY_DIR_IMAGE}/depends.tmp | sort |=
 uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
> + =C2=A0 =C2=A0 =C2=A0 rm ${BUILDHISTORY_DIR_IMAGE}/depends.tmp

{
    deps=3D`list_package_depends $pkg`
    for dep in $deps ; do
        echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e
's:+::g' | sed 's:OPP:->:g'
    done
    recs=3D`list_package_recommends $pkg`
    for rec in $recs ; do
        echo "$pkg OPP $rec [style=3Ddotted];" | sed -e 's:-:_:g' -e
's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'
    done
} | sort | uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
--=20
Christopher Larson


