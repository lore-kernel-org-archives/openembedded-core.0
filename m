Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CF3C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 04:24:08 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2106.1784521434393097528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 21:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qr7s/IAv;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848643382fcso10766178b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 21:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784521434; x=1785126234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSg7h4CArF6sxk6hpsfL3QQcX15XdeMqDSZsBJwKWTk=;
        b=qr7s/IAvDVHMeT/AQBmHMtv6V6RzUMvQfrr5ykOjgdV9Ps628uAah9jHbmAi31xVWb
         5FNDvMWtf8ZqaFSnUIK8xJgcxM90Au0smB+mUWd41p6fa34RBlkdBRgnzdC5tW1tZOS8
         iEP0FXrx3U73ldKLhtXpQBFkG9b8EA5Rn1MQzEqYHaIn9nFBz0fS9RqUlHQGCsZ50Phx
         yGGdTcDw9mbPCOw349lvnfLsZk4qRizY8aaDIIcKLTrm7G0gi5sus/KcoRVjBN551zye
         fBHFcICOtYTRLH5B4B7XEZH4WAzcDNHgaqkWRpNKpm1+YllcMj8h//NayMm8VxJkIHpt
         RWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784521434; x=1785126234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSg7h4CArF6sxk6hpsfL3QQcX15XdeMqDSZsBJwKWTk=;
        b=c2oSDeseUE+NgnY2CmjhMMltrj5ggUYv5Y/wlnjrXeIFl3Z1ifTOCfK0+0WLL9hC86
         pxAP5HfmIbyCojc+PHeSWQ4fCUdg7Z++M6bdZHC31ecYVnyG1wjUvrln4P6jDbV9zmZB
         TSqtho5yAaCciI4MBb5jNQRcDOMNEbvZW3cg//iHJ64MT5fzDwMWOcQI65i/m+ndZlDb
         Xq0NnmlQ1AcCn4h7J4vI2x6+B9bttGUJRYFat/wDDHLL/bQPOBILz7hF+TS1gXCIladR
         KzIGLpt4mwdvJuBY+MoC+FUsoYS/3fm6fIik3P1M6Dr84ORstLDZekmZiXHz/J6CCxcH
         lQxA==
X-Gm-Message-State: AOJu0Yxqz1MXtYDWYp8Rp7mipJGOK5bDhnNA9yhctqJv19tVg3Wjzuns
	CfyFanV6oyJhm8Oc2v1g0FRMnbPdUNikh/ZaWwZqQdp5k6oZ6GV6+1i8D4dHAA==
X-Gm-Gg: AfdE7cmNinjZi4mK6EcpYHh47BSAcydxygH1zPIQmb1WHL78CGWdUF6iIKpTIcyJFFW
	JNvalHtgNarwS0v4uWtQIn9dqsxBMpbGhjcL6hk12Zov2VGlbYdCACjpzfh2UzZsgFRY4TCktag
	AkjT4yjRujN6/kp0+BNnImfC8A3Qql5bvVXMUK1DGh2LVg/Www+23CKHWnWH77SgYMBnWZiyaiv
	s8lH2/zBryBnKqos5nSWghPq5hZZ8DWuPGImO0fYWJOxeJBYTCGWH3edCW9dXtSlvRb8FNcn3sC
	5mOzwAnRF4RL1meG67xVJn8eMXXd7YmxcI+md4j+KtoOgPAKjOQDiebfNgTRHrD5FhDUze/Sqpj
	BK5EtoojWFdoxFhDZGRrG8NnvUxdaJr64G1mELbJ0GjN1z07SE1aCex8J3DhXU/8uVHDvyfUuK5
	erIJ5PRgATdRfms5s=
X-Received: by 2002:a05:6a20:9397:b0:3c3:83e8:c211 with SMTP id adf61e73a8af0-3c3ada1fe89mr13469416637.63.1784521433713;
        Sun, 19 Jul 2026 21:23:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcaefsm31046004eec.10.2026.07.19.21.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 21:23:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 1/3] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
Date: Mon, 20 Jul 2026 16:23:42 +1200
Message-ID: <20260720042344.695725-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 04:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241311

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97a940bfdeaa3f9f4442a6fbb0fabe1ce5eaff69)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c816043..a70e9dd0da 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 

