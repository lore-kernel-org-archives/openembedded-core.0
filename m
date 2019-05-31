Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 438017E5E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:27:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 7so6652355wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Xi/Mx4MDcgHvuWWmN+jjwQv7Y4WaXzx1rvLefyhaJ6k=;
	b=GmwlJuR1mJh1Elz9WeBFSV3COTLUPDarvWtplOKnqAx00f94JNfUq9RZBGmnduU2FW
	BZXGwx3AfMluhhriZ8tFTA7q9NHGcuxch6fCiTPD4dCrrkzu9axU5QgW5JSf4htSoRm7
	4uNbvSp+fmd5TzOcMO8Yizsv4dxQUq1n+rJKk2XRICxdlJFePJ5bYsrCaxXcB4beURm1
	ijmxNpWW2K0Fq5kuMSg3/YQRpDF15qxQoJ0OMj9vc+iUUgz1o9AD7bYPkYkOEvf/RAz7
	HPPtnEn4PlslTB+4g90fEWZPUO2pPLQi3aLK7By5+lNOtIrvHSIrmuzP/FA7lQKOycgU
	TUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xi/Mx4MDcgHvuWWmN+jjwQv7Y4WaXzx1rvLefyhaJ6k=;
	b=KHZPw+k1LsJNukN/mC1vApmoRWiUom7MhjMudylJVVqiX3SauPYGcTmDTLmirUoGDy
	FDHF4egDJPh8IP/ehbx0BVIsjHm2yVg4IHP64y6wPcVgTEjER/QrUYLbmWHVzk1GeJmX
	kRQh6Sj2WVZ+GJKMnmFd9ddtqK0dBSg5N8/Lmsz+seVqbpx4nvit0Ob0HWFsiZWNkqhz
	X5J+vQK/psPmFFrSYzSM1hXwUGx26FodVaC/1D6HM9hB29i+x5w9lEI2VWqiVB50jwBp
	IpdxH48I9ghUlupwDm2Djm0rsmm7EzVVeIx29IDnxtBVFHih3Dh9r8ElGLfFjd+J7ehq
	9lUA==
X-Gm-Message-State: APjAAAW9iH0BW8hMMiOqqXXakgAy7VfoO+TNz8l6iza16S+dwnBbT/bw
	xYCbB9w4EzdpcnpPeS/Ep2qDW4DxjOg=
X-Google-Smtp-Source: APXvYqxXVP1gcaS1xVBXLZfE8yoeuDIQqOmx41moltkSK/5D4Ui7i+QBf63AWd6YFfD4rrDnBITjcQ==
X-Received: by 2002:a1c:dc45:: with SMTP id t66mr7096180wmg.63.1559334434802; 
	Fri, 31 May 2019 13:27:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h8sm15355394wmf.5.2019.05.31.13.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 13:27:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 22:27:09 +0200
Message-Id: <20190531202710.98718-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] ccache: fix upstream version check
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
X-List-Received-Date: Fri, 31 May 2019 20:27:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/ccache/ccache.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index a31acada578..dcbbf0ca7a5 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -10,6 +10,7 @@ LICENSE = "GPLv3+"
 DEPENDS = "zlib"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
 inherit autotools
 
-- 
2.17.1


