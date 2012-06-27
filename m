Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjuYK-0001eH-Oa
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:53:12 +0200
Received: by eaal1 with SMTP id l1so467139eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=cYocdz/SXvCTwO+eeP66Uz7IUcWbdGw+07i4cfGXdmU=;
	b=dcNbVD+qMxx41jrf11CxAs8/RcRzppG7vBWCABu8Vh8PKM2WuMO8T/CKhGOArOvdZr
	685THTvKZiXTbIr1AN3skY1jENDYGMGd3xNZYZEI9n/qQD1Mo/hj6596XD32fdN792F7
	YYqUQFtjkDBbDJ/86oiRLmIu1V7/DjL2neJBe2gc+oQRGaEAPEgbl0ZqDJAGIhGXHLlM
	SK5BOyJB/1ZP7A13pbb/hEJtj7aB0DzHWJdvU3h2dy4x05BToRnrRAeNVPWk7BexA71H
	vSIHQwGNlDbroD9PcjJqlQBLOXmO/YICgdeOdYuLaqsCM1SdBUllerqswewwcl9JcG2A
	mSxQ==
Received: by 10.14.185.137 with SMTP id u9mr4425639eem.220.1340811739182; Wed,
	27 Jun 2012 08:42:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Wed, 27 Jun 2012 08:41:49 -0700 (PDT)
In-Reply-To: <1340780976.2886.1.camel@x121e.pbcl.net>
References: <CAF1ZMEcMxTQUhyHdmMWV_PA6TY=RTz9rq-EahKU0p=DFFPw+Ew@mail.gmail.com>
	<1340780976.2886.1.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jun 2012 08:41:49 -0700
Message-ID: <CAMKF1sosEdtYD57EAc_D1Ap67cpadnYhgBqMQ_pohspn3ehEfg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bring mipsel support (little endian mode)
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
X-List-Received-Date: Wed, 27 Jun 2012 15:53:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2012 at 12:09 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-06-27 at 14:25 +0800, Dennis.Yxun wrote:
>> =C2=A0 =C2=A0for mipsel we also have to filter out -march=3Dmips32, prev=
iously we
>> only handle mips (the big endian?)
>
> Why isn't mipsel getting the mips overrides? =C2=A0I believe it's meant t=
o.
> For what it's worth, mipsel (generically; I haven't tried qemu
> specifically) does seem to work fine for me without this patch.

if you are using 2.15 it uses the compiler to generate syscalls for all abi=
's
and you should get errors. TARGET_ARCH is in overrides and for mipsel
its set to mipsel and for big endian its mips therefore mips should
not appear in OVERRIDE lists.
I and curious how it worked for you

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


