Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 584DE7729C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 23:17:48 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l68so15876024wml.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 15:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Gg+yQqcvOclIq6EYgPzj1wx5B6MbJ6HaSHgVWZM991U=;
	b=h5cUJD36LCPp6VS3bIaoAtZszQTzhNMGhJCboIu2Bg4hD6gnuyK4zwXQrBk2D6jhUw
	/9JSj6ZgyDIILuamyZ5/XpAisd4hkfbfjPCP5akVXkwELeJVRvJ5YEufkh9kDeKo7srd
	meXk6ffycdj/6hmBPTBKawsDiHwlGxNLw6qG7w+pYizbprIDuKgO1AIBV9HMyXOX/O2w
	0WZNG3pbo0qVD1o0n9TttZQVW1tYn7P7emhUfXB9QSjsfrkFsW+EluxsSVVxzsWNZok0
	UoPM0Oj9EP7POtH9GNBNgSX6WJKTh99CHfsVL43W8eZYtv+TNIkpNQFzwG4Y/GlR+loE
	hrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Gg+yQqcvOclIq6EYgPzj1wx5B6MbJ6HaSHgVWZM991U=;
	b=W/UjoXA8uD+64l1J+B4vnn9ZtgpN/RohsbdhtYQTXYPZqOWAUP5qTfeIK37pyzB05+
	Pm6aAMBo2MqcagmO+I/DcpZHvNHlbx46nPB0btW8EhQThPezMl/UWZFwnFOdIavkSPi2
	sLkcp7suZMTAyzd60XBZH608xTpUorJYQmZvVvgtKoWhWDSMghCnblzg/a9InhS+o4ja
	t1K9U/7PgwBonZQH4oMbVmQYrgcCzJhQryAA0UMqZrb+c/V3mNOeXtdcTPId/woOR21u
	DFa/MC79MzkAY9wtpCfLQ7i1Irxaa+3fsYF6btkYchj0PW67PrX9FJ1I8sB1NKV98v2o
	aOdw==
X-Gm-Message-State: AD7BkJLzDbT0GxJXiB/jiYS+pcq9ywUciFuB2bMyk+oich0EferX3UNaopacMog+VDyVH/CN
X-Received: by 10.194.60.145 with SMTP id h17mr8596915wjr.47.1456615068923;
	Sat, 27 Feb 2016 15:17:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c7sm9067709wmd.13.2016.02.27.15.17.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Feb 2016 15:17:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Feb 2016 23:17:46 +0000
Message-Id: <1456615066-30144-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] cracklib: package all *.py* files
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
X-List-Received-Date: Sat, 27 Feb 2016 23:17:49 -0000

Don't assume that we know precisely what Python files were installed as patching
automake can change what optimised forms get installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index 8c9063e..2e9eae6 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -42,7 +42,7 @@ do_install_append() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py \
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py* \
 	${PYTHON_SITEPACKAGES_DIR}/_cracklib.so \
     "
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_cracklib.a \
-- 
2.7.0


