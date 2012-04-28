Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOHRR-0006Kb-Ie
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 01:52:41 +0200
Received: by lbbgo4 with SMTP id go4so1234451lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2012 16:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=dYM5HpeGp573QOItoKAUmQHj9uyxly1Tsdc/L59t39o=;
	b=ILsElcJd67D9CCwHms22fUMq6m5Ckr6Ibgl4o5jaN/SHSFJ0t6A5ketdOwPmRJrSVQ
	WR1E/Ne5c2S7/EkF7OTlc89PesszFnMGf5nldp3S8BcIHiWBYKNgdlRQAP+kAaAzO0ol
	VkztS+X4v2EgbecgGCqLJath2YbqgANnOQTDUXbJDV8mUQQWI3nxbRs0PIJe9D56PUJQ
	nhW0mbuLeMHjxxG6UE1lBARuZC3Z/7vz6EAXXW4MGsK2pVjkWXBZ/0yJKAMavuNn64wK
	BEjFeWEYdCeffkteuBKXNTr0wmLZBbGiaXM53jA/rnw/WkLbwXd0hoIw3w2rMBua5mDa
	G5CA==
Received: by 10.152.111.198 with SMTP id ik6mr15326256lab.38.1335656581471;
	Sat, 28 Apr 2012 16:43:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 16:42:31 -0700 (PDT)
In-Reply-To: <f63a2f437adc71fbb9c622972a4137fc766bfed9.1335571265.git.peter.seebach@windriver.com>
References: <cover.1335571265.git.peter.seebach@windriver.com>
	<f63a2f437adc71fbb9c622972a4137fc766bfed9.1335571265.git.peter.seebach@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 16:42:31 -0700
Message-ID: <CAMKF1srEuuB2kfJsQWET1OZ1d32ZgLKqGMqoAAP+u+gaYJRA5g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: v2 [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Sat, 28 Apr 2012 23:52:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2012 at 5:01 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> + =C2=A0 =C2=A0valid_tunes =3D data.getVarFlags('TUNEVALID') or ""
> + =C2=A0 =C2=A0conflicts =3D data.getVarFlags('TUNECONFLICTS') or ""
> + =C2=A0 =C2=A0split_conflicts =3D {}
> + =C2=A0 =C2=A0for feature in features:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature in conflicts:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature not in split_confli=
cts:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0split_conflicts[=
feature] =3D conflicts[feature].split()
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for other in features:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if other in spli=
t_conflicts[feature]:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tu=
ne_errors.append("Feature '%s' conflicts with '%s'." %
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0( feature, other ))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature in valid_tunes:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(" =C2=A0%s: %s" % (fea=
ture, valid_tunes[feature]))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tune_errors.append("Feature '%=
s' is not defined." % feature)


can this piece be simplified. ? may be using sets or some other python cont=
ructs
I think its quite difficult to comprehend for me whats going on here


