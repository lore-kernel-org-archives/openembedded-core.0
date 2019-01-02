Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1579060234
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 05:18:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,429,1539619200"; d="scan'208";a="51111332"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2019 13:18:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8FB2B4B7D4C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 13:18:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 2 Jan 2019 13:18:30 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jan 2019 13:17:49 +0800
Message-ID: <20190102051749.26477-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190102051749.26477-1-hongl.fnst@cn.fujitsu.com>
References: <20190102051749.26477-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 8FB2B4B7D4C9.A0A5B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] Added armeb into QEMU_TARGETS.
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
X-List-Received-Date: Wed, 02 Jan 2019 05:18:26 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index f5de8f2..e9c2681 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -39,7 +39,7 @@ DISTRO_EXTRA_RDEPENDS_append_qemux86-64 = " ${POKYQEMUDEPS}"
 
 TCLIBCAPPEND = ""
 
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el nios2 ppc x86_64"
+QEMU_TARGETS ?= "arm armeb aarch64 i386 mips mipsel mips64 mips64el nios2 ppc x86_64"
 # Other QEMU_TARGETS "sh4"
 
 PREMIRRORS ??= "\
-- 
1.9.1




