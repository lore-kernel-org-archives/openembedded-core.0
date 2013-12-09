Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5611B6DF2B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 03:16:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB93GcPG026071
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Dec 2013 19:16:38 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 8 Dec 2013 19:16:37 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Dec 2013 11:17:25 +0800
Message-ID: <c20f79f4a812a4e007413751e3cabf63a4f5e6ec.1386558973.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386558973.git.Qi.Chen@windriver.com>
References: <cover.1386558973.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: default USE_DEVFS to '1'
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
X-List-Received-Date: Mon, 09 Dec 2013 03:16:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Default USE_DEVFS to "1" so that the `makedevs' command is not run
at rootfs time by default. There are mainly two reasons to do so.
1. This will fix a build failure with initramfs-kexecboot-klibc-image.
2. Most of our images use a filesystem over /dev. Most of the time, it's
   just devtmpfs. So we actually are using a filesystem over /dev.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cc65e35..b8bd462 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -77,7 +77,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
 
-USE_DEVFS ?= "0"
+USE_DEVFS ?= "1"
 
 PID = "${@os.getpid()}"
 
-- 
1.7.9.5


