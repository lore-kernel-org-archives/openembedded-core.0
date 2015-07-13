Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA726E648
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:04:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA4Yrs006127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:04:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:04:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:04:30 -0700
Message-ID: <2bf92dbc892c01e163e1275bbd13d5bdedd4d071.1436781811.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436781811.git.liezhi.yang@windriver.com>
References: <cover.1436781811.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] glibc: remove invalid ac_cv_path_KSH
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
X-List-Received-Date: Mon, 13 Jul 2015 10:04:35 -0000
Content-Type: text/plain

There is no ac_cv_path_KSH in configure, can't find it
in config.log after remove, either.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index da56bc9..74ad0b5 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -52,7 +52,6 @@ REQUIRED_DISTRO_FEATURES = "${DISTRO_FEATURES_LIBC}"
 LEAD_SONAME = "libc.so"
 
 CACHED_CONFIGUREVARS += " \
-  ac_cv_path_KSH=${base_bindir}/bash \
   ac_cv_path_BASH_SHELL=${base_bindir}/bash \
   libc_cv_slibdir=${base_libdir} \
   libc_cv_rootsbindir=${base_sbindir} \
-- 
1.7.9.5


