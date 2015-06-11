Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9817E73E36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:07:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B978SI013038
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:07:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 02:07:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 02:07:06 -0700
Message-ID: <9c6601e4bb29d8077ffb62b757076e2e5a969612.1434013599.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013599.git.liezhi.yang@windriver.com>
References: <cover.1434013599.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] beecrypt: DEPENDS on icu
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
X-List-Received-Date: Thu, 11 Jun 2015 09:07:09 -0000
Content-Type: text/plain

Fixed when fresh build:
$ bitbake beecrypt-native

| In file included from /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/include/beecrypt/c++/lang/System.h:32:0,
|                  from /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/c++/lang/System.cxx:27:
| /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/include/beecrypt/c++/io/PrintStream.h:31:26: fatal error: unicode/ucnv.h: No such file or directory
| compilation terminated.
| In file included from /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/c++/lang/String.cxx:25:0:
| /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/include/beecrypt/c++/lang/String.h:41:28: fatal error: unicode/unistr.h: No such file or directory
| compilation terminated.
| In file included from /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/include/beecrypt/c++/lang/StringBuffer.h:30:0,
|                  from /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/c++/lang/StringBuffer.cxx:25:
| /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/include/beecrypt/c++/lang/String.h:41:28: fatal error: unicode/unistr.h: No such file or directory
| compilation terminated.
| In file included from /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/include/beecrypt/c++/lang/Long.h:28:0,
|                  from /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/c++/lang/Long.cxx:25:
| /path/to/beecrypt-native/4.2.1-r3/beecrypt-4.2.1/include/beecrypt/c++/lang/String.h:41:28: fatal error: unicode/unistr.h: No such file or directory
| compilation terminated.

Both target and native has this error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 1e626f1..62b4f7c 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -24,6 +24,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
 
 PR = "r3"
 
+DEPENDS += "icu"
+
 inherit autotools multilib_header ptest
 acpaths=""
 
-- 
1.7.9.5


