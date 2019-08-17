Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 88DA77F359
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 15:12:19 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id q4so9425201qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 08:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=i6S+peqYcudQr0j8Y5PF3hI65IIpy5+DxyXCDNV9ALg=;
	b=fSTU1y97uUM8dR978qao7I1sFz40hO3U4I6vrjBNd5FDMvPMWEIeV1mX9YVkxVrU6F
	Cc2frp19/VQOdgFVJQcasgSBcOjhWWd9eCXFbvcBp0BklOZx3P8LAWoTmLZxakutyRKt
	xWvza2GhF8N+Mp5QCyG8VwcbgdCp7OuCNApu/B+2xcGwohZzKPTcgTNLu/3FkkCTZpo6
	JFRrFh5zceGpurHb53ovJKlxWLQWa/L7SH2YZmCCU9XHoLD0+EHPokRpO6iq8eXkAt06
	AyrhiKZpxJfN7eN1OiGChvMJ2wpr7/sVSFRqR7GjCl+A2JwjPmDs4hCnqd5zpL1qUpCl
	z5cg==
X-Gm-Message-State: APjAAAUHIVu2yfGr0T47Tpw1OHAwQH017/Gxe8QGib+Hs+UFyhq2ars4
	s8rmvPTzbi2SOvYAI545TRCYYBl38e8=
X-Google-Smtp-Source: APXvYqzjTTg5znEx/fVQ6O33O6ETRpovZHbD66Q6zy7jCXiAe0cvY0/ixhYLbE5DkPWcGNCB6Qxesg==
X-Received: by 2002:a0c:a9dc:: with SMTP id c28mr5276288qvb.85.1566054739968; 
	Sat, 17 Aug 2019 08:12:19 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	o200sm4549968qke.66.2019.08.17.08.12.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 08:12:19 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 17 Aug 2019 12:12:16 -0300
Message-Id: <20190817151216.15179-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] kmscube: Bump revision to f632b23
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
X-List-Received-Date: Sat, 17 Aug 2019 15:12:19 -0000
Content-Transfer-Encoding: 8bit

This includes following changes:

f632b23 drm: Find a proper modeset device, is none is provided

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index fd90d20172..2b6837fef6 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "e888ea1d233b2639b87a68e099d18d4e919905df"
+SRCREV = "f632b23a528ed6b4e1fddd774db005c30ab65568"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
     file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.22.1


