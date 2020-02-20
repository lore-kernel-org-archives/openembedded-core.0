Return-Path: <ssajal@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70B1B613CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:02:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KM2ogv014987
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:02:50 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 20 Feb 2020 14:02:50 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 0F8549009BB;
	Thu, 20 Feb 2020 14:02:50 -0800 (PST)
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 14:02:47 -0800
Message-ID: <20200220220247.86581-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] libical: fix host contamination in -dev pkg
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
X-List-Received-Date: Thu, 20 Feb 2020 22:02:49 -0000
Content-Type: text/plain

[YOCTO #13512]

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-support/libical/libical_3.0.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libical/libical_3.0.7.bb b/meta/recipes-support/libical/libical_3.0.7.bb
index ac9c114691..a50473e9ec 100644
--- a/meta/recipes-support/libical/libical_3.0.7.bb
+++ b/meta/recipes-support/libical/libical_3.0.7.bb
@@ -40,5 +40,6 @@ do_install_append () {
     # Remove build host references
     sed -i \
        -e 's,${STAGING_LIBDIR},${libdir},g' \
+       -e 's,${STAGING_INCDIR},${includedir},g' \
        ${D}${libdir}/cmake/LibIcal/LibIcal*.cmake
 }
-- 
2.17.1


