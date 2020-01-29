Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id F1FD6605C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:30:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id cy15so3831669edb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DcAkxIFJLH6sziLDyitWWxs4kozo9RaBPO5u6K2FvzI=;
	b=u6HFSixRCfAgWaD/SuHRecFuvkjOv9neT6/V6StDEtinNh26suLguf5JHfyDZcOQSf
	wAw3747tFnSDm5UukHPkwmsZoW2D7Xl6VawdIyn7vGOxT+Xm2OUM3tlsnKXRe9fdsHMl
	ccObo5MtSzuv2mGaOo1yFtWOlsj2TKlUw9cLGvsYSUVXJrV5KPSO0WfacfOMshTlSa0B
	wJdLIWsJfjgYNp0I6XOvsKqlPc1DxSKlqeCrWBw9L2P+SrAl/idakVLnJRI6/eo7m2HV
	DIptTBGNFbsOlsYWp/eLNTR4dPiFL48JIVOhcgm1GkGx5OOqQmayV+stQ/2kcsFOgQj9
	8mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DcAkxIFJLH6sziLDyitWWxs4kozo9RaBPO5u6K2FvzI=;
	b=mwb0zPYutJxrobirFdAisHoFLSI+OpafHp/eF2T5vUOIYgnsVGsGeGH79hzekgBrk2
	zXkF++IwatZ26RzFu1S86ayQxrLBFruxC6Wf/5/juHkXAuR0Z2RHoGr7dN7r8bgnudI3
	ww2yk8RwGfMdLUwLInFopPiZohLvIyDXsTjI9iL2NnqCTWdq63FsPb32rrejgZCIxtG4
	n+RzY6qbgvX7kYPLb8iNyTMix7npYgIpZqvZLJvyHLG5XSvqepFALXIkK9G72v5uDODK
	cHJjYXei1moOdMwvlcsJ63q/MMeGsS+2EaIcISaXLfoRQbNjNzyg0pS/jSuM7w5Vnf0h
	SGqQ==
X-Gm-Message-State: APjAAAX19WyP5+TGc0WQWko6QHnSUdU6+tr659SHU1tb+laeAlnqmQqo
	GWuhotsdIFF7UAaHQnCkNoWW9cNO
X-Google-Smtp-Source: APXvYqzZNykifTXxhSavLA2wWgIRfLnTHs4Lrf01Dp5LrGaWQJR02/4tJ5bsASPDZ+GRIHaCMKu5RA==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr32694844wrm.13.1580288903453; 
	Wed, 29 Jan 2020 01:08:23 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:35 +0100
Message-Id: <20200129090738.1398-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/24] python3-six: upgrade 1.13.0 -> 1.14.0
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
X-List-Received-Date: Thu, 30 Jan 2020 13:30:45 -0000
Content-Transfer-Encoding: 8bit

License-update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-six.inc                 | 6 +++---
 .../python/{python3-six_1.13.0.bb => python3-six_1.14.0.bb} | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-six_1.13.0.bb => python3-six_1.14.0.bb} (97%)

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index c386090b4b0..bbbddbec50a 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -2,10 +2,10 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://pypi.python.org/pypi/six/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f82eb3a1a7fade60bda5980935084b62"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d"
 
-SRC_URI[md5sum] = "e92c23c882c7d5564ce5773fe31b2771"
-SRC_URI[sha256sum] = "30f610279e8b2578cab6db20741130331735c781b56053c59c4076da27f06b66"
+SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
+SRC_URI[sha256sum] = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-six_1.13.0.bb b/meta/recipes-devtools/python/python3-six_1.14.0.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-six_1.13.0.bb
rename to meta/recipes-devtools/python/python3-six_1.14.0.bb
index 8795313bec6..99e6629b2f5 100644
--- a/meta/recipes-devtools/python/python3-six_1.13.0.bb
+++ b/meta/recipes-devtools/python/python3-six_1.14.0.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-six.inc
+
-- 
2.25.0


