Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 47A8A60745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:26:29 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1atYI9-0004zu-Cs from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2016 03:26:29 -0700
Received: from gemini.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Fri, 22 Apr 2016 03:26:29 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (svr-pkl-eng-06.pkl.mentorg.com
	[137.202.156.65])	by gemini.alm.mentorg.com (8.14.4/8.14.4) with
	ESMTP id u3MAQPiF027454;	Fri, 22 Apr 2016 05:26:27 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Apr 2016 15:26:20 +0500
Message-ID: <1461320780-50763-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] cups.inc: Fix ldflags warning.
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
X-List-Received-Date: Fri, 22 Apr 2016 10:26:30 -0000
Content-Type: text/plain

From: Noor Ahsan <noor_ahsan@mentor.com>

* While building following warning comes up
QA Issue: No GNU_HASH in the elf binary: '...libcups.so.2' [ldflags]
Fix this warning by settin DSOFLAGS.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 4b2d214..c7f3afe 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -44,6 +44,7 @@ EXTRA_OECONF = " \
                --without-perl \
                --without-python \
                --without-java \
+               "DSOFLAGS='${LDFLAGS}'"
                "
 
 EXTRA_AUTORECONF += "--exclude=autoheader"
-- 
2.8.1


