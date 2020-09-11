Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web12.2462.1599783543684584788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 17:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=echjTZOr;
 spf=pass (domain: taitradio.com, ip: 209.85.166.177, mailfrom: douglas.royds@taitradio.com)
Received: by mail-il1-f177.google.com with SMTP id q6so7409175ild.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 17:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=lNhBEFfmRanqMDU1YuoWxz2k882rnhD+DVZj4FwCPLw=;
        b=echjTZOrTnjyJRyAuOiYOwAzjUGUAl9i4e3mhdWoIuGe6WpahNyEwAGYGSGyOH1B4q
         xChQFqREzfogYymYH5bJeL7H+WLcrCoRgyD/Y+8TzBD0JS1xuTWaCs/wkElx4+pqT7Zw
         jCQiFsKW0jxdFUJEEoQ6hiJeZ/kjLog2J6CSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lNhBEFfmRanqMDU1YuoWxz2k882rnhD+DVZj4FwCPLw=;
        b=SmmU9ua3Ud/tsZlxCtl9xllG7/lDSfcRmbCjLwvXPDwdAJfWTqNTZypm3LfjQas4YC
         rbGPuoKSSsDWYbNu5SMDMfxQ0GGSHtIcAOnO1ViCy2RJKPl3MeGFb5OyEbRcHj6KTRw9
         dxwWt6TLWhUMMJlb5UpJn0mfYeKAfYgrNXF1bae7X6SkSWavAvShYNlhhv1SbSCWEjq8
         FqccjlmE4Z2iKQYbygFUflH7EweT7fIsLNt6pj9e6zS9irh4imxaq8/8L/DtoONcQSQ+
         rYpgnLdLPmw24KTkIvNefQOo8mD/gpLaladmbDfmc9f6tzYLkHNZnrP1b/ftz48FiBO8
         +rdg==
X-Gm-Message-State: AOAM530224UEBsiLcww69GcB8HAKspU7Mrj7xJrWSDtmE1kTxOE1sWFd
	zueV5gHv2YzRdiSwRjYJYJtVXf1pKUoeoqPOwNHdsgWsyPz43uE5Iz8MZMkvP10zZ8vMtHJXAxK
	zOPG5Yf+oqFQdcChWgiW/n1ChMmQ8FxnmfQgxAsL4TTGG5F3b5V9doZOsSgk=
X-Google-Smtp-Source: ABdhPJz7yhUWZ72g0zGiKrU+Rl+CJsqwv3xRVAoMdxZc10tY56rLBscNtrxtZZS0l75+3HOiG5US5/xegRjK1jvWVok=
X-Received: by 2002:a92:1b48:: with SMTP id b69mr9427688ilb.63.1599783542678;
 Thu, 10 Sep 2020 17:19:02 -0700 (PDT)
MIME-Version: 1.0
From: "Douglas" <douglas.royds@taitradio.com>
Date: Fri, 11 Sep 2020 12:18:51 +1200
Message-ID: <CAFimOt4qqUBom3vGpgdquC61oao4gppraibinztAzY8FUB0vsA@mail.gmail.com>
Subject: [PATCH] tcmode-default: Drop gcc-cross-initial, gcc-crosssdk-initial references
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Further to 5b2fd1c724

Also a few remaining references (DISTRO_PN_ALIAS, RECIPE_MAINTAINER).

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
meta/conf/distro/include/distro_alias.inc | 4 ----
meta/conf/distro/include/tcmode-default.inc | 2 --
meta/conf/layer.conf | 2 +-
3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc
b/meta/conf/distro/include/distro_alias.inc
index 56055f7798..b4dfcfc5f5 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -81,10 +81,6 @@ DISTRO_PN_ALIAS_pn-encodings =
"Ubuntu=xfonts-encodings Mandriva=x11-font-encodi
DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base
Mandriva=x11-font-alias Meego=xorg-x11-fonts"
DISTRO_PN_ALIAS_pn-font-util = "Meego=xorg-x11-font-utils
Fedora=xorg-x11-font-utils Ubuntu=xfonts-utils Mandriva=x11-font-util
Debian=xfonts-utils"
DISTRO_PN_ALIAS_pn-formfactor = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-cross-initial = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-cross-initial-i586 = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial-x86_64 = "OE-Core"
DISTRO_PN_ALIAS_pn-gccmakedep = "Mandriva=gccmakedep Ubuntu=xutils-dev"
DISTRO_PN_ALIAS_pn-gcc-runtime = "Ubuntu=gcc Fedora=gcc"
DISTRO_PN_ALIAS_pn-gcc-sanitizers = "Ubuntu=gcc Fedora=gcc"
diff --git a/meta/conf/distro/include/tcmode-default.inc
b/meta/conf/distro/include/tcmode-default.inc
index 1bc95ec675..50e8a20f35 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -30,9 +30,7 @@ LLVMVERSION ?= "10.0.1"
PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross-initial-${TARGET_ARCH} ?= "${GCCVERSION}"
PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
"${GCCVERSION}"
PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 1a01d02fef..38df0f3aff 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -91,7 +91,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
# dependency incidentally. This improves determinism and avoids build
# failures when people switch to external toolchains.
SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
-# Nothing needs to depend on libc-initial/gcc-cross-initial
+# Nothing needs to depend on libc-initial
# base-passwd/shadow-sysroot don't need their dependencies
SSTATE_EXCLUDEDEPS_SYSROOT += "\
.*->.*-initial.* \

-- 
2.17.1

-- 
This Communication is Confidential. We only send and receive email on the

basis of the terms set out at www.taitradio.com/email_disclaimer 
<http://www.taitradio.com/email_disclaimer>
