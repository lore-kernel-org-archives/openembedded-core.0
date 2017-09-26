Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2002A78348
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 02:36:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,438,1500912000"; d="scan'208";a="28235489"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Sep 2017 10:36:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AA9A647CAACF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 10:36:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 26 Sep 2017 10:36:35 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Sep 2017 10:36:33 +0800
Message-ID: <1506393395-10475-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506393395-10475-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1506393395-10475-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: AA9A647CAACF.AB1FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] prelink: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Tue, 26 Sep 2017 02:36:38 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index b739af0..a137a86 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -3,6 +3,7 @@ SECTION = "devel"
 # Would need transfig-native for documentation if it wasn't disabled
 DEPENDS = "elfutils binutils"
 SUMMARY = "An ELF prelinking utility"
+HOMEPAGE = "http://git.yoctoproject.org/cgit.cgi/prelink-cross/about/"
 DESCRIPTION = "The prelink package contains a utility which modifies ELF shared libraries \
 and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
-- 
2.7.4




