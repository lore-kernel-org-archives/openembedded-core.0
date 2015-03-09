Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABF09738ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 07:15:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t297FGW4022656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Mar 2015 00:15:16 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 00:15:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 00:15:11 -0700
Message-ID: <0ff5d279a262a006f2c3d6e679b108b59e659771.1425885208.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425885208.git.liezhi.yang@windriver.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Mon, 09 Mar 2015 07:15:16 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-1.diff.gz;name=patch, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mailx/mailx_12.5.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index f2899d5..9103d53 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
 DEPENDS = "openssl"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}-1.diff.gz;name=patch \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
+           http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx/heirloom-mailx_${PV}-1.diff.gz;name=patch \
            file://explicitly.disable.krb5.support.patch \
           "
 
-- 
1.7.9.5


