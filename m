Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76C0879D13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:00:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O70I12001265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 23:00:29 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 23:00:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 23:00:02 -0800
Message-ID: <a0d185da70165b9d7e8166bf7e6a1a7065045fea.1548313066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1548313066.git.liezhi.yang@windriver.com>
References: <cover.1548313066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gcc-runtime: Add --cache-file to EXTRA_OECONF
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
X-List-Received-Date: Thu, 24 Jan 2019 07:00:38 -0000
Content-Type: text/plain

This can save configure time since it runs configure multiple times:
$ time bitbake gcc-runtime -cconfigure
  60s -> 54s

  Saved 6s

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 50ecc81..3d03d8e 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -15,6 +15,7 @@ EXTRA_OECONF_PATHS = "\
 "
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
+EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
 
 RUNTIMELIBITM = "libitm"
 RUNTIMELIBITM_arc = ""
-- 
2.10.2


