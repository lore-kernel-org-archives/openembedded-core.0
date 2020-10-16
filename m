Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.10345.1602835319351184915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 01:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wd0skJhy;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id md26so1795488ejb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 01:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2S5YOzGYS3kO4V9nKv+n06X5eKXKF3aXj1EiqQ46ejQ=;
        b=Wd0skJhy/Sm/B5K+wySUZxrz/RCZcylVh1eSn8GQZ+TvHx11Rrdfv9guDhV0pPLPmn
         pBaJQCdKGodPqpp5Xhdd8SUX8dfIEsJy42KdwGBIPcbV4sbdtTCTq9r7Yz80ZXvP997n
         rw3V+FQl3nWGuGD/jsULDZle2p9jDAgmt+3Nu80LOW13vOGib+qd8NaZkiM/qeB5FwFn
         vCAJoMd8XjIXaT2ZKXVGVtTpVsv0VSW9/7PWTujfBQuyTIY8h/v9kgTgxPNRyMUYEIhC
         T/Xnw/qzkaKj8EKxE279UL4inVDzgzf7Dn7MrKroH1HfY5U7clC9eq4FL0/3XvUnoEHa
         5VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2S5YOzGYS3kO4V9nKv+n06X5eKXKF3aXj1EiqQ46ejQ=;
        b=ueukJoMz3FzZQWJW5Tko4p6htWTZy0/JmhMvELFAFphdlIu5BmSaHsdoU3gvSM3WO5
         mVBqQZSHYjXmgY/+BxtPgcGiQvhGPFFc+K/dlyPYN+NNUG4O3w3PIeHajHQQM4mkxQHh
         as5YQxKkzr7n/3WMBGoidsech2DozUp69o4ZFhggZgvPS3WwNJq9fOS9EQoDBZ9c7CYf
         JvHWh5eeRNH8miJ8D/agvacKDktWTx01boOC1uUHI++kNU3W+KTyFdq+MxQwjAnjziip
         39FuiYHNaGDXeEJ2DgBBBDwtUEH/uCTjy1K/NGbj3McZ5h2axyFp7yCEllcNTK4usR8x
         3v9A==
X-Gm-Message-State: AOAM530lzbN+3qOhUQMi+RR2BXnaZij0QU+6p53OxVa7VsXqvdfsQuyj
	oPysz1SbFABRk9yCY7zaHfYlxnNIo5BgmHwhsc4=
X-Google-Smtp-Source: ABdhPJxPSTXeRbRBAwlnBJTZp9vvON69Z1S56kGU+eu7olERoQzz0kJxpinIIaIGVDxv0YCB9nJCIo4W3CZzqIbufAk=
X-Received: by 2002:a17:906:a454:: with SMTP id cb20mr2514661ejb.137.1602835317594;
 Fri, 16 Oct 2020 01:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201012213137.15179-1-pkj@axis.com> <CA+chaQf-4692XTUAiguks3ZmGg7mLXDeFbPsn-mjLRRCMcEfQQ@mail.gmail.com>
 <0aec3831d3ff64f9848512740a7621456ac45fb8.camel@linuxfoundation.org> <163E22305B9C588F.27068@lists.openembedded.org>
In-Reply-To: <163E22305B9C588F.27068@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 16 Oct 2020 10:01:46 +0200
Message-ID: <CA+chaQedFbN5-kVkNkNTHUM=0Zv2yJUOcq7VX8Y=_Sua3sawyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa65.inc: Correct TUNE_FEATURES_tune-cortexa65
To: Martin Jansa <Martin.Jansa@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Khem Raj <raj.khem@gmail.com>, 
	Jon Mason <jdmason@kudzu.us>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bd20bd05b1c52d7a"

--000000000000bd20bd05b1c52d7a
Content-Type: text/plain; charset="UTF-8"

The tune-test.sh just finished (after 44 hours), there are 3 big groups of
issues:

1) 29 MACHINES with armv7atb-vfpv4d16 DEFAULTTUNE seem to be broken since:

commit 594f8584268d5179c18512beada2bae4a21325de
Author: Phil Edworthy <phil.edworthy@renesas.com>
Date:   Wed Nov 28 10:09:57 2018 +0000

    arch-armv7*.inc: Add Cortex vfpv4-d16 support

    Some ARM Cortex devices have the VFPv4-D16, but no NEON.

scripts/tune/log.fake-cortexa15.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa15) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa17.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa17) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa32.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa32) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa34.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa34) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa35.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa35) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa53.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa53) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa55.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa55) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa57.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa57) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa57-cortexa53.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa57_cortexa53) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa5.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa5) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa65ae.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65ae) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa65.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa72.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa72) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa72-cortexa53.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa72_cortexa53) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa73.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa73-cortexa35.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73_cortexa35) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa73-cortexa53.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73_cortexa53) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa75.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa75-cortexa55.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75_cortexa55) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa76ae.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76ae) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa76.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa76-cortexa55.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76_cortexa55) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa77.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa77) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa7.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa7) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa8.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa8) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa9.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa9) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-neoversee1.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversee1) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-neoversen1.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversen1) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-thunderx.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_thunderx) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).

