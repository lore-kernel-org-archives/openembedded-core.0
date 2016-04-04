Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC1276806
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 14:39:32 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id vo2so164885417lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 07:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7FeOnH989hQ6nQ3SAkcRAxPW6ddmyhlJZumyDaiid1w=;
	b=Ir2VqaJe2NA3FJihiCU/ywP1w0CU0dBGMu6e/zDdb244FooViGTYnqL7KzSvITB8gG
	ipwuiqqbZ/BBJ765ayxN3WpUZzVKo7ncNdULjjGJeIwkAonLorrQ62NZsDYEXLDmA85o
	VTbL+ww6GKsDUJGyCSv/DoNVafI7Od/fDi01jvnEZt6wNgEsa8bIDLOrNPeKrAo+gaUp
	DTBu/bDFxJGBcbzPj8kxH9ERAQOVif8vAjep5DUn8c755teNwOEHr9R/q+q5LvqC7D0J
	dNt8UBxqphUh2c1jRJ3yTWAE2H/FljBTHAOgfiClZmK4d/lNqDvq9CIMphIHbu1JZKdj
	fAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7FeOnH989hQ6nQ3SAkcRAxPW6ddmyhlJZumyDaiid1w=;
	b=cylXloEYViRWxcqjXtvT2eRotqAIS8TVUNR5hXYAiyevh6Mh2qBFU6zEOdtpGXv2D+
	0BKOcGhZk3SPP5lTRJX/lEi+31t/nzJe+hjFuzqmORJm+7ESRCIaLFm60a1chkRezdID
	ZgVUT0iwHqO/ftH4TAzy3MMZDXZMGLaHRgaFRBeJiCT9epRe9Rnt1UKHEU1U96fc0+K1
	2fsGSXI/EtmKImhvoPJZ+9l4aM+NrD25kEVGzNmEmQGXas2Z1R2keF2JsIasa1eDEVO0
	+oPhOaPxQSWZCw7Nsb4c8iypYybx8S7fM4i0GkbkE/rc5CjjFrrtoUxmhkBmpTQGZ0Po
	TvzQ==
X-Gm-Message-State: AD7BkJKcA6eD0EESV1BUojxpI1y0xVzqXl+n997fjDktwG++qIstYEUVYAc7nh0M3oFVhJBu
X-Received: by 10.28.57.214 with SMTP id g205mr12436153wma.24.1459780771014;
	Mon, 04 Apr 2016 07:39:31 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c144sm14261319wmd.0.2016.04.04.07.39.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 07:39:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:39:23 +0100
Message-Id: <1459780763-22368-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1459780763-22368-1-git-send-email-ross.burton@intel.com>
References: <1459780763-22368-1-git-send-email-ross.burton@intel.com>
Subject: [jethro][PATCH 2/2] ncurses: update SRC_URI
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
X-List-Received-Date: Mon, 04 Apr 2016 14:39:36 -0000

Upstream re-arranged their FTP server and deleted the tarball that we were
downloading.  This tarball is mirrors on downloads.yoctoproject.org but not
everyone uses that, so Work around this by pointing the SRC_URI at the Yocto
Project source mirror directly.

[ YOCTO #9379 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ncurses/ncurses_5.9.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
index 54d27a9..35ef9c3 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -4,9 +4,11 @@ REVISION = "20150329"
 
 PR = "${INC_PR}.1"
 
-SRC_URI += "file://tic-hang.patch \
-            file://config.cache \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/ncurses-5.9-20150329.tgz \
+           file://tic-hang.patch \
+           file://config.cache \
 "
+
 S = "${WORKDIR}/${BP}-${REVISION}"
 SRC_URI[md5sum] = "cee991d09e69e60ebedef424804c52d4"
 SRC_URI[sha256sum] = "5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f0938bd87c0eb75828f"
-- 
2.7.0


