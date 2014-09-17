Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24E677142E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 08:08:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H88ql7000213
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 01:08:52 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 01:08:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 17 Sep 2014 16:08:31 +0800
Message-ID: <4a47b220298ee815c125355989665f4abdffa0a3.1410939794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410939794.git.hongxu.jia@windriver.com>
References: <cover.1410939794.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] sstatesig.py: fix typo of locke sstate
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
X-List-Received-Date: Wed, 17 Sep 2014 08:08:56 -0000
Content-Type: text/plain

We used sigfile to instead of where_to_dump. Fix the missing one.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index df325d0..65dbac1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -138,7 +138,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
     def dump_lockedsigs(self, sigfile=None):
-        if not where_to_dump:
+        if not sigfile:
             sigfile = os.getcwd() + "/locked-sigs.inc"
 
         bb.plain("Writing locked sigs to %s" % sigfile)
-- 
1.9.1


