Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A71061AD1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 08:48:11 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so5889pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 01:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ikKaIGWYEZ6u0dK9S9yXwNrEOwRPdFeW3kxK0Y9uco0=;
	b=njrGsEyczs+9WsAEHw8gBymJlGm9Lyhr4cApdtjHNbbLlTSrWrZKjeBl+2q9qYOvQd
	YsDKQweq6lJRhuiwPdnLob2nXqrZ4Rz7cYYaue0LxOre5AnkRFR/87X1aWiBemwhxams
	GJrnWQqbJxgrCYQVI7KHTud7p+susGOorec4Y8vOXH1NtPeB/WfXl95qpPpfvd0BM+mp
	SLSNoBTBhJVS7f8FpX7EF84pRy9VKN18eR/iXL4lbmUV5gJSVaUeQHI2LKlsPE8HqXrP
	LftiaXMl/8vnbHLEMdHmoIQMWTYvoq7RGz8Gm0Mnou0Zq9oUjdYF2gM/nKZNjD71utRb
	MVnA==
X-Received: by 10.68.233.4 with SMTP id ts4mr32435777pbc.121.1370422091981;
	Wed, 05 Jun 2013 01:48:11 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	i16sm22886480pag.18.2013.06.05.01.48.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 01:48:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 19:01:50 +1000
Message-Id: <1370422910-24366-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Wed, 05 Jun 2013 08:48:11 -0000

qconfig.pri was not being loaded by qmake properly. This means Qt
qmake projects are unable to query QT_ARCH, QT_VERSION and other
variables defined in qconfig.pri.

Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
so that it can be located by qmake.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qmake2.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
index 5eebd8e..ca6b0f0 100644
--- a/meta/classes/qmake2.bbclass
+++ b/meta/classes/qmake2.bbclass
@@ -22,3 +22,4 @@ export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
 export OE_QMAKE_LIBS_X11SM = "-lSM -lICE"
 export OE_QMAKE_LRELEASE = "${STAGING_BINDIR_NATIVE}/lrelease4"
 export OE_QMAKE_LUPDATE = "${STAGING_BINDIR_NATIVE}/lupdate4"
+export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
-- 
1.8.2.3


