Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lei.Yang@windriver.com>) id 1TsBbs-0001Ay-PG
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:15:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07AsdxH028514
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jan 2013 02:54:39 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 7 Jan 2013 02:54:38 -0800
From: <lei.yang@windriver.com>
To: <lei.yang@windriver.com>, <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 7 Jan 2013 18:54:36 +0800
Message-ID: <1357556076-17485-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH:V2] Remove the redundant "/" in base-files
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
X-List-Received-Date: Mon, 07 Jan 2013 12:15:22 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

I'm working on my virt-test,when I check this file find it has
redundant "/"

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 39faad9..8ef7195 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Miscellaneous files for the base system."
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
-PR = "r72"
+PR = "r73"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # Removed all license related tasks in this recipe as license.bbclass 
@@ -78,7 +78,7 @@ do_install () {
 		install -m 2755 -d ${D}$d
 	done
 	for d in ${volatiles}; do
-		ln -sf volatile/$d ${D}/${localstatedir}/$d
+		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
 	for d in card cf net ram; do
 		ln -sf /media/$d ${D}/mnt/$d
-- 
1.7.1



