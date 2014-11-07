Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C22F66017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 07:57:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA77vA5O020717
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 23:57:10 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 6 Nov 2014 23:57:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 15:57:01 +0800
Message-ID: <16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415346812.git.hongxu.jia@windriver.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 07:57:12 -0000
Content-Type: text/plain

The package avahi does not exist, so we use avahi-daemon as the provider.
It avoids the do_rootfs failure while IMAGE_INSTALL += "avahi"

[YOCTO #6937]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index b060437..5573372 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -76,6 +76,8 @@ PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dn
 # As avahi doesn't put any files into PN, clear the files list to avoid problems
 # if extra libraries appear.
 FILES_avahi = ""
+# Let avahi-daemon to provide avahi
+RPROVIDES_avahi-daemon = "avahi"
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/dhcp/*/avahi-autoipd \
-- 
1.9.1


