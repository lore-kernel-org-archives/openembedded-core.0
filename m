Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6A570E38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:11:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6BoqD026359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:11:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:11:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:11:43 -0700
Message-ID: <d55c9bffb9f9c9c6fb0cdd01cab220d4c95c50b9.1408342098.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342098.git.liezhi.yang@windriver.com>
References: <cover.1408342098.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] apr: add bash to RDEPENDS_apr-dev
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
X-List-Received-Date: Mon, 18 Aug 2014 06:11:55 -0000
Content-Type: text/plain

Bashsim in apr-dev/usr/share/build-1/libtool:
possible bashism in apr-dev/usr/share/build-1/libtool line 1004 ($RANDOM):
        my_tmpdir="${my_template}-${RANDOM-0}$$"
possible bashism in apr-dev/usr/share/build-1/libtool line 3797 (should be '.', not 'source'):
                  dlprefile_dlname=`source "$curr_lafile" && echo "$dlname"`
possible bashism in apr-dev/usr/share/build-1/libtool line 8237 (shopt):
                test "$want_nocaseglob" = yes && nocaseglob=`shopt -p nocaseglob`
possible bashism in apr-dev/usr/share/build-1/libtool line 8240 (shopt):
                    shopt -s nocaseglob
possible bashism in apr-dev/usr/share/build-1/libtool line 9255 (should be VAR="${VAR}foo"):
               rpath+=" $flag"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/apr/apr_1.5.1.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/apr/apr_1.5.1.bb b/meta/recipes-support/apr/apr_1.5.1.bb
index 2720b52..17dddbc 100644
--- a/meta/recipes-support/apr/apr_1.5.1.bb
+++ b/meta/recipes-support/apr/apr_1.5.1.bb
@@ -37,6 +37,7 @@ do_configure_prepend() {
 }
 
 FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
+RDEPENDS_${PN}-dev += "bash"
 
 #for some reason, build/libtool.m4 handled by buildconf still be overwritten
 #when autoconf, so handle it again.
-- 
1.7.9.5


