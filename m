Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 843D26BCF7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 18:12:01 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Fri,  3 Jan 2014 19:11:54 +0100 (CET)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-03-01.atm.binero.net (Postfix) with ESMTPSA id 680983A178;
	Fri,  3 Jan 2014 19:11:54 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 19:11:43 +0100
Message-Id: <29a6b81da6c0dcf0796dd7732eac42787c403247.1388770493.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1388770493.git.petter@technux.se>
References: <cover.1388770493.git.petter@technux.se>
Subject: [PATCH 1/1] cdrtools-native: remove unused FILESPATH
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
X-List-Received-Date: Fri, 03 Jan 2014 18:12:02 -0000

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
However in cdrtools no FILESPATH additions are currently needed so
instead it should be removed.
---
 .../cdrtools/cdrtools-native_3.01a17.bb            |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
index 38de407..71b86aa 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
@@ -16,8 +16,6 @@ S = "${WORKDIR}/cdrtools-3.01"
 
 inherit native
 
-FILESPATH = "${FILE_DIRNAME}/cdrtools-native/"
-
 do_install() {
 	make install GMAKE_NOWARN=true INS_BASE=${prefix} DESTDIR=${D}
 }
-- 
1.7.9.5


