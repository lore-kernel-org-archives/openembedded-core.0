Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42F6377117
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 08:30:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA78UFR4001526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 7 Nov 2015 00:30:15 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 7 Nov 2015 00:30:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jeffrey.honig@windriver.com>
Date: Sat, 7 Nov 2015 16:30:08 +0800
Message-ID: <0a72056f922b7b7037370ad0f2d92bf4cda9b2c8.1446884806.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446884806.git.hongxu.jia@windriver.com>
References: <cover.1446884806.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cpan_build/bbclass: add perl to DEPENDS with target override
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
X-List-Received-Date: Sat, 07 Nov 2015 08:30:16 -0000
Content-Type: text/plain

While build for target at task cpan_build_do_configure,
it requires ${STAGING_LIBDIR}/perl/config.sh which is
provided by perl. So add perl to DEPENDS with target
override.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/cpan_build.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index fac074d..9bfe334 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -11,6 +11,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
 export LD = "${CCLD}"
 
+DEPENDS_append_class-target = " perl"
 cpan_build_do_configure () {
 	if [ "${@is_target(d)}" = "yes" ]; then
 		# build for target
-- 
1.9.1


