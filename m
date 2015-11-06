Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A3E7A76E2E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:27 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so92301266pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Sio+NLRPIcZdcgYcVtx59aC2tX2ILkLVzvCXk7zybsQ=;
	b=ZyGomG97+VrMpertChSG/ZYIw54S3uGQlGQt9GOAjbCosVT+ru8vNKb728Csno90kc
	4gYbaYmmdq3ec2uYq1ruTkagOURMNuWqRlEui3g7z9vx1TGxBp96hm4GtSUjwtPjQ6z2
	Ed5EZF562FrPU+snEXgMObQZQsGys4g/HK7MmalfpHDgfmf57+Y3lPnvB1k4vjCoXgUN
	FfrH7/ISDpfF/YOdplKALWq5PMr1oYTqycw8K/hMFWojpan8ifUPIY5aIuYVwdi1y4Eu
	ib9SPBMkGx+Qeuln8L0k1NZ3bJMgz7RLc++H+IvWZHj3X5rm2eRsPpfXRm3Di+H/gxv8
	IsZQ==
X-Received: by 10.69.25.73 with SMTP id io9mr15706966pbd.87.1446799648250;
	Fri, 06 Nov 2015 00:47:28 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:27 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:02 -0800
Message-Id: <1446799631-7037-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 02/11] busybox.inc: don't export EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:27 -0000

EXTRA_OEMAKE is private to OE and shouldn't be exported to
the busybox build.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index cfdea30..5e59ca7 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -17,7 +17,8 @@ BUSYBOX_SPLIT_SUID ?= "1"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
-export EXTRA_OEMAKE += "'LD=${CCLD}'"
+
+EXTRA_OEMAKE += "'LD=${CCLD}'"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
-- 
1.9.1


