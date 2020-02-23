Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBEB61738
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QSRk4m39z4J
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 15:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582468562;
	bh=dh154RGxTtkImMaWdWVWlSirp/E1nyst8noSGgca/74=;
	h=From:To:Subject:Date:From;
	b=iEXeB7rvCSBSOl5f2Hd/TL/v5zdjuQDW4z8UGl2CBpz4EfuJeUavwOYsl35FAZ4St
	qCFQyOAw9uuuwyy2DOVFzn9R2KMtTl5Bqrxe14UzSH31QgO9ugHHwBI/KKYFS7OIkj
	B443i6H9NZD0Tbp+hEqW2vr4nfEKGmC7drKzGdJ9OhRs6hgezLsuOurW/QOMMJOI++
	76Db6u8w82P63PjevFEN7KvBf3Ptf7R92eyh6S6lcH1DGnCbjip0TdbvUe1UVHEw1Y
	CfrgeZtwRMyhbJhRkIXQXG0j/1KgGsZeasSfoosQ9GjKqgeKNf8mh4LKGytWDgRIiX
	k+8nEW/OvpZoAYVnHNixW/Z1JlM9UVjxBsCZhQwcUcv430tqt1Ouksr9GUui77cYwO
	Jvp6IuHMU2nUNr3LIjAHkD11XHHfDzEdDlvXXnbO9iG2JaAD2aYGvE87DkAih73ZVo
	OFh7o1woX19oJ9/RkWHg7MxfTx8B2jYTuhD/Z5bar46EvMLL0YG4XER0zazV6X1Izz
	05PpXSZGmeQ0n2UvDv2kOdcW5R3niNt2RyH6GmTXNhZa2uQ5MJZzmBazztdtFHknQd
	mBW8Kd+bTZDRu+sDflXQkmYbBMeMWZE459GxVB7t02rBrFF2cC6qZ4lPpXTJIgAoRg
	E6m76ugkauiuk9g8tN+rWLi0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 16:35:59 +0200
Message-Id: <20200223143600.2282-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bison: Upgrade 3.5.1 -> 3.5.2
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
X-List-Received-Date: Sun, 23 Feb 2020 14:36:03 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-devtools/bison/{bison_3.5.1.bb => bison_3.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.5.1.bb => bison_3.5.2.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison_3.5.1.bb b/meta/recipes-devtools/bison/bison_3.5.2.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.5.1.bb
rename to meta/recipes-devtools/bison/bison_3.5.2.bb
index e70252d974..b5b4a8ef76 100644
--- a/meta/recipes-devtools/bison/bison_3.5.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "6fc5fa4488832a65db934b9e93bd5d4c"
-SRC_URI[sha256sum] = "3e7e097bd9709a2d5e40e69446b74b149733b3de864fadb7a9b54eca7b2a4dd0"
+SRC_URI[md5sum] = "49fc2cf23e31e697d5072835e1662a97"
+SRC_URI[sha256sum] = "24e273db9eb6da8bbb6f0648284d0724a5cbd6268a163db402f961350a4e50dd"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1


