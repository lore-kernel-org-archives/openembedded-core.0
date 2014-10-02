Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEF5F6017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9277g9l013208
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 00:07:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 2 Oct 2014 00:07:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Oct 2014 00:07:39 -0700
Message-ID: <32e43d08533a20d2d8be7f6cb83360564601f4a4.1412233591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412233591.git.liezhi.yang@windriver.com>
References: <cover.1412233591.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] apmd.service: Fix typo (not mandatory EnvironmentFile prefix)
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
X-List-Received-Date: Thu, 02 Oct 2014 07:07:44 -0000
Content-Type: text/plain

From: Tobias Blom <tobias.blom@techne-dev.se>

Prefix to EnvironmentFile should be preciding the filenamn.

(From OE-Core rev: 1f694e4cb493b0737b6009382c0957e6837ebbed)

Signed-off-by: Tobias Blom <tobias.blom@techne-dev.se>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
index 62d6af1..ffab823 100644
--- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
@@ -3,5 +3,5 @@ Description=Advanced Power Management daemon
 After=remote-fs.target
 
 [Service]
-EnvironmentFile-= @SYSCONFDIR@/default/apmd
+EnvironmentFile=-@SYSCONFDIR@/default/apmd
 ExecStart=@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
-- 
1.7.9.5


