Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F40326FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 09:40:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S9eXHT011839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 02:40:33 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 02:40:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 02:40:22 -0700
Message-ID: <b59cf782a35c219780a338b5ede96475eb1bdc5d.1459157937.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459157937.git.liezhi.yang@windriver.com>
References: <cover.1459157937.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] ruby-native: Depend on openssl-native
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
X-List-Received-Date: Mon, 28 Mar 2016 09:40:34 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

This dependency is floating otherwise, It races against openssl-native
and when openssl config does not match with openssl on build host the
build fails occasionally

x86_64-linux/usr/include/openssl/ripemd.h:70:4: error: #error RIPEMD is
disabled.
 #  error RIPEMD is disabled.

Change-Id: I5ff6d8f058ff99c64ad4dc7c0377724071003ae6
(From OE-Core master rev: d0c8d98077622a700d92384f676770cb4d6d4f46)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 17aa789..313e752 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
-DEPENDS_class-native = "libyaml-native"
+DEPENDS_class-native = "openssl-native libyaml-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-- 
2.7.4


