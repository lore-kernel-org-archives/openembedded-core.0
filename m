Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.6872.1614173874205993391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 05:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IWWaENoZ;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614173874;
  x=1645709874;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5UXfTE3+j7fADZeeWrfIuc9hq9vpOFCtiqaZvgC+Ax8=;
  b=IWWaENoZnMk0WO/54B5fYjrJAGR4PlufaCT8Y5RUWpkH8OayMVeZ0fll
   DMB5c7/lQMdFI46l81xrPH+xsGYQTFG4EKeija8CP216aHJnPD9DxnXFi
   t1QuqzUd3DmDm0O8TI9qScvZKzLuhwjY7Bs0HKNutKQg2eT/3Kq4EyfRJ
   SjWCn9JEBJZ3N0KTDvbVTW+0W6DPiLMPawleYsDxAgoJoilQwg48H2/Ev
   s0ngoR9BSrzNMFrLnsivPRsaUyLs81tcn5wY7E2axe4xwe2lUy7Vxyqbv
   HYbReidm08VoyKAUtcyBT3lqmmtPozSLk+V2boQQmZlHQYYK2UXzoPnGX
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] asciidoc: Switch to using the main branch
Date: Wed, 24 Feb 2021 14:37:44 +0100
Message-ID: <20210224133744.8284-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upstream has renamed the "master" branch to "main".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
index 4d94adec00..bb4248a5e5 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main \
            file://auto-catalogs.patch"
 SRCREV = "8de61a75572b5b8f90c1f87634aa3767472be7a7"
 
