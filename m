Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF84780A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 14:53:14 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t138so41416005wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8euIL2zlrEbi622Qt0i5Y1Qgro0OlJN6JrKiOTjctPU=;
	b=z0c+6R4icKEmddIC+nvgEXQ8v07m8ko5PiLXcbYbfc8KmFYAqQ3Bz19p6HXHYMAg5R
	IgQCnElFOf8BApBbygF2i0vT/sJLCrswIZre+dZ/Wndu7mHyZTOPoZsFRWJg8XGTLdi6
	6qxCz/N4jPaC5/+fkZNwRayX1NDb2xTwSLAlpsxG7voUuKZkSUZyb2KJLYKykmUGSrok
	mqIHSsmDMzLSDM9ezCADB/rHOXqNWxp//O7BqS2jhN6nNEAzhZg5mJMed9vmdrn5JN/I
	BB58BSM9yBzgr1HbOuofX0ihnNxB5LoG+gnGJ4y1HIim8saqXJ+YV2nrJwCz2vZPNkLH
	lMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8euIL2zlrEbi622Qt0i5Y1Qgro0OlJN6JrKiOTjctPU=;
	b=HTfcPLZ4uZq+1W0yZXsNJzmOte3VTV9Cp6223B8foSecSzqToIFR0EtGNTjwf3N+qN
	uRcOogq7TiPxeVW2VUvOQ5U97V2AltYtFNW+yYV0Qrc9AhEc601gX+7Ut2REGUEm2X1I
	UETbN5NcAO3+aXkk99WUCqA4N7lCv6/bVeN8mhTeUi3jAd0iLGCtCqRaMe6CWj+GPj3R
	TaKu2nzzYOai9XnbUwgGqt2vW3eGvaAkQS9IMnppyeiUua3s4ITKCefXatuWD0gnYv26
	eeW7TT+cMUcPjYAgFiie0N/cURp4+VKn/l24B4BErPnFAZlu3TH5KVNS1ox71teHjz8Q
	oMCA==
X-Gm-Message-State: AIVw111+FmzEBAT7tL2kDdAziBOXnRTZC/R8ogWNXim9Kts72Hkyn3e+
	q5F/cr+QE/GkBkp4Dgg=
X-Received: by 10.28.181.18 with SMTP id e18mr3672072wmf.180.1501685595658;
	Wed, 02 Aug 2017 07:53:15 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e21sm3203377wme.17.2017.08.02.07.53.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 07:53:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 15:53:08 +0100
Message-Id: <20170802145308.19074-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170802145308.19074-1-ross.burton@intel.com>
References: <20170802145308.19074-1-ross.burton@intel.com>
Subject: [PATCH 3/3] grub: use Python 3 in the build
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
X-List-Received-Date: Wed, 02 Aug 2017 14:53:15 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 240a1f92864..6de7ecc2215 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -57,6 +57,8 @@ BUILD_CFLAGS = ""
 BUILD_CXXFLAGS = ""
 BUILD_LDFLAGS = ""
 
+export PYTHON = "python3"
+
 do_configure_prepend() {
 	# The grub2 configure script uses variables such as TARGET_CFLAGS etc
 	# for its own purposes. Remove the OE versions from the environment to
-- 
2.11.0


