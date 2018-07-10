Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BF4086FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:42:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42039476"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 10:42:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9FFC44B5CBF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:45 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 10:42:44 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 10:42:07 +0800
Message-ID: <20180710024207.6296-7-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 9FFC44B5CBF3.AA34E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] psmisc:23.0 -> 23.1
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
X-List-Received-Date: Tue, 10 Jul 2018 02:42:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upgrade psmisc from 23.0 to 23.1

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/psmisc/{psmisc_23.0.bb => psmisc_23.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.0.bb => psmisc_23.1.bb} (87%)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.0.bb b/meta/recipes-extended/psmisc/psmisc_23.1.bb
similarity index 87%
rename from meta/recipes-extended/psmisc/psmisc_23.0.bb
rename to meta/recipes-extended/psmisc/psmisc_23.1.bb
index 2b07f49..f07c9db 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.0.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
 	   file://0001-Makefile.am-create-src-directory-before-attempting-t.patch \
            "
-SRCREV = "67b1da268f4c0ce6859980e3dfcfaec5b2448e80"
+SRCREV = "bd952b3063f2466ecab4ec093026cf0c4ce373c7"
 S = "${WORKDIR}/git"
-- 
2.7.4




