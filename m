Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6F22571D9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 02:56:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q189so4240439wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 19:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0WW+reFgCNL0gOktRrnXabcKU//6dUGwCs3/bCGeOp4=;
	b=YG7SLwnSJEJTLfWyQw80OYXGu43KxnQk1k2DnYDmveW/Diham1flt3zPowaVU+vzz+
	GkAVKeaLMvVkqY8GSm0c9RzVwn2QT3syZK4J03Jmk3aUxRNz3zn7v+6fsizsrBmhE2q7
	SwTFk5x/WZO4qi5W8Do31fWbFzzDx9ojhEcl32fL7xHFVba/C8cOft1h3+wUCS9guufV
	0zHo1V5oiqSozFbCc2cY/zPKu4PMcAF5sEcuLiLQc38M6Kc4px2H/lntdvyWGe8RqWSZ
	ur33S98c9d/agqINT/jz37kWFJeZyiPysK5dZ4KvrrF9Swwg+g80EPfUfs/RjOjYEqI3
	x5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0WW+reFgCNL0gOktRrnXabcKU//6dUGwCs3/bCGeOp4=;
	b=KVX+DfXga5IsIz2D7IHTCx2ZN434YbU3Nc3dajd/x5oR8qrP+ZsuZH1S43DNx6FZ5q
	49TdwehSVXjTAWYWV4L0JbQ7V4DOGUZkbZY7W7mSeeKE6EPZMhQU2hAZP6tCc/hrPvKj
	ijsNovpgnxGJnE//VzBocoxFUNPqc2Ve2RSF3M4mD/3vfcojfzOGOCmRIJMh9iCxguT3
	vmPi0EF9whT5kwbcKQcN03bLYvkAa79V3J8Qf9zhoQkaMemwejKBkvXez9p+OSV14pqy
	JSaJQK+emn1ARG6zhKLDJClgP7MS5xuXWsNBtg+8W8oSfVtzdGLJjZRHGXfXSObtXFjg
	5txw==
X-Gm-Message-State: AIVw113/SGtgS6Iak/2k/UdVOIJzz84sidPT6apREEiW2mHzbCTX/tCW
	sc0Cw2dntRI16F7R
X-Received: by 10.80.187.13 with SMTP id y13mr1017678ede.122.1501815413103;
	Thu, 03 Aug 2017 19:56:53 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	b10sm1984131edl.74.2017.08.03.19.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Aug 2017 19:56:52 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 04:56:29 +0200
Message-Id: <1501815391-8192-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
References: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2 2/4] wic-image-minimal.bb: add parted-native e2fsprogs-native to WKS_FILE_DEPENDS
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
X-List-Received-Date: Fri, 04 Aug 2017 02:56:52 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

They are needed by wic to generate a image based on
wic-image-minimal.wic.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index e1da203..5a83af5 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -6,7 +6,7 @@ IMAGE_INSTALL = "packagegroup-core-boot"
 
 IMAGE_FSTYPES = "wic"
 
-WKS_FILE_DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gptfdisk-native"
+WKS_FILE_DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gptfdisk-native parted-native e2fsprogs-native"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-- 
2.7.4


