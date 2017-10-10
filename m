Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24D88605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 09:19:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9A9J9Ck014433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 02:19:09 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 10 Oct 2017 02:19:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Oct 2017 17:17:53 +0800
Message-ID: <20171010091753.11125-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] perl: remove the reference of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Tue, 10 Oct 2017 09:19:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Remove all instances of -fdebug-prefix-map in ccflags*
because they contain references to the build host and
are not needed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 1e1d4f50fc..b55d2223e2 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -223,6 +223,7 @@ PACKAGE_PREPROCESS_FUNCS += "perl_package_preprocess"
 perl_package_preprocess () {
         # Fix up installed configuration
         sed -i -e "s,${D},,g" \
+               -e "s,${DEBUG_PREFIX_MAP},,g" \
                -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
                -e "s,-isystem${STAGING_INCDIR} ,,g" \
                -e "s,${STAGING_LIBDIR},${libdir},g" \
-- 
2.11.0


