Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EDB136C42C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 03:50:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB33oiIC019444
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2019 19:50:44 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Dec 2019 19:50:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2019 11:50:42 +0800
Message-ID: <1575345042-29535-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libtirpc: fix wrong path of command ln -sf
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
X-List-Received-Date: Tue, 03 Dec 2019 03:50:47 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix wrong path of command "ln -sf", the file should under folder
rpcsvc

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index 633cece..9d8533a 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -32,7 +32,7 @@ do_install_append() {
         done
         for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
             if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
-                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
+                ln -sf ../tirpc/rpcsvc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
             fi
         done
         ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
-- 
2.7.4


