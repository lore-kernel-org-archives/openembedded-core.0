Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A215C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 13:11:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.43197.1702905074217862227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 05:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MjB2LFFX;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e0d1f9fe6so3428018e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 05:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702905072; x=1703509872; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rwsRSSJxFxRtDeu2SgI1oZAOIZjvXqBolkfG7OMXdcQ=;
        b=MjB2LFFX8TKQl3EYXdKb1hzSDzq5eA1+dAPdMZeSgIKRTcYaNxl6ukP2463EVbCngn
         5FCGDdXFyHHtzIJRMy0DoNNe5lt7qOrrTwFq1m29C1QCcCoskzQer+6/U/qYwQGdxYuF
         FBK7p0X35983e4M0/6fZ7Wx/JFb7y1IBn5lNw7ykCWChW6rwy4gF8Y4DtCG8YScnXUti
         wdOUZd3Qb14pspRcYbh1Cre15sgo9JH2+3/I/DbhmLoj3PxR9i97PjxYDBwKceHf7F1r
         jNRRa78NZk/VLH3mqXM173SI1Pojkr2NfBQ0EWURqAXvYUZ7iEBjwdLXT74XrbqqA5ol
         i4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702905072; x=1703509872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwsRSSJxFxRtDeu2SgI1oZAOIZjvXqBolkfG7OMXdcQ=;
        b=X5GeVJDqU+kzsb4e4LFrsxEDLsZH45xD4m96Z6xRtjUCRuJ6QXwzYBAt5yMDhHeM3W
         wAlbddbLsEJg0M4MPsCMz1YzhTVEu/r4oumHduT6Dt6sN/PNj1JTKyv6nUteznq5sAnE
         IEmbS+B+IQVudHMYtZKUmRr3jmM7g++avwg6czhBdAmm3sRb7j4SrYjcUUXSoTrk9NtE
         M/9KExgRofaZWpvHoOnByVGIr9e0HUWAv0c+ko82p/8i5804xj9eZwsLSCGR14dEEy6w
         va1wxi0s6dnGduDMf6DSfVFlySvO15QE+gKcXgvq5eqClDFwd4XwcdGvvaoN4cmYG49s
         qQcw==
X-Gm-Message-State: AOJu0YwMCD/FyYImLVEuVIVYib+rgdiauoYh55mB0DoAgiozycEyQF+G
	Otm09lsVuGDbq/cdeT39FQ1cTUoIyVRTHWvYJ48=
X-Google-Smtp-Source: AGHT+IEqE1lygH3nC3EEsY9Jl6KU3otjq1nRri3XOEBkApSbvcvTKWicXVq/e8P8Rcsx9x7o5ThuPkultKovymJGXaY=
X-Received: by 2002:a05:6512:230d:b0:50e:3758:94d4 with SMTP id
 o13-20020a056512230d00b0050e375894d4mr1144501lfu.117.1702905072115; Mon, 18
 Dec 2023 05:11:12 -0800 (PST)
MIME-Version: 1.0
References: <e2ad5c51a48a8c85bae1c9c7e21912e8fb412c77.camel@infinera.com>
In-Reply-To: <e2ad5c51a48a8c85bae1c9c7e21912e8fb412c77.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 14:11:00 +0100
Message-ID: <CANNYZj-+T-uXRwVOkF3YmZJzOKaqogBnNKp+WFA9mpNyW2Y=EQ@mail.gmail.com>
Subject: Re: [OE-core] kirkstone: oe-selftest -v -r reproducible.ReproducibleTests.test_reproducible_builds
 broken ?
To: Joakim.Tjernlund@infinera.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 13:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192640

The short execution time is suspicious. The test is written so that
build B doesn't reuse the cache from build A, and if it does because
of your local tweaks, then you're probably just comparing the A
package with itself.

Alex

