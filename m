Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB98870CFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 09:44:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9R9iinA011445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 02:44:44 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 27 Oct 2014 02:44:43 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 05:44:42 -0400
Message-ID: <1414403082-28396-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] which-2.18: Make sure ChangeLog exists for automake
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
X-List-Received-Date: Mon, 27 Oct 2014 09:44:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed:
Makefile.am: error: required file './ChangeLog' not found

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/which/which_2.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-extended/which/which_2.18.bb
index 5fa5d9e..49e9248 100644
--- a/meta/recipes-extended/which/which_2.18.bb
+++ b/meta/recipes-extended/which/which_2.18.bb
@@ -25,6 +25,9 @@ do_configure_prepend() {
 	OLD="@ACLOCAL_CWFLAGS@"
 	NEW="-I ${STAGING_DIR_NATIVE}/${datadir}/cwautomacros/m4"
 	sed -i "s#${OLD}#${NEW}#g" `grep -rl ${OLD} ${S}`
+
+	# Make sure ChangeLog exists for automake
+	touch ${S}/ChangeLog
 }
 
 ALTERNATIVE_${PN} = "which"
-- 
2.0.0


