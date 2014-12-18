Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3068972791
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8rjxd028326
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:45 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:44 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:51:00 +0800
Message-ID: <62ccdb01900758e5bfad4830d88f1aa65e9cfe5f.1418885578.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/19] libc-package.bbclass: add aarch64 target to locale_arch_options
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:52 -0000
Content-Type: text/plain

Add aarch64 target to locale_arch_options in libc-package.bbclass to
support Arm V8.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index eb76ff9..793936e 100644
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