On Mon, 18 Dec 2023 at 12:20, Joakim Tjernlund via
lists.openembedded.org
<Joakim.Tjernlund=infinera.com@lists.openembedded.org> wrote:
>
> I setup above test for reproducible builds and build one pkg(u-boot) and try to force a
> non-reproducible build to test the framework:
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -9,7 +9,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kerne
>
>  DEPENDS += "swig-native"
>
> -EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
> +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1 SOURCE_DATE_EPOCH="$(date +%s)"'
>  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
>  EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
>
> forcing EPOCH to current build date but I still get an success report:
>
> oe-selftest -v -r reproducible.ReproducibleTests.test_reproducible_builds
> 2023-12-18 12:05:22,355 - oe-selftest - INFO - Adding layer libraries:
> 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta/lib
> 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta-yocto-bsp/lib
> 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/meta-openembedded/meta-oe/lib
> 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/meta-xr/lib
> 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta-selftest/lib
> 2023-12-18 12:05:22,359 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
> 2023-12-18 12:05:27,248 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/local.conf
> 2023-12-18 12:05:27,248 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> 2023-12-18 12:05:27,248 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests)
> 2023-12-18 12:05:29,724 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
>
>
> 2023-12-18 12:08:26,539 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
> 2023-12-18 12:08:26,545 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
> PACKAGE_CLASSES = "package_ipk"
> INHIBIT_PACKAGE_STRIP = "1"
> TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/reproducibleA/tmp"
> LICENSE_FLAGS_ACCEPTED = "commercial"
> DISTRO_FEATURES:append = ' systemd pam'
> USERADDEXTENSION = "useradd-staticids"
> USERADD_ERROR_DYNAMIC = "skip"
> USERADD_UID_TABLES += "files/static-passwd"
> USERADD_GID_TABLES += "files/static-group"
>
>
> 2023-12-18 12:09:08,936 - oe-selftest - INFO - Building reproducibleB (sstate NOT allowed)...
> 2023-12-18 12:09:08,937 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
> PACKAGE_CLASSES = "package_ipk"
> INHIBIT_PACKAGE_STRIP = "1"
> TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/reproducibleB/tmp"
> LICENSE_FLAGS_ACCEPTED = "commercial"
> DISTRO_FEATURES:append = ' systemd pam'
> USERADDEXTENSION = "useradd-staticids"
> USERADD_ERROR_DYNAMIC = "skip"
> USERADD_UID_TABLES += "files/static-passwd"
> USERADD_GID_TABLES += "files/static-group"
> SSTATE_DIR = "${TMPDIR}/sstate"
> SSTATE_MIRRORS = "file://.*/.*-native.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH file://.*/.*-cross.*
> http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
>
>
> 2023-12-18 12:09:24,772 - oe-selftest - INFO - Checking ipk packages for differences...
> 2023-12-18 12:09:24,843 - oe-selftest - INFO - Reproducibility summary for ipk: same=4 different=0 different_excluded=0 missing=0 total=4
> unused_exclusions=[]
> 2023-12-18 12:09:24,847 - oe-selftest - INFO -  ... ok
> 2023-12-18 12:09:26,044 - oe-selftest - INFO - ----------------------------------------------------------------------
> 2023-12-18 12:09:26,044 - oe-selftest - INFO - Ran 1 test in 241.335s
> 2023-12-18 12:09:26,045 - oe-selftest - INFO - OK
> 2023-12-18 12:09:32,355 - oe-selftest - INFO - RESULTS:
> 2023-12-18 12:09:32,356 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (237.60s)
> 2023-12-18 12:09:32,361 - oe-selftest - INFO - SUMMARY:
> 2023-12-18 12:09:32,362 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 241.336s
> 2023-12-18 12:09:32,362 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
>
>
> Looking harder I don't see oe-seftest ever creating reproducibleA/reproducibleB directories.
> I have these set
> OEQA_REPRODUCIBLE_TEST_PACKAGE = "ipk"
> OEQA_REPRODUCIBLE_TEST_TARGET = "xr-u-boot"
>
> I am missing something?
>
>  Jocke
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192631): https://lists.openembedded.org/g/openembedded-core/message/192631
> Mute This Topic: https://lists.openembedded.org/mt/103240689/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

