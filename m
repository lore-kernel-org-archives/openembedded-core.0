Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41F3D605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 09:56:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB89unOS010282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 01:56:49 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 01:56:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Dec 2015 01:56:32 -0800
Message-ID: <6821bb42febfc5f939896b0ffbc1c00b15b9329e.1449568553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449568553.git.liezhi.yang@windriver.com>
References: <cover.1449568553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/15] readline: rename patch to contain CVE reference
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
X-List-Received-Date: Tue, 08 Dec 2015 09:56:48 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

To help automated scanning of CVEs, put the CVE ID in the filename.

(From OE-Core master rev: 211bce4f23230c7898cccdb73b582420f830f977)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ne63-003.patch => readline-cve-2014-2524.patch} |    0
 meta/recipes-core/readline/readline_6.3.bb         |    2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/readline/readline-6.3/{readline63-003.patch => readline-cve-2014-2524.patch} (100%)

diff --git a/meta/recipes-core/readline/readline-6.3/readline63-003.patch b/meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-6.3/readline63-003.patch
rename to meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
index 6ba1c18..fc362ae 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,6 +1,6 @@
 require readline.inc
 
-SRC_URI += "file://readline63-003.patch;striplevel=0 \
+SRC_URI += "file://readline-cve-2014-2524.patch;striplevel=0 \
             file://readline-dispatch-multikey.patch"
 
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
-- 
1.7.9.5


