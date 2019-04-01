Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id CBBD57D1DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:24:41 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id d18so7479795lfn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ufS5NM5W1rgcFoAGLvmH4Xt6o0U+MSOTUXBypi82Wu4=;
	b=yY+H2RighF07+A4jauEPwbvAuKbC/zlaA5cKtzGRuzkbZBrR0H3KiYkjFV1nPOj3bQ
	Zow8kQgNBicTwB4Gq4qE6rdWvTUaBjCsJnpnKlas6CrirCkudg7aAUf6hjPcX1+ciJi8
	jf79l7ZSzF4VHl2GLZz0K4uAdiWlOK97oXxTzFOKVhq6hwWW4DuAOC6RsE1rNUXMasK+
	I4ygLSyXvGGOX5hUJ2GsKu6TUlhkNCgrA0rOvqdMdynX50l1aIFcEyCHp2faAHwLkuPi
	tV/p1DqJHodnQGUtM/gvY8YpbIZzoTbgZHfES4lSKE5br67NmZUEp3WxlNVxDJS8uhlc
	6WAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ufS5NM5W1rgcFoAGLvmH4Xt6o0U+MSOTUXBypi82Wu4=;
	b=jFm6fVm5xeasyTIbWcPvCW83qOSyakegd9jkNQzC2nbKb/Tm/E8w2RULX2gd7YrTLs
	kB6juxm7AJJjFsoNrVwokjHPOOtS6SsrGePaxzCYhk1opih9jeaepu//b1UnMWDSz/zx
	KCRxnI366AYOJ08Nwk0B5jEGY7DwQ82lr6BU+JhA+F5rywEcuvDsp5zOh95DludJeINT
	fUZ1iPBZRS6njl5EG7fbTBYKOWDnrpDwKfFavLAMVuQp56yZ3qbw0VTbmVZ3dyFzQl7J
	0LTid1Iib3vVy8PyfCnCnE1Qhu5zC2JEVxogYB7gdfYULKw9qMQwzIb7TIoZjZv0//m2
	CY4A==
X-Gm-Message-State: APjAAAUqq5UEfsqPHfLa4+g62uovaWStbEIeSolqhOWM2vfGBZpBaTVu
	6wbqaWHm+Lf+da1nYRS3XTbStj5f2J8=
X-Google-Smtp-Source: APXvYqyMb5+fG12nL2nfjAj1cV98aoQxHsXthLB1Eoh+njWLcWI2/TS8uwKQc+faHw2EJbIt75/yVw==
X-Received: by 2002:ac2:5966:: with SMTP id h6mr21675136lfp.86.1554157482082; 
	Mon, 01 Apr 2019 15:24:42 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f25sm1636338lfk.69.2019.04.01.15.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 15:24:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:24:38 +0200
Message-Id: <20190401222438.26872-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libcomps: update to 0.1.11
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
X-List-Received-Date: Mon, 01 Apr 2019 22:24:42 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libcomps/{libcomps_git.bb => libcomps_0.1.11.bb}          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.11.bb} (92%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
similarity index 92%
rename from meta/recipes-devtools/libcomps/libcomps_git.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
index ff6820851f..cf6f46484d 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
@@ -9,8 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.10"
-SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
+SRCREV = "d868a79b76fb980d1371c28124ae07f00d2b63a9"
 
 S = "${WORKDIR}/git"
 
@@ -22,4 +21,3 @@ EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIR
 OECMAKE_SOURCEPATH = "${S}/libcomps"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.17.1


