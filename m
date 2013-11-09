Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED426D4BD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:28:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA95T08x025400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:29:00 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 21:29:00 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 13:28:53 +0800
Message-ID: <3f23b90e347148afd892b09f7c497994e8c001f4.1383974819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] zlib: install into base_libdir
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
X-List-Received-Date: Sat, 09 Nov 2013 05:28:58 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Install zlib into base_libdir as kmod needs it. The purpose is to
make system boot into single user mode even if /usr is missing.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/zlib/zlib_1.2.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index 5cdf685..3504e59 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "28f1205d8dd2001f26fec1e8c2cebe37"
 SRC_URI[sha256sum] = "831df043236df8e9a7667b9e3bb37e1fcb1220a0f163b6de2626774b9590d057"
 
 do_configure (){
-	./configure --prefix=${prefix} --shared --libdir=${libdir}
+	./configure --prefix=${base_prefix} --shared --libdir=${base_libdir}
 }
 
 do_compile (){
-- 
1.7.9.5


