Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 479C8605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 07:33:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5L7XLEK010059
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 00:33:21 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 21 Jun 2013 00:33:20 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 15:35:29 +0800
Message-ID: <2db3fbb87cb91b479460b97c203c21e30a7263ea.1371800041.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1371800041.git.sen.zhang@windriver.com>
References: <cover.1371800041.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: update to new release
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
X-List-Received-Date: Fri, 21 Jun 2013 07:33:20 -0000
Content-Type: text/plain

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-extended/ltp/{ltp_20130109.bb => ltp_20130503.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20130109.bb => ltp_20130503.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp_20130109.bb b/meta/recipes-extended/ltp/ltp_20130503.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20130109.bb
rename to meta/recipes-extended/ltp/ltp_20130503.bb
index 3496379..c00c647 100644
--- a/meta/recipes-extended/ltp/ltp_20130109.bb
+++ b/meta/recipes-extended/ltp/ltp_20130503.bb
@@ -23,8 +23,8 @@ DEPENDS = "attr libaio libcap"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
-SRC_URI[md5sum] = "06974c85542c78b6b6ff74ac3ac3a5d3"
-SRC_URI[sha256sum] = "471b21f1d6f952957f534cd0c5ee5bcbbf50b9fcb83519b0293be141e6f2338d"
+SRC_URI[md5sum] = "d448d9e9731d7ef45352fc74633cc97f"
+SRC_URI[sha256sum] = "afdb1479e73d4da7f0d4d5d3fe1570bc5fc96e3317d4a5c10c59c046d3dfa4a0"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
-- 
1.7.11.7


