Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBC87705E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:21 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id o11so7625199qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=v/w9kjhENxPAGF5k3zCkRM6F92pVdGnLP9zHnfbksGc=;
	b=AYJ4E6/kmlW6HIpvLRdiEzg6R5ECJpUt8uf6T+oT0KtQfINLed3N0iKdIro/q2YtZ0
	PVxtCxdY3Y8iv0dK7YgzQWSHX00Ur2jR8yn9Ygrc/XrLF8KcdPybLQCaYi60inA7hdaD
	pTE6P77s1jwfIg9rtdpySqrswmO5SK/GrR0yeeHTAb2xlP5zGP/EOoBNGd7cAwr46rJ9
	z2nviirgBVcwDEiyGU5l2Gxnt6A6Pe4n++AAdF7CjAn1LxF/PJ4zQkQGkOsvWm4cGWJM
	4yT3+bomlvZn0TJdggQquNC8WcK//Sj4eWiOscaY+mEaQRZQ3zL9qvnw6RcCxAMAwalv
	UGLw==
X-Gm-Message-State: AG10YOT81EMP2mELpun1hsUjEyf8NeuI61zvTIeSKTMSnujsjh4AnVsO4GrHLsBM67PLag==
X-Received: by 10.140.178.18 with SMTP id y18mr13071044qhy.92.1453590622143;
	Sat, 23 Jan 2016 15:10:22 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:04 -0500
Message-Id: <b3d60406238ad674fe140d551aae678d0b0c6545.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 07/13] python-pyserial: update to 3.0.1
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:22 -0000

---
 meta-python/recipes-devtools/python/python-pyserial.inc   | 15 +++++++--------
 .../{python-pyserial_2.7.bb => python-pyserial_3.0.1.bb}  |  0
 ...{python3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} |  0
 3 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_2.7.bb => python-pyserial_3.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 0fd6747..fb87969 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -1,19 +1,18 @@
 SUMMARY = "Serial Port Support for Python"
 SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c557c64905dac5b725980b9505bf8d7b"
-SRCNAME = "pyserial"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0051a0dc811ee3fdb17a2fd0be44f3ad"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "pyserial"
 
 # FIXME might stop packaging serialwin32 and serialjava files
+SRC_URI[md5sum] = "c8521e49f8852196aac39431e0901703"
+SRC_URI[sha256sum] = "969cb6405d1d87f8960cf9c10f597ae58f85da2fb9769dba96f4aeeaade54656"
+
+inherit pypi
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-stringold \
 "
-
-SRC_URI[md5sum] = "794506184df83ef2290de0d18803dd11"
-SRC_URI[sha256sum] = "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
diff --git a/meta-python/recipes-devtools/python/python-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyserial_2.7.bb
rename to meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyserial_2.7.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb
-- 
1.9.1


