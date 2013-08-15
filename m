Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 789C96B8AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:22:58 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so184388eak.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LYsyox2f95emjPFKp/Bsy906aF2wD85/XjiNVj/PypQ=;
	b=S2PI1UqGK1rEnrplGfMDDJOimye7iupuIsgfC5K2E1RpxqpDPid7PdKrZJh/mKLaDt
	pplaBGOjdngntPHSSIwEaHeaBzokdr7NQTRYDo8veDFHaB55s8OCcED52kBFdw4X10ab
	ICeFPHUW5HPjc7V67ygyEpB+fZJag4c97VNGSVqkXsZiWeXQ7/vR1yAPaljzXhc3/5AF
	/byn7BRxmkPF6friqtmdHJfWWuMFsT3Z8+nkzeBvL+Pi1yzEMYPfu+lG+o+ImMerlgzu
	El9i1meOQEHNvJCEb62AxKSyxPhzn+g6rS2cuoSZY49ly6ccUI8uw3Qzudv9672HCZh0
	G9Qg==
X-Received: by 10.14.37.4 with SMTP id x4mr20878713eea.16.1376551378920;
	Thu, 15 Aug 2013 00:22:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm81972828eel.12.2013.08.15.00.22.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:22:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:15 +0200
Message-Id: <d3290a75c84556ff5f2e76e9e7188ba297e220a1.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 04/33] taglib: add missing dependency on zlib
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
X-List-Received-Date: Thu, 15 Aug 2013 07:22:58 -0000

* without target zlib it tries to use native one:
 | /OE/sysroots/x86_64-linux/usr/lib/libz.so: could not read symbols: File in wrong format
 | collect2: error: ld returned 1 exit status
 | make[2]: *** [taglib/libtag.so.1.12.0] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/taglib/taglib_1.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/taglib/taglib_1.8.bb b/meta/recipes-support/taglib/taglib_1.8.bb
index 76d2e51..4c151b7 100644
--- a/meta/recipes-support/taglib/taglib_1.8.bb
+++ b/meta/recipes-support/taglib/taglib_1.8.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
 
+DEPENDS = "zlib"
+
 PR = "r1"
 # http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
 SRC_URI = "https://github.com/downloads/taglib/taglib/taglib-1.8.tar.gz \
-- 
1.8.3.2


