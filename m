Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 516DF7F829
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:10 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g206so4389144wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q6BkYd+COG689iAftSd57KiAAQcLi6umK822nfZ5tnA=;
	b=bgo0N09lyBuzBuEj2YTgXWtiQ/WybDkRt5MJ5XeW/9jCqIPHahhuosEBRc6ujKrGm8
	MN95Pt3SAB/YH0D3/M8vQItr7N8naWas59PIV8TugnDfLUthThhtUiz85+CzQyjAPufn
	szY153O5dGPWzudnxfqZf3uV7+Q1QDLcfi5Dt2Y12owfnQgn1SkR86yRK2zXH8qrkvIz
	ZhaYnpSbhkbhbqFDJaNVffrhbtzSD28etPNWMTcb3rNfuCvpxy+rD6SofzEcP36rTBKs
	CEn446t+RKNlfukX1xgHRfGmhR1ysJupeL3iRXSlbwZ2tnOs9jbp0CQO4Gyd7sUJmpcv
	zKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q6BkYd+COG689iAftSd57KiAAQcLi6umK822nfZ5tnA=;
	b=WYhX7FLz2puVoTQ1SNh70kgraaAW40G+Byd7R06gWoRkm546uuDOScao1zmnpjg2rD
	eqDOx1gCsg1cmwFfn5yxAwOx77t3m6Zjdxz4ifdHqxLLhrwsBL2dpmOlNWbUOokl0j/Q
	sN0+/ZKHcXdg34nygD8hqUSSJTOGmMILbP0B4VjS8u8NaX5UfMIQJ0uOXaXPMbOXBiLr
	ua90PXHWlh4YYvQA85yv7FWd9O5lC14fkoeY0VHnjpkd/w6PjSolWAPI0My+bT8aZYKO
	FY6piMd37cBPPk6iWDm2pKMerErAy17xoqJ0xk9TYNWlPPe1d9n14abfuhQPTjcDI/pE
	H8pA==
X-Gm-Message-State: APjAAAU9sOefhkj/Xls0CCtd/QQFkj+a2c3MH6/O49Y6strCHLHHZbEZ
	Z8vvI67AfIlP/zGMo3MKbxlZIXyq
X-Google-Smtp-Source: APXvYqwcX4rA2v5jnlFLNIOSUHddD9QB7agwd1i0M2u25uf9hHUlpWrB2vm5ESlXQyHgoQsEiTn3jA==
X-Received: by 2002:a05:600c:218f:: with SMTP id
	e15mr5775038wme.124.1575560650921; 
	Thu, 05 Dec 2019 07:44:10 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:41 +0100
Message-Id: <20191205154357.121346-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/24] selftest: skip virgl gtk/sdl test on opensuse 15.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2019 15:44:10 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index ccd2c40aa3f..7aa9fb25da2 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -181,6 +181,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Debian 8')
         if distro and distro == 'centos-7':
             self.skipTest('virgl isn\'t working with Centos 7')
+        if distro and distro == 'opensuseleap-15.0':
+            self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         sdl_packageconfig = get_bb_var('PACKAGECONFIG', 'libsdl2-native')
-- 
2.17.1


