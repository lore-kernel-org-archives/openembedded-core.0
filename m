Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71646C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.35731.1678494445817680445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZbW+GiwW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q16so6567561wrw.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wTJupVjsYPGdd82CYkXs6dBOpvtnRLQLXljeTf/A9g=;
        b=ZbW+GiwWhOLomZ5wfYlb7IEuZki0c9kUXsgkEKcxecnnCuMPGnzGzdRS5Zj1UhZhcr
         XJwXzlute4gSgj4qrKapGKbww+n32hZEfPghrZcdgH88atPOu3sdlO42qQa4KZ+DhzW1
         BLmgb9tenoVb5181rX8hgKKGN913TGLLRcqKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wTJupVjsYPGdd82CYkXs6dBOpvtnRLQLXljeTf/A9g=;
        b=EHdfz973N09FGV0PFt7LyhT3cE6otVSwDYxlQDEHtvjUILQ3GXm5C6Bwy3DYMQHZP+
         cbJm9YczfEHYH33Kg9UVCDx1mF8GAPfHCAaE3U8DEG236/mkAE7eesZjFi2oJXRDBg5U
         fAre1dgEicQ6oIt2TMCPxg+grZ3oaUDWtNIY0VatmoTYTuu4eVxPRsEE1WqgYjJzEKpm
         VBPqkKx8EVgZ0a3Xho7BXFY8D+DmEAZaPpwDPeScCkPisnxq4gAz53sS+0ByyaT3hf64
         Hsb7b43kl6d2lhbAFVbbE3kLt21s+9nGMASu4/LI0ffePVmQtgI9tWmNaP6wsC1GHNUm
         AkcQ==
X-Gm-Message-State: AO0yUKVEIg4aRcibq5n/TysxFnZm3CQuB/38ollc9NwSgjKltUWqaiZ7
	nD2MUxOlBjwdAI1CSgSlrCIjCdz0Ca1g8kZsdvw=
X-Google-Smtp-Source: AK7set+yDELKl+LrH9wQFhqj5IY3KpH/ln+2ZDqdL6w8LgMNY3Y16JSmdn4gdVBMUWg3kjn8dpMqYQ==
X-Received: by 2002:a5d:6b10:0:b0:2cc:4e58:f6d0 with SMTP id v16-20020a5d6b10000000b002cc4e58f6d0mr16396631wrw.54.1678494443760;
        Fri, 10 Mar 2023 16:27:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/16] m4/opkg/ethtool/attr/libgpg-error: Add missing bash ptest dependency
Date: Sat, 11 Mar 2023 00:27:07 +0000
Message-Id: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178345

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc                 | 2 +-
 meta/recipes-devtools/opkg/opkg_0.6.1.bb               | 2 +-
 meta/recipes-extended/ethtool/ethtool_6.2.bb           | 2 +-
 meta/recipes-support/attr/attr.inc                     | 1 +
 meta/recipes-support/libgpg-error/libgpg-error_1.46.bb | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index c098a4077ef..fd3efa54692 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -53,7 +53,7 @@ do_install_ptest() {
 }
 
 
-RDEPENDS:${PN}-ptest += "make coreutils diffutils"
+RDEPENDS:${PN}-ptest += "make coreutils diffutils bash"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
      locale-base-fr-fr \
      locale-base-fr-fr.iso-8859-1 \
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
index c95a40d2689..c3f4a7dd575 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -65,7 +65,7 @@ do_install_ptest () {
 RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}:class-nativesdk = ""
-RDEPENDS:${PN}-ptest += "make binutils python3-core python3-compression"
+RDEPENDS:${PN}-ptest += "make binutils python3-core python3-compression bash"
 RREPLACES:${PN} = "opkg-nogpg opkg-collateral"
 RCONFLICTS:${PN} = "opkg-collateral"
 RPROVIDES:${PN} = "opkg-collateral"
diff --git a/meta/recipes-extended/ethtool/ethtool_6.2.bb b/meta/recipes-extended/ethtool/ethtool_6.2.bb
index 881e6388518..aea03b729d3 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.2.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
 inherit autotools ptest bash-completion pkgconfig
 
-RDEPENDS:${PN}-ptest += "make"
+RDEPENDS:${PN}-ptest += "make bash"
 
 PACKAGECONFIG ?= "netlink"
 PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink,libmnl,"
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index a4e38f2b199..53d9dccb27e 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -49,6 +49,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest = "attr \
+                        bash \
                         coreutils \
                         perl-module-filehandle \
                         perl-module-getopt-std \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
index 580fe208d47..e0f2d86303e 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
@@ -26,7 +26,7 @@ BINCONFIG = "${bindir}/gpg-error-config"
 
 inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
 
-RDEPENDS:${PN}-ptest:append = " make"
+RDEPENDS:${PN}-ptest:append = " make bash"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
 
-- 
2.38.1


