Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UQHnm-0005ZF-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:44:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3BDRAen014173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:27:10 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 06:27:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 06:27:01 -0700
Message-ID: <9c22995dd4af48aa22d8abbe01113d9f34a51dad.1365686481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365686481.git.bruce.ashfield@windriver.com>
References: <cover.1365686481.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] linux-yocto/3.8: fix atom-pc config audit warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
Content-Type: text/plain

The atom-pc was referencing some invalid and unecessary config
options that are causing kernel config audit warnings.

With this SRCREV update, the configuration is clean against the
3.8 kernel.

[YOCTO #3490]

(From OE-Core rev: 9f3ff1f907a0cf65d8aff82134463c4321d4b1e2)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 3632a28..7452a8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "abd0728b164f651292374e96251ee197b50e3c02"
 SRCREV_machine_qemuppc ?= "1619988b773840ec546292a9cd65dda99d55b96c"
-SRCREV_meta ?= "70dac5a56c245ca01d2d4e18fc2c9fb112749bf3"
+SRCREV_meta ?= "f86199dd4c142fae61517a993b3f7162bb6d4f94"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index c589fa0..f1dfbc4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "f8848d222d1fcd1ebc517d28f289735621708449"
 SRCREV_machine_qemux86 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
 SRCREV_machine_qemux86-64 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
 SRCREV_machine ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
-SRCREV_meta ?= "70dac5a56c245ca01d2d4e18fc2c9fb112749bf3"
+SRCREV_meta ?= "f86199dd4c142fae61517a993b3f7162bb6d4f94"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



