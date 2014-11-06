Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C654571F44
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:38:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA6FcrXT019028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:38:53 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:38:53 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:08 +0800
Message-ID: <c9472934d620649fbf7ec8680ed3e44b6adb2ae8.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 05/25] libc-package.bbclass: add aarch64 target to locale_arch_options
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
X-List-Received-Date: Thu, 06 Nov 2014 15:38:53 -0000
Content-Type: text/plain

Add aarch64 target to locale_arch_options in libc-package.bbclass to
support Arm V8.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index c1bc399..5701e20 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -268,6 +268,7 @@ python package_do_split_gconvs () {
             locale_arch_options = { \
                 "arm":     " --uint32-align=4 --little-endian ", \
                 "armeb":   " --uint32-align=4 --big-endian ",    \
+                "aarch64": " --uint32-align=4 --little-endian ",    \
                 "aarch64_be": " --uint32-align=4 --big-endian ",    \
                 "sh4":     " --uint32-align=4 --big-endian ",    \
                 "powerpc": " --uint32-align=4 --big-endian ",    \
-- 
1.9.1