2) Duplicated "_be" suffix in 24 MACHINES with aarch64_be DEFAULTTUNE seems
to be introduced by:

commit 08433cc58abf0cf3e42b22d20870a50287cfb8bc
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue May 26 16:10:37 2020 -0700

    armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH

Because it's first included in ARMPKGARCH and then appended
from ARMPKGSFX_ENDIAN_64 again:

meta/conf/machine/include/arm/arch-arm64.inc:
ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
...
ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian',
'_be', '', d)}"
TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"

scripts/tune/log.fake-cortexa32.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa32) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa34.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa34) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa35.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa35) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa53.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa53) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa55.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa55) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa57.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa57) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa57-cortexa53.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa57_cortexa53)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa65.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa65) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa65ae.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa65ae) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa72.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa72) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa72-cortexa53.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa72_cortexa53)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa73.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa73) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa73-cortexa35.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73_cortexa35)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa73-cortexa53.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73_cortexa53)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa75.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa75) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa75-cortexa55.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa75_cortexa55)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa76.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa76) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa76ae.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa76ae) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa76-cortexa55.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa76_cortexa55)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa77.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa77) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-neoversee1.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_neoversee1) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-neoversen1.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_neoversen1) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-thunderx.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_thunderx) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-thunderx.thunderx_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be thunderx_be fake_thunderx) for
DEFAULTTUNE (thunderx_be) does not contain TUNE_PKGARCH (thunderx_be_be).

3) Duplicated mips64el-o32 in 9 MACHINEs

commit ae5073c4abd8935c01d14d3e6395124f815bd10b
Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Date:   Fri Sep 23 15:28:08 2016 +0100

    arch-mips: Add mips64-o32 tunes

meta/conf/machine/include/mips/arch-mips.inc:
PACKAGE_EXTRA_ARCHS_tune-mips64el-o32 = "mipsel mips64el-o32 mips64el-o32"

scripts/tune/log.fake-mips-24k.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips32.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips32r2.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips32r6.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips64.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips64r2.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips64r6.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips-74k.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-octeon.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32

4) remaining issues:
scripts/tune/log.fake-ep9312:    Error, the PACKAGE_ARCHS variable (all any
noarch arm armv4 armv4t ep9312 fake_ep9312) for DEFAULTTUNE (ep9312) does
not contain TUNE_PKGARCH (ep9312t).
scripts/tune/log.fake-mips64r6.mipsisa64r6-nf:    Error, the PACKAGE_ARCHS
variable (all any noarch mipsisa64r6 fake_mips64r6) for DEFAULTTUNE
(mipsisa64r6-nf) does not contain TUNE_PKGARCH (mipsisa64r6-nf).
scripts/tune/log.fake-riscv.riscv32nf:    Error, the PACKAGE_ARCHS variable
(all any noarch riscv32nf fake_riscv) for DEFAULTTUNE (riscv32nf) does not
contain TUNE_PKGARCH (riscv32).
scripts/tune/log.fake-riscv.riscv64nf:    Error, the PACKAGE_ARCHS variable
(all any noarch riscv64nf fake_riscv) for DEFAULTTUNE (riscv64nf) does not
contain TUNE_PKGARCH (riscv64).
scripts/tune/log.fake-supersparc:    Error, the PACKAGE_ARCHS variable (all
any noarch ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} fake_supersparc) for
DEFAULTTUNE (None) does not contain TUNE_PKGARCH (supersparc).Toolchain
tunings invalid:

Complete logs and this ugly&slow script from 2012 are included in:
https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test




