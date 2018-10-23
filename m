Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF2379C3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 04:52:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9N4qQkQ022744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 21:52:36 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 22 Oct 2018 21:52:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2018 12:58:22 +0800
Message-ID: <5b6cd92fe35423239f37c9817d24e543f4ab814a.1540270676.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1540270676.git.Qi.Chen@windriver.com>
References: <cover.1540270676.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libaio: extend to nativesdk
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
X-List-Received-Date: Tue, 23 Oct 2018 04:52:46 -0000
Content-Type: text/plain

lvm2 currently requires libaio. So building nativesdk-lvm2 will
result in the following error.

  ERROR: Required build target 'nativesdk-lvm2' has no buildable providers.
  Missing or unbuildable dependency chain was: ['nativesdk-lvm2', 'nativesdk-libaio']

Extend libaio to nativesdk to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/libaio/libaio_0.3.111.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipes-extended/libaio/libaio_0.3.111.bb
index 5bd8307..04b50b6 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.111.bb
@@ -19,3 +19,5 @@ EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
 do_install () {
     oe_runmake install DESTDIR=${D}
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.9.1


