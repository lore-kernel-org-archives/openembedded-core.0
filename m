Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B36CC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:52:30 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.60.1668793950140637232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qCdZ71mN;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y13so5560968pfp.7
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3/wS6+j5QTgyNRc7rqq3i9c+AbJ9idXHhz3Q9Jl2uE=;
        b=qCdZ71mNGQ6uhO+jYjZsveVlY7Z4lvgilF4/5U6Yx4/bSvgQ0hAgwel8joJjQiXeSz
         GcQbhK/mbq9ccaTwuFxAehADO90Qis8qv7VCUN401m4ZuOooqkzoVQtA2AHRtdTidM6m
         /iEklxi+s/KNPeMLcEnAe4X9wwHbPiHM8Ye9r7qg5eBS/oHeZHwHlxDBkl+0TxJ3hobA
         DiUBAcseu/C2ukEW/7pMuwpQ4jMjTqVBiOwUGCm8JLCWs84RX50v46lJw7FcYsP/coLp
         yK9HaWZBZI9VIBpOjFvEbNPn9M4a1dSXOFTEUA9OiSg4Q2W2yIOHuSca5yk5O6h/lies
         z2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3/wS6+j5QTgyNRc7rqq3i9c+AbJ9idXHhz3Q9Jl2uE=;
        b=CgTHHP7O+YyqnbHfRg5bJ3rXGexqJmj4/IoTJsh/ymL48fsF6b5xFuTysindX0gQyS
         Q8uVA2V/VDUkQFuLM6Z66llu+1ZbZ3tEN1b1Atrg9xXtt8N+vucicKhHk5TBqAj4SLjQ
         JJYo/y8ryqH/q7EUE7FDyUpY7E/YENyFVFac+g4ANaJSTG3afAqK0PZ9yW5NEld71a/7
         gLiopNkGiqrM/B6zxI/IAiiTZh7qJ9nz7B3lSH0lEPUsypDLU5hfGv8PbWxg810JdPl5
         5/oNkH3kkDcpGDyyXSgix0GFsUeD0zR2ttWpfVJgzzcbwTS1+t0V9SBCfvV6M12lewy5
         GAYg==
X-Gm-Message-State: ANoB5plTst8BA4+yfBPG7EXMOaK4902cwXq3tUnNzADV4eOVl9UvkAQw
	0bH8VoooCenFR+xYYv1o2evQwYMvEGTwvg==
X-Google-Smtp-Source: AA0mqf6f9Zd4PyVnLhZZBqz4Dqu1cf1Mrdq6wZ1QAsKX7aCskxrPEEJhTQRbEdKMD017CfTmhbG64w==
X-Received: by 2002:a62:ea18:0:b0:56c:2d:1e56 with SMTP id t24-20020a62ea18000000b0056c002d1e56mr9093956pfh.41.1668793949131;
        Fri, 18 Nov 2022 09:52:29 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6693:e191:c3fe:39ff])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b0056c702a370dsm3443173pfp.117.2022.11.18.09.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:52:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] libtry-tiny-perl: add recipe for 0.31
Date: Fri, 18 Nov 2022 09:52:04 -0800
Message-Id: <6e0d78434526a2e1d54dcf57cadb3a87bf65c22a.1668793524.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1668793524.git.tim.orling@konsulko.com>
References: <cover.1668793524.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173484

Try::Tiny - Minimal try/catch with proper preservation of $@

https://metacpan.org/release/ETHER/Try-Tiny-0.31

* Dependency for libtest-fatal-perl
* Add self as maintainer
* Add to ptest-packagelists.inc (fast)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../perl/libtry-tiny-perl_0.31.bb             | 36 +++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5b7ce77c3cc..141578a7a99 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -396,6 +396,7 @@ RECIPE_MAINTAINER:pn-libtirpc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-libtry-tiny-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3c9ff43bd9b..b0925e13dd0 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -34,6 +34,7 @@ PTESTS_FAST = "\
     libssh2-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
+    libtry-tiny-perl-ptest \
     liburi-perl-ptest \
     libusb1-ptest \
     libxml-namespacesupport-perl-ptest \
diff --git a/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb b/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
new file mode 100644
index 00000000000..a3728d84356
--- /dev/null
+++ b/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Try::Tiny - Minimal try/catch with proper preservation of $@"
+DESCRIPTION = "This module provides bare bones try/catch/finally statements \
+that are designed to minimize common mistakes with eval blocks, and NOTHING \
+else."
+HOMEPAGE = "https://github.com/p5sagit/Try-Tiny"
+BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=Try-Tiny"
+SECTION = "libs"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENCE;md5=5dc332c2d4aade55f5db244681000091"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Try-Tiny-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "3300d31d8a4075b26d8f46ce864a1d913e0e8467ceeba6655d5d2b2e206c11be"
+
+S = "${WORKDIR}/Try-Tiny-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    perl-module-carp \
+    perl-module-constant \
+    perl-module-exporter \
+"
+RRECOMMENDS:${PN} += "\
+    perl-module-sub-util \
+"
+RDEPENDS:${PN}-ptest += "\
+    perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec \
+    perl-module-if \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


