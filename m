Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0C857601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 21:27:36 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id h14so28872234pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=u7I2uJ8H44dKvi8HKEaH+RuZ2CtA+n1po9OXR/LC+kQ=;
	b=FyZP5N4qOJI5BVgrsxh7DFnlc54NisrPMVdkAfZN9i3mlw3T5XgFlv+g7fC6nIz0Ga
	EgaPPZm+T/RiPuBudvqRf18dzn7g+oVIWDomXvDdDijivZ/vKkD57PXpdbBOK0B/WsSO
	G8f8YIEzMV/Vj+RRo2IB9fh40qldJAbQVkyA0tYw2fUkEtaumljTw+Oh4hO/zqA5wGPu
	tRQs0yBSR1rZZyvrYHoqNbPaKzvsXfv8W7Z5ELEZJZ5W/JBN/o7Hwhch4bryHLzesc+0
	i56+1G63KPsFbWo0lCoJvrh5gcvIuaPDrasNLF/0tMjnMJQPCFz6qR41TZNKzZhnWu2G
	ZXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=u7I2uJ8H44dKvi8HKEaH+RuZ2CtA+n1po9OXR/LC+kQ=;
	b=XBoDzY15UI+yQkIu0fz/T8Nzxu9bgnYdijoWh05F0x2VGJRen9tZTJc/EW3c44qHZT
	xeBnuwQEuLGMs0gDUMXwAWGLArr7q16hPJXIf3A6wbQwrub0y5JPPQpmk2xHWUZGGJhe
	TaLCuLJUWSX4dUaby10NZv6G3lxhVzKIjMnz+elXVq11esaMQuCIFfzslpkQFEmxuxRo
	gwc5FDi0OH1qet23i06VeQ6MwTS3ue9HacEyGgw0FFCIseU+DOwFi3Bdo/3U4SGQS1YG
	5iB7AimaSEeXUcAgSlv/VkD0TnM177dIQTvn16cJ00UIe9U0oR7NpgMfgOKjc/2PkEc7
	auLA==
X-Gm-Message-State: ALyK8tIGk+G6DXA27TuWgtJZTi2npv0CXTMc9IKNhTmYKwgycapLA47iC9O515PaPOCziw==
X-Received: by 10.98.54.198 with SMTP id d189mr29054963pfa.39.1468186057434;
	Sun, 10 Jul 2016 14:27:37 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	186sm4252517pfg.39.2016.07.10.14.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 14:27:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun, 10 Jul 2016 14:27:18 -0700
Message-Id: <cover.1468185892.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 00/15] Fido-next libxml2 sercurity fixes
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
X-List-Received-Date: Sun, 10 Jul 2016 21:27:37 -0000

Please consider these libxml2 fixes for fido-next

The following changes since commit c9f0a99050ec0050f0dbcd55d0cd2ab18848113f:

  build-appliance-image: Update to fido head revision (2016-05-12 13:14:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/fido-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fido-next

Armin Kuster (15):
  libxml2: Security fix for CVE-2016-1762
  libxml2: Security fix for CVE-2016-3705
  libxml2: Security fix for CVE-2016-1834.patch
  libxml2: Security fix for CVE-2016-4483.patch
  libxml2: Security fix for CVE-2016-1840
  libxml2: Security fix for CVE-2016-1838
  libxml2: Security fix for CVE-2016-1839
  libxml2: Security fix for CVE-2016-1836
  libxml2: Security fix for CVE-2016-4449
  libxml2: Security fix for CVE-2016-1837
  libxml2: Security fix for CVE-2016-1835
  libxml2: Security fix for CVE-2016-1833
  libxml2: Security fix for CVE-2016-3627
  libxml2: Security fix for CVE-2016-4447
  libxml2: Security fix for CVE-2016-4448

 .../libxml/libxml2/CVE-2016-1762.patch             |   84 ++
 .../libxml/libxml2/CVE-2016-1833.patch             |  368 +++++++
 .../libxml/libxml2/CVE-2016-1834.patch             |   55 +
 .../libxml/libxml2/CVE-2016-1835.patch             |   95 ++
 .../libxml/libxml2/CVE-2016-1836.patch             |  443 ++++++++
 .../libxml/libxml2/CVE-2016-1837.patch             |  143 +++
 .../libxml/libxml2/CVE-2016-1838.patch             |   96 ++
 .../libxml/libxml2/CVE-2016-1839.patch             |  127 +++
 .../libxml/libxml2/CVE-2016-1840.patch             |   37 +
 .../libxml/libxml2/CVE-2016-3627.patch             |   64 ++
 .../libxml/libxml2/CVE-2016-3705.patch             |   71 ++
 .../libxml/libxml2/CVE-2016-4447.patch             |  208 ++++
 .../libxml/libxml2/CVE-2016-4448_1.patch           | 1067 ++++++++++++++++++++
 .../libxml/libxml2/CVE-2016-4448_2.patch           |  208 ++++
 .../libxml/libxml2/CVE-2016-4449.patch             |   47 +
 .../libxml/libxml2/CVE-2016-4483.patch             |   55 +
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |   18 +
 17 files changed, 3186 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1762.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1833.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1834.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1835.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1836.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1837.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1838.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1839.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1840.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3627.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3705.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4447.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_2.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4449.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4483.patch

-- 
2.3.5


