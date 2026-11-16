Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30995.1794845356605390303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OOY3oop6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EBD691A16A3
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCB996023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E17DF11BC0317;
	Mon, 16 Nov 2026 17:09:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5eqxINrBEUOe71bmf86eapWyGqhkQBY/vOQ6q9B4P1g=;
	b=OOY3oop6a9d3pk9rxf+0i4qmG/SpZip67fu9i8+6loJOthfPEcFfRoCXV7h31IGMBHV4Cf
	BYNzJC5dWZFKkKlIxxWrDlq6LtOQYmTRRiu4HASWbnEKx6totUf1NNdeGkPE+clUOT2fY5
	0SotLh1dotObkNAjetX6p1cXFAg/kZIGHNm3edXfX0STCCZ+e5P0njEJsez892hOPnNDzC
	CyzzoOW2UPZ0XgLWg6Fi9JHMAb+I1oSbVJEDSTzi2Z1lK8Lk/uPys8F5LhTB/2LnBQPU1l
	14zBS8mvnk+7yuusOu48TlthR0pyzoKxBsOLXUYthSF6H2ufqz0L6M4n7JWzGQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:04 +0100
Subject: [PATCH 06/13] lib/oe/data: improve docstring for typed_value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-6-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mGk+jWHlWPMXrvba/NZcs0/5NVDOS/m3IVz+VO5iiGk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqeG7x7YxhiqT1Rdt8sAmxi79Dj8fLBQIKZq
 +VxfQ/6pd+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqngAKCRDRgEFAKaOo
 NlbTD/4kjI+7QoDZPj261qP5JrzUEYL9A33lAPLeYU54j2oWywNWtGOMnQj18D7V+ela9gqvlJv
 3ijA2rIhcbJZjFe+RDXB5hjrFohr8/pIJc3+K3Dr5O4dKTk9tCe2IudM9RVlpgzLPiTUpbO8AYz
 7gOrCD1dogMYNLTCJQIHlRxotal7zOgfKhAC2JAOL3t4aRF7hoi5GzB6QLWprEJCLTaNzGV5MTn
 nqvbnCqedn5JQr1wtp3FwCUl4pqZHHFqCB2u6ve1js2sA5hyVUOXje4KbsVA8z/GxgmVCizFq7K
 L7YckU5/gw3tienfKxk8NkBHJP7Xhnyrtb9ZEQe0b/0qzMJX8TS90kW+7+Lxppase02EJzj0ypy
 fnFtHEElARayMQQDIlIchJxvaJw+dONktVC0PYAg6kAQHtKYXjkFoTv3lsgkwsOQPuwvAB0f1Hg
 uABHyT69FR/fqCTVjqN/WWDtF/WPlimt3ZdlIa658aUH9huIhv/h8vN/X0uJD2fvJqkhxxWNFtp
 cfFLEV61zh1j5RvmZNYpnsLJETNShdQzUWNezJUSGRf4UUMmSL2ZuJMcWeGWXOOro4wTGYq5h/n
 XapuooQBc9Ec3E8WIdgcsd72FndgYoMj4HHAnqs5f8sL6sZ9t4c1rw9a6qAtZv6YxwycPb0w6P9
 o9KuaJ9uFMOSpzg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250355

Improve the docstring of oe.data.typed_value() with an example and
details about its parameters.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/data.py | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 37121cfad2..e9ca87dc16 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -8,8 +8,32 @@ import json
 import oe.maketype
 
 def typed_value(key, d):
-    """Construct a value for the specified metadata variable, using its flags
-    to determine the type and parameters for construction."""
+    """
+    Construct a value for the specified metadata variable, using its flags
+    to determine the type and parameters for construction.
+
+    For example, consider the following definition for ``FOO``::
+
+        FOO = "\\
+            /path/to/one \\
+            /path/to/two \\
+            /path/to/three \\
+        "
+        FOO[type] = "list"
+
+    Then this value can be iterated as follows:
+
+    .. code-block:: python
+
+       for line in oe.data.typed_value("FOO", d):
+           # ...
+
+    Take ``key`` as the variable name and return the object, for which the
+    type depends on the ``type`` variable flag of the variable.
+
+    See :py:mod:`oe.types` for more information on OpenEmbedded types.
+    """
+
     var_type = d.getVarFlag(key, 'type')
     flags = d.getVarFlags(key)
     if flags is not None:

-- 
2.56.0

