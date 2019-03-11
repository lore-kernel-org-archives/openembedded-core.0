Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8FA7CF75
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:16:44 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id e17so3128771pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 22:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZIZqbZ5Z24hIKdN53aNVmNfMnXrr/JI869mFZAQLi6M=;
	b=rGF1vib0U8a7B7ItY07elauY4q6o5ftPZueROh9o4fcHUQjHsX2GIVavcFqFsQmWtH
	aZu9y47A71ls6UAq6jiTVPSu8cseFISNjiqpLViNO+Xn5h1UVy3fbYs528pmm6hsU6Wg
	TLMCbt/XCg5pasndZZZtnEQO5ilWd+oNrw/XTqZiCQru0TvbHYcIibItK84mh1esqZkl
	pATegpn8pCYB9J9onKM+SREK98E8WEPZh6G9frcW9JXXu6emYyH2tlWiZRxUaX6li5/x
	D/+cidUUw/HZHUWOoA3q9J5nypN/x3TD9mRbzJMPMpm1eS5sVoCoMgVtwkPKOljNO+PU
	6fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZIZqbZ5Z24hIKdN53aNVmNfMnXrr/JI869mFZAQLi6M=;
	b=SZdcskz5M+NbLfI6snpwl5KyiRZgacCtkzyZCzfxum47a+hQYFA2IM0Fih5MzYrggt
	mF+e9fPm60ooHVqq35Ir1RAUNRJpGD1sxTbR2bzkqGScTzeJhhvTrhdNwtwyCYF+nvck
	Qmjf/ohcgbARZ59xuFgHYa4BXmsr658DSJjnbWl7mQiESqzlc0ud78L4jXCSbM++9899
	BZSwsaHv03DSgFsoP2P7KZRAs0aKFdFaw2n0Kxyg5Lb6tVKjycuO91Kwsg+ynesikyx8
	qMKYdouXBDLDtVLCvyMDM0mJKD0LoBYbHtFt0KpvdMDKdYu/MPWnvLHVDhswxw5PJunx
	vfHQ==
X-Gm-Message-State: APjAAAVekIknzRZEqcdGIevHoBJDfVswGm9dSn72sfhacue2nK0fdvi7
	w4T2BiBFD3qsbH0YnXS1kd4kxPiT
X-Google-Smtp-Source: APXvYqxx0R3mGdlJ+Uq50RNQeqL73BFvg4QfGbyYrLZSdC3mU1g/Yh4UDwqrOfqouL1ujUF5tm/aLQ==
X-Received: by 2002:a62:4ec5:: with SMTP id
	c188mr31587647pfb.230.1552281405158; 
	Sun, 10 Mar 2019 22:16:45 -0700 (PDT)
Received: from localhost.localdomain
	(50-196-139-177-static.hfc.comcastbusiness.net. [50.196.139.177])
	by smtp.gmail.com with ESMTPSA id s6sm6215239pgm.90.2019.03.10.22.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 22:16:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 22:16:42 -0700
Message-Id: <1552281403-31669-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552281403-31669-1-git-send-email-akuster808@gmail.com>
References: <1552281403-31669-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/3] libxcursor: update 1.2.0
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
X-List-Received-Date: Mon, 11 Mar 2019 05:16:44 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxcursor_1.1.15.bb => libxcursor_1.2.0.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.15.bb => libxcursor_1.2.0.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.15.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.1.15.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
index dc9af23..2df7a3a 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
@@ -12,11 +12,12 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8902e6643f7bcd7793b23dcd5d8031a4"
 
 DEPENDS += "libxrender libxfixes"
-BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[md5sum] = "58fe3514e1e7135cf364101e714d1a14"
-SRC_URI[sha256sum] = "294e670dd37cd23995e69aae626629d4a2dfe5708851bbc13d032401b7a3df6b"
+SRC_URI[md5sum] = "9b9be0e289130fb820aedf67705fc549"
+SRC_URI[sha256sum] = "3ad3e9f8251094af6fe8cb4afcf63e28df504d46bfa5a5529db74a505d628782"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


