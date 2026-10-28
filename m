Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38086.1793174829608603955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 01:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wfmkobpd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0F95BC4FECB
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 347B760769
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55FCE1032909C;
	Wed, 28 Oct 2026 09:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5rOa2jDvJBuh65T87FXSo7KvvWEawCbZo1zCSp6EHb0=;
	b=wfmkobpdxuD5lAhxh1FWZvpQHAQXMbVB7EvRVztu31hht3vyfZIAmY9iIfS9DadW+hdyJe
	ZF7lCiu4bagnmzuV650ytTyZ3uxfpbpVaJbiS1nh6Jd9cxJyaTlwpaDOKxrfb2Xwyu9uWy
	sEzhDssh49D4eT8989dvdBASXGAdjsEqPHnD+J0o5Zf+zsan0na7Q5hlNxa+oqvRV+eQi/
	vA7nfRrB+nuHZQAZbwUe5/BQTNsRIgFN2X0q+3fZTo76IR86TpRDwtqMW/j5ZPLnw8gTo4
	dflFA+qktRxdWE6NrjOF+0eOeC3IJCqo1p7Mc9KhqKbna33pJkeGipHCVbctvg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Add python3-sphinx-tags recipe to
 buildtools-docs-tarball
Date: Wed, 28 Oct 2026 09:06:58 +0100
Message-Id: <20261028-sphinx-tags-v1-0-65bf95b5f2d8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVph5C4ilhQU8aipIM0EXdXL
 N/i/wuEApNAk10Q6GTh1SeYPAM7934ixWMyoMbKaKyVbDP7qPZ+EmWwQO1MWThbQSq2QI7jd2u
 733IMC9n9XcB9P2HEUr1vAAAA
X-Change-ID: 20261027-sphinx-tags-12320f143fc6
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UPGnCZJokrYkEoZk5P3LOE2SlXVhgSd95c/IiTnjHjk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4a0kf1IZNnm6/BCx0CTYBa+LHf0ruUzHlayxa
 cxgccw6zcGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGtJAAKCRDRgEFAKaOo
 NmakEAC/E84VhCMbcQuGqcN1+p1t4ZlVUoZhv3K5LFHFlxt0wIJNfTOW+eLuwP5GpBjYSKU/OcY
 m4jAS+vfwpry/NKVzgUE3ldNKkjMGfrOBuRd+NTkwe6swxknpNou8pgIiGu09Gj9HuUAFX5ZP8E
 pY2Fe7CncDmqEp06ky6L9eOY8QRihKVzihYxZrelRhHIWV9bzzZqrD6NSRtGd8xIWFm7RB8Z6QS
 nyKim+jfajsOvQHjqDzaWFv5XSqbN/LxyY0TxskxHDNZDtuXPvx4CixlxkRcW323+LiT76PaQFw
 Zzi7wZY95H1pC5x3UdCwq7lUzRfePjKubWNDx2PtkOw05qXKgm1ckooBVA/Q6LDoP9IjguF0xAn
 YZ6sM89K5+ktaoThogCCNxIxZWfSOfdIpTdCcKOuiHHklPK5iifj7X0UPNWArNbKue1flYWhJz+
 Z8x+B7A7McpwjU6OfytY2xFvZppeI8+rxYY8NLLmzXbWPliL3UrGUJNJAE9olUfAPEOlcmHVYC+
 EOrdKvey6Y5kChAEw+YxGoxRvMz2hpdm6u6XJIOsgQGss1DSpp1pVjCosq8rf4KnyGVt0cK0xkJ
 eaxH2nGHbvBj/RICaMLaQx52yjp6AS9zowh7XD8Gx/LDoX7CEkBchH5SnIhb7I+cU5n3gg07++d
 CyCa3fF07WJXKNg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248793

This series adds the python3-sphinx-tags recipe to buildtools tarball
used for building the Yocto Project documentation.

See [1] for the corresponding series implementing documentation tags.

Tested a buildtools-docs-tarball and a documentation build with [1].

[1]: https://lore.kernel.org/r/20261028-tags-v1-0-d5ad01019eae@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      python3-sphinx-design: add recipe
      python3-sphinx-tags: add recipe
      buildtools-docs-tarball: add nativesdk-python3-sphinx-tags

 meta/conf/distro/include/maintainers.inc                    |  2 ++
 meta/recipes-core/meta/buildtools-docs-tarball.bb           |  1 +
 meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb | 12 ++++++++++++
 meta/recipes-devtools/python/python3-sphinx-tags_0.4.bb     | 12 ++++++++++++
 4 files changed, 27 insertions(+)
---
base-commit: fa83da7da277a641c3a997d3da26041fa46d48ab
change-id: 20261027-sphinx-tags-12320f143fc6

