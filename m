Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C39C671ADA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 09:25:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v189Pe1J000983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2017 01:25:40 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 8 Feb 2017 01:25:39 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Feb 2017 17:25:37 +0800
Message-ID: <6fb2745b5b179fa6253bac4a2cc08c547ee485e9.1486545658.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1486545657.git.Qi.Chen@windriver.com>
References: <cover.1486545657.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] security_flags: enable string formatting check for console tools
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
X-List-Received-Date: Wed, 08 Feb 2017 09:25:40 -0000
Content-Type: text/plain

As we've fixed the string formatting issue in console-tools, we don't
need to override SECURITY_STRINGFORMAT for console-tools any more.

[YOCTO #9540]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/distro/include/security_flags.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index eca835e..28e11bd 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -91,7 +91,6 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT_pn-busybox = ""
-SECURITY_STRINGFORMAT_pn-console-tools = ""
 SECURITY_STRINGFORMAT_pn-cmake = ""
 SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
-- 
1.9.1


