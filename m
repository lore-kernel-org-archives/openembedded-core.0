Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id BB7A176AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:45 +0000 (UTC)
Received: by ioii196 with SMTP id i196so207537777ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b20VY2e3dBZef/L2V6vSYhf3YCXtkzwqBJTymaCZEAM=;
	b=V3iA/hVDZNu/iZWl7WBt9xNY5g0R6ChbxOmnsT/SE2JEfJ6N0/t8D4luVFKL/AhE5Y
	OIma5Plm5xhXgot+n6UrCUskeSgTw0eHQWesM7etZv6liGFS5xz4otoS3gE4iuiSGiIN
	zf+cWcohFo8sjgjj8iiFZRcqaeT8Kofm6o4De1yK19KAZdXHJDscvzbitZSpJ1hSAkVM
	0cFif8Me/M4i/rp67M8W2PwKM+eCvV/FV0xGeNFAZYjHzljaIISdO52WsEkn+2bYyiUx
	uFoIbbqwSmJc9NW3Axc6jFY3r+bk/ggHOrOddBx91i+JoYAsAUtfuPqMwC+pvgIolEpG
	YBsg==
X-Received: by 10.107.138.233 with SMTP id c102mr31175935ioj.187.1444101585490;
	Mon, 05 Oct 2015 20:19:45 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:23 -0700
Message-Id: <1444101568-16639-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/7] busybox.inc: don't export EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 06 Oct 2015 03:19:45 -0000

EXTRA_OEMAKE is private to OE and shouldn't be exported to
the busybox build.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4d4709a..235bda2 100644
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


