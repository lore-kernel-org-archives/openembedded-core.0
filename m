Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC5337E73D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:08:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5L28TRI030371
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 19:08:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 19:08:40 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2019 10:08:15 +0800
Message-ID: <1561082895-23815-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561082895-23815-1-git-send-email-changqing.li@windriver.com>
References: <1561082895-23815-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] update-rc.d: update SRCREV and license checksum
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
X-List-Received-Date: Fri, 21 Jun 2019 02:08:53 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index baa21ae..75632d9 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -4,10 +4,10 @@ DESCRIPTION = "update-rc.d is a utility that allows the management of symlinks t
 SECTION = "base"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=148a48321b10eb37c1fa3ee02b940a75"
+LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d"
-SRCREV = "22e0692898c3e7ceedc8eb5ff4ec8e0b9c340b2d"
+SRCREV = "4b150b25b38de688d25cde2b2d22c268ed65a748"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.7.4


