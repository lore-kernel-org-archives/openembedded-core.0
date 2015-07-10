Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B41675BCF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7F1Sd019117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:15:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:15:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:53 -0700
Message-ID: <b5fd0cdc574769e5f8859c9d9d164cd26cfb225e.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] perl: remove invalid sed command
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

There is no match of sed pattern any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.22.0.bb |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 050a98c..f72afa7 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -211,9 +211,6 @@ do_configure() {
 
 do_compile() {
         # Fix to avoid recursive substitution of path
-        sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" ext/Errno/Errno_pm.PL
-        sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" cpan/Compress-Raw-Zlib/config.in
-        sed -i -e 's|/usr/lib|""|g' cpan/Compress-Raw-Zlib/config.in
         sed -i -e 's|(@libpath, ".*"|(@libpath, "${STAGING_LIBDIR}"|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 
         cd Cross
-- 
1.7.9.5


