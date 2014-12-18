Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 06D3F727A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 11:04:44 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBIB4hHu027694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:04:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418900684;
	bh=Ck3ot15qXxUOIvVsjCQGa1vUR6iS1LPuTOA82vZcj/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=jVJIwdAqgGEfKi5y2GxIXSMZHosDOeQ6ibCJwAGJdgVAvgYQXFwNyGkw2PyIXAKsV
	LCUYNFOkovdb4MZg5y5kwxlHcZAWixYJgrraB3F2ec21L+CKuxNlfBIbPC9YoKSOaM
	w9nPSQnjwnCLGvJLfmeVUB91/CgFO6T+Bmc2nolU=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBIB4c4K005846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Dec 2014 12:04:39 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y1Ysn-0006x2-B9; Thu, 18 Dec 2014 12:04:37 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2014 12:04:23 +0100
Message-Id: <1418900663-20985-4-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 3/3] insane: made 'pkgconfig-nosysroot' check critical
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
X-List-Received-Date: Thu, 18 Dec 2014 11:04:49 -0000

Now, as pkgconfig.bbclass fixes .pc files, this check can be turned
from a warning into an error.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d327294..c69f1d9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,12 +29,12 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps file-rdeps pkgconfig-nosysroot \
+            pn-overrides infodir build-deps file-rdeps \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
-            version-going-backwards \
+            version-going-backwards pkgconfig-nosysroot \
             "
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
-- 
1.9.3


