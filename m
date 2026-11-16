Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31638.1794845358417016109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gTHU4EO7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C1EA71A169E
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9897C6023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5A5D11BC146D;
	Mon, 16 Nov 2026 17:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845356; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2P2RJ31q0ldhDBzgtw1+Nk/OGYcOeta3DLpnBu7Q3T8=;
	b=gTHU4EO70CfwKxqAZVZSlGTYbCdDpaUhZhATfQlljYaEwvX6CWvmnABDmzW79cN7I8S+Tm
	wM/1t5i0YrwxQwwC79snGMNPoa3vlu2J9ynuHLTlkdgTRDIo9hbCHkwIEKHR5lQkQx9CAu
	r48WNUgDjmK7vSz7/zSkfr+rMWicYVA5T5dUYNcHe5ufDV3gWB/lJlj8/3DpX4R7fFjCp7
	EsD2a50EISyEsLoak5mpVsvuB6fGMHOQ+kj6U9sK0yWYboskNtVY1agG0UOMGNRGSkEJei
	TwXa6ENq64z8CW2JkO8X+FnR1kq6P/SEf0I/MxcyECtZW3mbnN36JXnIOA9YAg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:07 +0100
Subject: [PATCH 09/13] lib/oe/lsb: improve docstrings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-9-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9bizxj7JyfSyb5wsBal2KqGjeqHll3MR3ML1Il9E94E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqfLK57+K34XL8AlhwnzJES0jVjGHZUi064A
 IMtxhhomqqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqnwAKCRDRgEFAKaOo
 NqZjD/4gAOjq1pvSXgonio3EQizhSI3tk55hLwDSmePN2928+a5LankqCcmcuAcEPrgnW3L9k8V
 8VbHNQzvFaY7vvDehVPLCIhnuR2EHnHn2TGSbJ6avksNmmZFJHfzfB+h6WMykTMuyKXujXbOJdB
 i0vjidMv00agpI24fWBOAiSA/Qi304S02ascNyAShNVlrARXSPQ/ALv94DCAa41GMXezYT8yPd2
 yol1275RlxPks4e5jZTCn+GyedkwSPG8ig9PgHXpbLsXpmkuLTcv8Dd5YpFYOwerBx268ZurvOz
 KioKXxjvYUGPTuytxIzMvd7dAj/+Ui7qKIa/aZ+j59L9e2uFgJNlhRr0voMAPk8xvUtClbuylgJ
 LkufWuRtYflrAeAfu2DZECVmo1NbYWNUBxqOKJqV8viGBrwOhZu+ySiakpmIBXLudiGsnBZT5vP
 MT/I550OpKVPH1qp9nm0AGXd5xXxtAF6iMNnFOZqKtSWICpYQkNZ7b4K37EC8nlG7q9hD0lE2gH
 svg6PST5+wlrSvmR+iLK9w7PobMi8TOS3bbDF6jxa8fBNQ1u5gNhU+1gJsi7SIO4I5whQ5UBWPX
 Dn3nMFimbzg6k9LaS4re+7V16KfvfmJ5zQ8YjJZUxyvpr+3C9jR2I2fXPeDj+1JMYDGVrOzRfhR
 Yp9Ia3gZAwlJLkA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250359

Improve docstrings by detailing the parameters and return values of
functions in this module.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/lsb.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 1283cefaaf..8f43301484 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -7,7 +7,13 @@
 import os
 
 def get_os_release():
-    """Get all key-value pairs from /etc/os-release as a dict"""
+    """
+    Get all key-value pairs from the :term:`Build Host`'s ``/etc/os-release``
+    as a dictionary.
+
+    Return a Python dictionary mapping keys from ``/etc/os-release`` to their
+    values.
+    """
 
     data = {}
     if os.path.exists('/etc/os-release'):
@@ -21,8 +27,14 @@ def get_os_release():
     return data
 
 def distro_identifier(d=None):
-    """Return a distro identifier string based upon /etc/os-release
-       with optional adjustment via a hook"""
+    """
+    Return a distro identifier string based upon the :term:`Build Host`'s /etc/os-release
+    with optional adjustment via a hook defined by ``LSB_DISTRO_ADJUST``.
+    See the value of :term:`SANITY_TESTED_DISTROS` for a list of valid distro identifiers.
+
+    Can optionally take ``d`` (the :term:`datastore`) to read the value of
+    ``LSB_DISTRO_ADJUST``.
+    """
 
     import re
 

-- 
2.56.0