On Thu, Oct 15, 2020 at 12:02 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> On Tue, Oct 13, 2020 at 10:44 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2020-10-13 at 00:24 +0200, Martin Jansa wrote:
>> > Good catch, maybe we should require tune-test.sh test for all tune
>> > modifying changes, it catches the issue as the very first tested
>> > case:
>> >
>> > Testing fake MACHINE fake-cortexa65 for include
>> > conf/machine/include/arm/armv8-2a/tune-cortexa65.inc (1/76)
>> > ERROR: something wrong in openembedded-core/scripts/tune/log.fake-
>> > cortexa65
>> >
>> > martin@jama:/OE/build/oe-core$ cat openembedded-
>> > core/scripts/tune/log.fake-cortexa65
>> > NOTE: Started PRServer with DBfile: /OE/build/oe-
>> > core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 44979, PID: 158972
>> > ERROR:  OE-core's config sanity checker detected a potential
>> > misconfiguration.
>> >     Either fix the cause of this error or at your own risk disable
>> > the checker (see sanity.conf).
>> >     Following is the list of potential problems / advisories:
>> >
>> >     Toolchain tunings invalid:
>> > Tuning 'cortexa65' has the following errors:
>> > Feature 'cortexa55' is not defined.
>> >
>> >
>> > Summary: There was 1 ERROR message shown, returning a non-zero exit
>> > code.
>> >
>> > I'll let it finish in master branch and update
>> >
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
>> > tomorrow.
>>
>> Could we turn tune-test.sh into something in oe-selftest? That way it
>> would be tested on the infrastructure automatically...
>>
>
> It would be definitely better, this shell script is quite ugly, old and
> slow, It doesn't even use bitbake server which should really help in this
> case (it just calls "bitbake -e" for every combination of tune file and
> AVAILTUNES for it). It might also be affected by ARM_INSTRUCTION_SET
> setting in the distro, so in theory we should run most arm tunes twice.
>
> My previous test was testing only the "neon-vfpv4" tunes, because that was
> probably the last thing I've modified few years ago.
>
> Yesterday I've noticed it and removed this filter .. and it's still
> running, now at:
> Testing DEFAULTTUNE armv7a-vfpv3 (45/145) for fake MACHINE fake-cortexa53
> (33/76)
>
> which means 45th DEFAULTTUNE from 145 on 33rd MACHINE from 76.. hopefully
> after it finishes all these cortex* variants it will get
> significantly faster, because other tune files don't have so many
> AVAILTUNES.
>
> Sofar it found following issues (not all of them are from new tune files
> from Jon):
>
> scripts/tune/log.fake-cortexa15.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa15) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa17.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa17) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa32.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa32) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa32.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa32) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa34.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa34) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa34.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa34) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa35.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa35) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa35.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa35) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa5.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa5) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa65.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa65) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa65ae.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa65ae) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa65ae.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65ae) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa65.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa73.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa73) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa73.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa73-cortexa35.aarch64_be:    Error, the
> PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73_cortexa35)
> for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa73-cortexa35.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73_cortexa35) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa75.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa75) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa75.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa75-cortexa55.aarch64_be:    Error, the
> PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa75_cortexa55)
> for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa75-cortexa55.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75_cortexa55) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa76.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa76) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa76ae.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa76ae) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa76ae.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76ae) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa76.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa76-cortexa55.aarch64_be:    Error, the
> PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa76_cortexa55)
> for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa76-cortexa55.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76_cortexa55) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-cortexa77.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_cortexa77) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-cortexa77.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa77) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-ep9312:    Error, the PACKAGE_ARCHS variable (all
> any noarch arm armv4 armv4t ep9312 fake_ep9312) for DEFAULTTUNE (ep9312)
> does not contain TUNE_PKGARCH (ep9312t).
> scripts/tune/log.fake-mips-24k.mips64el-o32:    Error, the PACKAGE_ARCHS
> variable contains duplicates. The following archs are listed more than
> once: mips64el-o32
> scripts/tune/log.fake-mips-74k.mips64el-o32:    Error, the PACKAGE_ARCHS
> variable contains duplicates. The following archs are listed more than
> once: mips64el-o32
> scripts/tune/log.fake-neoversee1.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_neoversee1) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-neoversee1.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversee1) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-neoversen1.aarch64_be:    Error, the PACKAGE_ARCHS
> variable (all any noarch aarch64_be fake_neoversen1) for DEFAULTTUNE
> (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
> scripts/tune/log.fake-neoversen1.armv7atb-vfpv4d16:    Error, the
> PACKAGE_ARCHS variable (all any noarch
> ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversen1) for
> DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
> (armv7at2b-vfpv4d16).
> scripts/tune/log.fake-riscv.riscv32nf:    Error, the PACKAGE_ARCHS
> variable (all any noarch riscv32nf fake_riscv) for DEFAULTTUNE (riscv32nf)
> does not contain TUNE_PKGARCH (riscv32).
> scripts/tune/log.fake-riscv.riscv64nf:    Error, the PACKAGE_ARCHS
> variable (all any noarch riscv64nf fake_riscv) for DEFAULTTUNE (riscv64nf)
> does not contain TUNE_PKGARCH (riscv64).
> scripts/tune/log.fake-supersparc:    Error, the PACKAGE_ARCHS variable
> (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} fake_supersparc)
> for DEFAULTTUNE (None) does not contain TUNE_PKGARCH (supersparc).Toolchain
> tunings invalid:
>
>
> 
>
>

--000000000000bd20bd05b1c52d7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The tune-test.sh just finished (after 44 hours), there are=
 3 big groups of issues:<div><br></div><div>1) 29 MACHINES with armv7atb-vf=
