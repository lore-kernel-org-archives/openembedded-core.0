Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3886961017
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 04:31:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8E4Vfvu005387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:31:41 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 21:31:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Sep 2013 12:31:37 +0800
Message-ID: <9bafb39aaaf33a7a3eee1e20ca2beca8378df3c8.1379132723.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379132723.git.hongxu.jia@windriver.com>
References: <cover.1379132723.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python: fix failures of LSB python-runtime tests
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
X-List-Received-Date: Sat, 14 Sep 2013 04:31:39 -0000
Content-Type: text/plain

It has been fixed in:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=e261c1760d8a660c13cd00039a4812d51f47f3df

But there is a typo in:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb
It missed to remove an extra "--with-wctype-functions" in EXTRA_OECONF

[YOCTO #5154]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 80609a8..fcfeda5 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -25,7 +25,6 @@ EXTRA_OECONF = "\
   --with-cyclic-gc \
   --without-cxx \
   --with-signal-module \
-  --with-wctype-functions \
   --enable-shared \
   --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
   ${PYTHONLSBOPTS} \
-- 
1.8.1.2


