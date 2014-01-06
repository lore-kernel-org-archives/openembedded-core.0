Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 655BD6B961
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 03:27:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s063R7TW017550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jan 2014 19:27:07 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 5 Jan 2014 19:27:07 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2014 11:27:25 +0800
Message-ID: <863ec5a3d581ba413c1eb095fc9cb64aac15d230.1388978801.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1388978801.git.Qi.Chen@windriver.com>
References: <cover.1388978801.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grep: upgrade to 2.16
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
X-List-Received-Date: Mon, 06 Jan 2014 03:27:06 -0000
Content-Type: text/plain

---
 .../grep/{grep_2.15.bb => grep_2.16.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.15.bb => grep_2.16.bb} (86%)

diff --git a/meta/recipes-extended/grep/grep_2.15.bb b/meta/recipes-extended/grep/grep_2.16.bb
similarity index 86%
rename from meta/recipes-extended/grep/grep_2.15.bb
rename to meta/recipes-extended/grep/grep_2.16.bb
index b24188f..be39555 100644
--- a/meta/recipes-extended/grep/grep_2.15.bb
+++ b/meta/recipes-extended/grep/grep_2.16.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8cab8ca52bcae735af40278423c7c942"
-SRC_URI[sha256sum] = "bf5a834e587974c8c64e71b35b9e75cd21c7ff253c0e7fbfb0a78be794965314"
+SRC_URI[md5sum] = "502350a6c8f7c2b12ee58829e760b44d"
+SRC_URI[sha256sum] = "16dfeb5013d8c9f21f40ccec0936f2c1c6a014c828d30488f0d5c6ef7b551162"
 
 inherit autotools gettext
 
-- 
1.7.9.5


