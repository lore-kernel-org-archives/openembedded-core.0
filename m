Return-Path: <jan.kiszka@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 885C478447
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:28:09 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5G7S6K2019395
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:28:06 +0200
Received: from md1f2u6c.ww002.siemens.net ([146.254.78.90])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v5G7S6lV027073
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:28:06 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7424d317-958a-e976-6aa8-ab3629fc0e58@siemens.com>
Date: Fri, 16 Jun 2017 09:28:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Subject: [PATCH] tzdata: Install zone1970.tab
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
X-List-Received-Date: Fri, 16 Jun 2017 07:28:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The modern version of zone.tab is required by tzselect e.g.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 meta/recipes-extended/tzdata/tzdata_2017b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tzdata/tzdata_2017b.bb b/meta/recipes-extended/tzdata/tzdata_2017b.bb
index 2e4277f794..55e89767fc 100644
--- a/meta/recipes-extended/tzdata/tzdata_2017b.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2017b.bb
@@ -45,6 +45,7 @@ do_install () {
         cp -pPR ${S}/$exec_prefix ${D}/
         # libc is removing zoneinfo files from package
         cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
+        cp -pP "${S}/zone1970.tab" ${D}${datadir}/zoneinfo
         cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
 
         # Install default timezone
@@ -206,6 +207,7 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/WET                  \
                 ${datadir}/zoneinfo/Zulu                 \
                 ${datadir}/zoneinfo/zone.tab             \
+                ${datadir}/zoneinfo/zone1970.tab         \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
 
-- 
2.12.3

