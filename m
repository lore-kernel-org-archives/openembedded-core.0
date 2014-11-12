Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 673DB720D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:14:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAC2E4kW013558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 18:14:04 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 18:14:03 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 10:09:52 +0800
Message-ID: <0e9fb5c3d788edc739dd5e97d61b6bc9b113ee75.1415758071.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415758071.git.Chong.Lu@windriver.com>
References: <cover.1415758071.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] strace: add libunwind dependency
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
X-List-Received-Date: Wed, 12 Nov 2014 02:14:03 -0000
Content-Type: text/plain

Add libunwind package dependency to solve following error:

configure: error: failed to find libunwind-ptrace.h

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/strace/strace_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/strace/strace_4.9.bb b/meta/recipes-devtools/strace/strace_4.9.bb
index f64c6ec..cce130d 100644
--- a/meta/recipes-devtools/strace/strace_4.9.bb
+++ b/meta/recipes-devtools/strace/strace_4.9.bb
@@ -21,6 +21,7 @@ PACKAGECONFIG_class-target ?= "libaio ${@bb.utils.contains('DISTRO_FEATURES', 'a
 
 PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
+PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
 
 export INCLUDES = "-I. -I./linux"
 
-- 
1.9.1


