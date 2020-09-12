Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.24005.1599937650005321963
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 12:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=s64zp26B;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id D9C0F601ED;
	Sat, 12 Sep 2020 21:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1599937647;
	bh=c/qMpXv1fCVdI+7gWBWoQFEfyv5Qvt+1qkVgMHLRdyU=;
	h=From:To:Cc:Subject:Date:From;
	b=s64zp26B4Yh4TKuYRzF2bGsgyijcbKHUhfH0ZLVYsHuzskniJ3+bjJlQcKhO33BtW
	 HbjHa/Q7QnceVTRDuC/JtRfnumuI4Xi5wJNFODJQWtuRpBDogUFqvEWDyaRKEjW7MS
	 BLPZk+QvBeCKHawu18lhSj4qOZ2FTtvmR0iMXfBdgJmBGlATxbO9c76wxNOZgHveUa
	 uKSIQXAX2q3RDfikKhFtu9RbjdSdnemLXrmAQrp6o84ZXRSWO27DFk7x7Bx2ursOIL
	 X1Srp/vBBx+h+yW6ZPqC6HcZVfxgazpi3PcAqC6I+IxL0Vkq2NbactFxMaNY/6FVLS
	 fONgM3qQ+h/Yg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] diffoscope: upgrade 158 -> 160
Date: Sat, 12 Sep 2020 21:07:00 +0200
Message-Id: <1599937620-13840-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

Version 159:

* Show "ordering differences only" in strings(1) output.
  (Closes: reproducible-builds/diffoscope#216)
* Don't alias output from "os.path.splitext" to variables that we do not end
  up using.
* Don't raise exceptions when cleaning up after a guestfs cleanup failure.
* Make "Command" subclass a new generic Operation class.

Version 160:

* Check that pgpdump is actually installed before attempting to run it.
  Thanks to Gianfranco Costamagna (locutusofborg). (Closes: #969753)
* Add some documentation for the EXTERNAL_TOOLS dictionary.
* Ensure we check FALLBACK_FILE_EXTENSION_SUFFIX, otherwise we run pgpdump
  against all files that are recognised by file(1) as "data".

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/diffoscope/{diffoscope_158.bb => diffoscope_160.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_158.bb => diffoscope_160.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_158.bb b/meta/recipes-support/diffoscope/diffoscope_160.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_158.bb
rename to meta/recipes-support/diffoscope/diffoscope_160.bb
index 9b00e22..2c3da3b 100644
--- a/meta/recipes-support/diffoscope/diffoscope_158.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_160.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "54e6d074a783c742b18b18a63328ac6821f4bedbb3d721a5d6af6ccb5d4fe6b2"
+SRC_URI[sha256sum] = "f164b5e74cc11f6238ad8d62c92d3a819fa4c8b618683fc0533e04f21acae6b2"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.7.4

