Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03E8A7E5F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:42:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so7278857wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CBXoPw0NX1wVOYCh6ccd36gozq7IdgO3vY56XVJo8gc=;
	b=i53UTucatpzEjcFwQv7xQ1xG0v2jagzfaGcySW0ee8AkPDabp+dLN5K4nfnG4pxJg+
	U8OMZFcRTWJsVsjhzFLC8BoVdSTwIg0o3+4TcglBPSMKAWEMErmB+IMnv0urB6gwLleQ
	6C1RYjagFYTUjKpPeeO+LMola7R3C/My282w1ao3ZBxPEuHt0HV2ahJujKDx2WREiSrS
	9o0BoyZfT9yQJjAXDUa8dndNT1hy1njPbqgy4TZ35bGjaKIWWyh5oY9OEoeF0dq4q+XP
	knNbqbX/m0op4uVZm2S/My8wSSTViU0c6lridCJoCdTsY2B70prYIRKdrxgVsFgpxFeJ
	XlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CBXoPw0NX1wVOYCh6ccd36gozq7IdgO3vY56XVJo8gc=;
	b=DWh92z3gMdIXnHpNLJFIEsQrDR90QPpwfiShZXcOeu2U1eQd3MUOAifFKZAgss2pIo
	Tki3OWgo7XLKqU/222nAnEiwOc3B/4x6sLrOFaPCOz7QplSdnI2u4XVehmYKnc15UBlP
	zroABGHBGZ56jDWpyIeNvSx3Zoy/UyI5Kygg8c2K4ErjPh0EW86vlyw3+b4wmedJvr+M
	dd8jIBVK/QlDgTd/DxmLA8iJFtOGsyPeMA0Flm2+YFG4qZtjpOok2Z1/+UFfIM7g0EWd
	xuINbNk+AbYTAGHhY3ks7/Srxij8zS3eVsZmIn48BRx4cyo+Wzj65u8bWAbSKZT7qFu3
	iJEQ==
X-Gm-Message-State: APjAAAW6SxH9laSzbes5rsfAoWKWz6/quu/KzyM3vRafPddyZy60PGFw
	dmvenc7Hpg35k7vIm2Pyso99uVBLNXQ=
X-Google-Smtp-Source: APXvYqwEzSCxTTAqcOTdYZAovCzqwSynS/Yl2KyLqjwrsGiGBi5TEuZFfCilDWo9TJbNodjb33jBRw==
X-Received: by 2002:a5d:680d:: with SMTP id w13mr7714186wru.316.1559335326419; 
	Fri, 31 May 2019 13:42:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	w10sm10994393wrr.67.2019.05.31.13.42.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 13:42:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 22:41:57 +0200
Message-Id: <20190531204157.101122-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sysstat: add UPSTREAM_VERSION_UNKNOWN
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
X-List-Received-Date: Fri, 31 May 2019 20:42:06 -0000

We are taking a development version from an odd-even versioned project,
so upstream version check reports that the latest version is less than
the one the recipe is using.

UPSTREAM_VERSION_UNKNOWN avoids a version check failure until
there is a new stable series.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 7f4749f5714..6b21c6b8c19 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -10,6 +10,7 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
           "
 
 UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 DEPENDS += "base-passwd"
 
-- 
2.17.1


