Return-Path: <zhengjunling@huawei.com>
X-Greylist: delayed 358 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Mar 2020 17:18:03 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD006191D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 17:18:03 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7982C2E65CFCC88F6E4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 01:18:04 +0800 (CST)
Received: from HULK-Android.huawei.com (10.113.189.218) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.439.0; Tue, 3 Mar 2020 01:17:46 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Mar 2020 01:17:43 +0800
Message-ID: <20200302171744.30713-1-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.113.189.218]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
Subject: [RESEND PATCH 1/2] security_flags: Remove stack protector flags from LDFLAGS
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
X-List-Received-Date: Mon, 02 Mar 2020 17:18:04 -0000
Content-Type: text/plain

The stack protector flag is a compile option, not a link option, so
remove it from LDFLAGS.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/conf/distro/include/security_flags.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index aaf04e9e59..5b79340be9 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -26,8 +26,8 @@ SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
 SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
-SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
-SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
+SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
+SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
 GCCPIE_powerpc = ""
-- 
2.17.1


