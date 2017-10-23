Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC1B37198D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 17:23:55 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r25so12287843pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8HHAPnpqs/MbRzLGuZ7Vjd5QBSNFGVxLulU35bHNsVk=;
	b=Ey8lAEfZVHZJgyxPrQgBeP+7tnp788H4KzbzMV+DZI6r7tsGcB8qQ5eZPmrnek5S7D
	tchl5DvaP2nP3foOGmEEOfnrEjP3HLLyIeg7Zh3zyCy7cpuKqQW6vKdqVuFSt68wI0vC
	bPucIOE8q9nVilT6hVs+0NH5+SC7kTmxrDejoW/PgiL5m205cBLNmqyXm6EswXj6U1o2
	T83l3nzRBUZtDfZt+zy+D+WOO3C1dca8azKUA58EHykfZLM3rpq1jBtcVz8TVeaSHKhH
	98D1Bq95Of4nvez/im82uZ7xOr+zuKDxcn7EVkZ7XDjzzy8FVFFXd7C2VvsKLwpkSTIY
	tZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8HHAPnpqs/MbRzLGuZ7Vjd5QBSNFGVxLulU35bHNsVk=;
	b=MwbwSelYR+b4W5kkZfhSQE/O+d5s459fZElB9MLupPL4xW7aw2qSzE8fUQjfRHqmSn
	HaUp2czVZOLmHkIgzpv3i+7JWfbPuXhvEuAbMxMbjjjxIBU5yBInaeS5OsDysD89AA7m
	vIZYOvPP1PUeF7+bHHBc9II3XZ26n3+H8fPQSbZ5zTeBrpEf5YgxaEr8fjFd6eDAEos+
	EMY6ctjcTyfMA284rGmGsHuv5dKx1QUDpTSkttTIZBqBAsnAJ9nOuyPu4Dc4vu76oSzi
	mH6bEGd1FUlbm3X5hmTtfZ9rmTi0u4FI2Xlqm7aMYJOOg5UzzafNsiuvASvcRVQmUADE
	xJMQ==
X-Gm-Message-State: AMCzsaX/G6YU7gqXA8lppDpifNRNrslZP9bkmwi8rqsIoK8NdFdUKO2W
	IKnpMB/mdK7+GYa1hV2xho9/pw==
X-Google-Smtp-Source: ABhQp+TJ/Mw9XWnK8tViPfxVdgVvTKC6AhdssJWOaLe8dP79jP75fN02AdY06SKRGNf6vEc/fSrqdQ==
X-Received: by 10.99.183.67 with SMTP id w3mr12335003pgt.329.1508779436914;
	Mon, 23 Oct 2017 10:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	j8sm13113491pff.131.2017.10.23.10.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 10:23:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Oct 2017 10:23:49 -0700
Message-Id: <20171023172349.25616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH V4] libcheck: Upgrade to 0.12.0
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
X-List-Received-Date: Mon, 23 Oct 2017 17:23:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V4: Point SRC_URI to release URL

 .../libcheck/{libcheck_0.10.0.bb => libcheck_0.12.0.bb}           | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.10.0.bb => libcheck_0.12.0.bb} (67%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
similarity index 67%
rename from meta/recipes-support/libcheck/libcheck_0.10.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.12.0.bb
index 9d34198a96..e684958925 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
@@ -5,11 +5,9 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
-          "
-
-SRC_URI[md5sum] = "53c5e5c77d090e103a17f3ed7fd7d8b8"
-SRC_URI[sha256sum] = "f5f50766aa6f8fe5a2df752666ca01a950add45079aa06416b83765b1cf71052"
+SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz"
+SRC_URI[md5sum] = "31b17c6075820a434119592941186f70"
+SRC_URI[sha256sum] = "464201098bee00e90f5c4bdfa94a5d3ead8d641f9025b560a27755a83b824234"
 
 S = "${WORKDIR}/check-${PV}"
 
-- 
2.14.2


