Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4ou-0002o1-Jf
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:10:04 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qh4l5-000114-I5 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:06:07 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:06:06 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:06:05 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:06:01 -0700
Message-Id: <ea6f9e7c8e2fd03d3c1ca9fc83f149dd696ac40b.1310583666.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310583666.git.tom_rini@mentor.com>
References: <cover.1310583666.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 13 Jul 2011 19:06:05.0862 (UTC)
	FILETIME=[EA945460:01CC418F]
Subject: [PATCH 1/3] site/ix86-common: Fix ac_cv_sizeof_unsigned_char definition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 19:10:04 -0000

It's very not right to set this to +ac_cv_sizeof_unsigned_int=1.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/ix86-common |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 4a4442a..ae5680a 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -1,5 +1,5 @@
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_int=1}
+ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
 ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_unsigned_char_p=${ac_cv_sizeof_unsigned_char_p=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-- 
1.7.0.4



