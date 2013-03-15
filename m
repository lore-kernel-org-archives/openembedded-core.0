Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGSkB-0007Ey-7D
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 12:24:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2F84DkL008700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2013 01:04:13 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 15 Mar 2013 01:04:13 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2013 16:04:03 +0800
Message-ID: <8c34b482af68133824a27987cb254523f9674ff2.1363333753.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1363333753.git.jackie.huang@windriver.com>
References: <cover.1363333753.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, Jackie.Huang@windriver.com
Subject: [PATCH 4/4] libatomics-ops: fix PN -> BPN in do_install for multilibs
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
X-List-Received-Date: Fri, 15 Mar 2013 11:24:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../pulseaudio/libatomics-ops_7.2.bb               |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
index 3706656..f31f983 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
 		   "
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
           "
@@ -25,5 +25,5 @@ inherit autotools pkgconfig
 do_install_append() {
 	# those contain only docs, not necessary for now.
 	install -m 0755 -d ${D}${docdir}
-	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${PN}
+	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${BPN}
 }
-- 
1.7.4.1



