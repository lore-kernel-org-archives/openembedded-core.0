Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id A04637D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:30 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id cb4so242216plb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PL93Srdn38V/MwXAOt+6wzxGYUswQHG0XSuJ+0VNiuo=;
	b=V/2f8/QeexJgHY1vPMWbG2E1bwr7+vXvZe3hq9ZcW/3c61gk3fr89QpM6zEEUXcRjy
	i2bkxGD7BKScCCAzHGIBIBZSjqyyylJhW7JyLqy3uLHVM+Z2JXeCbB005jGFW2EOjbZF
	7LURTXvp6E+2il9E/g0gf9Y6MFC/QY7O9ILbJFlYZdll1VB04xEFzXkcfQldGNLRmquK
	nTBD3eV0nm1NXZKKmSYlhMpLxWseXDbe+ok+M3QBdMMwbV+jEv8bRp7L2IJ2nTjXI158
	1Q4N8jTiUzuiV/uI9BJPU/s00C1i+RkDMN2hInpKBUVVokpO9SOq2A2Cbz9aBr8JSvTM
	HN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PL93Srdn38V/MwXAOt+6wzxGYUswQHG0XSuJ+0VNiuo=;
	b=oGucb6ZNK/fAunIbPDymsRhZrpylLCpO4lfYJL6j1+QbRQ0UUAKesAK0ZU07yE71IA
	NQDzgmgNJ5JMJAeTv6MC3pp+EVMmATMBAkRPhO+afm0QBR+eWgifCTVOjnQ5WjSE/0jJ
	zlP3VPn5lUCRTfNz4cR0tH+DdExh4SwjJ6zCtrBsx6puournS/q7jlNSaod1xqC7IC/y
	SOFMyVmG99PFQQZJsmEuso6Yle6Xv4y2wiP/1ymMRfUnvxTnQ8mJZHDIDar0lTuwwxbh
	Wf1zTfNxQd/32yABOlmMRJ+JQzt80N4H40wrL3k/vSmvLglkkPuAksSeZ+4CWDtODABS
	e6MA==
X-Gm-Message-State: APjAAAWRWF4E/Yq9Eedk6mwph5kOQSLDpai/vPiBT6UZJ2V8Pa5BTb8B
	geOickIhQbMWgu/wtVCuX6fA1KOy
X-Google-Smtp-Source: APXvYqyXg42w4coZIdrpowjAXytVWesuvcHPJ02I2bcdTcppG5HuPjIc6sf/WTWHTXdcqz6phZ9NMw==
X-Received: by 2002:a17:902:9a4a:: with SMTP id
	x10mr19021655plv.113.1556983651585; 
	Sat, 04 May 2019 08:27:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:42 -0700
Message-Id: <dd2529b7874f895f671c6a016cc0819a2f9e2846.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 06/43] linux-yocto-rt: update to 5.0.5-rt3
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
X-List-Received-Date: Sat, 04 May 2019 15:27:30 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the -r3 release, which has the following rt specific
fixes:

    printk: An all-in-one commit to fix build failures
    powerpc/stackprotector: work around stack-guard init from atomic
    powerpc/pseries/iommu: Use a locallock instead local_irq_save()
    powerpc: reshuffle TIF bits
    tty/sysrq: Convert show_lock to raw_spinlock_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index adffe4e..24c4816 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "06e1ff79ea9efef052404ee1989cae038b28e954"
-SRCREV_meta ?= "f0b575cda6d03540ff8da2f70421f13a08f34a5e"
+SRCREV_machine ?= "4767ff117d75b2cd54d2c0f77dc1c3e6fdd6c520"
+SRCREV_meta ?= "2070c41a1d0542e41cac5f0ea04a108e46cac427"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.0.3"
+LINUX_VERSION ?= "5.0.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
-- 
2.7.4


