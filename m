Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEC76C149
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 22:06:17 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id k8so11587799lja.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Ildr0mswRMa+9fW6rq5lWp57F3RFJpGxLAUZn0P59XM=;
	b=k2Ow1cztPkBf7aUsw062iCE9pS3hznkxQBdxVeRWFIN7C0rQtlPZCl0nHzbNBrxTqO
	ztsKH0GwJBy8tHYep4kllx1zQxrEXy3YlWEe2ANPsxG5ZD/nq4/p1Ja5TK3sTlzUUyd9
	2CG+kXcAVD1k0aDBsuajgNgpmE5xaesk76ENEyG2ntFmUK7ayHj7IACHYdsBK0sQj4Bg
	tWMh88TCDCjRlSiUqOo1uEMvu5Ofv1pVPYHGyiec2HfFAVjUp5bqw9YjY4v2bq2FBbhz
	/ZDtni8M9pLX4ZncHT3Sc6yy3wRvgGf5jYWsf7Ipk5ak47nXVsdBUOiTzFF6lK/b9OCI
	Z2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ildr0mswRMa+9fW6rq5lWp57F3RFJpGxLAUZn0P59XM=;
	b=qZrl4fc9bBgs2QlbR92g41ODCqi06cFpOO50dy8Fy5H+xNr0hE82EHgD4xAnUy8yTP
	SPSlXN1vsrLWaBMKqkgzAkBL921AG5sNEvry64Lf0JTuO0K7YRryY4Lan7BeRhtVslH2
	xUD9oGHfL0WYId8p85JEPR5nAhZ8oJQmu65EN3GEqSk63ctYjT8n6V8IhGXg2v1k0i6L
	Ksb6xmsrfkx+DmQnaOi1MlpUBDkmLtWQXtnck6GBStEK+jcv9SaBndSe8mfYsDkt6Sma
	c/Y21T80xo4wTR+jC9LHW7OyI2NTwIj+80wfDaT7smuPhLBbeQbfEyDfqmCPYWmdIhVY
	PH+w==
X-Gm-Message-State: APjAAAUi+rYSDZP+woAcdmvgZDP3LPnX5KvsxQSo0x8g7Y2PQ85q7oZV
	G7tSk/Ii6z1TNlx/bWB/s5CZB6ypNaA=
X-Google-Smtp-Source: APXvYqxC4TLP7+mwl1AoKYr9XAzlvy8VX65Huw+47Y/95+TWGPKaSCBnWkZb8N6WdHlZ2bOJR3dY/A==
X-Received: by 2002:a2e:9a46:: with SMTP id k6mr11424958ljj.119.1555970778297; 
	Mon, 22 Apr 2019 15:06:18 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f25sm3247964lfc.46.2019.04.22.15.06.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 15:06:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 00:06:15 +0200
Message-Id: <20190422220615.29474-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libdrm: update to 2.4.98
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
X-List-Received-Date: Mon, 22 Apr 2019 22:06:18 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../drm/{libdrm_2.4.97.bb => libdrm_2.4.98.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.97.bb => libdrm_2.4.98.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.97.bb b/meta/recipes-graphics/drm/libdrm_2.4.98.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.97.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.98.bb
index bbe9a33ba9..bed542ba05 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.97.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.98.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
-SRC_URI[md5sum] = "acef22d0c62c89692348c2dd5591393e"
-SRC_URI[sha256sum] = "77d0ccda3e10d6593398edb70b1566bfe1a23a39bd3da98ace2147692eadd123"
+SRC_URI[md5sum] = "1320b43c4bdb8846c308ec2610b62b64"
+SRC_URI[sha256sum] = "8be0edccaca3abde8b6bb1431b46354c7fab46e9b91cc6946ba65b51f56f1894"
 
 inherit meson pkgconfig manpages
 
-- 
2.17.1


