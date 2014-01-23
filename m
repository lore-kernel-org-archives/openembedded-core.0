Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBA26E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:12:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0NCCSh4005905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:12:28 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 23 Jan 2014 04:12:27 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 20:12:36 +0800
Message-ID: <b5cee43db9bb7a971d352f7b8673e2e6e6fc7075.1390479069.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390479069.git.Qi.Chen@windriver.com>
References: <cover.1390479069.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] sysvinit: add initscripts-functions to RDEPENDS
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
X-List-Received-Date: Thu, 23 Jan 2014 12:12:27 -0000
Content-Type: text/plain

As sysvinit doesn't inherit update-rc.d, we need to add this dependency
manually.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index dd25f71..c06eac4 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -61,7 +61,7 @@ FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
 FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
 FILES_sysvinit-sulogin = "${base_sbindir}/sulogin.sysvinit"
 
-RDEPENDS_${PN} += "sysvinit-pidof"
+RDEPENDS_${PN} += "sysvinit-pidof initscripts-functions"
 
 CFLAGS_prepend = "-D_GNU_SOURCE "
 export LCRYPT = "-lcrypt"
-- 
1.7.9.5


