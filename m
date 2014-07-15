Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CCDFB705B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJkbq012734
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:19 -0700
Message-ID: <aba37c156bc567fe74cceda643b5ef109b026137.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 24/38] grep: add bash to RDEPENDS_grep
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:45 -0000
Content-Type: text/plain

Bash scripts:
grep/bin/egrep.grep
grep/bin/fgrep.grep

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/grep/grep_2.19.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/grep/grep_2.19.bb b/meta/recipes-extended/grep/grep_2.19.bb
index f38a9a6..7f7b598 100644
--- a/meta/recipes-extended/grep/grep_2.19.bb
+++ b/meta/recipes-extended/grep/grep_2.19.bb
@@ -10,6 +10,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 SRC_URI[md5sum] = "ac732142227d9fe9567d71301e127979"
 SRC_URI[sha256sum] = "6388295be48cfcaf7665d9cd3914e6625ea000e9414132bfefd45cf1d8eec34d"
 
+RDEPENDS_${PN} += "bash"
+
 inherit autotools gettext texinfo
 
 EXTRA_OECONF = "--disable-perl-regexp"
-- 
1.7.9.5


