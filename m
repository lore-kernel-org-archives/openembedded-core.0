Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 11B89724DF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:21:35 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sB9ALTuM003922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 9 Dec 2014 11:21:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418120492;
	bh=Z/eUuvRTqwY2d9ueMnUKk0+RisfI0QR4mGG66UNMauY=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=WsIikKHTPADkw5y4EGG1gC1HvZ+oXMPrMq3V5qNTK4zwoqAG90LGDKdxcSDJHPBb9
	tM466FayofQnsU4nq390rpYMyA1D9vBBIOnXoRldi/jIytY4OSr2P1TU10zJuepCX/
	9iwL+f/g3q2R1/ozQKC9KLMZcrsw2vNRMxxbnhLk=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sB9ALHPW020695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 9 Dec 2014 11:21:19 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1XyHuu-0002MS-RW; Tue, 09 Dec 2014 11:21:16 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 11:21:06 +0100
Message-Id: <1418120466-9044-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
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
Subject: [PATCH] serf: readded md5sum
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
X-List-Received-Date: Tue, 09 Dec 2014 10:21:41 -0000

Commit 36d94ed631f1a753482282fced7d3b7505d5e03d ("serf: fix 'ccache'
builds") removed the source md5sum accidentally while resolving a
merge conflict.

Readd it.


Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Kang Kai <Kai.Kang@windriver.com>
---
 meta/recipes-support/serf/serf_1.3.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.8.bb
index e818889..aa7918b 100644
--- a/meta/recipes-support/serf/serf_1.3.8.bb
+++ b/meta/recipes-support/serf/serf_1.3.8.bb
@@ -2,6 +2,8 @@
 SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch"
+
+SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"
 SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
 
 LICENSE = "Apache-2.0"
-- 
1.9.3


