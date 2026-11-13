Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13457.1794582203915886074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 07:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ApcfP8Aj;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5067a2411bso206438866b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582202; x=1795187002; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LLR4wZwVceEZQV4fCaR541yI+qJZhxFfrpP8sllOxZM=;
        b=ApcfP8AjRWCx0MtFzot2C+vVwHLCFycJ2+QQGdAo/ZHdV0SYAgpnqHLUJG7XKvR0ku
         rYJFXRpIyNOUdZgEKGskrNAkOYxaPDrJ84fU4CsJDKNuaWClWDfNJmENhhGZ5FdrfKOs
         5s2oAsrByeHC22cKH1JhS19QNN/eFzBE8gZ7fSNA0EMFETqHXV/H/59gOA1aLn5hmQjd
         cEx8dnWg74btkjcLLaEg3Poyi1OlUrqL9rc08SV1Losrt1X3vSO+8QHhuvQj7ZRlANNR
         tfR2zhi25w6+KPUUz67emanWE7e9I1NhWGILFG7nZOkzYARG3ZXcB9xE5oXN0DOg7o2f
         2hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582202; x=1795187002;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LLR4wZwVceEZQV4fCaR541yI+qJZhxFfrpP8sllOxZM=;
        b=RBqPq9pblB7dgANinaxq3hzJS7J8DYR1FeP9S9rnjEx8h03qr/eFd4oFDCg08Oh3Ks
         5ai396aVnQja3O286TRzOfv4yDfaMOp710iAa7Y8AAMTAmzonSK3wpqRjyYFZO/U7SOq
         PQCQ4bk5mQ56yb6yEAEhQ/FaGrutrFN8A/BV6CmNaaw+AhS6m+dA3rhvx/d0k7tqlqjU
         B5ZkBgbYkFOkvcwVhkX8TZH8GSvZYXRxUDuz81pGyr+Qtwf1fMMjT5Hyx2vCx2nRdCQk
         wAN7qxyPtyF2lIA+tUDfl+jqc4IHiRKYHodWYNndmWiJBi967Kxno4U+64d4mFHGDAtn
         Vipg==
X-Gm-Message-State: APuU4Z89n3pSjS3zCaRXDI6nGMsQo8qI+5oBC5+2pWNIc95goosPRGmq
	5LErD4In53P2bf8q6gvhdNFuYgGecvzApwugyJqkLVch3Wtz0PNggflWvuDboUVw
X-Gm-Gg: AYBFou2TjwJ2YBIpeSUPykrUVKJDzL4KzLvMc7TwXrLozXbwOBBapAJrjFtMSHT2L4o
	8bO0fApgbAaUSrASgcJi/2gdG5IL5aZLmw2U95SfPvqyeGXlW6LlinFDbz7k20q6vsktipgX1YD
	4GWpUyNOzxQNWAhT7vb/FGGM9051Z+6CEjcJBq9+wy8YWP+S+Wg8tZP+mXUeSghHZE+2tR52hge
	9RqmlteATBLgzpM6kRS9vQqSztT28VGN/xCsv0zhIyKVGA5nBjE37tz3P99PXLUHO0KHWun3FS6
	kdGRlDL1apUg2Y+gs63otZocNCITCzGlhaAXGWylrxsdPJYQMVQZXMsRx0cn/VUsIO37VvHKK1q
	HQ+3WJdRs5n79vtKLQCDNSFc3wWQ7d+AafBrr/oFTsODZidrOuHuQmAfIw3EnLHGQL9+Dr11uYY
	c92lXKUHEPpBauBiUa7BPtYU3OhWHiIhJPDr3y+S3/G7WyIQfmzjBqSYvqKKWaAx4cqYReCV2Ew
	TDLhCM8UE/BdeVd4QmSPyTLQWgBZ0fpR9rLRr6AwhgalQtZAzozbgFaz8MaHVmxYrPFntOARxrl
	9Vaqp5kfK2+1dXCQ56tQT5IiNcAumsHT
X-Received: by 2002:a17:906:99c9:b0:c50:95bd:e491 with SMTP id a640c23a62f3a-c50964377d8mr267935966b.28.1794582201921;
        Fri, 13 Nov 2026 07:03:21 -0800 (PST)
Return-Path: <michalwsieron@gmail.com>
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm4970426f8f.16.2026.11.13.07.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:03:21 -0800 (PST)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Fri, 13 Nov 2026 16:03:04 +0100
Subject: [PATCH] python3-sphinx: Make __pycache__ removal optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-msieron-python-sphinx-pycache-v1-1-7e641cba892f@nokia.com>
X-B4-Tracking: v=1; b=H4sIAKcm92oC/yXMQQqDMBBA0avIrA2YWES8irhIpmMzQmPI2KKId
 ++0XX3e5p8gVJgEhuqEQm8WXpPC1hVg9OlBhu9qcI3rrLWteQpTWZPJxxY1kiOnXYUeI5ngmu7
 WB49+RtBHLjTz/vuP09/yCgvh9p3CdX0AXxcCz4EAAAA=
X-Change-ID: 20261113-msieron-python-sphinx-pycache-b20648bacafc
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 15:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250183

One can disable bytecode compilation via INSTALL_WHEEL_COMPILE_BYTECODE
and in such case this rm will fail.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/recipes-devtools/python/python3-sphinx_9.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
index e54b35ca68..fde0777022 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
@@ -12,7 +12,7 @@ inherit python_flit_core pypi
 
 do_install:append () {
 	# The cache format of "{None, 'en', 'ja'}" doesn't seem to be consistent (dict ordering?)
-	rm ${D}${libdir}/${PYTHON_DIR}/site-packages/sphinx/writers/__pycache__/*latex*
+	rm -f ${D}${libdir}/${PYTHON_DIR}/site-packages/sphinx/writers/__pycache__/*latex*
 }
 
 RDEPENDS:${PN} = "\

---
base-commit: 34991d0ce3cc5f38dd29e824af7579512d2b917e
change-id: 20261113-msieron-python-sphinx-pycache-b20648bacafc

Best regards,
--  
Michal Sieron <michal.sieron@nokia.com>

