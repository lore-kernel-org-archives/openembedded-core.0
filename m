Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C94EA7E4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:31:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8P9V4bf019703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:31:15 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:30:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:30:52 +0800
Message-ID: <604679f4585c656362226770d59f5375861a0335.1569403775.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403775.git.liezhi.yang@windriver.com>
References: <cover.1569403775.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] expect: Fix configure error for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:31:24 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-expect
checking for Tcl public headers... configure: error: tcl.h not found.  Please specify its location with --with-tclinclude

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 96eacd9..de8e141 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -47,6 +47,7 @@ do_install_append() {
 # when building for the target.
 TCL_INCLUDE_PATH = ""
 TCL_INCLUDE_PATH_class-target = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
+TCL_INCLUDE_PATH_class-nativesdk = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
 
 EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                  --enable-shared \
-- 
2.7.4


