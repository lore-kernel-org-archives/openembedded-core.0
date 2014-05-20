Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCE66610F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 06:42:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4K6gDo1001036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 23:42:13 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 23:42:13 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 14:42:10 +0800
Message-ID: <593698e9fb204faa60acbe20e060beff6ac282a3.1400568090.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1400568090.git.Chong.Lu@windriver.com>
References: <cover.1400568090.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] byacc: Update to 20140422 version
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
X-List-Received-Date: Tue, 20 May 2014 06:42:15 -0000
Content-Type: text/plain

Upgrade byacc to 20140422 version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/byacc/{byacc_20140101.bb => byacc_20140422.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20140101.bb => byacc_20140422.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20140101.bb b/meta/recipes-extended/byacc/byacc_20140422.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20140101.bb
rename to meta/recipes-extended/byacc/byacc_20140422.bb
index dff315e..cf57738 100644
--- a/meta/recipes-extended/byacc/byacc_20140101.bb
+++ b/meta/recipes-extended/byacc/byacc_20140422.bb
@@ -7,5 +7,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "05aeba2369b90fa63bac5e7425090f9d"
-SRC_URI[sha256sum] = "78aea5a34ccb6c9f1ff673a94cd3e66b0f669b7a042c2fcfdada85f0f399421c"
+SRC_URI[md5sum] = "e7c13c5e207dc05eab9145cc9972397b"
+SRC_URI[sha256sum] = "2f104c7e200dd86844d5f3521e12cb55fc48a9c3da3480a65fde2ca8c053bdcc"
-- 
1.8.1.2