pv4d16 DEFAULTTUNE seem to be broken since:</div><div><br></div><div>commit=
 594f8584268d5179c18512beada2bae4a21325de<br>Author: Phil Edworthy &lt;<a h=
ref=3D"mailto:phil.edworthy@renesas.com">phil.edworthy@renesas.com</a>&gt;<=
br>Date: =C2=A0 Wed Nov 28 10:09:57 2018 +0000<br><br>=C2=A0 =C2=A0 arch-ar=
mv7*.inc: Add Cortex vfpv4-d16 support<br><br>=C2=A0 =C2=A0 Some ARM Cortex=
 devices have the VFPv4-D16, but no NEON.<br></div><div><br></div><div>scri=
pts/tune/log.fake-cortexa15.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACK=
AGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv=
4d16} fake_cortexa15) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain =
TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa17.armv7=
atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarc=
h ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa17) for DEFAULT=
TUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16)=
.<br>scripts/tune/log.fake-cortexa32.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error,=
 the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv=
7atb-vfpv4d16} fake_cortexa32) for DEFAULTTUNE (armv7atb-vfpv4d16) does not=
 contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortex=
a34.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all =
any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa34) fo=
r DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-=
vfpv4d16).<br>scripts/tune/log.fake-cortexa35.armv7atb-vfpv4d16: =C2=A0 =C2=
=
=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS=
_tune-armv7atb-vfpv4d16} fake_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4d16=
) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.f=
ake-cortexa53.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS vari=
able (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cor=
texa53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (=
armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa55.armv7atb-vfpv4d16: =
=
=C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_E=
XTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa55) for DEFAULTTUNE (armv7at=
b-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/=
tune/log.fake-cortexa57.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_=
ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16=
} fake_cortexa57) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE=
_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa57-cortexa53=
.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any=
 noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa57_cortex=
a53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (arm=
v7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa5.armv7atb-vfpv4d16: =C2=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTR=
A_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa5) for DEFAULTTUNE (armv7atb-vf=
pv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune=
/log.fake-cortexa65ae.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_AR=
CHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} =
fake_cortexa65ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE=
_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa65.armv7atb-=
vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${=
PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65) for DEFAULTTUNE=
 (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br=
>scripts/tune/log.fake-cortexa72.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the=
 PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb=
-vfpv4d16} fake_cortexa72) for DEFAULTTUNE (armv7atb-vfpv4d16) does not con=
tain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa72-=
cortexa53.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable=
 (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa=
72_cortexa53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKG=
ARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa73.armv7atb-vfpv=
4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACK=
AGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73) for DEFAULTTUNE (ar=
mv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scr=
ipts/tune/log.fake-cortexa73-cortexa35.armv7atb-vfpv4d16: =C2=A0 =C2=A0Erro=
r, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-ar=
mv7atb-vfpv4d16} fake_cortexa73_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4d=
16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log=
.fake-cortexa73-cortexa53.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAG=
E_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d=
16} fake_cortexa73_cortexa53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not =
contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa=
75.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all a=
ny noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75) for=
 DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-v=
fpv4d16).<br>scripts/tune/log.fake-cortexa75-cortexa55.armv7atb-vfpv4d16: =
=C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_E=
XTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75_cortexa55) for DEFAULTTUN=
E (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<b=
r>scripts/tune/log.fake-cortexa76ae.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, =
the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7=
atb-vfpv4d16} fake_cortexa76ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does no=
t contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-corte=
xa76.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all=
 any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76) f=
or DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b=
-vfpv4d16).<br>scripts/tune/log.fake-cortexa76-cortexa55.armv7atb-vfpv4d16:=
 =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_E=
XTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76_cortexa55) for DEFAULTTUN=
E (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<b=
r>scripts/tune/log.fake-cortexa77.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, th=
e PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7at=
b-vfpv4d16} fake_cortexa77) for DEFAULTTUNE (armv7atb-vfpv4d16) does not co=
ntain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa7.=
armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any =
noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa7) for DEF=
AULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4=
d16).<br>scripts/tune/log.fake-cortexa8.armv7atb-vfpv4d16: =C2=A0 =C2=A0Err=
or, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7atb-vfpv4d16} fake_cortexa8) for DEFAULTTUNE (armv7atb-vfpv4d16) does n=
ot contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cort=
exa9.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all=
 any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa9) fo=
r DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-=
vfpv4d16).<br>scripts/tune/log.fake-neoversee1.armv7atb-vfpv4d16: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_AR=
CHS_tune-armv7atb-vfpv4d16} fake_neoversee1) for DEFAULTTUNE (armv7atb-vfpv=
4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/l=
og.fake-neoversen1.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS=
 variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fak=
e_neoversen1) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKG=
ARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-thunderx.armv7atb-vfpv4=
d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKA=
GE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_thunderx) for DEFAULTTUNE (armv=
7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br></div=
><div><br></div><div>2) Duplicated &quot;_be&quot; suffix in 24 MACHINES wi=
th aarch64_be DEFAULTTUNE seems to be introduced by:</div><div><br></div><d=
iv>commit 08433cc58abf0cf3e42b22d20870a50287cfb8bc<br>Author: Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>Date: =
=C2=A0 Tue May 26 16:10:37 2020 -0700<br><br>=C2=A0 =C2=A0 armv8/tunes: Se=
t TUNE_PKGARCH_64 based on ARMPKGARCH<br></div><div><br></div><div>Because =
it&#39;s first included in=C2=A0ARMPKGARCH and then appended from=C2=A0ARMP=
KGSFX_ENDIAN_64 again:=C2=A0</div><div><br></div><div>meta/conf/machine/inc=
lude/arm/arch-arm64.inc:<br></div><div>ARMPKGARCH_tune-aarch64_be ?=3D &quo=
t;aarch64_be&quot;</div><div>...<br>ARMPKGSFX_ENDIAN_64 =3D &quot;${@bb.uti=
ls.contains(&#39;TUNE_FEATURES&#39;, &#39;bigendian&#39;, &#39;_be&#39;, &#=
39;&#39;, d)}&quot;<br>TUNE_ARCH_64 =3D &quot;aarch64${ARMPKGSFX_ENDIAN_64}=
&quot;<br>TUNE_PKGARCH_64 =3D &quot;${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}&quo=
t;<br></div><div><br></div><div>scripts/tune/log.fake-cortexa32.aarch64_be:=
 =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be =
fake_cortexa32) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH =
(aarch64_be_be).<br>scripts/tune/log.fake-cortexa34.aarch64_be: =C2=A0 =C2=
=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_corte=
xa34) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_b=
e_be).<br>scripts/tune/log.fake-cortexa35.aarch64_be: =C2=A0 =C2=A0Error, t=
he PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa35) for DE=
FAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>sc=
ripts/tune/log.fake-cortexa53.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_A=
RCHS variable (all any noarch aarch64_be fake_cortexa53) for DEFAULTTUNE (a=
arch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/l=
og.fake-cortexa55.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variabl=
e (all any noarch aarch64_be fake_cortexa55) for DEFAULTTUNE (aarch64_be) d=
oes not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cort=
exa57.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any n=
oarch aarch64_be fake_cortexa57) for DEFAULTTUNE (aarch64_be) does not cont=
ain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa57-cortex=
a53.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noa=
rch aarch64_be fake_cortexa57_cortexa53) for DEFAULTTUNE (aarch64_be) does =
not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa6=
5.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarc=
h aarch64_be fake_cortexa65) for DEFAULTTUNE (aarch64_be) does not contain =
TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa65ae.aarch64_=
be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_=
be fake_cortexa65ae) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKG=
ARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa72.aarch64_be: =C2=A0=
 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa72) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch6=
4_be_be).<br>scripts/tune/log.fake-cortexa72-cortexa53.aarch64_be: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa72_cortexa53) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGAR=
CH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa73.aarch64_be: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa73) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch6=
4_be_be).<br>scripts/tune/log.fake-cortexa73-cortexa35.aarch64_be: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa73_cortexa35) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGAR=
CH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa73-cortexa53.aarch64_be=
: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be=
 fake_cortexa73_cortexa53) for DEFAULTTUNE (aarch64_be) does not contain TU=
NE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa75.aarch64_be: =
=
=C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be =
fake_cortexa75) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH =
(aarch64_be_be).<br>scripts/tune/log.fake-cortexa75-cortexa55.aarch64_be: =
=C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be =
fake_cortexa75_cortexa55) for DEFAULTTUNE (aarch64_be) does not contain TUN=
E_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa76.aarch64_be: =
=C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be =
fake_cortexa76) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH =
(aarch64_be_be).<br>scripts/tune/log.fake-cortexa76ae.aarch64_be: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa76ae) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarc=
h64_be_be).<br>scripts/tune/log.fake-cortexa76-cortexa55.aarch64_be: =C2=A0=
 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa76_cortexa55) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGAR=
