Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F400C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 15:29:19 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.46986.1680449349414984022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 08:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KkUXeWtf;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id z11so17551677pfh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680449348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGFquxhw6sN1zAPkjB85oRHVCHFoWqrwXgFdhQY9sFQ=;
        b=KkUXeWtfOZaO1N3LLc3uBoaGKOdBYGrw+yia0h1N+ur7wM1I7ug/DcNTDFwJiTascu
         MoK1G+CB69qT3c5Okv2zYFAzkFejyX0WHW902Kcnww8nq+oG1AfQc7F6M4Id87qQeDWQ
         Zwh3SiiGl+HHOcbR5fLOIr2ObJ59JTs/nmokArRlybRVh/4coOSR+77L2/f0Ule8Ng6I
         yd3fQElh68m8K7gDXB7QGo1/y65TI6vVFzlYk2tk+o9aCrW638dnrxrcBeXvJrPxgvVM
         9inG8a+QS84LI9E2uPgeA3cKgVVRIEQRx8WcDqlWFRU4MWtq1kTuXPft8ZIAT6YtRPzi
         yz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680449348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGFquxhw6sN1zAPkjB85oRHVCHFoWqrwXgFdhQY9sFQ=;
        b=EGsoZp9NjA+noCMT8YFtO0W/Cl9NQHvPxWSaSQE418nYyc72mKJmzj/r0PbVurKkd0
         shEDKKtCWzfTTSdjl0cWV7Eqjobr05EX0+7MQTjoF6AyvexTqxix0dw4HzdHU6wGWaoI
         rgP2kdUNQ83kYI9Qgnt8JGatDJeT3pdtV90G7GNLBFgtJ5f6FFx/E6gkPhZdsW6ziC7J
         8/vhIaJuKTJ3R1PXmtoizkm+B+zoT85cFAcCa9dY2RbnhEPqK9iWWHj3FW/gLtmAmz5d
         SRLzhifzTvRAaQBVAi99rPvFzcIHk2gOi7YMKxOCtBwjiofGLuR89ekfEZUkCaK1xIDD
         pBnw==
X-Gm-Message-State: AAQBX9eJJD8076RPkAK+1dy0eMuTc36+AnwtgnAcOB2n/WkHAEu+VF62
	LtHw9LunuU+uaB5ZRASxhfnZHqYw3COjtA==
X-Google-Smtp-Source: AKy350a5ykIA5aekvb7sS3Q8XbcxL8p/QPt4K5KFZBoOm3BORRdjDBooS2jiVmJ/lJL7jc6vaiOQjw==
X-Received: by 2002:a62:5543:0:b0:625:a012:a59c with SMTP id j64-20020a625543000000b00625a012a59cmr34430050pfb.9.1680449348469;
        Sun, 02 Apr 2023 08:29:08 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id n23-20020aa78a57000000b005809d382016sm5163357pfa.74.2023.04.02.08.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 08:29:08 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com
Subject: [kirkstone][PATCH] cargo : non vulnerable cve-2022-46176 added to excluded list
Date: Sun,  2 Apr 2023 20:58:36 +0530
Message-Id: <20230402152836.9157-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 15:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179580

This cve (https://nvd.nist.gov/vuln/detail/CVE-2022-46176) is a security vulnirability when using cargo ssh.
Kirkstone doesn't support rust on-target images and the bitbake using the 'wget' (which uses 'https') for fetching the sources instead of ssh.
So, cargo-native also not vulnerable to this cve and so added to excluded list.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 8b5f8d49b8..cb2d920441 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -15,6 +15,11 @@
 # the aim of sharing that work and ensuring we don't duplicate it.
 #
 
+#cargo https://nvd.nist.gov/vuln/detail/CVE-2022-46176
+#cargo security advisor https://blog.rust-lang.org/2023/01/10/cve-2022-46176.html
+#This CVE is a security issue when using cargo ssh. In kirkstone, rust 1.59.0 is used and the rust on-target is not supported, so the target images are not vulnerable to the cve.
+#The bitbake using the 'wget' (which uses 'https') for fetching the sources instead of ssh. So, the cargo-native are also not vulnerable to this cve and so added to excluded list.
+CVE_CHECK_IGNORE += "CVE-2022-46176"
 
 # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
 # CVE is more than 20 years old with no resolution evident
-- 
2.34.1


