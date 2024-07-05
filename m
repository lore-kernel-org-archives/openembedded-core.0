Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C543AC30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 09:23:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.13294.1720171377357598261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 02:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V6YibNpJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-367963ea053so1081249f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720171375; x=1720776175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xuXS6r+R7L2bEdC2JI3YnUUAGOcfz0bwtv4pRFJ6Dyo=;
        b=V6YibNpJqpC8x+rdcznvtLARgDbXzfa36fChoj89T4KqVTqVOnhiH0Qt83bzLoP4Pz
         DhRz9I162BsmwlBMb+TdXOxiJq1cOEMK6it5FX8tcBwfB4bWr0w4jMG766zkGSQ73Y6n
         n8OQpG+34IZEYyKgpuRfFT+qKu8yKIiygCBU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720171375; x=1720776175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuXS6r+R7L2bEdC2JI3YnUUAGOcfz0bwtv4pRFJ6Dyo=;
        b=SL5R3tlnE7TLyvcaAaOY7rf6w0yplJxEeseqHn/bhvoDiAHxcfQ+NkPR25CCzR38mi
         7H3Zktvq5bSNOrJblv/L+ij8iihrLBc3UNsVh5Q3jhg14EMdEbpi7OLQ1fYAZ0yUnl0n
         WSGS1fXt/hE16Q6pasHNkZs3k3RRQnz15jL7+oBuLJaP+LS2yssh10BhP8AmPRNpwIva
         T70wvIT3ljiLZaDXLClgh0zcsOwR2I425PlWUPqiRdzUdPMjlIZXwQe+Nr0BgsXTAenr
         JXoz54c7PIPUCZyx+VAnCS/RxLPLqn92dN7lt9wTvTuhQEfS7U7YV98FzrBetbf6ho8W
         xRcQ==
X-Gm-Message-State: AOJu0YyXDHZ1v42cPMpJYjLJeJHyIN4zYSlWiyHoetOvsxXVKOfljVcw
	iDI/VJe2SNQcmaYNCks0ZPXFYFPXl+L2LjftH3L+egyozd4NLbFNHZv8hCNdIWpF0mt56N8OSjy
	n
X-Google-Smtp-Source: AGHT+IEPVzquL7apYRUlEEqjn6quXoq1UHH4AtJvbmPK+Q3hTp8u80+zw3hwbLNwdJfCMyrU3696UA==
X-Received: by 2002:adf:e405:0:b0:367:9c0b:374a with SMTP id ffacd0b85a97d-3679dd71fcbmr3728590f8f.65.1720171375155;
        Fri, 05 Jul 2024 02:22:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679c03fb09sm3789331f8f.70.2024.07.05.02.22.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:22:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] abi_version/package: Bump hashequiv version and package class version
Date: Fri,  5 Jul 2024 10:22:53 +0100
Message-ID: <20240705092254.3435292-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 09:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201592

The recent pkgconfig change and subsqeuent fixes have left the hash equivalence
server in a corrupted state with hashes linking the changes beofore and after
the pkgconfig change, breaking reproducibile builds.

Bump the appropriate version numbers to allow us to move on and avoid
build failures and corrupt equivalence data now the underlying issue
was fixed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass | 2 +-
 meta/conf/abi_version.conf          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index aa1eb5e901c..6cd8c0140f2 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -476,7 +476,7 @@ python do_package () {
     # cache.  This is useful if an item this class depends on changes in a
     # way that the output of this class changes.  rpmdeps is a good example
     # as any change to rpmdeps requires this to be rerun.
-    # PACKAGE_BBCLASS_VERSION = "5"
+    # PACKAGE_BBCLASS_VERSION = "6"
 
     # Init cachedpath
     global cpath
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 13c2c45b42a..0fe91b5ddf3 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "15"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "16"
+HASHEQUIV_HASH_VERSION  = "17"

