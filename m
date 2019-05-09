Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB527D573
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 03:04:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x49347Hs020888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2019 20:04:08 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 8 May 2019 20:04:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2019 23:04:04 -0400
Message-ID: <20190509030404.141954-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: set NO_RECOMMENDATIONS with weak assignment
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
X-List-Received-Date: Thu, 09 May 2019 03:04:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Set NO_RECOMMENDATIONS with weak assignment then it could be set a
default value somewhere else.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c13e4f3f71..c5313ccd19 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -848,7 +848,7 @@ COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 SERIAL_CONSOLE ??= ""
 SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE').replace(' ', ';')}"
 
-NO_RECOMMENDATIONS ?= ""
+NO_RECOMMENDATIONS ??= ""
 BAD_RECOMMENDATIONS ?= ""
 
 # Make sure MACHINE isn't exported
-- 
2.20.0


