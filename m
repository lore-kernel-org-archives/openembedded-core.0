Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06CA573689
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:33:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5X5DH016298
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:33:05 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 22:33:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 22:33:00 -0700
Message-ID: <c69ad1230024d547eec81bb1fe0ada3a478e608d.1426743145.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426743145.git.liezhi.yang@windriver.com>
References: <cover.1426743145.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] oelint.bbclass: adjust task order
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
X-List-Received-Date: Thu, 19 Mar 2015 05:33:04 -0000
Content-Type: text/plain

Addtask lint before do_build rather than do_fetch, otherwise it would
cause all the tasks after do_fetch run again every time since
do_lint[nostamp] = "1".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/oelint.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index d00f468..1cee4b0 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -1,4 +1,4 @@
-addtask lint before do_fetch
+addtask lint before do_build
 do_lint[nostamp] = "1"
 python do_lint() {
     pkgname = d.getVar("PN", True)
-- 
1.7.9.5


