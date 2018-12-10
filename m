Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 057AD6D1E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 02:24:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBA2OoUi009574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Dec 2018 18:24:50 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Dec 2018 18:24:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Dec 2018 18:24:23 -0800
Message-ID: <d8d5c615ca2b0527b3927161c2401dc6cbe72512.1544408339.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1544408339.git.liezhi.yang@windriver.com>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] apr/openssl10: Enable ccache for them
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
X-List-Received-Date: Mon, 10 Dec 2018 02:24:49 -0000
Content-Type: text/plain

The work well now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb | 3 ---
 meta/recipes-support/apr/apr_1.6.5.bb                 | 1 -
 2 files changed, 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
index 6518dac..1986cf2 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
@@ -76,9 +76,6 @@ EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABL
 
 export OE_LDFLAGS = "${LDFLAGS}"
 
-# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
-CCACHE = ""
-
 TERMIO ?= "-DTERMIO"
 TERMIO_libc-musl = "-DTERMIOS"
 
diff --git a/meta/recipes-support/apr/apr_1.6.5.bb b/meta/recipes-support/apr/apr_1.6.5.bb
index c2f5900..ed93a7e 100644
--- a/meta/recipes-support/apr/apr_1.6.5.bb
+++ b/meta/recipes-support/apr/apr_1.6.5.bb
@@ -40,7 +40,6 @@ CACHED_CONFIGUREVARS += "ac_cv_file__dev_zero=yes"
 # Otherwise libtool fails to compile apr-utils
 # x86_64-linux-libtool: compile: unable to infer tagged configuration
 # x86_64-linux-libtool:   error: specify a tag with '--tag'
-CCACHE = ""
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.10.2


