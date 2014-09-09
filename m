Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84FF57067B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 06:35:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s896ZXp0021137
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 23:35:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 23:35:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 14:35:47 +0800
Message-ID: <e5231488cd1ae45078ff2bf369779f804fd7400e.1410244514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410244514.git.Qi.Chen@windriver.com>
References: <cover.1410244514.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] zlib: install into base_libdir
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
X-List-Received-Date: Tue, 09 Sep 2014 06:35:33 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

[CQID: WIND00444742]

Install zlib into base_libdir as kmod needs it. The purpose is to
make system boot into single user mode even if /usr is missing.

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20131113

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta/recipes-core/zlib/zlib_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index bdfa045..5b5e2e1 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -21,7 +21,7 @@ RDEPENDS_${PN}-ptest += "make"
 inherit ptest
 
 do_configure (){
-	./configure --prefix=${prefix} --shared --libdir=${libdir}
+	./configure --prefix=${base_prefix} --shared --libdir=${base_libdir}
 }
 
 do_compile (){
-- 
1.9.1


