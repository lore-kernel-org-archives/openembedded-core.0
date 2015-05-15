Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4F47772207
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 10:38:55 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGB94311; Fri, 15 May 2015 18:38:55 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml433-hub.china.huawei.com (10.82.67.210) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 15 May 2015 18:38:51 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 May 2015 10:35:09 +0000
Message-ID: <1431686109-616-2-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1431686109-616-1-git-send-email-zhengjunling@huawei.com>
References: <1431686109-616-1-git-send-email-zhengjunling@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.5555CCBF.00AE, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a1c0104322a3a6c2685f5a3a6179a44e
Subject: [PATCH 2/2] automake: set perl location only for target
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
X-List-Received-Date: Fri, 15 May 2015 10:38:58 -0000
Content-Type: text/plain

We should only fix perl location to /usr/bin/perl for target. It seems
to be more appropriate that the perl used by native and nativesdk class
of automake depends on build host environment.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/recipes-devtools/automake/automake_1.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index d5b6e9e..1963ab0 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -25,7 +25,7 @@ SRC_URI += " file://python-libdir.patch \
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
 SRC_URI[sha256sum] = "7946e945a96e28152ba5a6beb0625ca715c6e32ac55f2e353ef54def0c8ed924"
 
-do_install_append () {
+do_install_append_class-target() {
     install -d ${D}${datadir}
 
     # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-- 
1.8.3.4


