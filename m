Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB6337058C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJmhG022806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:24 -0700
Message-ID: <c70f0ebecc89672637175d12cfa79f0a1fa1a050.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 29/38] ltp: add bash and python to RDEPENDS_ltp
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:46 -0000
Content-Type: text/plain

Bash scripts:
[snip]
228 ones

Python scripts:
ltp/opt/ltp/testcases/bin/lib/sched_mc.py
ltp/opt/ltp/testcases/bin/cpu_consolidation.py
ltp/opt/ltp/testcases/bin/sched_domain.py
ltp/opt/ltp/testcases/bin/ilb_test.py
ltp/opt/ltp/bin/execltp

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20140422.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index 995d617..f464ad9 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -64,7 +64,7 @@ do_install(){
     find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs bash python"
 
 FILES_${PN}-dbg += "\
     /opt/ltp/runtest/.debug \
-- 
1.7.9.5


