Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDBD6D5B3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 04:36:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA94aEKt025145
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 20:36:14 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 20:36:13 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 12:36:10 +0800
Message-ID: <9238e5a8e090c9a7adfa2e10faac2d3d6e60066b.1383967708.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1383967708.git.jackie.huang@windriver.com>
References: <cover.1383967708.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagegroup-core-basic: define VIRTUAL-RUNTIME_syslog
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
X-List-Received-Date: Sat, 09 Nov 2013 04:36:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We have rsyslog and syslog-ng in our layer, and oe-core
has sysklogd, define VIRTUAL-RUNTIME_syslog so that we
can switch them easily. Set sysklogd as default here,
we will have setting in distro confs to override it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 55de32f..c89923d 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -96,12 +96,13 @@ RDEPENDS_packagegroup-core-dev-utils = "\
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_login_manager ?= "busybox"
+VIRTUAL-RUNTIME_syslog ?= "sysklogd"
 RDEPENDS_packagegroup-core-initscripts = "\
     ${VIRTUAL-RUNTIME_initscripts} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ethtool \
     ${VIRTUAL-RUNTIME_login_manager} \
-    sysklogd \
+    ${VIRTUAL-RUNTIME_syslog} \
     "
 
 RDEPENDS_packagegroup-core-multiuser = "\
-- 
1.8.3


