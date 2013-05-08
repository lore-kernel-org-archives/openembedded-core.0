Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZznA-0002XI-Va
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:32:11 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r488E2ZW004755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 01:14:02 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 01:14:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 04:13:58 -0400
Message-ID: <c3a393bdeb5b764dbd32226e89b6d3ef1a60e095.1367994910.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367994910.git.liezhi.yang@windriver.com>
References: <cover.1367994910.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bootimg.bbclass: add comment for NOHDD
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
X-List-Received-Date: Wed, 08 May 2013 08:32:23 -0000
Content-Type: text/plain

Add comment for NOHDD which is used for skipping building the HDDIMG if
set to 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/bootimg.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b7ddf42..117929e 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -20,6 +20,7 @@
 # External variables (also used by syslinux.bbclass)
 # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
 # ${NOISO}  - skip building the ISO image if set to 1
+# ${NOHDD}  - skip building the HDD image if set to 1
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
-- 
1.7.10.4