CH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa77.aarch64_be: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa77) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch6=
4_be_be).<br>scripts/tune/log.fake-neoversee1.aarch64_be: =C2=A0 =C2=A0Erro=
r, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_neoversee1) f=
or DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<=
br>scripts/tune/log.fake-neoversen1.aarch64_be: =C2=A0 =C2=A0Error, the PAC=
KAGE_ARCHS variable (all any noarch aarch64_be fake_neoversen1) for DEFAULT=
TUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts=
/tune/log.fake-thunderx.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS v=
ariable (all any noarch aarch64_be fake_thunderx) for DEFAULTTUNE (aarch64_=
be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake=
-thunderx.thunderx_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all =
any noarch aarch64_be thunderx_be fake_thunderx) for DEFAULTTUNE (thunderx_=
be) does not contain TUNE_PKGARCH (thunderx_be_be).<br></div><div><br></div=
><div>3) Duplicated=C2=A0mips64el-o32 in 9 MACHINEs</div><div><br></div><di=
v>commit ae5073c4abd8935c01d14d3e6395124f815bd10b<br>Author: Zubair Lutfull=
ah Kakakhel &lt;<a href=3D"mailto:Zubair.Kakakhel@imgtec.com">Zubair.Kakakh=
el@imgtec.com</a>&gt;<br>Date: =C2=A0 Fri Sep 23 15:28:08 2016 +0100<br><br=
>=C2=A0 =C2=A0 arch-mips: Add mips64-o32 tunes<br></div><div><br></div><div=
>meta/conf/machine/include/mips/arch-mips.inc:<br></div><div>PACKAGE_EXTRA_=
ARCHS_tune-mips64el-o32 =3D &quot;mipsel mips64el-o32 mips64el-o32&quot;<br=
></div><div><br></div><div>scripts/tune/log.fake-mips-24k.mips64el-o32: =C2=
=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable contains duplicates. The follo=
wing archs are listed more than once: mips64el-o32<br>scripts/tune/log.fake=
-mips32.mips64el-o32: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable contai=
ns duplicates. The following archs are listed more than once: mips64el-o32<=
br>scripts/tune/log.fake-mips32r2.mips64el-o32: =C2=A0 =C2=A0Error, the PAC=
KAGE_ARCHS variable contains duplicates. The following archs are listed mor=
e than once: mips64el-o32<br>scripts/tune/log.fake-mips32r6.mips64el-o32: =
=C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable contains duplicates. The fo=
llowing archs are listed more than once: mips64el-o32<br>scripts/tune/log.f=
ake-mips64.mips64el-o32: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable con=
tains duplicates. The following archs are listed more than once: mips64el-o=
32<br>scripts/tune/log.fake-mips64r2.mips64el-o32: =C2=A0 =C2=A0Error, the =
PACKAGE_ARCHS variable contains duplicates. The following archs are listed =
more than once: mips64el-o32<br>scripts/tune/log.fake-mips64r6.mips64el-o32=
: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable contains duplicates. The f=
ollowing archs are listed more than once: mips64el-o32<br>scripts/tune/log.=
fake-mips-74k.mips64el-o32: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable =
contains duplicates. The following archs are listed more than once: mips64e=
l-o32<br>scripts/tune/log.fake-octeon.mips64el-o32: =C2=A0 =C2=A0Error, the=
 PACKAGE_ARCHS variable contains duplicates. The following archs are listed=
 more than once: mips64el-o32<br></div><div><br></div><div>4) remaining iss=
ues:</div><div>scripts/tune/log.fake-ep9312: =C2=A0 =C2=A0Error, the PACKAG=
E_ARCHS variable (all any noarch arm armv4 armv4t ep9312 fake_ep9312) for D=
EFAULTTUNE (ep9312) does not contain TUNE_PKGARCH (ep9312t).<br>scripts/tun=
e/log.fake-mips64r6.mipsisa64r6-nf: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS v=
ariable (all any noarch mipsisa64r6 fake_mips64r6) for DEFAULTTUNE (mipsisa=
64r6-nf) does not contain TUNE_PKGARCH (mipsisa64r6-nf).<br>scripts/tune/lo=
g.fake-riscv.riscv32nf: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all=
 any noarch riscv32nf fake_riscv) for DEFAULTTUNE (riscv32nf) does not cont=
