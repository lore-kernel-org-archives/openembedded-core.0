Return-Path: <bkylerussell@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF3A36EAB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 18:31:01 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rl12so525070iec.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1sjovcJ0nu+gZJrsu465gNPzHLlckzuKlwCF4y9L8Lk=;
	b=k4wuAbEC1HutoB2I7PMiqmn/6bRRPkLFJ8MlIvNpLyVB4YAltgiFtUYohbUGR2uTd3
	fnImMtXr8BxtmfMmtuf31j43asL5QYm1DpBTjN3dWmHu0D22qdGy0v4ri6kRobxGxrtA
	TF/xvFFk3kChwZacknEBoi6vckmNxiBeI51qyRSMa4ARMuHEQlfbCKvBgWX7xcVpS/du
	BZlVrJOjDizuYldNnThMkq7dN7cAGJlOjqPUsSDR3xA828WYWDihtHy+F5dfPTD0FPsp
	y0IVmcRGOytqZ+vTVYpzLBQueyZJmsscR9Bo9w+WtZOmuuSIpad4iwoB40uCdykJ4s2q
	u+yA==
X-Received: by 10.50.61.147 with SMTP id p19mr2588763igr.49.1392834661822;
	Wed, 19 Feb 2014 10:31:01 -0800 (PST)
Received: from brrussell-Latitude-E6530.dhcp.lexmark.com ([192.146.101.8])
	by mx.google.com with ESMTPSA id r4sm52086299igh.1.2014.02.19.10.31.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 10:31:01 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 13:30:32 -0500
Message-Id: <1392834632-2867-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] image-vmdk.bbclass: Don't force syslinux timeout
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
X-List-Received-Date: Wed, 19 Feb 2014 18:31:02 -0000

Don't force SYSLINUX_TIMEOUT and SYSLINUX_PROMPT if overrides have
been defined elsewhere for an image configuration.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/classes/image-vmdk.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 6983e5c..bdb9e18 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -2,8 +2,8 @@
 #NOISO = "1"
 
 SYSLINUX_ROOT = "root=/dev/hda2 "
-SYSLINUX_PROMPT = "0"
-SYSLINUX_TIMEOUT = "1"
+SYSLINUX_PROMPT ?= "0"
+SYSLINUX_TIMEOUT ?= "1"
 SYSLINUX_LABELS = "boot"
 LABELS_append = " ${SYSLINUX_LABELS} "
 
-- 
1.7.9.5


