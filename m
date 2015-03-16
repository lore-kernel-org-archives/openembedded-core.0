Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 190826AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 17:27:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2GHREwv022346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Mar 2015 10:27:14 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 16 Mar 2015 10:27:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Mar 2015 13:27:10 -0400
Message-ID: <3c6986da5c4fff85137524037e740a64de23e9db.1426525757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1426525757.git.bruce.ashfield@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] perf: add bash to RDEPENDS
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
X-List-Received-Date: Mon, 16 Mar 2015 17:27:14 -0000
Content-Type: text/plain

perf has a dependency on bash in its utilities, which generate the
following warning:

  WARNING: QA Issue: perf requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]

Since perf is not installed on extremely small systems, we just add
bash to the RDEPENDS, rather than modifying scripts or removing content.

[YOCTO: #7445]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4f820f1c88a3..a909132beb86 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -168,7 +168,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
-RDEPENDS_${PN} += "elfutils"
+RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-- 
2.1.0


