Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.3412.1587805603374092905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 02:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Wokx1J6E;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=849; q=dns/txt; s=axis-central1;
  t=1587805603; x=1619341603;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rLotO9v+/fDXEP16E4mQpRG7oX1q2r8NVji0O7YTFxw=;
  b=Wokx1J6EheKrjr4UrnVLlQEzsl9GDF+f35Hmk/RQTJ/FD7i6kzlP5PvC
   R8v5tFEk3dUwftyb5JhfLcxHTXMqXmMR+RmtWwicCNdESh/aNzJRXOGVz
   PORkuQhURZWdZmg6tEEY9ACgcws+v0tcxk90HywumATgBA48jTJIcsgOV
   +6UpV01UtR4paLJhTr0EnJg07z7ienuX/p5b9AS5PzPDcRJ9kAs75h9nA
   4hpWsmM960PtJLZodUTgQ45RM0o71XXPtqFTrLECnmVrAEy3EoYDzA9Pb
   IgUd8aGb9t6EfbTgNeqg6hdyOXbcMRCVvrZ52D/HYI46AJ7N63YzsY5gy
   g==;
IronPort-SDR: FV01qocfUWk0PnvB/3SraB/vkXfBiroehFeprjI4HbShzsG+1nR7jydpbwRaM6vR34rkBRsCPh
 O8ZO9S/uTq8pUXkhoqwGEZy6J5l6jCSSE/2R1C/dnnYOy6DTkzTWhxsuB4/umBACK9SY68IJ/A
 wV0uYO+HuiaEomsZUciCaPuN3HaTl11IvWNrUsJA2ShwXxhWVOYxjEuseNe0mS27S+VV0WzJNO
 wqk4pCu29iVLgjo7bQ67N6lbtxRn01uiqJM4jFVj9XFM/0h19U0hqjerpUK/vdb6WTm/VCgKro
 hFs=
X-IronPort-AV: E=Sophos;i="5.73,315,1583190000"; 
   d="scan'208";a="8080503"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] busybox: Correct the name of the bzip2 license
Date: Sat, 25 Apr 2020 11:06:36 +0200
Message-ID: <20200425090636.4577-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The common bzip2 license was renamed from "bzip2" to "bzip2-1.0.6" in
commit 669600ef to match the official SPDX identifier.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 344e891f7a..6cfdcd7344 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -7,7 +7,7 @@ DEPENDS += "kern-tools-native virtual/crypt"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2"
+LICENSE = "GPLv2 & bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
 
 SECTION = "base"
-- 
2.21.1

