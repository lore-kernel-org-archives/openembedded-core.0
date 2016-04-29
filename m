Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2304B70149
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:56:23 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id g17so29846613wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sApu7b7ZGy4V6BhdJo3FXNNaYQxROw+j3vKvAX6W/gg=;
	b=WEJ/smFGoFNNTtj0gVceT6mcwMAz9+HLwsGvlbqWhK1lFehdycAsFYXV+/OaN/y/I4
	RnlS1kEOOITMLyaUmWiD0iHUWcfAwZOc2c+9zDg7rGUxReNV66GNoeBgBSLg/6PAxfR3
	yHz1EfBWijOgldbpT4DIuIipoasYHGDaoYco8HtkoE/2q/W7oM2qUMGXe88nWN9FIyJw
	wDeDJBQ/Ch5grqJuaNPfe7YQfP2MtwtScOBsxEU+TYqbIv3YLb9ssL4lh86YzUP9MfQ+
	/6ihpOY4fs5zkku2xzlakz3NcZdbvzzPJENlq+N9q8WUfIuN9i5hI2itEteytspak3KF
	XSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sApu7b7ZGy4V6BhdJo3FXNNaYQxROw+j3vKvAX6W/gg=;
	b=Bg7Zqz0h8ZGBlCMeV/DuuBPgIvmb+yXHAjG2YSt3yUWXXCVzzWqx4mHMx12qTub/Kx
	/jKymZpJCj970FdaYttbP8dSVlv07M17f3ndZ6/M267g5r3MVL2Fz5XNALcnUB6zvHey
	lEnvLLIdJZsLdHgOdN3UGuMRv43yHh1IkLtP763MtpY8AH4dcc/oDIY4R3ZC+gigySeg
	mzP1px7U3Rnf2uEJHzZqhB8AI+3d3QVEBkcVgVIg66tmS/DAkBZH0xRMcNDlSKUo6h/X
	IwT7T3Cq41orSl/5NZfW1uNW28W25qnTZufx27nM4jLlHChDlwWji4uv9hRPdo6wAElT
	gf4Q==
X-Gm-Message-State: AOPr4FXkqTQSGuwMMxQRV3alBkIBh9YBqwx9qJ8WmFaTLKRJHtmaqWuaa3UbiROlHQQ9wJVE
X-Received: by 10.194.143.51 with SMTP id sb19mr21297199wjb.98.1461927383863; 
	Fri, 29 Apr 2016 03:56:23 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ck9sm14238739wjc.22.2016.04.29.03.56.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 03:56:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 11:56:21 +0100
Message-Id: <1461927381-14091-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] bitbake.conf: change APACHE_MIRROR to point at archive.apache.org
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
X-List-Received-Date: Fri, 29 Apr 2016 10:56:24 -0000

The official download servers www.[country].apace.org only host the latest
release, so the URL is only valid when the recipe is fully up to date.

In the general case this isn't a problem as our mirror list includes
archive.apache.org, but the upstream URI checking (the checkuri task) fails as
that explicitly doesn't use the mirrors.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 66646c8..1c4175f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -572,7 +572,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 # Download locations and utilities.
 ##################################################################
 
-APACHE_MIRROR = "http://www.eu.apache.org/dist/"
+APACHE_MIRROR = "http://archive.apache.org/dist"
 DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://git.gnome.org"
-- 
2.8.0.rc3


