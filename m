Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30999.1794845360012783304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IUyjNque;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 69BED1A169C
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40BEC6023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2309E11BC1D59;
	Mon, 16 Nov 2026 17:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kL4XUrFpaWAuCFa90k7rXqJvO0Nl9ZUsmiJUgKsYuQg=;
	b=IUyjNqueytHnN2W3ExAw1L8oca9c6Snfsii7AiOt6jwICHABwQC2XOpznqC4Vn9HevAOyp
	BFt3x5A8fXyE2SGKbJZ/FYaT+VxpajuWzT7tZqUBpvSjWq6E3bEfNrWWhjafF5GWnYqF5Z
	qT56+tMYkb6H0Y/3wXWdkmlFz4wYcAanpkqINWzqeBqKg3sp0FJsyILIRRZzMUpysChgmR
	yyRdFRj5jiB+Jd+kbD9QyMZGzGZ4ZknTReBwHtu2mSwPp3tV+aS/rOFtVKQ284c2PCj1sh
	9xAv8cRxZEW9At2g5JLRoUxBkRZGW1iHyL/dPUBy7/UNYcz9i2GrqHWTaPYbLw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:09 +0100
Subject: [PATCH 11/13] lib/oe/purl: improve docstrings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-11-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=g55l8H44eXAQHJ9PIcT+oB//nMHnSnuSmj7UrSh79AQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqfPe8mDhoJCwRmG8Q/IzlUpz5+ZSy4dxM2s
 67/jfXs2LSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqnwAKCRDRgEFAKaOo
 NqwGD/4y0jjdfYl9y0N4VW0XeXethwlq3jNcoektr1hhbKJ0GZnYhMto7rMPyvjqGdH5gAmyekW
 n5q2V0oXN3kmoVDMok6YorGzv/KfipNMnWP+FqMo0J76dvpJ1SCIE4P9ST2VHRsHkgZBr1tG16L
 BzEbviid9vi6/Kv/oke+o46egLidT9nv0Nq+VOw/9j9zKsvmuBpO533V2UBvoVwD67ZNgnd0j2B
 vMttYPQCfc72j+nYUn9PwvKyhm0T1tfuCqn6SgXGon8WEyfj6u6xEfB5cv/3eg6oFoNHxSyw2Qm
 Hq+jzf4lh0eZV0wtTI50LqIEv/TgSft+mRnzcdHqNWXjSfo8V19+nVEDjQm8bZ1GuosN7bFMFf5
 /5G9JTnLu/jvWwVUy05EU/HUbd+8BTBOS5UxNiEAEtneMbV9ZKpYrqzkQnDreWoAt5v/Gn55Dyh
 Meop/d7gvdflU1AdgtgfHv82s/D6XasIliQJKWIrMQ+VuhSaGvIU/YF+/o1mpEghwHl8HksCFTL
 x1X/A8K2pDjBjgcabO56t+n0wy6P67LkPtnbwXfIi1w4q5/l6SDjL+DWKQIDLMFEnUkCd2BL3hR
 Vh0PWDUYAXRfLg226KYg7xQ6cHGf3ycQNkGcsMtP+OCtnlZCTtjfV3DRa9fBrrBGdpQeTMKrG6c
 tlDoE5MbjlqNyfg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250361

Improve docstrings by detailing the parameters and return values of
functions in this module.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/purl.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/purl.py b/meta/lib/oe/purl.py
index 2f92a23596..ed158d7f81 100644
--- a/meta/lib/oe/purl.py
+++ b/meta/lib/oe/purl.py
@@ -11,16 +11,17 @@ PREFIX = "pkg:yocto"
 
 def quote(s):
     """
-    Returns the percent encoded version of the string, suitable for including
-    in a PURL field
+    Return the percent encoded version of the string ``s``, suitable for inclusion
+    in a PURL field.
     """
     return urllib.parse.quote(s, safe="")
 
 
 def get_base_purl(d):
     """
-    Returns the base PURL for the current recipe (that is, the PURL without any
-    additional qualifiers)
+    Return the base PURL for the current recipe (that is, the PURL without any
+    additional qualifiers), using ``d`` (the :term:`datastore`) to access the recipe's
+    variables.
     """
     layername = d.getVar("FILE_LAYERNAME")
     bpn = d.getVar("BPN")

-- 
2.56.0

