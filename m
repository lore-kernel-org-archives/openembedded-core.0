Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 29C1565E58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 10:05:01 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s5DA50Ng019846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 12:05:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1402653902;
	bh=GraScty78Bw4oR3SrSnhad4eAeV1cgCtr773h5ADAvw=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=j3JBTOXPVtHGmok418omS2DJweOj+qE07oSNyEJ+yxm/fAhAVqWu5XOEc83/94QBp
	jbax9BM0SKWQdknm+3PaldKuNEInrlmIYVjgXZRjVxsz+yWGQRXQToztrz9GGdYi3O
	WSJFvtj9rI2xleBfwxfbrRDKM6WAC8aFOfcEYxdo=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s5DA4so3003106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 13 Jun 2014 12:04:56 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1WvOLt-0006W1-Vg; Fri, 13 Jun 2014 12:04:54 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 12:04:47 +0200
Message-Id: <1402653887-25012-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] git: fixed typo in 'libexecdir' varname
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
X-List-Received-Date: Fri, 13 Jun 2014 10:05:02 -0000

variable is called 'libexecdir', not 'libxecdir'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-devtools/git/git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ad0ad1b..8c85ade 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -49,7 +49,7 @@ do_install_append_class-nativesdk () {
 	${PERLSEDFIXUP}
 }
 
-FILES_${PN} += "${datadir}/git-core ${libxecdir}/git-core/"
+FILES_${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
 FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
 
 PERLTOOLS = " \
-- 
1.9.3


