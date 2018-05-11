Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 337BD782FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l1-v6so5042594wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r4t6YeUR4/PL208gnOg4s52pe28HXgiFZeD6rLYzVpw=;
	b=YNLMeLY2NXaMlYkLUbKF6qeZyJ3rAt7Vi1jabDnJI6IkADCnIurA19GZrFLxM2/7l6
	5eBSyFNwXQYDtlTj7ZR2VJ03MxLkCREKUGrqRFt4few17LHxgBRz0slCsOIwOETF/cZd
	vMXYVPWnMjRfsIPcb/xUCxdXZ2ZV2f+Zf9S8J14G+0vTQnMcmpMY7ROZfuhe7+8RSlF3
	oUvJkQTsoa1NVkKEm+ndR7HwJbwAbtEGnFqDSeP4wOiojE8sGJXwoEtYneUcB/57YVZD
	8apHqM5T+BA7YP6DgIa1tcX6ZXOrdPausIkWJ7+Qdnmq6nRoK/j/X3pxxUkcJuaRMc0T
	rGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r4t6YeUR4/PL208gnOg4s52pe28HXgiFZeD6rLYzVpw=;
	b=TkIyEzEcLjC4PKDsqokL8y5PczA8TkdgWT5iHcX9zPIK3zJYCDyyrkxuzR2jrax2Qj
	quyXhYxIlB8VPzZOaEh8nOvknrnJLDOozVNVrzx0OU5qKYIDaiKrLJV0GSYVPvG2cIHF
	aeru16iTtlGuPemx37qdlJC8vCGCD+436WjKnh45thasraNuHQIiolAT8doGMdNUuY6B
	+aHsnK0xulv0h7I38XkabdlnhV7TWgL1gG8Guugf1YMtcUtJnHsinDAbIVgS+iwmFieL
	rVPPRmHKyXaFzS/qHPR3RwEAQggtoZf7dtw7zyayHUvCMgOcNWbYbrY/eSpWz390x0ii
	7Euw==
X-Gm-Message-State: ALKqPwc7j8PalJB8Yo4NCY/uCT8SRhu+GR6pLiZHlKYFaJRM99qZS8zd
	TPDkYeEGMsFn0b0Uycsaj2Z0Pg==
X-Google-Smtp-Source: AB8JxZodpqXPTTjpxhiMZQbY7RDnu0R8EASGDNsjkXsE673jG9fW+z4dPed3zXbUGqfa8CMgbz5HrA==
X-Received: by 2002:a1c:d50a:: with SMTP id
	m10-v6mr2762781wmg.72.1526066463440; 
	Fri, 11 May 2018 12:21:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	4-v6sm2078433wmg.40.2018.05.11.12.21.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 19:20:59 +0000
Message-Id: <20180511192103.7581-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
Subject: [PATCHv2 1/5] libsdl2: allow to build native and nativesdk
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
X-List-Received-Date: Fri, 11 May 2018 19:21:03 -0000

* enable x11 in native builds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index c0cf70d7fd..c37f669321 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -37,6 +37,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
+PACKAGECONFIG_class-native = "x11"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
@@ -63,3 +65,5 @@ do_configure_prepend() {
 }
 
 FILES_${PN}-dev += "${libdir}/cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


