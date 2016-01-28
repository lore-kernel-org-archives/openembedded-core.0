Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4570F77121
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 20:55:50 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id n128so29143949pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=A5d7vYhwqNj7HvLlzL8T95po1/zvWUnqVZqxLwVZ33g=;
	b=ODiKlfwtqgQVrmlBhMUUezqewrOIkjFzlaqt0fidaceImES4nIDn4TpyP0FkaFawOe
	0e4qXDfrDLaxE59TO7/SG4Xe9GbxBa3VDu8YT1AkcKoOmwVvmGX/Yox91BHf2yQ7b4R5
	AHeKX8OUvBvPiJj3p8qzoWoI2RF2WA48aVISF0JFfXmwGx0j872J+t0cMtQiEChkNpQC
	t+8dUAE/ErnLrvaTG+uT5+JXAdRIw5Wkc1Dmob4Wo4w2n+VPxZnmKtSRrWd4Q7qS5ZE7
	qeOa0I0C8nAf4MwVBbtXDgyXBcAJWi53qQQVQc+9h1Hrx2O4lYIbclCPlItsTdnutJlm
	emrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A5d7vYhwqNj7HvLlzL8T95po1/zvWUnqVZqxLwVZ33g=;
	b=PVkszKh8/nb7ykrfr9mRGPDrxtro92nrxQEl+dodFqN9RtJJd8/2cMfO4f4WSVybGk
	o48t0J7Rg7q87THnpeQFvvH1HNPHi61auhP+LOzAJplo37febn/jsi4fwEoCuFqrVwv3
	8+dyy1KxcxLthNHKpdLSY4H5rZpfDRSS0G8+WlQncwG8xEwm4GEUby9g3mL4qeGBp0bV
	RC6Yw4z88AAbv86uG8jy6L+1G2pi9JobJu7cPf5aFv7F3Itx1PvT/2u+xnsA6j6WcqcM
	r1kt2VQjFFFotn/5IIj3I9ZXwCXKBPx2lgktf7z8Fs0KoKZuUh+lTeaUhFXxLXF9GhHt
	jkkA==
X-Gm-Message-State: AG10YOS7XUh7JDmps+5hjBDuKqQrf450/CyM6NKn7//dQG43heazn3xs74YpMrce3bsskQ==
X-Received: by 10.98.66.212 with SMTP id h81mr4019877pfd.89.1454014551465;
	Thu, 28 Jan 2016 12:55:51 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	c90sm18494462pfd.31.2016.01.28.12.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 12:55:50 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2016 12:55:45 -0800
Message-Id: <1454014545-27186-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssl: update 1.0.2e -> 1.0.2f ( CVE-2016-0701 CVE-2015-3197 )
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
X-List-Received-Date: Thu, 28 Jan 2016 20:55:53 -0000

Major changes between OpenSSL 1.0.2e and OpenSSL 1.0.2f [28 Jan 2016]

  o DH small subgroups (CVE-2016-0701)
  o SSLv2 doesn't block disabled ciphers (CVE-2015-3197)

Updated LICENSE hash due to change in copyright year.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../openssl/{openssl_1.0.2e.bb => openssl_1.0.2f.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2e.bb => openssl_1.0.2f.bb} (91%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2f.bb
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2f.bb
index d2a265a..fbc78e1 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2f.bb
@@ -6,7 +6,7 @@ DEPENDS += "cryptodev-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
 
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
@@ -40,8 +40,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://configure-musl-target.patch \
            "
 
-SRC_URI[md5sum] = "5262bfa25b60ed9de9f28d5d52d77fc5"
-SRC_URI[sha256sum] = "e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff"
+SRC_URI[md5sum] = "b3bf73f507172be9292ea2a8c28b659d"
+SRC_URI[sha256sum] = "932b4ee4def2b434f85435d9e3e19ca8ba99ce9a065a61524b429a9d5e9b2e9c"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-- 
1.9.1


