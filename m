Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5531660402
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:58 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f188so2503099wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ChajbooX7JrXx9dmx+XRc4tO7I62DdvuyeTlscRogYg=;
	b=aWNDZNcmk8nL6e3A+p39ksatJ11xWAOmZ8iT+uTSc6zSxxnWnHpcu+fGk/WrVt3I8t
	9IKXt1A/sPKJVgotn5U6fRH6RpbfTAbg7M1ypP+raAJuU7mEnE0eO0/hGsgkHL8cFVWl
	vIoHEnWiTjc7oD1V5hMHMtisnuNeHsFJzyM53H1HHWd3saCkcMe+EESusbbLZ4Pp2AZn
	WWaXzXQ4kYFRuYeY8lwvucNpB68XsYcVLWLiaYIEdCOON8Q0s4z0GeZ72tUj6gQLKBiD
	EYttVPTcsLZNXf1+2iNTGXBxr6yDimUuSM8/CXnBpkcAOEnJP2hDyl42ioP1Dgh8+Lap
	EK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ChajbooX7JrXx9dmx+XRc4tO7I62DdvuyeTlscRogYg=;
	b=g061v5ZZu9fswu2zuFeri+2ZsHjXhJcirNrolzmUHRTs5Db9jrrYzElgB1BRlZTmo9
	lANywezDTUpX9B6ex0mextP+lvHE3RLpVWyK+vGH+SGQNK/+gaJMOwg+Jt97TFOxLUZE
	Y4wTDSYEMuFaR4rVzyjm0W5meLhZUjD9FS+UuDgI4Uxmqep0rf/tRbvyVz61V9WNhbBP
	3dnzJB6hOXsUGipJtoqEnvSQd2ufUZ8m17BuuqlDj4jHWdpZ1nX5o11j/NjyCD56uGLP
	cJcXXSjw0OI9SgWIKnDnMhQUPMKUdpNUDAFhk9oz9vJjDimEd30DBWW38/8BKsYb+y9e
	vTbQ==
X-Gm-Message-State: AJcUukdqsu5XH12mOudk94ZXdlJRoNcb+t3U1wAK0ZDNucl6TBXXK+2R
	jbbKeBnFh/Tjh3LgzzowN9c6HMPF
X-Google-Smtp-Source: ALg8bN7zVgbovSNz/7AubDr0PfJ6YfNXZZumgALT0HodPsITGNKvS8nXL8EYiWxNAGFacEy+Dry3VA==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr3293963wme.135.1548260278811;
	Wed, 23 Jan 2019 08:17:58 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:41 +0100
Message-Id: <20190123161744.45763-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/10] kmscube: update to latest commit, switch over to meson
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:58 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 46aeeb01795..c6cb1842158 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,13 +6,13 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "9dcce71e603616ee7a54707e932f962cdf8fb20a"
+SRCREV = "d8da3dcfdfe33ee525cf562e928a5266ac69843c"
 SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git \
     file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig distro_features_check
+inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.17.1


