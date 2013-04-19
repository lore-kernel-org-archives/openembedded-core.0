Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrapet@gmail.com>) id 1UT7Ur-0001bC-KY
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 11:20:53 +0200
Received: by mail-we0-f175.google.com with SMTP id t11so3302694wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=8gp2W9LL8EQg84hEFyWDsnm3tn7LrhjgIR3xWJygths=;
	b=0DOWXBL6hXvQ5zP75ra7uVkGZolY3PWRN/6mmi+Uu8ttmfLH6NSCOmrElz10a3cC4B
	xLu8wAI6319mo/mhppYiuzHEHsF8V7Gbt3EAZ2JHp1i33VzbbW3b5X7PtoxWvpp7MCVo
	iKK3bbnteYWzA9Q+HbNXJQD8kfQhTjIkH1rbEWJ2Vsv2W150jEr9haOmocwa7Ax4x8iS
	KA63bjLz/hbH2AikU9auOkAWQtV7ufWnIk1MRgJqcSWNniZLxjobi/MOfoy5cBLUddC0
	yU1hGJMpneV7HzHSKh50s2Ne3sTmWf8qpuA9CO0pyhBqUf7ZhUjv84mKbADyFTfZEG5d
	/CyA==
X-Received: by 10.180.183.133 with SMTP id em5mr14066127wic.26.1366362190046; 
	Fri, 19 Apr 2013 02:03:10 -0700 (PDT)
Received: from localhost.localdomain (mur75-1-81-57-45-18.fbx.proxad.net.
	[81.57.45.18])
	by mx.google.com with ESMTPS id bq19sm2218897wib.7.2013.04.19.02.03.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:03:08 -0700 (PDT)
From: Matthieu Crapet <mcrapet@gmail.com>
To: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Apr 2013 11:01:23 +0200
Message-Id: <1366362083-7654-1-git-send-email-mcrapet@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libomxil (0.9.3): drop unecessary dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2013 09:20:53 -0000

Since version 0.9.2, Bellagio's components (vorbis, mad, also, ...)  are shipped in separate packages.

Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
---
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index ded0e1c..8c3166f 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -4,7 +4,6 @@ LICENSE = "LGPLv2.1+"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
-DEPENDS = "libvorbis libogg alsa-lib libmad"
 
 PR = "r0"
 
-- 
1.8.2.1



