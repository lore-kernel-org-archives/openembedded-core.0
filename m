Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103DBC52D11
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.82153.1674238277463498526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Asaw+39q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id a184so4562106pfa.9
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+2CNxYouLVYqcsFTxa6YpTKp0ARwEnzD1sy/HS4oMU=;
        b=Asaw+39qoIfS1Qide7qjaZXE0+u6OX3krBGzBiwTrl39vgy3zF2Kat3hnwTEtql0kq
         Eh7YgradzlB2ukDK2aNdqMnFU9jQG7B/vp9LB6MVzHiwWz9nkMjWKx4KH72nn4aVSSLk
         NcXFcyFeZ7YFp0skFOlsm80OTqA3+FiCnRIOckTkre779zSYWQzSe0/vWjFUZQ6B80bY
         mN8EFA6YCIj9aCRfsQx0zroj7UgO0CEDkBADpHd4XRRrUHO63+OAQ1Mjx9o3EWfI6h1U
         B1osTgC3l+Qd690as3CnF1I1Uio4ekQsFDCEjC/HWdzTSXUaj6z/5kVlzbaKRkgPMwna
         x1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+2CNxYouLVYqcsFTxa6YpTKp0ARwEnzD1sy/HS4oMU=;
        b=NdLIDzq1mMUF6gEvl8QGwBs7Gf0jzXsMW77TF0UxmEhkj3MIxxnPokhJuVlhUdb3mV
         uzyTZ/QS2gfuyiIRF8yYzfDNf8va3npC0C0rKt60bm+3G3n45/HhgkzX4gAt+hIWFPeV
         Jg51rtm/VqHJuLiJ0th8hFEFR1tUhxyKaUybtPc17Xms33MaC28Rb1SeToNaNfQ7uJCn
         JxmXWjOFz3/srzT5ASclJIQeecb5a1F3/dD2Z3dFtEEEkigapuCHr6Nuuk8phgry+6GA
         QkSiPbPn85WuEjQxi7cCIYIK7PDciyY+CxOL3dl/H4wuakpl+Nu3VaeKv2s7dV9W5FyD
         D9ZQ==
X-Gm-Message-State: AFqh2krlnDE/BRRAzFffV7+6R1TlsJ7yuAmUFaF7hotV+emcJdpmWo9B
	47H6k9UKV2jXP2osqhAagvjzV0EJkaZHocJJR34=
X-Google-Smtp-Source: AMrXdXszHgnmmsBVIVcIC1QvaoqKsJOEuZ2EQco5jV4A7CsDCQcPr25LRnJfr1qnXvgOv33eGO8gng==
X-Received: by 2002:a05:6a00:4295:b0:58d:b2c0:e4e3 with SMTP id bx21-20020a056a00429500b0058db2c0e4e3mr15671245pfb.25.1674238276605;
        Fri, 20 Jan 2023 10:11:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/41] libksba: update 1.6.2 -> 1.6.3
Date: Fri, 20 Jan 2023 08:10:24 -1000
Message-Id: <f098cb5073051eb371f4142678b4b3d5e7b52426.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176213

From: Alexander Kanavin <alex.kanavin@gmail.com>

Noteworthy changes in version 1.6.3 (2022-12-06)

Fix another integer overflow in the CRL parser. [T6284,CVE-2022-47629]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83f3f21b1b84ab9e7b461ac966691c80f4ed4e97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch        | 6 +++---
 .../libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index af96bd57cd..bdb80ff34d 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 6081640895b6d566fa21123e2de7d111eeab5c4c Mon Sep 17 00:00:00 2001
+From ca8174aa81d7bf364b33f7254a9e887735c4996d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/ksba.m4 b/src/ksba.m4
-index 6b55bb8..6e7336f 100644
+index 452c245..aa96255 100644
 --- a/src/ksba.m4
 +++ b/src/ksba.m4
 @@ -23,37 +23,6 @@ dnl with a changed API.
@@ -44,7 +44,7 @@ index 6b55bb8..6e7336f 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$KSBA_CONFIG" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG ksba --exists; then
 -      KSBA_CONFIG="$GPGRT_CONFIG ksba"
 -      AC_MSG_NOTICE([Use gpgrt-config as ksba-config])
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.3.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.2.bb
rename to meta/recipes-support/libksba/libksba_1.6.3.bb
index f6ecb9aec4..dc39693be4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.3.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
+SRC_URI[sha256sum] = "3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.25.1


