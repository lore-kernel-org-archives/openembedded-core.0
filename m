Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE290CE7B18
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:48:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.35469.1725630528507995862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 06:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cWemy2Lx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c5bab490so1888263f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 06:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725630527; x=1726235327; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BroRi5dXdrBAVNtXcKxF4JoRIs+Z3iJxM9e6h5d85X0=;
        b=cWemy2LxUM6D7PIqn+tg2q2bqpdS4R1HkucHU/aBhTHDA4yAfzUdzgG5v3IX+4rylJ
         7IvNDsMSZqSYESSLOubkKP50FSfG891qDksQ0GyCPEzJ9GhbR7yHJ2mvJysPcI83Bxua
         ikw09J1f87tBjLmKM+92Dfp/MRNm0NOFr6Bqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725630527; x=1726235327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BroRi5dXdrBAVNtXcKxF4JoRIs+Z3iJxM9e6h5d85X0=;
        b=ejmODLybHGkOWn2QjyN1FmxrYG1vsEPoYhVME6jZuQZVOdAhGtcSJoWyb+dwItZ/A0
         qGKE2iVPlo4MlThqmxdnP1ru1nWNMAlHUDZR6/jUm+s8ObpdhMGfiDfdeNX/wDjtpsKJ
         X8UVZ6oYCPJAU9XRDMnEoxwYgRIze+uELT33GXT7B9BFNw4wIXxJbZt/rCpLTFo4d7xG
         G6NhJHjbIFR8xRfqXG7D1+58owlhOfjMKFgaBfLO/FGd3AmnT6gnKg4ynWIPMMYj7Wgs
         dmHnledQluti3JGJwRbk/e78Khs0itDv3taSaBaC6X68gz/+Km9ZgkYqp90R/u4l6TdL
         JbGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtbzc6mA4WPhQLhCA2dmpcZ1Uomvura+jDnmEd6ffa346uEdXIFETVhjGbJu0UoqEm0oli07mE3w0KUApaHtTJVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy31E5yIKTjRHZeQZBYEptb2DwUwyuRD/lfuwesaVpXUZPASJ5K
	9deBxe18UA864PnP0gW/aBBlBIqeOtBPYWCFUFYNLPYCdbVVJ74wRVi9qsYhdrBSdXo+o1dAroY
	R
X-Google-Smtp-Source: AGHT+IEkzSHfadCB2T2XAFwd8P4OLZBnGHJ3dt+Irw1iT0rQ297y8HtBG8NDBrb5vViO9+evOG4ajQ==
X-Received: by 2002:adf:fd92:0:b0:374:c878:4519 with SMTP id ffacd0b85a97d-378885c049cmr1629093f8f.3.1725630526610;
        Fri, 06 Sep 2024 06:48:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f86:8879:5d66:675c? ([2001:8b0:aba:5f3c:3f86:8879:5d66:675c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-377a662aea3sm6479679f8f.11.2024.09.06.06.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:48:46 -0700 (PDT)
Message-ID: <fd756f4b5ce0b3b2dc38813469a0224047f99a09.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master/scarthgap PATCH] meta-ide-support: Mark
 recipe as MACHINE-specific
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul.barker.ct@bp.renesas.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Sep 2024 14:48:45 +0100
In-Reply-To: <17F27A4142F288D2.30374@lists.openembedded.org>
References: <20240905202102.565-1-paul.barker.ct@bp.renesas.com>
	 <17F27A4142F288D2.30374@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 13:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204268

On Thu, 2024-09-05 at 23:40 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Thu, 2024-09-05 at 21:21 +0100, Paul Barker via lists.openembedded.org=
 wrote:
> > meta-ide-support:do_write_test_data dumps the bitbake data dictionary t=
o
> > a file using export2json(). As this obviously includes the value of
> > MACHINE, and other MACHINE-specific variables, the recipe needs to be
> > marked as MACHINE-specific.
> >=20
> > Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> > ---
> > =C2=A0meta/recipes-core/meta/meta-ide-support.bb | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-=
core/meta/meta-ide-support.bb
> > index d85aa120c08b..7ed422ce4ddb 100644
> > --- a/meta/recipes-core/meta/meta-ide-support.bb
> > +++ b/meta/recipes-core/meta/meta-ide-support.bb
> > @@ -1,6 +1,7 @@
> > =C2=A0SUMMARY =3D "Integrated Development Environment support"
> > =C2=A0DESCRIPTION =3D "Meta package for ensuring the build directory co=
ntains all appropriate toolchain packages for using an IDE"
> > =C2=A0LICENSE =3D "MIT"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > =C2=A0
> > =C2=A0DEPENDS =3D "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qe=
mu-helper-native unfs3-native cmake-native autoconf-native automake-native =
meson-native intltool-native pkgconfig-native"
> > =C2=A0RM_WORK_EXCLUDE +=3D "${PN}"
>=20
> Something about this is making our toolchain tests unhappy, e.g.:
>=20
> https://valkyrie.yoctoproject.org/#/builders/42/builds/86/steps/12/logs/s=
tdio
>=20
> I've not looked into it at all, just reporting what we've need to fix
> in order to be able to consider merging this.

It can be fixed with:

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selft=
est/cases/meta_ide.py
index ffe0d2604d1..5a17ca52ea1 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -20,8 +20,8 @@ class MetaIDE(OESelftestTestCase):
         bitbake('meta-ide-support')
         bitbake('build-sysroots -c build_native_sysroot')
         bitbake('build-sysroots -c build_target_sysroot')
-        bb_vars =3D get_bb_vars(['MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE=
', 'COREBASE'])
-        cls.environment_script =3D 'environment-setup-%s' % bb_vars['MULTI=
MACH_TARGET_SYS']
+        bb_vars =3D get_bb_vars(['MACHINE_ARCH', 'TARGET_VENDOR', 'TARGET_=
OS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
+        cls.environment_script =3D 'environment-setup-%s%s-%s' % (bb_vars[=
'MACHINE_ARCH'], bb_vars['TARGET_VENDOR'], bb_vars['TARGET_OS'])
         cls.deploydir =3D bb_vars['DEPLOY_DIR_IMAGE']
         cls.environment_script_path =3D '%s/%s' % (cls.deploydir, cls.envi=
ronment_script)
         cls.corebasedir =3D bb_vars['COREBASE']

Whether that is a good/right fix, I'm not sure...

Cheers,

Richard

