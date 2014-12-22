Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59EEE729AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBM5SVJ7021179
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 21:28:31 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Dec 2014 21:28:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 21:28:25 -0800
Message-ID: <24e79cb3d5e9911dcbe4244a6bf2f17cfeb1e7ab.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1419226071.git.liezhi.yang@windriver.com>
References: <cover.1419226071.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] wget: add PACKAGECONFIG for util-linux
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
X-List-Received-Date: Mon, 22 Dec 2014 05:28:32 -0000
Content-Type: text/plain

Fixed:
WARNING: QA Issue: wget rdepends on util-linux-libuuid, but it isn't a build dependency? [build-deps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/wget.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index f2e12ef..049b898 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -19,3 +19,6 @@ ALTERNATIVE_PRIORITY = "100"
 RRECOMMENDS_${PN} += "ca-certificates"
 
 BBCLASSEXTEND += "nativesdk"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
-- 
1.7.9.5


