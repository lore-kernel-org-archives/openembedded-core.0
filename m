Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 619A8785E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 12:24:57 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id o35so12122672qtj.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 04:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=jxjOVnUmAcEXyTMW5XYWy5zH93R6Yy8pv47Cl0DRZTQ=;
	b=Ka368EQW6TaJZEhVyPpYK333cmNQylKbv1XsYBx8IXSqBO5eGo7qgrLukUgDD6Udc+
	LTmiJGuDzFq/Y9HVWhEqfsvV/k1gvIAL33TAwrGetRVVr0v0suypAGfjdlZRhrBJOzVw
	XHfocrKbP5+APNyQ4whmSNbU+uvqgMIQtni/t4pG7gUGJxQYwWVsYE5Fz1iDYWDNei1B
	x0z1YYrob2GRQJJnoTU+amwa3gpseZecqyHj/euJ9wCNZk5vPxUwYkL5IeDCWeIXSqNs
	hcM9yyMefVWIFowX5nQvYT0jKrlTbLhJDqibXXSsjLJN3TgRrvX7e3G8bmL5Hc/H31CK
	DyZg==
X-Gm-Message-State: AKwxytf7VS8n0S+02dJITMDz5dgEwH/tv0Og8/cec0lHVI5keK0OVYsY
	ZJv8yBVEjOrUjs+uzG0hV/MfyQ==
X-Google-Smtp-Source: ACJfBoswrWnTUCzX8WKeYDogSCHpuuPjTB6AudAid3/dqnwRZ3JBwM1jcVzQMFZVjDVeKOeQeT0Qyw==
X-Received: by 10.200.54.61 with SMTP id m58mr37008374qtb.304.1516191898080;
	Wed, 17 Jan 2018 04:24:58 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id j7sm2719786qth.31.2018.01.17.04.24.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 04:24:57 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 10:24:50 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 10:24:47 -0200
Message-Id: <20180117122449.8395-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] libdrm: upgrade 2.4.88 -> 2.4.89
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
X-List-Received-Date: Wed, 17 Jan 2018 12:24:57 -0000

The 2.4.89 version has been released in Dec 18, 2017, and has a great
set of features and improvements, as seen in the announcement summary:

,----
| libdrm release with leasing and syncobj api updates,
| updated amdgpu marketing ids, amdgpu tests,
| updated uapi headers
| etnaviv updates.
`----

The full announcement can be seen at:

https://lists.freedesktop.org/archives/dri-devel/2017-December/160530.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/drm/{libdrm_2.4.88.bb => libdrm_2.4.89.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.88.bb => libdrm_2.4.89.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.88.bb b/meta/recipes-graphics/drm/libdrm_2.4.89.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.88.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.89.bb
index 735f734295..6754a93242 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.88.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.89.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "fe4d5c77f1468ee73d0bbb30d76945d7"
-SRC_URI[sha256sum] = "b5e55dbac2124e742e639f5b8553e8b7395863bf73dab4f77e99fe2fc25572b5"
+SRC_URI[md5sum] = "5307a147dde67ac643f6753a42b5d32c"
+SRC_URI[sha256sum] = "629f9782aabbb4809166de5f24d26fe0766055255038f16935602d89f136a02e"
 
 inherit autotools pkgconfig manpages
 
-- 
2.15.1


