Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E6D596E687
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 22:56:38 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p63so50257197wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/xqf1OkqbbujGG/pk6G6ExkeL93NWI2NKQuE7Hx0FBY=;
	b=rnetrId/5bvmbqu7cRehqQFpxjuQKul9rht7nnii1OvO5BbIOnl2QUh0XyuaENIdvt
	zQkuySsyFq3ijT++4qMivt2cStlORIah9YPTFTxvD/lDB6gf/2RgVc59CzC60jLopsQ4
	MHMbxqOIdAFRGU0HhYXzdMtNkOalZV5nRKvhHIpy0yvgrxnLdBCVi3i6uVSIExjZQJCv
	g09ilvhDPkuGzQwVnqw/MwJsawoyyXd2wyLwUjp/pBs/VRWJ5W4cxfHPu3qOCZeNr9au
	2LH+g/TXR9q7ieog0csXhuxPNHuk+gDuCIVbFdjWzDy0ztiGo0SQfH/DYAFHfqVHqGdv
	N8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/xqf1OkqbbujGG/pk6G6ExkeL93NWI2NKQuE7Hx0FBY=;
	b=MhzoedJKu08zXJX3qyDI419If4kfsIW109Uo+uYOqnW78r8ifPyTpKY71XEjCxSlFe
	0O7YGMtSi7N9lE9Gi/fvgc1NK8rDskfIfeNvdMJ8F9xd0teu/Vjn/8jszZo/yij2/6fM
	k50Vwd3wrvomiR19VYygJTPD56QSgoewMU/bI/aSwexcXq1MEZTBq2dqxWOBoxkiURlP
	LJorvqzhMiqjYNHVryr60pa40PqLeG50P9i4ulPITFPVrio324y2Lk/0AfTpeXmhXFpD
	sdYKjok9jTB57t2pI3wG3r+etUJedhZlhVS97EfjFD/ZAVLqxxjN3yyRWrgYpNnqHZwT
	X99Q==
X-Gm-Message-State: AG10YOTbfHOsKkp1xi7/jfjHJ5AakwxlYUyRtu1V9g7jNERao2chHStMHM1bbN3J6iIL3oh3
X-Received: by 10.28.1.196 with SMTP id 187mr13547839wmb.68.1455144998135;
	Wed, 10 Feb 2016 14:56:38 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id i2sm4863784wjx.42.2016.02.10.14.56.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 14:56:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 22:56:35 +0000
Message-Id: <1455144995-15559-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] piglit: upgrade SRCREV
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
X-List-Received-Date: Wed, 10 Feb 2016 22:56:39 -0000

Upgrade the SRVREV to a slightly more up-to-date revision, this time from
2015-02-19.  This commit in particular was chosen as it's the one before Piglit
gained a hard dependnecy on python-six, which isn't yet in oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 82912fd..607f236 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-tests-Fix-missing-include-of-Xutil.h.patch"
 
-# From 2014/12/04
-SRCREV = "126c7d049b8f32e541625d5a35fbc5f5e4e7fbf8"
+# From 2015-02-19
+SRCREV = "c4585427913e4cb28994b4bfb11d49778273aa2c"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.7.0


