Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75E9CCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:32 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.28045.1658155826572144392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZvQXJ3hz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id e132so10796931pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CFJc+MhgF1pxZlq5ssVwDXPJaTa3J5/ctQceMD+V5TI=;
        b=ZvQXJ3hzVZ6/gWQe4mPWvG2cwFEZ8+tTnWKOOUzrVVqf973zZ7fdlFZhoIeV1FBviK
         AKy5OKCAwhISyHEA2f1VKyyoHr4e6mPvwf/tDA5IpSWs96+0Iq5W31tXTk5W57jVqrAO
         tXXEhEBQgq76UBBGIbbDZuetN5jtG+Pr+FN/XCMa9PXUeVjAfVtgcUgOe+qwlCnJpf7R
         XJURtn2Bdim3EDL0q1L4iunqVlnAaLfTtWQ1GGsQVbe9Ru8ruh1AysGbG+TDbUtfIkbf
         VTT46sn82tFOfhOm1EP+2nBwIVK8uMXOF/JBhASwJw8/rqhzl4Z5OemUFVexglLePdlP
         X+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CFJc+MhgF1pxZlq5ssVwDXPJaTa3J5/ctQceMD+V5TI=;
        b=v7y+YeqShvb7Uk3rbOiyrEZ5Gi2fxZOh9OhCfgNXqyW3u4G4K0CElet+wH8mKrslyE
         WOU6IEr/hEt6fdUFcUe1T5EDOTuILVDaKphFXyWY5hq3GL/RyWStzWvd2RMdunDWhvf5
         5F3yC6+08RdQGbRn4JEzGQX5SzwoV/7rhXFr8r4/Ll9TnyJJFxUyRwNBja8upldz3AH4
         gYXE6QzF58sGPKVb0D5VDR9mdGLt9C4fBEe67JuT/5ovdVcT3QkwR9PeseORxAy9d40k
         LXRRdkeAsYOwth0FWYQo5R7HWcC0s3hIJ+4OiBBDzRlkx7otce500syMpG7MLRspqVM4
         t+wg==
X-Gm-Message-State: AJIora+wao8R5RJ2l4GISewHCiFPy+DUtYFCMN511yiuPYK2VnkTthtz
	7NrpAKEJe//emNdqFh8LB9Y76nnBROEM2c8D
X-Google-Smtp-Source: 
 AGRyM1vaZUFjhMnt/zqlb910Dq7Y8kaQL4FZ7HW5LTNnl/wzqLmlR7+WKi6UXdbFtBKA8GoIIvPtSQ==
X-Received: by 2002:a05:6a00:1628:b0:52a:bd79:c175 with SMTP id
 e8-20020a056a00162800b0052abd79c175mr28321832pfc.14.1658155825454;
        Mon, 18 Jul 2022 07:50:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/35] alsa-state: correct license
Date: Mon, 18 Jul 2022 04:48:48 -1000
Message-Id: 
 <7c3d9c5d72f1e832697b51a89e284e0b1e041f38.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168223

From: Peter Marko <peter.marko@siemens.com>

* add GPL license because of alsa-state-init file
* gpl link points to gpl3, but at time of adding this file was actually
  pointing to gpl2, so should correspond to SPDX GPL-2.0-or-later
* remove date as the file was already changed several times since then

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ca73ff0d9930d545ce8cb8a62e259c0b43310f99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb              | 7 +++++--
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init | 3 +--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index df546633f1..27b2eccbe4 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -8,8 +8,11 @@ SUMMARY = "Alsa scenario files to enable alsa state restoration"
 HOMEPAGE = "http://www.alsa-project.org/"
 DESCRIPTION = "Alsa Scenario Files - an init script and state files to restore \
 sound state at system boot and save it at system shut down."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LICENSE = "MIT & GPL-2.0-or-later"
+LIC_FILES_CHKSUM = " \
+    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
+    file://alsa-state-init;beginline=3;endline=4;md5=3ff7ecbf534d7d503941abe8e268ef50 \
+"
 PV = "0.2.0"
 PR = "r5"
 
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
index eee59cb321..a04cc27004 100755
--- a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
+++ b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
@@ -1,10 +1,9 @@
 #! /bin/sh
 #
 # Copyright Matthias Hentges <devel@hentges.net> (c) 2007
-# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Filename: alsa-state
-# Date: 20070308 (YMD)
 
 # source function library
 . /etc/init.d/functions
-- 
2.25.1


