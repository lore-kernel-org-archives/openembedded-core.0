Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0107723F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 10:26:25 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id i5so23773944wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=y65tonafLdcgiwQ+TTYsQ+oyWNTYRFvSe2aayfXMUdo=;
	b=o/KUYl/OwOJd9EnqyjDkrDEzwnKk8Nk5TEhNM3VsGWPig3CEHLQy9nzBo13cG2vHHm
	+csfQITYkVjvVfj9jREOZnV+VfY8fIeKGf4+NfmBC4+9fy3R3sggsq3ZAIYaTmFb0gm/
	H/bTQH3Cuo8Cc16dGAH+mStEWR9DcY7eY6EV7iHpFUrslgOwGl3ewoR7hbUorumDL3Nt
	bUlgAd1HM9IOyDljZbS7NbWTijoqVfkY5Is2GYvE9U6hownatHz+jh/vW1+iLwcd0+N5
	drAUMZPIcfQQaVcQ4QTvERFVLoJ41wUOhgzCtsks4nsJ8Vywllbxy7IOjnETDQwQEUYz
	iRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=y65tonafLdcgiwQ+TTYsQ+oyWNTYRFvSe2aayfXMUdo=;
	b=VwX3272wYg8QarIkhTwaJA1mp4TwjkXfG4NzUmpLTcO8kGG2Nva3z0j0xU3LwATQaa
	ov8bxE/YbzO75PcsHawG0ayc1L8evMAA/igjqPnMgaqLJb5Nle62Xr7vM+DKVNRcCBZU
	0AO1s8IGUC4VkoZs0QfAa4ZOoV40sHtIOFOhmioKzC1fFt0XeyCHX6kYt1wQpRH8l4rm
	1+izl05YfqxIZGfuPLx4L2SYrtrmu6TcGg4oFIyV6LuxgX8Yp73qMK6n4vB3+s/BZAUN
	VFMisvAyeEGgAKTlGRshKVFKJ3kHVtf9P1bBkZ9EyTiqOsX1Me4a0yN7BFlRxPxdgks/
	mPhw==
X-Gm-Message-State: AEkoouvA3bjD8R1Gtc+rgegVRDa1zH+uy9MPwIpAyO2ZUNhjBU0n2ZATI/MrzqDBq6eZi8De
X-Received: by 10.28.128.15 with SMTP id b15mr2367824wmd.100.1470997585566;
	Fri, 12 Aug 2016 03:26:25 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lv9sm6866584wjb.22.2016.08.12.03.26.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Aug 2016 03:26:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 11:26:23 +0100
Message-Id: <1470997583-13210-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] curl: upgrade to 7.50.1
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
X-List-Received-Date: Fri, 12 Aug 2016 10:26:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/curl/{curl_7.50.0.bb => curl_7.50.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.50.0.bb => curl_7.50.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.50.0.bb b/meta/recipes-support/curl/curl_7.50.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.50.0.bb
rename to meta/recipes-support/curl/curl_7.50.1.bb
index 6a5be25..a21419a 100644
--- a/meta/recipes-support/curl/curl_7.50.0.bb
+++ b/meta/recipes-support/curl/curl_7.50.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "9e463ff8fdc1b5daa81c850c514980ec"
-SRC_URI[sha256sum] = "608dfe2db77f48db792c387e7791aca55a25f0b42385707ad927164199ecfa9a"
+SRC_URI[md5sum] = "015f6a0217ca6f2c5442ca406476920b"
+SRC_URI[sha256sum] = "3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.8.1


