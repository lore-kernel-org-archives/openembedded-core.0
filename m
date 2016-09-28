Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7889460602
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 16:24:25 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id u134so62595439itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3QRKfechhciGO7aAJ2ouAGJgMpuwySy73YQF/9wu4OQ=;
	b=IKumXJO14I3UB++8905Dutjjg+wD8vABFUIWaxEgTBxV8SglFvScKL6l7zy1eSxcoU
	cub0bxX161LZGw6vSBp3boLFVCuPxStdr9RRO6n/VY62DRVUmMYY9AmwWyjLMcbt31lD
	Asvw4e96xsCAbBwEV8citrUAFwe5A+9F4/DcgwzduZHLua5w4saifZSpt/iWGaVdBA56
	P7PeLj9oQgGDFOV4uBrJjXREDkqmUpWCvR1lnftCpcekWkYLEvWlJs0XthieFttP660Q
	rkf6oTDgV8Ednzu5JgXgNJtA5R6lqkgHz+VZsNnz0bx60wnrJQbL2vjPtN09yQEj5TTM
	AbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3QRKfechhciGO7aAJ2ouAGJgMpuwySy73YQF/9wu4OQ=;
	b=DgWRGGZGWpzPvmD5c5s/+AGEZWWJU3jWbUMG0snHIPL4uqsFk2ZtOQvCE/1oC1YBWm
	eDMiB8K6+GquBQ6e3ieySEfVzOvJEbxfz4TyhJCvidYWYsb53pdx2hDmey7/FI01T098
	tAsnOJaFWpgiF7irukr3w0zak+DnTALByCBZ1Iyq/enNGE6WHt7yCrZQSR8hQCQqSk6N
	rWQwl9WqsQsDccDqwPJpJ8AkLvmTwFLm0AXvtgg7vFLlqfPTqz3BArdMMX/gQfM49dyS
	yOX/cnIr6dkSF+KvnD2dkuJUv+HuUkQ/mnZ/rfpLKSErmu8cEZormN0e+Q4vxwJel6rY
	mtOw==
X-Gm-Message-State: AA6/9RmsMMxR326JP3UHsa1X1We3l7RedeGEV96eBiy8sp4mkAV4BnLzk+cU3e2mfI+S/FdT43m5QimHsqbgnwRq
X-Received: by 10.36.25.14 with SMTP id b14mr3201332itb.29.1475079866839; Wed,
	28 Sep 2016 09:24:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 28 Sep 2016 09:24:06 -0700 (PDT)
In-Reply-To: <1475078770-26139-1-git-send-email-anibal.limon@linux.intel.com>
References: <1475078770-26139-1-git-send-email-anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Sep 2016 17:24:06 +0100
Message-ID: <CAJTo0LbTrb=-boXa+p6oWxvu9RS1V6hMPKrXBFOOHS0yTmv+Og@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: 00moses.alexander00@gmail.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] db: Upgrade to 6.0.35
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2016 16:24:26 -0000
Content-Type: multipart/alternative; boundary=001a1144b0c47aa9e8053d93cbb1

--001a1144b0c47aa9e8053d93cbb1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28 September 2016 at 17:06, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.i=
ntel.com>
wrote:

> @@ -18,16 +18,15 @@ RCONFLICTS_${PN} =3D "db3"
>  PR =3D "r1"
>

Remove this PR please.


>  # Note, when upgraded to 6.1.x, a patch in RPM will need to be removed t=
o
> activate db 6.1 support.
> -
> -SRC_URI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz \
> +SRC_URI =3D "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
>

What is distfiles.gentoo.org's policy when db-6.0.36 is released?  Could
the tarball be deleted the day after we release?  In general we've been
either using snapshot.debian.org or pointing directly at the
yoctoproject.org source mirror for tarballs we can't rely upon over time.

Ross

--001a1144b0c47aa9e8053d93cbb1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 September 2016 at 17:06, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt=
;<a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.l=
imon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":2md" class=3D"a3s aXjCH m157718b82bf8531b">@@ -18,16 +18,15 @=
@ RCONFLICTS_${PN} =3D &quot;db3&quot;<br>
=C2=A0PR =3D &quot;r1&quot;<br></div></blockquote><div><br></div><div>Remov=
e this PR please.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":2md" class=3D"a3s aXjCH m157718b82bf8531b">
=C2=A0# Note, when upgraded to 6.1.x, a patch in RPM will need to be remove=
d to activate db 6.1 support.<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://download.oracle.com/berkeley-db/db-${P=
V}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://download.oracle.com/=
<wbr>berkeley-db/db-${PV}.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"http://distfiles.gentoo.org/distfiles/db-${PV=
}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://distfiles.gentoo.org/=
<wbr>distfiles/db-${PV}.tar.gz</a> \<br></div></blockquote></div><br>What i=
s <a href=3D"http://distfiles.gentoo.org">distfiles.gentoo.org</a>&#39;s po=
licy when db-6.0.36 is released?=C2=A0 Could the tarball be deleted the day=
 after we release?=C2=A0 In general we&#39;ve been either using <a href=3D"=
http://snapshot.debian.org">snapshot.debian.org</a> or pointing directly at=
 the <a href=3D"http://yoctoproject.org">yoctoproject.org</a> source mirror=
 for tarballs we can&#39;t rely upon over time.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1144b0c47aa9e8053d93cbb1--
