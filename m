Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UF3xW-0000Jw-Po
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:44:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BERZZp008903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Mar 2013 07:27:35 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 07:27:35 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Mar 2013 10:27:14 -0400
Message-ID: <64e34e1a86e9892227905b0366c183ae3519faf1.1363011775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363011775.git.bruce.ashfield@windriver.com>
References: <cover.1363011775.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/3.8: update EDF configuration
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
X-List-Received-Date: Mon, 11 Mar 2013 14:44:26 -0000
Content-Type: text/plain

The sched_deadline configuration fragmements were not optimal, so tweaking
the meta data to make an enable-only configuration fragment avaiable and
updating the options within that fragment.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index d1e0308..b395e45 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "c12eb257c5fd9441b434c1216c3d987c89ecdd68"
 SRCREV_machine_qemux86 ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
 SRCREV_machine_qemux86-64 ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
 SRCREV_machine ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
-SRCREV_meta ?= "27988ba5eb2dd797a355e7d92fd78e78c7066757"
+SRCREV_meta ?= "cc572ff970662c844c0a8dd2dab93cc10b8b2a3f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



