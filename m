Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9362260024
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 02:03:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0U23oYl028444
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 18:03:50 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 29 Jan 2015 18:03:49 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jan 2015 10:03:55 +0800
Message-ID: <1422583435-23667-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] lsbinitscripts: fix the path for mountpoint
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
X-List-Received-Date: Fri, 30 Jan 2015 02:03:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

mountpoint is installed in ${bindir}

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.60.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
index 1490582..f67eff7 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
@@ -27,4 +27,5 @@ do_compile[noexec] = "1"
 do_install(){
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0644 ${S}/rc.d/init.d/functions ${D}${sysconfdir}/init.d/functions
+	sed -i 's,${base_bindir}/mountpoint,${bindir}/mountpoint,g' ${D}${sysconfdir}/init.d/functions
 }
-- 
1.9.1


