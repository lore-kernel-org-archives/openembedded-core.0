Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id B483E6FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 01:48:06 +0000 (UTC)
Received: by pabur14 with SMTP id ur14so3288156pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 17:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NPE4KRvpg7B0Y9mR+6QblNt1AI+GYLbxFATcMPjKcDU=;
	b=iS4B6a04bw+EPwF7eRPeBDkX8r9JZlWeqVT5+V7VEnW8bX1Dl0oxCG0FVhFe3/H/3g
	jy2dj/qfXCT+CbeeQzEGx6WhzmSfzAJW1+IUiIl6kO99UuSo3AtQU/8WQ3KO08HiFviw
	TN9WELPkfrxd+F5k/5VzdFcqlQcsu0CqDYS2noUjrlUd/EtE0xCeKCok4vW62YNdv3ew
	+14pfkL9xDA1//Z8HcaoACzuuddimxbUfBXeqbgv8ZOhjPWgaeRbJKXoH77dZ1g88csE
	psOeP1kppIj7tk+T3Fm/zsarRvnAtnSmT+7ZEyeMQPAxbPgR7n6EfeM6lA6vk9y0yLm7
	65aw==
X-Received: by 10.66.150.228 with SMTP id ul4mr1270066pab.15.1449539287108;
	Mon, 07 Dec 2015 17:48:07 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	cc16sm605285pac.44.2015.12.07.17.48.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Dec 2015 17:48:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 17:47:58 -0800
Message-Id: <1449539278-20070-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
References: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [jethro][fido][PATCH 4/4] openssl: three CVE fixes
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
X-List-Received-Date: Tue, 08 Dec 2015 01:48:07 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-3193
CVE-2015-3194
CVE-2105-3195

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index fd56841..3864e88 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -37,6 +37,10 @@ SRC_URI += "file://configure-targets.patch \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
+            file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
+            file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
+            file://0001-Add-test-for-CVE-2015-3194.patch \
+            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


