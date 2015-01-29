Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8735E6012B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 21:34:40 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kx10so43589877pab.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 13:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=zCMSb9OqqwllzsGz5aoKfnpnC2IYzBasB6DTVtsmweo=;
	b=EltI3RzgnoPpbs3aKHGuZic10RLZ/vHVpRA3lDqMyMWhioz9tlwATLd5P7UdoZS8z1
	dAqBTjHh0rUnoGKXJHXfXZWdoRB4ifiHXESxXU2vdcPaSnlbhL6zkCKbb0XXkoZkTrDd
	27eokVpMlS/gbBCD81+gBBz/uA7oS7X67hHwcRawwPFoQh9WsOc2t9odn1AH/culaNzK
	k2AOzPMgdcrs9WhoNuo9Q3q6tY5/bcz6H5sDYEG1yBjJkabUqGCfu+vtdgPQxasBnwui
	2WcjhYPPSuAQcRSxlM/SLr0csggJUzMOWwdmNAqiQpiqF7Fr2ek4XHG+wYDwaLeW2SVU
	QwWA==
X-Received: by 10.68.237.35 with SMTP id uz3mr4088992pbc.26.1422567281552;
	Thu, 29 Jan 2015 13:34:41 -0800 (PST)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18])
	by mx.google.com with ESMTPSA id tu7sm8801213pac.6.2015.01.29.13.34.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Jan 2015 13:34:41 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jan 2015 13:34:40 -0800
Message-Id: <1422567280-7697-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] busybox: Include 'mesg' utility
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
X-List-Received-Date: Thu, 29 Jan 2015 21:34:49 -0000

The 'dot.profile' supplied by base-files calls 'mesg'.  For simple
images using busybox e.g. core-image-minimal, this utility should be
available to avoid errors on login:

 -sh: mesg: command not found

Provide mesg with busybox.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 8394067..c200ee0 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -441,7 +441,7 @@ CONFIG_FEATURE_KILL_DELAY=0
 # CONFIG_FEATURE_INIT_COREDUMPS is not set
 # CONFIG_FEATURE_INITRD is not set
 CONFIG_INIT_TERMINAL_TYPE=""
-# CONFIG_MESG is not set
+CONFIG_MESG=y
 # CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set
 
 #
-- 
2.1.0


