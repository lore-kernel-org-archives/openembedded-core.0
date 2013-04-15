Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1URhWn-0007lh-Ri
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:25:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7bcJ003445; Mon, 15 Apr 2013 12:07:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id njpQaSnFVPXX; Mon, 15 Apr 2013 12:07:38 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7YJo003430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 15 Apr 2013 12:07:35 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1URhFg-0006Ui-66; Mon, 15 Apr 2013 12:07:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:07:03 +0100
Message-Id: <1366024028-24911-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/7] update-alternatives: Ensure DEPENDS is correct in multilib case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000

Ensure that the DEPENDS we're adding is correct in the multilib case by
including MLPREFIX, fixing unnecessary dependencies in those images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/update-alternatives.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index f7ad4d4..45f4291 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -169,7 +169,7 @@ def gen_updatealternativesvardeps(d):
 
 def ua_extend_depends(d):
     if not 'virtual/update-alternatives' in d.getVar('PROVIDES', True):
-        d.appendVar('DEPENDS', ' virtual/update-alternatives')
+        d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
 
 python __anonymous() {
     # Update Alternatives only works on target packages...
-- 
1.7.10.4



