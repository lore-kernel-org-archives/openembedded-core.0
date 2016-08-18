Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15D9E7706C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:04:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7IH4Lmo019966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:04:21 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 10:04:20 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 12:04:15 -0500
Message-ID: <b6bbdff553e3b63cb10ae5a033f2c4a030ae977f.1471539779.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1471539779.git.mark.hatle@windriver.com>
References: <cover.1471539779.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] prelink: Move to latest version of prelink
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
X-List-Received-Date: Thu, 18 Aug 2016 17:04:22 -0000
Content-Type: text/plain

* Uprev rtld emulation to glibc-2.23
* Fix compilation warnings
* Add additional debug scopes
* Change rtld build_local_scope to be breadth-first
* Fix LD_PRELOAD emulation
* Change function reordering to work with latest binutils

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index e223ef6..5d9f260 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,7 +8,7 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "927979bbd115eeb8a75db3231906ef6aca4c4eb6"
+SRCREV = "ef20628dd78b92e1a3123afc67b64cf010bdd9e4"
 PV = "1.0+git${SRCPV}"
 
 #
-- 
2.5.5


