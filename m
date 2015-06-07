Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id A8858732B1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jun 2015 07:56:24 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BHH97212; Sun, 07 Jun 2015 15:56:23 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.158.1; Sun, 7 Jun 2015 15:56:17 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Jun 2015 07:52:18 +0000
Message-ID: <1433663540-1760-2-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1433663540-1760-1-git-send-email-zhengjunling@huawei.com>
References: <1433663540-1760-1-git-send-email-zhengjunling@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5573F927.004D, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c15f2e034c2fb846ac246125a1a69488
Subject: [PATCH 1/3] busybox: sync the patches for git version
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
X-List-Received-Date: Sun, 07 Jun 2015 07:56:26 -0000
Content-Type: text/plain

Synchronize the patches for busybox_git with busybox_1.23.2.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 7b868a2..cee5b91 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -34,6 +34,8 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
+           file://recognize_connmand.patch \
+           file://busybox-cross-menuconfig.patch \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.8.3.4


