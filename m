Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24503.1794822898844438033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 01:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sdpKWi6D;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4118BC4EFD7
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B96F6023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4684811BC18AB;
	Mon, 16 Nov 2026 10:54:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794822895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HYYf/9PUUBsZ27eo6h2qs0CWF3nulV0xtYWkvrqDatk=;
	b=sdpKWi6D/ZtyPNGWPePuvseIlcGiyy1oPGv5SsA1JJrPlIiznsYa++lpgy76MKjqnY1sTg
	nabMJd+lwEm/EZAoltEmDh4awWPKvS2ZaEyOsSyHJcPa+CBjKOaXhodYSM/uP6AoZJFmhM
	RxQVxxh0Mo6JBF271GGV3mO8WCE4nX00WYRfVntUXzqMCWu5IOsSP9nPFJHiKht2K+/h/L
	uZLqC0lALQ6fuygJwtJMtYYy1EHUo0gSSzjPKfLv+GlLgdCl9FmBYV3SVXBcQPeLbONwhl
	dbtY9cPBeaYZ/Nz7FLOWhqWTk7AU0nd7vybFoMOAkt8xJtI81FOoJm/SuS96CQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 10:54:45 +0100
Subject: [PATCH] python3-sphinx-design: upgrade 0.7.0 -> 0.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sphinx-design-0-8-0-v1-1-d8dcb58e1cfe@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZuktajLq4gF7WAsSjpIE/Hui
 sVZfIvzXyAUmASa7IJAJwuvPkHnGdi59xMhu2QoVGG01gZlm9lHdCQ8eVRYpbmSemNKOyhbQ3p
 ugUaOX7XtfssxLGT3NwX3/QA7aJUJdwAAAA==
X-Change-ID: 20261116-sphinx-design-0-8-0-d7ea667cb0c9
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zCobM/jygDWNNAe1oJS2qRhD9jWb+NJ13FI9q8+njkY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+tLnn1aKwjeGQPUkiCg7QuycWR2/TVTMMMs62
 6GgCL6GjqGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavrS5wAKCRDRgEFAKaOo
 NjoZEACbIjAfSX1cyWSfC8A0IfIU9mzwC4VfVRqqFT4Zx1TqYeGlxH8/Q35MH0UR61UNi26z0Yn
 80fucPOzRtARluIchp5pclTdLMLadhoMMihPLZIVk6xMRPYB94Cdwhwxhq+uTZ03DbFRU2tRBpW
 EKgzq6rZp9UtKvg+5AVdMKjh207d8CJ0dMtgjxM0jVvpCaZzDvYKs5bMfX5Gr90Tpy/rQrZgwcR
 w/VKhxa5Kplv8Sz3JFeQRmiayMix1Ab/+GY52EwNwOyxO9ZW59pJ5es6u53GmI2Ms4w+UMwF5Aw
 +8DP1x3NvqZ4VVmFDabWJVHWQd4G8RyBzdkMLGfI7w461jDBouch8sxTdBwCsQQ0qvxFLt8Cc+H
 2TfGWPbcGJT42+a+R4iuAlKiLXR+xcuF5Z8p2hpeer5wpiQOKXmztilk8C0f7kabqcnTgz1Ft3t
 pZ9baiIA1rZb0Qog8v/BwlDznAurL9sKqy1C/O5cpDCbqP+ga9xH7F8DB68Qi3NzTzpEyaRDj6B
 2PB5isXyARM5bb6hLdQMJdaFbIRcV4/r/FIDDfV4Dr//KjMZt7kEyFI5l/H06e5i6McgkMeYOZl
 A4s7TfSGCQ6ThHuCyGx/cTNyLSoHbjPrHwtgaf5dnu+2O3GWHkW5eQKbbc4Jwwb1wqP8bJp+4Mh
 aNdOmXr7BTDjyLQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250327

Changelog summary:

 New components (accordion, aside, steps, vertical tab sets, and explicit
 card header and footer directives), links that open in a new tab, badge
 tooltips, a plain-CSS build with no Sass, tab selections that persist
 across pages and visits, accessibility fixes, FontAwesome v6 support,
 and Octicons v19.42.0. Sphinx 7.2 or later is now required.

OE-Core provides Sphinx 9.2.0 as of writing so we are compatible.

Full changelog:
https://github.com/executablebooks/sphinx-design/releases/tag/v0.8.0

Tested a yocto-docs build with this new release in the buildtools-docs
tarball, with no issue.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../{python3-sphinx-design_0.7.0.bb => python3-sphinx-design_0.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb b/meta/recipes-devtools/python/python3-sphinx-design_0.8.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-design_0.8.0.bb
index 908ac0846e..920205ae1c 100644
--- a/meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-design_0.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sphinx-design.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=484a29024499c025d11c52f22a6f0bb8"
 
-SRC_URI[sha256sum] = "d2a3f5b19c24b916adb52f97c5f00efab4009ca337812001109084a740ec9b7a"
+SRC_URI[sha256sum] = "57fa4d96378525122947ab6109c6e490190e3119dc10f3e3adf6b71444bf3bb4"
 
 inherit pypi python_flit_core
 

---
base-commit: f32bced7b431f39a956c3e0d42e3c756ab784c49
change-id: 20261116-sphinx-design-0-8-0-d7ea667cb0c9

