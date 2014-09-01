Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1DC62252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 14:34:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s81EYb1p029166
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Sep 2014 07:34:38 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 07:34:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Sep 2014 07:34:36 -0700
Message-ID: <4088c95b073ed995f6e69d51337939872db565c4.1409580372.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409580372.git.liezhi.yang@windriver.com>
References: <cover.1409580372.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] native.bbclass: deltask package_qa
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
X-List-Received-Date: Mon, 01 Sep 2014 14:34:44 -0000
Content-Type: text/plain

The native recipe doesn't need package_qa, and it has a race issue with
do_unpack which requires the clean dir of ${S}, then causes error:

NOTE: recipe opkg-utils-native-0.1.8+gitAUTOINC+eae0d8fa44-r0: task do_package_qa: Failed
ERROR: Task 283 (virtual:native:/path/to/opkg-utils_git.bb, do_package_qa) failed with exit code '1'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/native.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index adebb97..dcd364b 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -163,6 +163,7 @@ native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 deltask package
 deltask packagedata
+deltask package_qa
 deltask package_write_ipk
 deltask package_write_deb
 deltask package_write_rpm
-- 
1.7.9.5


