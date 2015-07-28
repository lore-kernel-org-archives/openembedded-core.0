Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id D5DA976427
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:21:42 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so3835461ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rpTwmn10eLIeY+H1yG8SukCRb7OsTjLWW3KkH6vC3/8=;
	b=alHfA2PyuN8N0xvrnwFYV+W6BBPafMgljiGSTK9W/EIAylCw52waRxl77ZD+hKTCRu
	ygx5ZSUlKuznqIBIO8JOfURRp8lKnD+fNyBVBVenWsFEWZ+2VbXWY4E31fqP+JB1v1i3
	ZRWSAZYb03PzwPTyF80+qsgVM/zEoPM7BsMaee+0yaWzRxoFQCd1Ut78yMD3t4ofsEgd
	OfgMOFFTCVIDHMYFymg5dk0eC8z5kxmiqhe2J5GYCVd7YY+enRxEy1hzfeORgCNkK7J5
	uBo4TGdv/Vx+pFkn49um+MMv89egYlpLsIpINN1Y0zQyUKsMjbi4H77Wg4dtMr9GOYMT
	gAbw==
X-Received: by 10.107.33.65 with SMTP id h62mr57633150ioh.11.1438125702852;
	Tue, 28 Jul 2015 16:21:42 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i7sm9668533igt.18.2015.07.28.16.21.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jul 2015 16:21:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:21:03 -0700
Message-Id: <1438125665-14966-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/8] busybox: disable fatattr in defconfig
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
X-List-Received-Date: Tue, 28 Jul 2015 23:21:43 -0000

The fatattr applet (to display or change file attributes on a fat file
system) doesn't seem like core functionality, so disable by default.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 5e87239..74d12ee 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -545,7 +545,7 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # Linux System Utilities
 #
 # CONFIG_BLOCKDEV is not set
-CONFIG_FATATTR=y
+# CONFIG_FATATTR is not set
 CONFIG_FSTRIM=y
 # CONFIG_MDEV is not set
 # CONFIG_FEATURE_MDEV_CONF is not set
-- 
1.9.1


