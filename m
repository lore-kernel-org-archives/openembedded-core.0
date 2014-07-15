Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF0670600
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJiYu022791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:16 -0700
Message-ID: <9b618424c2827b9f63510e738e5a2b48a4da7250.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 21/38] gzip: add bash to RDEPENDS_gzip
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:43 -0000
Content-Type: text/plain

Bash scripts:
gzip/bin/zcat.gzip
gzip/bin/gunzip.gzip
gzip/bin/uncompress
gzip/usr/bin/zfgrep
gzip/usr/bin/gzexe
gzip/usr/bin/zdiff
gzip/usr/bin/zegrep
gzip/usr/bin/zforce
gzip/usr/bin/zmore
gzip/usr/bin/zcmp
gzip/usr/bin/zless
gzip/usr/bin/znew
gzip/usr/bin/zgrep

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/gzip/gzip.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index eeeafe0..be1c584 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
 
+RDEPENDS_${PN}_class-target += "bash"
+
 inherit autotools texinfo
 
 EXTRA_OEMAKE_class-target = "GREP=${base_bindir}/grep"
-- 
1.7.9.5


