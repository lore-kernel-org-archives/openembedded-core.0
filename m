Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B282738F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:32:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t269WdkX012807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2015 01:32:39 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 01:32:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 01:32:35 -0800
Message-ID: <b7139695ceb52af222c4278c284596d50f667ef8.1425634271.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] mailx: fix SRC_URI
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
X-List-Received-Date: Fri, 06 Mar 2015 09:32:38 -0000
Content-Type: text/plain

The old one is not available any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mailx/mailx_12.5.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index f2899d5..080d71f 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
 DEPENDS = "openssl"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}-1.diff.gz;name=patch \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/heirloom-mailx_12.5.orig.tar.gz;name=archive \
+           https://launchpad.net/ubuntu/+archive/primary/+files/heirloom-mailx_12.5-1.diff.gz;name=patch \
            file://explicitly.disable.krb5.support.patch \
           "
 
-- 
1.7.9.5


