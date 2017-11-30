Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAC3602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 13:19:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g75so13106745wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QsHiIe+xIOQ3EJ0nFasd3X7S0kveyavB3lFomsLnFxM=;
	b=S/eG0sMbq8xivgvK0y5nlt3/VWzfYwr3wyUK+IZMuv7NvNQ0/izKYaBRLViKGwYQTS
	U9NBcLGgbpTmpaTsj7eMAYgt1BHqg6gSx25a0xtJD8PC8HMbc+THKagE08z4Q1p81w6H
	U8+l/q5S61MudW5JQ3COVrsp5y9fV57QaDHkqMmCRjm7pZl5UogCQl8IZLQ8TxXbYmDW
	iR+qo+HNGFUMcrVwHFL2IdNlfgDOis2offjX4330c6nEWAqq+2CIXxV/QmqNsq0Hr5EQ
	ZNb1w1VeY8lf7R1t8w/G+1xfrztgSvTMXzuYwWAlMkt/7IB3TUao1JI28WumE9GY7Hyt
	CySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QsHiIe+xIOQ3EJ0nFasd3X7S0kveyavB3lFomsLnFxM=;
	b=ksJnFXzjzyPcihOm6MGxamcI6hTiVSYq68XjXtg/kT6RkCv/8CwgAJkfIAvCYJVgk6
	Ya1OQcywvTN8SgNX2U+wa3usUBXD8MUrsMmp+SELgogvyenZfsyEvsWvCYDKt+eEbYq5
	9n8GOZmlaxJ44Ndun78o70JDMzTZttacTrGpk2j6E0XAIY97nIvI+vt/e/OgXII919TM
	R0ljU4iOLivBMsZ/o3wrFMMRhZo2wMQhiQRj39TxSQZEpSxgBbfkar95xqw8Ua3A5GhQ
	hrzjuA+yUJVA2JuSeLnQ6IjWTHDZxzGn2htULJQK80Wppu1H8iVFwX9W4NfL7S6PAZIQ
	hp4Q==
X-Gm-Message-State: AJaThX6PLpttN22IZ3C7t0FIVJLfaDRIGNbCoBp6Lz+GvzFLaMph4agu
	5IeVtC0YhxuglxHj1uJvM+lSeWQ7
X-Google-Smtp-Source: AGs4zMZzF4VYYBcQ/mQ5rqICHr+GrLGqTXStDkjFeOgNScLAneCoZyvuKg9MUkvJozeNBLy5ILQyWQ==
X-Received: by 10.28.175.132 with SMTP id y126mr598368wme.20.1512047983584;
	Thu, 30 Nov 2017 05:19:43 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q15sm3602780wra.91.2017.11.30.05.19.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 05:19:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 13:19:32 +0000
Message-Id: <20171130131935.20771-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] pango: update upstream-status on a patch
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
X-List-Received-Date: Thu, 30 Nov 2017 13:19:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch b/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
index 812da21c56f..9e1626e9a0d 100644
--- a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
+++ b/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Drop introspection macros from acinclude.m4
 They take precendence over our customized macros, and so
 introspection doesn't work correctly.
 
-Upstream-Status: Pending [review on oe-core list]
+Upstream-Status: Backport [upstream 5ccfe0]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  acinclude.m4 | 96 ------------------------------------------------------------
@@ -118,4 +118,3 @@ index 8899c7c..48fd5d8 100644
 -])
 -- 
 2.1.4
-
-- 
2.11.0


