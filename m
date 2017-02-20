Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47FC871C54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 08:46:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1K8khgT027597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 00:46:44 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 00:46:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Feb 2017 00:46:36 -0800
Message-ID: <8c5f9863246300cd8ae545685e75dc3e1d21395f.1487580369.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487580369.git.liezhi.yang@windriver.com>
References: <cover.1487580369.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] security_flags.inc: let gettext be secure
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
X-List-Received-Date: Mon, 20 Feb 2017 08:46:43 -0000
Content-Type: text/plain

It has been fixed.

[YOCTO #9544]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/distro/include/security_flags.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 77416bc11e7..5a1cbb13192 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -95,7 +95,6 @@ SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-cmake = ""
 SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
-SECURITY_STRINGFORMAT_pn-gettext = ""
 SECURITY_STRINGFORMAT_pn-kexec-tools = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
-- 
2.11.0.rc2.dirty


