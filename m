Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0356B2BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 09:42:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s029gH2t001679
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jan 2014 01:42:18 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 2 Jan 2014 01:42:17 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jan 2014 17:41:30 +0800
Message-ID: <ee8b3802f764f8ff280aac8effc0e975aec945c8.1388655637.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388655637.git.Chong.Lu@windriver.com>
References: <cover.1388655637.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] byacc: upgrade to 20140101
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
X-List-Received-Date: Thu, 02 Jan 2014 09:42:17 -0000
Content-Type: text/plain

Upgrade byacc to 20140101.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/byacc/{byacc_20130925.bb => byacc_20140101.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20130925.bb => byacc_20140101.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20130925.bb b/meta/recipes-extended/byacc/byacc_20140101.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20130925.bb
rename to meta/recipes-extended/byacc/byacc_20140101.bb
index 8e68db8..f2becde 100644
--- a/meta/recipes-extended/byacc/byacc_20130925.bb
+++ b/meta/recipes-extended/byacc/byacc_20140101.bb
@@ -7,5 +7,5 @@ LICENSE="PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "265f74058b923d7d9ddd1bd82f05a42e"
-SRC_URI[sha256sum] = "e2560caab28396fc732a946e722cf5c6220e72388e70cdcc23bf67ae88799b31"
+SRC_URI[md5sum] = "05aeba2369b90fa63bac5e7425090f9d"
+SRC_URI[sha256sum] = "78aea5a34ccb6c9f1ff673a94cd3e66b0f669b7a042c2fcfdada85f0f399421c"
-- 
1.8.1.2


