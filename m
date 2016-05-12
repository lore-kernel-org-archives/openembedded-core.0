Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D6F5160721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 19:21:07 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v200so41103398wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=WZaD15wFLmrziAgLg/nPrDYjrIClQxZm9Qxf+SIJ4TE=;
	b=ZhjUZC0yVG3sELu8dZA6eOmiB3FvtV4FL6lPrB0oUs0/9J8lrOlBOuL+2IhlMlf46s
	2qHrp82nQdyx/sC1xBtkzXdhpTI8d4ndYJ198kr5tpgfSduFGAKJCG8A6G1a8Ojx1vn5
	pQyh4FXVaA0S5uAf13SG4buReU0SAqbPzKrDMY4CURUxPjs5fbrxMxzruqpMr1mOs2rm
	Q1m5LGcBTIxt0lur7/MhyE7fJPJ3f7jGpUnTIuQdCrzzBUi+bZcGam8F2FuyZEzDgzFq
	g+EniPINCzWxtXlO4aIvPIOD+UECm0vPcqpibVrBV7Xk00o4Zh5lirsjzyOcGEzxJXhA
	mt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WZaD15wFLmrziAgLg/nPrDYjrIClQxZm9Qxf+SIJ4TE=;
	b=jUe/unzzZdExmfVhBIzS1a16/NvRWyl+Lm6cbjT5L3a2ud24YQQ9ipNoGfznm5X9Lg
	945XGP/n4NOuNI/o966QLOpRhCnnFsj+6AZfqTee20nigfFHe2b8sIQAYsYMzyI/QSAS
	zJhydjj9eDZyzeedW1VOz1V6ZX1uxj7xRB4Eex2uyNdCxtcsPbRt5ffhg7IkgGIm7DNI
	XM+H7+fv6/NskAdlx20B4Z0/9VozW5X8C+IlOxU3GYI/8pYT6Ntf7zQM78fBmCRfx0hG
	zPVIX81PNRKgw2BT+YP3hJYZFGMCRp6NApIdMG7twSnt4b8TyWcuN7f7UafF5XCVNLZv
	Md6A==
X-Gm-Message-State: AOPr4FXR5Vfg6/627e2Eq/OgvRgLcE3gNxtaL8v35EH+CgzqoOI21KREKEFCoBHYHtV6XUWP
X-Received: by 10.194.72.103 with SMTP id c7mr12433732wjv.65.1463080867898;
	Thu, 12 May 2016 12:21:07 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	az2sm14879502wjc.6.2016.05.12.12.21.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 May 2016 12:21:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 20:21:05 +0100
Message-Id: <1463080865-26480-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] cmake: enable verbose builds
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
X-List-Received-Date: Thu, 12 May 2016 19:21:08 -0000

To help debugging build problems pass VERBOSE=1 to make so that the makefiles
print their commands, just like we do with autotools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 02f313a..e788310 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -126,7 +126,7 @@ cmake_do_configure() {
 
 cmake_do_compile()  {
 	cd ${B}
-	base_do_compile
+	base_do_compile VERBOSE=1
 }
 
 cmake_do_install() {
-- 
2.8.0.rc3


