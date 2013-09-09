Return-Path: <jeff.polk@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9406BE4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 16:29:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r89GT42o008222
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2013 09:29:04 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 9 Sep 2013 09:29:04 -0700
From: Jeff Polk <jeff.polk@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 11:29:14 -0500
Message-ID: <1378744154-6489-1-git-send-email-jeff.polk@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] sanity.bbclass: add xz to SANITY_REQUIRED_UTILITIES
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
X-List-Received-Date: Mon, 09 Sep 2013 16:29:03 -0000
Content-Type: text/plain

xz is commonly available and is now used by some recipes
It's reasonable to expect it to be present so error immediately
if it's not.

Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a49b405..26038cb 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -2,7 +2,7 @@
 # Sanity check the users setup for common misconfigurations
 #
 
-SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
+SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio xz"
 
 def bblayers_conf_file(d):
     return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
-- 
1.7.1


