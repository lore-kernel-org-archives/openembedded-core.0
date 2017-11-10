Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAF978643
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:49:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADn4Gf018151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:49:04 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:49:03 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 21:48:55 +0800
Message-ID: <9aea5e098481c8c13e41ebc027fcbe5ea0ab92a1.1510321707.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510321707.git.liezhi.yang@windriver.com>
References: <cover.1510321707.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: print command search result when not found
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
X-List-Received-Date: Fri, 10 Nov 2017 13:49:03 -0000
Content-Type: text/plain

This makes debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index fe4459d..785421e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -908,6 +908,9 @@ class BaseConfig(object):
         lockdir = "/tmp/qemu-tap-locks"
 
         if not (self.qemuifup and self.qemuifdown and ip):
+            logger.error("runqemu-ifup: %s" % self.qemuifup)
+            logger.error("runqemu-ifdown: %s" % self.qemuifdown)
+            logger.error("ip: %s" % ip)
             raise OEPathError("runqemu-ifup, runqemu-ifdown or ip not found")
 
         if not os.path.exists(lockdir):
-- 
2.7.4


