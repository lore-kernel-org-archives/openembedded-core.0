Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5731B71994
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 09:15:01 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id i88so45103626pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 01:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+4hjZE2GINv3rfvnkoEkWyhbl9gDYcuzKkj8lVuvhlI=;
	b=FYnaTTx3hloq54kmpvRSHrURmAO5K1cFhZICh6l9qIfLPX21xfv0kny/C4WTO5XvQd
	5n/iPGb9pifeMBbcDT+RDYHqndx4w4x0f7jP3ayIp8kmsBVxVLkTNvcqZx2jLQsYB2Uc
	AmCRJO0B0EQGI5p5XDqa3JjHhOJ+Io37cso2Ovo96daYcV/RW1DBzmdo31ibGJwwQYlC
	5Y2Wm9Bt0V4emcaUjtT2gwNGKVYQNwHmPd/nbed5nvIjezxPxzUQ4ykZ4kCVP01hIImP
	h8mqfa8QQGVDX3UtI2BQyi48bzaOQEy1JBnQU2YzahIPgZQ46CF1Dc/t7vEfEk1tRLLy
	zJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+4hjZE2GINv3rfvnkoEkWyhbl9gDYcuzKkj8lVuvhlI=;
	b=UsencYJIJ09GnOgc76nog43m/qOlcQyiX/9GtSpCy32gcry+h9jwhdmJxFblkfGfqq
	PvWhjvJB6WbrjapEjHg77VEUupCowTvLjsv+8Ff4awsOlGRfafIdMx4HDTtftaRGPU3+
	/ULNc0BYhnwQgDEs3Rr4BDNB3v2iC1SgvUf7+GqPrO+47/edhH0UWsv41Xycg7rhG1h1
	eJ/JWIjUh3A2De2JZqOFQskjUhvvBnGmfmTB9bZuw32hmNJdni+kc/7EnX17xAXhH8ZQ
	7doicb/kZ2OhTTXJYlMFWevj5D4lD212L7mbTcGHvj/0ANEx5I9YEiw+LNiErTEaPTUt
	nxOw==
X-Gm-Message-State: AKaTC02hkA2hupAz8NBBI5QxPX5txBEe9Y2PMt/gQpoBLW5oCLD8kCIxkVg4v9hei9AA+g==
X-Received: by 10.84.218.70 with SMTP id f6mr55152423plm.142.1480583703416;
	Thu, 01 Dec 2016 01:15:03 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v193sm91014812pgb.37.2016.12.01.01.15.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Dec 2016 01:15:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 01:14:57 -0800
Message-Id: <20161201091457.6822-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] gstreamer1.0-rtsp-server: Add libcheck to deps
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
X-List-Received-Date: Thu, 01 Dec 2016 09:15:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 13ba40d..7191f98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
 
-DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base"
+DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base libcheck"
 
 PNREAL = "gst-rtsp-server"
 
-- 
2.10.2


