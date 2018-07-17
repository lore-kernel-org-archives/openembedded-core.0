Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 17DB378984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:27 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id s14-v6so42439wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CL0LEyEOZVxeKIGvJaQwxAtWS2f5q43kDhtHsnwgh0U=;
	b=0rbJmJpnZHvmHtj/B0crVeZuh76HTHKAmlBkHACqzFWCTLWZ/P4/QhL7iCmYMzdHJE
	t7SKp8/K4y0FKvgyjKz6tHGUwMjvvmTtlvWsnkEV72C3rWgl0cS6GWJwS1CFDkBN7GTX
	i58ATSXyQwmAg0CqiiWuC18h0IRBYdjx86dzJgAKvK6plB1v/LcbHf3YdHJuQx1zB/MP
	J3lN17lbSHFGzCn2qUY/HrFlFPrbJ/SGrI6gmV859hA7GCYx6ARVAQ+IzADj9ds0Bd5A
	X0BeFVop+Def3TeuxLg07DluXQo3GYGGfbxq6Gc7M9Hzvx78JlfHsWtSdNikUAPuk1Wf
	xHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CL0LEyEOZVxeKIGvJaQwxAtWS2f5q43kDhtHsnwgh0U=;
	b=KUWEdjAbo2mdDqfwdW5JC8aSAm3mybDJJhGcT9EVXSe9LWU0HeQLin1RhOB50D2ZVW
	9Uq48zU9aI99KhVUXpkpNcd8wzwrk1CitnhwSVuxnRcHUirhGl1ROLFzymQcppbGZMMb
	4Qgw08FI0b2z2KaQZ2HCaNf85TSLhT0xDgSXgVVfkC+OCfwzEwrXWOiYr5ga7GKoHp4/
	gERfasm6hDBX+oP3YpSNm7cB5YIFjmsrART3fOwTozx3e9G5UXIKQxwCebn77DlNrQkK
	t2nGCD1AQ3tvh/h4lF61yY1+/eKqO/vyk/cMCMaX8qGIe1+jUegM0oWRe1yu11vwZyuU
	8yRA==
X-Gm-Message-State: AOUpUlF2nz3MZfTEuabDBmGrYnVBDjYgP+y+eZk9buWQrOw520cqwE6V
	VIaqNnZmB9U2KIp6czts0P2yTqQx
X-Google-Smtp-Source: AAOMgpc7IzrD36BdASx/+tlcWJabnKK+m+rDDkle0p0lsms857wR0CzPfOTPU2N0pvyCGgcnbvRIIg==
X-Received: by 2002:a1c:8010:: with SMTP id
	b16-v6mr1963802wmd.41.1531845567659; 
	Tue, 17 Jul 2018 09:39:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:06 +0100
Message-Id: <20180717163910.3196-11-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 11/15] libinput: upgrade 1.11.0 -> 1.11.2
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:27 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/{libinput_1.11.0.bb => libinput_1.11.2.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.11.0.bb => libinput_1.11.2.bb} (79%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.11.0.bb b/meta/recipes-graphics/wayland/libinput_1.11.2.bb
similarity index 79%
rename from meta/recipes-graphics/wayland/libinput_1.11.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.11.2.bb
index 97264ca8e19..c1800a5be93 100644
--- a/meta/recipes-graphics/wayland/libinput_1.11.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.11.2.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "a182dab52f4d33bc1ef50668dcf53cc6"
-SRC_URI[sha256sum] = "64a36c4f826f4b5d473bf2cb803122f96390a18243ec810f2ce8ac5076a0bc12"
+SRC_URI[md5sum] = "d179b5afbf414b34ce36ffe6ea8a401d"
+SRC_URI[sha256sum] = "6b36e1163d306c292ec8359b35aa65431cd29d0a5254923775e8019ff5018107"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
-- 
2.11.0


