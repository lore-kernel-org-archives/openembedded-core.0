Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 45C806BBE6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 01:42:27 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id y22so12637684pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 18:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6706cnOjdGMFpSJX0eciCIRQxb3583oEEgt/RL84bu8=;
	b=In99SgkydGpMtEmBSmsQkY9gBOskpLuUKsKNWQqG61zQkPXoQXBA1luoK4uheQKNmS
	5YUP/fCm9SdhTZttebK7EsR9kV2BWoaPklHJMTehMRvcfBmSQY01oXCbHmPYXKhFOrAD
	r6KKjy1JKp2jSbO6WNdw8Xv9tt6quNScjA9G3rUPzr7a5yER7JtQR/gigOOPLmzqZFd6
	qIsaGYDUhP0OX6bUN6BBl1hFi0zTESp+q15ba72pYio/LDkaIAbTVg65TGiVPB5yc31Q
	2LyKM7C19a9d5KnjDufaMfz8jF+ZJVxhdtRjZXcJaE+7/xfi1CW+yERz32O6X6dl/uZJ
	MIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6706cnOjdGMFpSJX0eciCIRQxb3583oEEgt/RL84bu8=;
	b=eA46e4ePVLJTuLb/2jWkcvvrjUh3KkTvuGtwL7wP73Z28gc/B92fZ8o/kBgiSPl5Y+
	wS1NslXu0mEegryIDz4QN3Q0PO7e/k1jjshHzXtezYu2TT74YLrsqF6td380AblAXF4G
	sWMyMH9/UopRw1352G2lRMnLdZFkZ9NSmEGVDLxa9e6B6D2uh5J3e+ZI/al9MOcZIw0q
	p5aqbHv0iwjxHekLe1aTjjSNzMJBV7bSuMvrrmgzxqqhw+DjpzVs9xSKYdbCsg5Vzmab
	jdTgTEqash9MPiwQmcDTH2enXElkSwynuN3KDOLFde4ikaFvm9dQiHSODn4+IGI2Q8s0
	12wQ==
X-Gm-Message-State: APjAAAVjRYRuncDS9m0n2PQBBRf53baAx0sye3e6i64O4PDw0mylZq7g
	WyiQwCb29u3h350cF9t9d1jLwPRGeek=
X-Google-Smtp-Source: APXvYqy30E7hZI7WeuG+oT2ZvoqxsAa6m/KB8uR/YQj+26/6kn4FqOagXXwYcObroY7ytnP2zdSX2g==
X-Received: by 2002:a63:2006:: with SMTP id g6mr30036096pgg.287.1568166147860; 
	Tue, 10 Sep 2019 18:42:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p189sm33096679pfp.163.2019.09.10.18.42.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 18:42:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2019 18:42:20 -0700
Message-Id: <20190911014220.4089579-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] cogl: Do not depend PN-dev on empty PN
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
X-List-Received-Date: Wed, 11 Sep 2019 01:42:27 -0000
Content-Transfer-Encoding: 8bit

Fixes image build error e.g.

 - nothing provides cogl-1.0 = 1.22.4-r0.2 needed by cogl-1.0-dev-1.22.4-r0.2.core2-64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 3e392fa5ec..4038afbc11 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -75,4 +75,6 @@ RPROVIDES_libcogl = "cogl-1.0"
 RCONFLICTS_libcogl = "cogl-1.0"
 RREPLACES_libcogl = "cogl-1.0"
 
+RDEPENDS_${PN}-dev = "libcogl"
+
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.23.0