ain TUNE_PKGARCH (riscv32).<br>scripts/tune/log.fake-riscv.riscv64nf: =C2=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch riscv64nf fake=
_riscv) for DEFAULTTUNE (riscv64nf) does not contain TUNE_PKGARCH (riscv64)=
.<br>scripts/tune/log.fake-supersparc: =C2=A0 =C2=A0Error, the PACKAGE_ARCH=
S variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} fake_=
supersparc) for DEFAULTTUNE (None) does not contain TUNE_PKGARCH (superspar=
c).Toolchain tunings invalid:<br></div><div><br></div><div>Complete logs an=
d this ugly&amp;slow script from 2012 are included in:</div><div><a href=3D=
"https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
-test">https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djans=
a/tune-test</a><br></div><div><br></div><div><br></div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Oct 15, 2020 at 12:02 PM Martin Jansa via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=
=3D"ltr"><div dir=3D"ltr">On Tue, Oct 13, 2020 at 10:44 AM Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2020-=
10-13 at 00:24 +0200, Martin Jansa wrote:<br>
&gt; Good catch, maybe we should require tune-test.sh test for all tune<br=
>
&gt; modifying changes, it catches the issue as the very first tested<br>
&gt; case:<br>
&gt; <br>
&gt; Testing fake MACHINE fake-cortexa65 for include<br>
&gt; conf/machine/include/arm/armv8-2a/tune-cortexa65.inc (1/76)<br>
&gt; ERROR: something wrong in openembedded-core/scripts/tune/log.fake-<br=
>
&gt; cortexa65<br>
&gt; <br>
&gt; martin@jama:/OE/build/oe-core$ cat openembedded-<br>
&gt; core/scripts/tune/log.fake-cortexa65 <br>
&gt; NOTE: Started PRServer with DBfile: /OE/build/oe-<br>
&gt; core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 44979, PID: 158972<br=
>
&gt; ERROR:=C2=A0 OE-core&#39;s config sanity checker detected a potential=
<br>
&gt; misconfiguration.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Either fix the cause of this error or at your own =
risk disable<br>
&gt; the checker (see sanity.conf).<br>
&gt;=C2=A0 =C2=A0 =C2=A0Following is the list of potential problems / advi=
sories:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Toolchain tunings invalid:<br>
&gt; Tuning &#39;cortexa65&#39; has the following errors:<br>
&gt; Feature &#39;cortexa55&#39; is not defined.<br>
&gt; <br>
&gt; <br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit<b=
r>
&gt; code.<br>
&gt; <br>
&gt; I&#39;ll let it finish in master branch and update<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/log=
/?h=3Djansa/tune-test" rel=3D"noreferrer" target=3D"_blank">https://git.ope=
nembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune-test</a><br>
&gt; tomorrow.<br>
<br>
Could we turn tune-test.sh into something in oe-selftest? That way it<br>
would be tested on the infrastructure automatically...<br></blockquote><di=
v><br></div><div>It would be definitely better, this shell script is quite =
ugly, old and slow, It doesn&#39;t even use bitbake server which should rea=
lly help in this case (it just calls &quot;bitbake -e&quot; for every combi=
nation of tune file and AVAILTUNES for it). It might also be affected by=C2=
=
=A0ARM_INSTRUCTION_SET setting in the distro, so in theory we should run m=
ost arm tunes twice.</div><div><br></div><div>My previous test was testing =
only the &quot;neon-vfpv4&quot; tunes, because that was probably the last t=
hing I&#39;ve modified few years ago.</div><div><br></div><div>Yesterday I&=
#39;ve noticed it and removed this filter .. and it&#39;s still running, no=
w at:</div><div>Testing DEFAULTTUNE armv7a-vfpv3 (45/145) for fake MACHINE =
fake-cortexa53 (33/76)<br></div><div><br></div><div>which means 45th=C2=A0D=
EFAULTTUNE from 145 on 33rd MACHINE from 76.. hopefully after it finishes a=
ll these cortex* variants it will get significantly=C2=A0faster, because ot=
her tune files don&#39;t have so many AVAILTUNES.</div><div><br></div><div>=
Sofar it found following issues (not all of them are from new tune files fr=
om Jon):</div><div><br></div><div>scripts/tune/log.fake-cortexa15.armv7atb-=
vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${=
PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa15) for DEFAULTTUNE=
 (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br=
>scripts/tune/log.fake-cortexa17.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the=
 PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb=
-vfpv4d16} fake_cortexa17) for DEFAULTTUNE (armv7atb-vfpv4d16) does not con=
tain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa32.=
aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch =
aarch64_be fake_cortexa32) for DEFAULTTUNE (aarch64_be) does not contain TU=
NE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa32.armv7atb-vfp=
v4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PAC=
KAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa32) for DEFAULTTUNE (a=
rmv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>sc=
ripts/tune/log.fake-cortexa34.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_A=
RCHS variable (all any noarch aarch64_be fake_cortexa34) for DEFAULTTUNE (a=
arch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/l=
og.fake-cortexa34.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS =
variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake=
_cortexa34) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGAR=
CH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa35.aarch64_be: =C2=
=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fak=
e_cortexa35) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aa=
rch64_be_be).<br>scripts/tune/log.fake-cortexa35.armv7atb-vfpv4d16: =C2=A0 =
=
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_AR=
CHS_tune-armv7atb-vfpv4d16} fake_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4=
d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/lo=
g.fake-cortexa5.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS va=
riable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_c=
ortexa5) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH =
(armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa65.aarch64_be: =C2=A0=
 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_co=
rtexa65) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch6=
4_be_be).<br>scripts/tune/log.fake-cortexa65ae.aarch64_be: =C2=A0 =C2=A0Err=
or, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa65ae)=
 for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be)=
.<br>scripts/tune/log.fake-cortexa65ae.armv7atb-vfpv4d16: =C2=A0 =C2=A0Erro=
r, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-ar=
mv7atb-vfpv4d16} fake_cortexa65ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does=
 not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-co=
