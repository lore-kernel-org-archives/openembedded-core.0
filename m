Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA8106E5DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t131CKBc012986
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:19 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:11:59 -0800
Message-ID: <d90f7174f53234a2310880fb98925cc5c290b197.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/21] groff 1.18.1.4: fix HOMEPAGE and SRC_URI
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:18 -0000
Content-Type: text/plain

The upstream has moved tarball to "old" dir.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/groff/groff_1.18.1.4.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
index 7fbce9b..bd786a3 100644
--- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -2,13 +2,13 @@ SUMMARY = "GNU Troff software"
 DESCRIPTION = "The groff (GNU troff) software is a typesetting package which reads plain text mixed with \
 formatting commands and produces formatted output."
 SECTION = "console/utils"
-HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
+HOMEPAGE = "http://www.gnu.org/software/groff/"
 LICENSE = "GPLv2"
 PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e43fc16fccd8519fba405f0a0ff6e8a3"
 
-SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/${BPN}/old/${BP}.tar.gz \
           file://groff-1.18.1.4-remove-mom.patch;striplevel=1 \
           file://man-local.patch \
           file://mdoc-local.patch \
-- 
1.7.9.5


