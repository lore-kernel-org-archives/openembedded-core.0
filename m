Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id F24927D25F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:26 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p74so69093393wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BMhusBfw3tIi/kpPIZYLpU9etaPIkof40VIYukrx0eg=;
	b=C2BDn3mXmJ6aOs1YqDlcsGeFpCJlwuB7skc0eHIxLj9sKq8/7gaNWEumAoOdUIKYE7
	wwU260QdbYrsFMAWQMb3mSupADq2H+af2MFAfBNDhAJVsjcZtaPovnfhYgu6eJw3iJ7t
	o6TGA8Oz+qXr5iAbQVNeP1ZBbD8a8UrDGeHa7C5qkTjfwE9Vk7BPbL3UyHrTa5504F/a
	dAmm2FqWPVbH1ZteOuFQ7XYtr5Tj2rni1B074zMjANcJqAWFAch3AM+QRY/lBVMttC3v
	eyaAbN2xxCWUbhCpnI61KZX/otbl163Vm8Vc7wsantkhVYc3CB/P1g9v5hI+GlpKyk3C
	dfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BMhusBfw3tIi/kpPIZYLpU9etaPIkof40VIYukrx0eg=;
	b=T7b4NEonH3RkfVvKHL9GPksAAo81FupzXCiYkY4JEYF1RJrbYCkf9mqEPgtXbPb2fp
	MGZUw/la9wmRKc1WQGlJYpsCKdbQlGDkLbGXW2R2r9MtB9SeFWyHMkTkO0uhORLN222R
	swJ06okTjs26gJk8OakP0gw3yRZR2HtG6fBngidAqQCjUJxWOmEy6I9ETe1hyc0pR1c/
	M2Io6kS8+pD9tTKJSB8sS6XBhx3WKgpaRQeDTsfSR6kAvynTH9WoAR+hnnT2Esa1KtCe
	tUp4TwSpmvdrN5StoM/sTA7Zcb4MrXpY+A/93wD/ogg7mc+eaR6iOc6UrMD16wtiUxKq
	Fb1w==
X-Gm-Message-State: APjAAAVgggc7njNYaeRAFoMqtDWipVugCTc/SHyLpIUUYlWgHIFgDfRM
	RdKJl5wLlZossVc29ZvNzZGnoMKkdHA=
X-Google-Smtp-Source: APXvYqzckyIFAappOR0Rv1yMx7VMpHtvlldyaMUB7a+RsjzvF5kReCgAIzKp6AXWe/3kQ4kOaZY/Fw==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr5967240wmi.14.1564778247472;
	Fri, 02 Aug 2019 13:37:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:15 +0100
Message-Id: <20190802203719.20437-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802203719.20437-1-ross.burton@intel.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] libxx86dga: remove obsolete client libary
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:27 -0000
Content-Transfer-Encoding: 8bit

No modern drivers nor applications use DGA, so remove the client library.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../xorg-lib/libxxf86dga_1.1.5.bb             | 19 -------------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0bb4a57248f..d9ef9bf1fdb 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -442,7 +442,6 @@ RECIPE_MAINTAINER_pn-libxt = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxtst = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxv = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxvmc = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libxxf86dga = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxxf86vm = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libyaml = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-lighttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
deleted file mode 100644
index e1cb3456588..00000000000
--- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-lib-common.inc
-
-SUMMARY = "XFree86-DGA: XFree86 Direct Graphics Access extension library"
-
-DESCRIPTION = "libXxf86dga provides the XFree86-DGA extension, which \
-allows direct graphics access to a framebuffer-like region, and also \
-allows relative mouse reporting, et al.  It is mainly used by games and \
-emulators for games."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=abb99ac125f84f424a4278153988e32f"
-
-DEPENDS += "libxext"
-
-PE = "1"
-
-SRC_URI[md5sum] = "0ddeafc13b33086357cfa96fae41ee8e"
-SRC_URI[sha256sum] = "2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203"
-
-XORG_PN = "libXxf86dga"
-- 
2.20.1


