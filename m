Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5CECC6C3B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 03:09:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67016557"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 11:09:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 5143E4CDD981
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:09:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 11:09:28 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 1 Jun 2019 05:08:34 +0800
Message-ID: <1559336914-6411-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 5143E4CDD981.AC8FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [master][warrior][PATCH] at: Fix a spelling mistake.
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
X-List-Received-Date: Wed, 12 Jun 2019 03:09:20 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-extended/at/at/pam.conf.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/at/at/pam.conf.patch b/meta/recipes-extended/at/at/pam.conf.patch
index c9f337e..38e7fc1 100644
--- a/meta/recipes-extended/at/at/pam.conf.patch
+++ b/meta/recipes-extended/at/at/pam.conf.patch
@@ -24,7 +24,7 @@ index 3674c0a..2f8d586 100644
 -@include common-auth
 -@include common-account
 +auth       include    common-auth
-+acount     include    common-account
++account     include    common-account
  session    required   pam_loginuid.so
 -@include common-session-noninteractive
 +session    include    common-session-noninteractive
-- 
2.7.4




