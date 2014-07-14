Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7EB702C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:01:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E91pko022856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Jul 2014 02:01:51 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 14 Jul 2014 02:01:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 17:01:42 +0800
Message-ID: <f67e07e11f5f7294bd6bc49fc1a0b90ca31bc830.1405328408.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405328408.git.hongxu.jia@windriver.com>
References: <cover.1405328408.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] perl-rdepends: Add perl as perl-misc/${PN}-pod runtime dep
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
X-List-Received-Date: Mon, 14 Jul 2014 09:01:58 -0000
Content-Type: text/plain

Each of the items requires perl, but had not previously stated their perl
dependency.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
index 47a7548..9bd2e39 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
@@ -12,6 +12,8 @@
 #| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' 
 #| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-build-.*|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/
 
+RDEPENDS_perl-misc += "perl"
+RDEPENDS_${PN}-pod += "perl"
 
 # Some additional dependencies that the above doesn't manage to figure out
 RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
-- 
1.8.1.2


