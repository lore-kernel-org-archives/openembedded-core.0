Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE64B6605F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 05:36:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4J5aY1c027153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 22:36:34 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 22:36:33 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 13:36:31 +0800
Message-ID: <7a92a9da4b308473462f49d608a71cd1d014fbdb.1400477731.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1400477731.git.Chong.Lu@windriver.com>
References: <cover.1400477731.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpcre: Update to 8.35 version
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
X-List-Received-Date: Mon, 19 May 2014 05:36:33 -0000
Content-Type: text/plain

Upgrade libpcre to 8.35 version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/libpcre/{libpcre_8.34.bb => libpcre_8.35.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.34.bb => libpcre_8.35.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.34.bb b/meta/recipes-support/libpcre/libpcre_8.35.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre_8.34.bb
rename to meta/recipes-support/libpcre/libpcre_8.35.bb
index 5c5072c..a99b34c 100644
--- a/meta/recipes-support/libpcre/libpcre_8.34.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.35.bb
@@ -6,7 +6,7 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=0920cc1a9f7ba95464491fa83c86afd8"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=ded617e975f28e15952dc68b84a7ac1a"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "5439e321351bddd5533551bbce128d07"
-SRC_URI[sha256sum] = "b6043ae1ff2720be665ffa28dc22b7c637cdde96f389a116c0c3020caeae583f"
+SRC_URI[md5sum] = "6aacb23986adccd9b3bc626c00979958"
+SRC_URI[sha256sum] = "a961c1c78befef263cc130756eeca7b674b4e73a81533293df44e4265236865b"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.8.1.2


