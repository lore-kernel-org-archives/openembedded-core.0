Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6FA465D4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 21:42:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9NLgDsg011581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 14:42:14 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 23 Oct 2014 14:42:13 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Oct 2014 16:42:10 -0500
Message-ID: <a5535043775b6bf8a8bf9c23790cbfe238dd49c0.1414082526.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1414082526.git.peter.seebach@windriver.com>
References: <cover.1414082526.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib.conf: set MULTILIB_GLOBAL_VARIANTS conditionally
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
X-List-Received-Date: Thu, 23 Oct 2014 21:42:20 -0000
Content-Type: text/plain

It is not entirely obvious that all reasonable configurations
will have multilib.conf strictly before the file which might
want to set MULTILIB_GLOBAL_VARIANTS. The x86-ish values here
look like reasonable default guesses, but shouldn't override
an explicit setting.
---
 meta/conf/multilib.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 733236d..37e8481 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -14,6 +14,6 @@ INHERIT += "multilib_global"
 
 BBCLASSEXTEND_append = " ${MULTILIBS}"
 
-MULTILIB_GLOBAL_VARIANTS  = "lib32 lib64 libx32"
+MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
 
 OPKG_ARGS_append = " --force-maintainer --force-overwrite"
-- 
1.7.1


