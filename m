Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 606FE7D995
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 15:28:38 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a190so10265765ite.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nmTh5YijYyUGjQzqBVmq1xz+TpexE7ECfYFdOPmqPlw=;
	b=yzuBRCeTplxfYbDMJJ+ZBbJmKyRcTCuYT0azrh55F/wk/9D1Ff1dqGOk8SUJq31NS9
	yrISRydEGi3fok7i9vLv3bLRWmChWFj/clqS8IY0Glw01EyfXPA3yvBD/NdgxGN06IxU
	syNVe36doFBG5wYnqxHo75Dg6Jo5HgJ0TrDj4423BbCFljc/Hw/NFrq9HFkp9mqxRZcx
	/WshtrT+QF40day0cllLDFrSIz+OyUC6Ja6d18seRi22VPcY0OXNZ7V9l+w37kycJyE6
	phDGZR/FmoEu0ONCI6M2Yvz7Wu7IfaIIAUxIlMvJMsncFSIDnX/r0eJaW7T6w1CwzyXY
	FYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nmTh5YijYyUGjQzqBVmq1xz+TpexE7ECfYFdOPmqPlw=;
	b=LkvswtYUdlsdzg5yDBtG5J2bd7RghC5NfEZXWAVqXyeZZmUd+9HrbXYfolRHBe3s1D
	QNLyphrxBoxplhZOoxDfBBoSG45MUEoKYYUNwYoBD01aiK/psWbPGAoiAy+guzh+9efN
	94mUfb15v+rhDoaMPloVjQh6mypttU5oPHBON1ZzdsecwOkIOlZhqsB+1e4oajc9LeQy
	54bKa+jjgmSWAmiA7rB3m+X+mIyfico7QPQuvio7JTR9nlRZ1zimMm5sFDWKv9YDzzlg
	66zoj5Ew0nQfeMUyt6LjScweecS6ElPeAcoNktlxtFxCuHgEZGWZmFyK8C/BZAIlhaes
	0t9Q==
X-Gm-Message-State: APjAAAXZltsscc7CiAFPUyjqCT2QWx9HpquDd9V1YPFpJg0cTWcVp5z/
	ZAqPEMyE8O9DfpEmhqmZ9OwTMoykF96WXC1wrtSU6B5W
X-Google-Smtp-Source: APXvYqxuTH1rmHIXc01r3mHoO/NWz2ycwV33+vGhgEBBNC1uV7i7RhDQIqGU57H0dOAak4EyPYn5GfVgV8tTZ86T0oE=
X-Received: by 2002:a24:ad2:: with SMTP id 201mr7942449itw.26.1556724519371;
	Wed, 01 May 2019 08:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <eb6e23843ff14f079f0218e579894f31@mtkmbs06n1.mediatek.inc>
In-Reply-To: <eb6e23843ff14f079f0218e579894f31@mtkmbs06n1.mediatek.inc>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 May 2019 16:28:28 +0100
Message-ID: <CAJTo0LbPQo6RDo02=rS+pJLJ5y22VHwQbgjJ6zLa35m59KDVPg@mail.gmail.com>
To: =?UTF-8?B?U3RldmVuIEh1bmcgKOa0quS6jueOiSk=?= <Steven.Hung@mediatek.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] musl: fix build failure when ld-is-gold is in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 01 May 2019 15:28:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you send this using git-send-email so that your mailer doesn't
corrupt the patch?

On Mon, 29 Apr 2019 at 09:36, Steven Hung (=E6=B4=AA=E4=BA=8E=E7=8E=89)
<Steven.Hung@mediatek.com> wrote:
>
> based on the solution: http://ffmpeg.org/pipermail/ffmpeg-devel/2018-Apri=
l/228246.html
>
> Signed-off-by: Steven Hung (=E6=B4=AA=E4=BA=8E=E7=8E=89) <Steven.Hung@med=
iatek.com>
> ---
>  ...branch-to-PLT-in-THUMB-2-not-support.patch | 34 +++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl/0003-fix-conditional-bran=
ch-to-PLT-in-THUMB-2-not-support.patch
>
> diff --git a/meta/recipes-core/musl/musl/0003-fix-conditional-branch-to-P=
LT-in-THUMB-2-not-support.patch b/meta/recipes-core/musl/musl/0003-fix-cond=
itional-branch-to-PLT-in-THUMB-2-not-support.patch
> new file mode 100644
> index 0000000000..e1aa126b85
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0003-fix-conditional-branch-to-PLT-in-T=
HUMB-2-not-support.patch
> @@ -0,0 +1,34 @@
> +From ee3d6b0f35ec4e71cbc2ae4d1a7561f9cb27d51f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Steven=3D20Hung=3D20=3D28=3DE6=3DB4=3DAA=3DE4=3DBA=3D8=
E=3DE7=3D8E=3D89=3D29?=3D
> + <Steven.Hung@mediatek.com>
> +Date: Mon, 29 Apr 2019 16:25:17 +0800
> +Subject: [PATCH] fix conditional branch to PLT in THUMB-2 not supported =
yet.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +based on the solution: http://ffmpeg.org/pipermail/ffmpeg-devel/2018-Apr=
il/228246.html
> +
> +Upstream-Status: Pending
> +Signed-off-by: Steven Hung (=E6=B4=AA=E4=BA=8E=E7=8E=89) <Steven.Hung@me=
diatek.com>
> +---
> + src/signal/arm/sigsetjmp.s | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/signal/arm/sigsetjmp.s b/src/signal/arm/sigsetjmp.s
> +index 318addba..1ac79293 100644
> +--- a/src/signal/arm/sigsetjmp.s
> ++++ b/src/signal/arm/sigsetjmp.s
> +@@ -6,6 +6,9 @@
> + sigsetjmp:
> + __sigsetjmp:
> +       tst r1,r1
> ++#ifdef __thumb2__
> ++      it eq
> ++#endif
> +       beq setjmp
> +
> +       str lr,[r0,#256]
> +--
> +2.18.0
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index 1e324804e1..779e1dc751 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -15,6 +15,7 @@ PV =3D "${BASEVER}+git${SRCPV}"
>  SRC_URI =3D "git://git.musl-libc.org/musl \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.pa=
tch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-t=
o-l.patch \
> +           file://0003-fix-conditional-branch-to-PLT-in-THUMB-2-not-supp=
ort.patch \
>            "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.18.0
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

