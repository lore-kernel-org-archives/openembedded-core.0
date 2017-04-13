Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 552F177DB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:57:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3D9vTjK024685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:57:29 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Apr 2017 02:57:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 02:57:25 -0700
Message-ID: <8dda2297e14acc1d586c4e5f1195846f14eb4a52.1492077359.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1492077359.git.liezhi.yang@windriver.com>
References: <cover.1492077359.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] autogen: update libopts.m4's patch
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
X-List-Received-Date: Thu, 13 Apr 2017 09:57:28 -0000
Content-Type: text/plain

Use 'test -n "$POSIX_SHELL"' rather than 'test -x "$POSIX_SHELL"' so
that 'POSIX_SHELL = "/usr/bin/env sh"' can work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-config-libopts.m4-regenerate-it-from-config-libopts..patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch b/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
index a14018e..e247594 100644
--- a/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
+++ b/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
@@ -30,7 +30,7 @@ index c7ba4f3..51e6a39 100644
    AC_PROG_SED
    [while :
    do
-+      test -x "$POSIX_SHELL" && break
++      test -n "$POSIX_SHELL" && break
        POSIX_SHELL=`which bash`
        test -x "$POSIX_SHELL" && break
        POSIX_SHELL=`which dash`
-- 
2.10.2