rtexa65.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (=
all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65=
) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7a=
t2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa73.aarch64_be: =C2=A0 =C2=A0=
Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73=
) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be=
).<br>scripts/tune/log.fake-cortexa73.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error=
, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-arm=
v7atb-vfpv4d16} fake_cortexa73) for DEFAULTTUNE (armv7atb-vfpv4d16) does no=
t contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-corte=
xa73-cortexa35.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (=
all any noarch aarch64_be fake_cortexa73_cortexa35) for DEFAULTTUNE (aarch6=
4_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fa=
ke-cortexa73-cortexa35.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_A=
RCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16}=
 fake_cortexa73_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4d16) does not con=
tain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa75.=
aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch =
aarch64_be fake_cortexa75) for DEFAULTTUNE (aarch64_be) does not contain TU=
NE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa75.armv7atb-vfp=
v4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PAC=
KAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75) for DEFAULTTUNE (a=
rmv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>sc=
ripts/tune/log.fake-cortexa75-cortexa55.aarch64_be: =C2=A0 =C2=A0Error, the=
 PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa75_cortexa55=
) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be=
).<br>scripts/tune/log.fake-cortexa75-cortexa55.armv7atb-vfpv4d16: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_AR=
CHS_tune-armv7atb-vfpv4d16} fake_cortexa75_cortexa55) for DEFAULTTUNE (armv=
7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scrip=
ts/tune/log.fake-cortexa76.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCH=
S variable (all any noarch aarch64_be fake_cortexa76) for DEFAULTTUNE (aarc=
h64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.=
fake-cortexa76ae.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable=
 (all any noarch aarch64_be fake_cortexa76ae) for DEFAULTTUNE (aarch64_be) =
does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cor=
texa76ae.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable =
(all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa7=
6ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (arm=
v7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa76.armv7atb-vfpv4d16: =C2=
=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTR=
A_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76) for DEFAULTTUNE (armv7atb-v=
fpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tun=
e/log.fake-cortexa76-cortexa55.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_=
ARCHS variable (all any noarch aarch64_be fake_cortexa76_cortexa55) for DEF=
AULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scr=
ipts/tune/log.fake-cortexa76-cortexa55.armv7atb-vfpv4d16: =C2=A0 =C2=A0Erro=
r, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-ar=
mv7atb-vfpv4d16} fake_cortexa76_cortexa55) for DEFAULTTUNE (armv7atb-vfpv4d=
16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log=
.fake-cortexa77.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable =
(all any noarch aarch64_be fake_cortexa77) for DEFAULTTUNE (aarch64_be) doe=
s not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortex=
a77.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all =
any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa77) fo=
r DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-=
vfpv4d16).<br>scripts/tune/log.fake-ep9312: =C2=A0 =C2=A0Error, the PACKAGE=
_ARCHS variable (all any noarch arm armv4 armv4t ep9312 fake_ep9312) for DE=
FAULTTUNE (ep9312) does not contain TUNE_PKGARCH (ep9312t).<br>scripts/tune=
/log.fake-mips-24k.mips64el-o32: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS vari=
able contains duplicates. The following archs are listed more than once: mi=
ps64el-o32<br>scripts/tune/log.fake-mips-74k.mips64el-o32: =C2=A0 =C2=A0Err=
or, the PACKAGE_ARCHS variable contains duplicates. The following archs are=
 listed more than once: mips64el-o32<br>scripts/tune/log.fake-neoversee1.aa=
rch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aa=
rch64_be fake_neoversee1) for DEFAULTTUNE (aarch64_be) does not contain TUN=
E_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-neoversee1.armv7atb-vfp=
v4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PAC=
KAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversee1) for DEFAULTTUNE (=
armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>s=
cripts/tune/log.fake-neoversen1.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE=
_ARCHS variable (all any noarch aarch64_be fake_neoversen1) for DEFAULTTUNE=
 (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tun=
e/log.fake-neoversen1.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_AR=
CHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} =
fake_neoversen1) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_=
PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-riscv.riscv32nf: =C2=
=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch riscv32nf fake=
_riscv) for DEFAULTTUNE (riscv32nf) does not contain TUNE_PKGARCH (riscv32)=
.<br>scripts/tune/log.fake-riscv.riscv64nf: =C2=A0 =C2=A0Error, the PACKAGE=
_ARCHS variable (all any noarch riscv64nf fake_riscv) for DEFAULTTUNE (risc=
v64nf) does not contain TUNE_PKGARCH (riscv64).<br>scripts/tune/log.fake-su=
persparc: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${=
PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} fake_supersparc) for DEFAULTTUNE (=
None) does not contain TUNE_PKGARCH (supersparc).Toolchain tunings invalid:=
<br></div><div><br></div></div></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000bd20bd05b1c52d7a--
