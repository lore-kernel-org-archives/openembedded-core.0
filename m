Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 481136028A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 07:20:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1R7KZTK005573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:20:35 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 26 Feb 2014 23:20:35 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2014 15:21:07 +0800
Message-ID: <1393485667-25675-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mailx: fix the path to sendmail interface
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
X-List-Received-Date: Thu, 27 Feb 2014 07:20:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The default path to sendmail is to /usr/lib/sendmail, but
msmtp install it as ${sbindir}/sendmail, set the correct
path for Makefile to fix it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/mailx/mailx_12.5.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index 1245a11..a70f703 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -27,5 +27,6 @@ S = "${WORKDIR}/heirloom-mailx-${PV}"
 inherit autotools
 
 CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
+EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail"
 
 PARALLEL_MAKE = ""
-- 
1.7.9.5


