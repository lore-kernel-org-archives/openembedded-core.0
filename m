Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77CEE7E541
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8P9V4bi019703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:31:25 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:31:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:30:53 +0800
Message-ID: <94619a2a1eee28dc3b19b4b1d2c8e1a9f7adc61d.1569403775.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403775.git.liezhi.yang@windriver.com>
References: <cover.1569403775.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] apr: Fix configure error for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:31:34 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-expect
buildconf: libtool not found.
           You need libtool version 1.4 or newer installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/apr/apr_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 09a65bf..02df068 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "util-linux"
 
+DEPENDS_class-nativesdk = "nativesdk-libtool"
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
                     file://include/apr_lib.h;endline=15;md5=823b3d1a7225df8f7b68a69c3c2b4c71"
-- 
2.7.4


