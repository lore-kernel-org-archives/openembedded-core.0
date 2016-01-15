Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DB6626067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 01:26:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2610090"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2016 09:26:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 06374418914D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:25:48 +0800 (CST)
Received: from localhost.localdomain (10.167.226.65) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 15 Jan 2016 09:29:29 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2016 04:25:36 +0300
Message-ID: <1452821136-1821-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CAJTo0LaNFs_vV9Q6xLM4Qh2YT==8U263F79f0hdET1nK2a_JXw@mail.gmail.com>
References: <CAJTo0LaNFs_vV9Q6xLM4Qh2YT==8U263F79f0hdET1nK2a_JXw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.65]
X-yoursite-MailScanner-ID: 06374418914D.AAE84
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] net-tools_1.60-26.bb: Error fix
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
X-List-Received-Date: Fri, 15 Jan 2016 01:26:09 -0000
Content-Type: text/plain

when set PATCHTOOL = "patch" in conf/local.conf,error will occur
in the step of do_patch.
The error is: "quilt: command not found",so fix it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 923d048..632aee7 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -31,6 +31,7 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
 
 inherit gettext
 
+do_patch[depends] = "quilt-native:do_populate_sysroot"
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
 
-- 
1.8.4.2




