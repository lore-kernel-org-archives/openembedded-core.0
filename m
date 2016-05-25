Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E683731A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 09:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4P9O0NN012221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 02:24:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 02:23:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 May 2016 02:23:58 -0700
Message-ID: <76594b7fd302fb530bf25f2a25aad956de2d8e31.1464168189.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464168189.git.liezhi.yang@windriver.com>
References: <cover.1464168189.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nopackages.bbclass: deltask foo_setscene
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
X-List-Received-Date: Wed, 25 May 2016 09:24:01 -0000
Content-Type: text/plain

When deltask foo, also deltask foo_setscene.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/nopackages.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 0c2761b..559f507 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -4,3 +4,9 @@ deltask do_package_write_ipk
 deltask do_package_write_deb
 deltask do_package_qa
 deltask do_packagedata
+deltask do_package_setscene
+deltask do_package_write_rpm_setscene
+deltask do_package_write_ipk_setscene
+deltask do_package_write_deb_setscene
+deltask do_package_qa_setscene
+deltask do_packagedata_setscene
-- 
2.8.0


