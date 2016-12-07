Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD0C60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 16:50:44 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g23so177095616wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4yd2Rrr57eL2wwxKW2j1bub5ryF+yy0g0WGJiviA5Ho=;
	b=jYMsrV6dyXKokW294hvjpKeMikgKWSLBwiQ55lXB4Z5aaxV+VwzOQCG0f6M5exafU1
	BJ0yIMY/yWzjxTldiLFqss5LZIIRVK8tcL5MsWflgDjjG7Ua8KZZkuV9hR9HprDMZ9bF
	GDft8HWYpeBbZQZ41iV0jFnNfM7lDpFI2cKA7hqji70eFE41oYyFMvYSMRaYKPFVNIaU
	VAaquvx/qGsaVYbyrrYfC/UGuMK/uxZtTPGNXQ+gbEO2nJxJiSaK6PtQ4+4vHav9xSLZ
	0rJ06U8x9Y6iHa7q17FBr9eZ8Rco8sFTo1Ii5p13OyElFqFFSYlWJs1F7i/t/jVG1DwE
	wMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4yd2Rrr57eL2wwxKW2j1bub5ryF+yy0g0WGJiviA5Ho=;
	b=Q0l0dzucoc4u3BQJTBxoTnIK0p2H8T8FECJ0B3SdCZWyjZOgJKhiNTlvwQZ5guI7Yz
	fv1xrob2SnLWWr9B/6YqKIgHFhvk0kn83VSM5bA9jEEfJU9Us0aPd/8QP2yT8W4hT+70
	jhpmlLresPrH7XBnHbJZEpTSQA/QosJpEjmkeV/6Di4fdjxu03RrgZIYBXO7sZwXAfe0
	HLsLSWUVkyCC+vm4JLvHGVDVRF+U3I+9tLWdRk6FwMFv/aS5ZqpE2HcM2p/nY75C1oHO
	5n6vCERD1SAKP7jj3hDtp+s+jzhMW2lAk55EpzGVLeYm9uNwW+oh2GlWjtl3iRBRMdat
	9gRw==
X-Gm-Message-State: AKaTC00XqdPolX1XesfRRchUrO4Cm8dESdfl7OLmqQrWQ3TK0Erh9bQtfmldUqhrIdEn1Ncr
X-Received: by 10.28.232.16 with SMTP id f16mr3411876wmh.103.1481129444839;
	Wed, 07 Dec 2016 08:50:44 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	138sm10535402wms.20.2016.12.07.08.50.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Dec 2016 08:50:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 16:50:37 +0000
Message-Id: <1481129438-28306-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1481129438-28306-1-git-send-email-ross.burton@intel.com>
References: <1481129438-28306-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] tiff: set CVE_PRODUCT
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
X-List-Received-Date: Wed, 07 Dec 2016 16:50:44 -0000

This is 'libtiff' in NVD.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 5fccde9..963d4b3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -2,6 +2,8 @@ SUMMARY = "Provides support for the Tag Image File Format (TIFF)"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 
+CVE_PRODUCT = "libtiff"
+
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
            file://CVE-2015-8665_8683.patch \
-- 
2.8.1


