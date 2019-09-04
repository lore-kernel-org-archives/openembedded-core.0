Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 749547D70B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 09:36:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x849aOQm020460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 02:36:24 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 4 Sep 2019 02:36:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2019 05:35:55 -0400
Message-ID: <20190904093555.59494-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190904093555.59494-1-kai.kang@windriver.com>
References: <20190904093555.59494-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] sysstat: 12.1.3 -> 12.1.6
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
X-List-Received-Date: Wed, 04 Sep 2019 09:36:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update sysstat from 12.1.3 to 12.1.6.

* make sa_lib_dir refer to ${libexecdir}/sa to fix conflictions when
  multilib is enabled

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc                     | 4 ++--
 .../sysstat/{sysstat_12.1.3.bb => sysstat_12.1.6.bb}          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.1.3.bb => sysstat_12.1.6.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 592cbf4574..5a7d2114ca 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
 LICENSE = "GPLv2+"
 SECTION = "console/utils"
 
-SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
+SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
            file://99_sysstat \
            file://sysstat.service \
           "
@@ -29,7 +29,7 @@ SYSTEMD_SERVICE_${PN} = "sysstat.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
 do_configure_prepend() {
-    export sa_lib_dir=${libdir}/sa
+    export sa_lib_dir=${libexecdir}/sa
 }
 
 do_install() {
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_12.1.3.bb
rename to meta/recipes-extended/sysstat/sysstat_12.1.6.bb
index 5daf3f45f5..8cf8c36d9b 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "0f9b73f60aba6fd49de346bc384902c3"
-SRC_URI[sha256sum] = "55498bf82755ba9fed3e7df61fd26f8f50dd3e7b3b229c731029a4c8ab51a1aa"
+SRC_URI[md5sum] = "d8e3bbb9c873dd370f6d33664e326570"
+SRC_URI[sha256sum] = "f752f3c406153a6fc446496f1102872505ace3f0931d975c1d664c81ec09f129"
-- 
2.20.0


