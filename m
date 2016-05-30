Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 025D476E5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 08:02:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4U82RV8012092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 01:02:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 May 2016 01:02:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 May 2016 16:02:34 +0800
Message-ID: <9697a509e56ad274d52f6d82866adfddd0a3d484.1464595294.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1464595294.git.Qi.Chen@windriver.com>
References: <cover.1464595294.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] webkitgtk: disable gobject-introspection on mips64
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
X-List-Received-Date: Mon, 30 May 2016 08:02:27 -0000
Content-Type: text/plain

Disable gobject-introspection on mips64 to avoid do_compile failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
index 23ead72..0ff05c2 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
@@ -92,3 +92,6 @@ ARM_INSTRUCTION_SET = "arm"
 # qemu: uncaught target signal 11 (Segmentation fault) - core dumped
 # Segmentation fault
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_INTROSPECTION=OFF "
+
+# qemu: uncaught target signal 6 (Aborted) - core dumped
+EXTRA_OECMAKE_append_mips64 = " -DENABLE_INTROSPECTION=OFF "
-- 
1.9.1


