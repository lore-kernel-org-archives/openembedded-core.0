Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D96171E68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 02:37:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1L2b6ns019318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:37:07 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Feb 2015 18:37:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Feb 2015 18:37:06 -0800
Message-ID: <032cb24e9226a499a25898f664eb1dfbb0af66c9.1424486192.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424486192.git.liezhi.yang@windriver.com>
References: <cover.1424486192.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] groff: skip file-rdeps checking
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
X-List-Received-Date: Sat, 21 Feb 2015 02:37:06 -0000
Content-Type: text/plain

Avoid the warning:
WARNING: QA Issue: groff requires /bin/sed, but no providers in its RDEPENDS [file-rdeps]

Our busybox provides /bin/sed, so skip the file-rdeps checking to avoid
the warning.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/groff/groff_1.18.1.4.bb |    1 +
 meta/recipes-extended/groff/groff_1.22.2.bb   |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
index bd786a3..922a712 100644
--- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -47,3 +47,4 @@ pkg_postinst_${PN}() {
 	echo "export GROFF_TMAC_PATH=/usr/share/groff/${PV}/tmac" >> $D${sysconfdir}/profile
 }
 
+INSANE_SKIP_${PN} = "file-rdeps"
diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 63f0425..513d299 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -64,3 +64,5 @@ FILES_${PN} += "${libdir}/${BPN}/site-tmac \
                 ${libdir}/${BPN}/groffer/"
 
 BBCLASSEXTEND = "native"
+
+INSANE_SKIP_${PN} = "file-rdeps"
-- 
1.7.9.5


