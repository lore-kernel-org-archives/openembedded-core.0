Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70C2F6FB41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:54:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2PAsNR4018217
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 03:54:23 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 03:54:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 19:00:12 +0800
Message-ID: <ce7610fe97a4550f4b9612978a525e324f9a631a.1395745170.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395745170.git.liezhi.yang@windriver.com>
References: <cover.1395745170.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bind: remove nslookup from FILES
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
X-List-Received-Date: Tue, 25 Mar 2014 10:54:22 -0000
Content-Type: text/plain

The nslookup had been disabled from 2010 (or earlier), but it still in
FILES_${PN}-utils, we need remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 8c3cbed..604deb6 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -37,7 +37,7 @@ PARALLEL_MAKE = ""
 RDEPENDS_${PN} = "python-core"
 
 PACKAGES_prepend = " ${PN}-utils "
-FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/nslookup"
+FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 
 do_install_append() {
-- 
1.8.3.1


