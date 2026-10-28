Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37927.1793174830932526393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 01:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=slCIN8gG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EFCE1C4FECE
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:08:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2291D60769
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D61E103290AD;
	Wed, 28 Oct 2026 09:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/3envSYdI7sk8fGleOnScik7kNBcv3XNjB8twqzc56o=;
	b=slCIN8gGak9TMaeVbieyvLV2e65LMIVSgy5DVWerQ86fEOJQBeAEvSZApgpYovW5ka/5KX
	jGiNZHozIb5F3gbpqy0yfmVgRGWW7DK+n/4J5GbrljIchxoiX7DicPgH5d5ESFrGP3QZM1
	qbYvEFadynNDLAD+6TlAFwAY0ba6fj7fyl/vwg6J+t2bG/SAgasd1ZannLqRI5H8FiS0s4
	IBU4+YG61wHSXycp9MHN5V5v3odD8GdYiAc6L/YDfelPIahEXDt+VPkgIT+I1RI+ZC3bsi
	QntHfCEOzK7kivv9Zqpxe5L0iEs9j+MSqzynxjCPD9UP9wxD6faEtQTjGIZ/Xw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:07:01 +0100
Subject: [PATCH 3/3] buildtools-docs-tarball: add
 nativesdk-python3-sphinx-tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-sphinx-tags-v1-3-65bf95b5f2d8@bootlin.com>
References: <20261028-sphinx-tags-v1-0-65bf95b5f2d8@bootlin.com>
In-Reply-To: <20261028-sphinx-tags-v1-0-65bf95b5f2d8@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HtKcmw2UCR2bVy2CBkuFgXJMpc6Uctpi1Mg9mWIOlBo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4a0kChtNbkPX2M6gE3KSQmhsxK3o0IYXN/z7o
 AKi+oOHI2aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGtJAAKCRDRgEFAKaOo
 Nt00D/9p6eokn+DR6hRIySuyiNXVn8NphuYU7PQRHSx7ZtTkXv3YHoL6PEh+loAL0wwtwVclE+E
 Y00txgO1+BW99NfMkUzQ5FEJV0DQMgfkCP8BGSc5taRrimwQjv0FSHdoo40PD5/55ftk0XcIJYl
 I3QIEqGpLrg8BL8MR8gCOTm2DNGQTqAENdZhdZ67JY14pBVG6OtTWrnWAFWP3oqi1kkVtolpKD2
 Co2ov6O3nqEMXriTqti/wkzpPLbOfTgUj0ruk20khtDlgl7qD5uYC0WxpefeVhHqBD11BirH/cz
 U4DgKPKpLKTcwBpQF9n07kfr530+/fe7yx8Mk6drpK8eUC5bY6dWjLXRxn47oKy00NUiXKgg43l
 tItYLffPJedO7plQe9hrvoApKpk/V0QWZXjV2EqCObFuJcxlKGxaww0uieglXbnde/gK3gHW9O6
 c8YeVSGj4Tcycoge8gYBLueXS/31cA5HW4H6wXGQhskY7HmZASfOd3MSC6a1YjvXN2UcE0AyJOV
 GEpeD2usSfDQzB+X1C3bb52B1Xt2RamRoorTZPdow7I3hW+2QK6sDGef2AH9/EAiHqUO9x+kZiU
 p5cu4XtBRNSJkPJNrP49wiU5YMRr6skL1e7XAb129uVA69/zwJXpZEtGjMlvDwPgpFWa/SeN33f
 zVogjW/MaKK35Xg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248796

This addition will be used for building the Yocto Project documentation
with the addition of tags for categorizing documents.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/recipes-core/meta/buildtools-docs-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
index 3fc28fad93..746c72f149 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -10,6 +10,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-python3-sphinx-argparse \
     nativesdk-python3-sphinx-copybutton \
     nativesdk-python3-sphinx-rtd-theme \
+    nativesdk-python3-sphinx-tags \
     nativesdk-python3-sphinxcontrib-svg2pdfconverter \
     nativesdk-python3-pyyaml \
     nativesdk-rsvg \

-- 
2.55.0

