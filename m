Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5907.1792566764333993931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MyoTb7r6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 62A9A4E41296
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 311EE606E3
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71C6E10328E21;
	Wed, 21 Oct 2026 09:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792566761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GIPcIPA1tjq9Naa/5v9Ofb/jl65lTuhUcTex3NsT3Ek=;
	b=MyoTb7r6bLyU/0855FimIdCxRZ+T8ovjtkWJM+Nm3XMu0UrDIIWxEkZaea94PuiFyDv0Cy
	wyNuiWnAUSe1O1cYOCIJTKICNFLOswl04NUCSKdg2fJ/tk0NNG1YgYp5+Ndb/3YePelSbv
	wEvGM+3MQHEnblITV5gYHzrV7bloluSRCb29Asyo/1ovrmg3PcunBonaGCpNgASQO4tktJ
	hI9e1c5wW034eruapPMgW6ARX8eyWQ5sJwn9lR3nLfdy2iS2yajBt/3p8gsOShOrzTNNQs
	Waj9IjbZExn51JkmSVpxdMgLrQlEDLUDlH1nhmV9KnI+j2SVp/NScBvdeZc4pA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 21 Oct 2026 09:12:18 +0200
Subject: [PATCH v2 2/2] python3-sphinx: update 9.1.1 -> 9.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-sphinx-9-1-1-v2-2-d6414fff7bef@bootlin.com>
References: <20261021-sphinx-9-1-1-v2-0-d6414fff7bef@bootlin.com>
In-Reply-To: <20261021-sphinx-9-1-1-v2-0-d6414fff7bef@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YrXfIV3X6YzFK943uDDb+TqYsUwzkQ8XXrDI/P/zOvc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq2GXZ7jiM3pT1j5Q3qJTIXwYvu4ek1NCcvSRbv
 KoUWZGQ3jyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCathl2QAKCRDRgEFAKaOo
 Nt05D/4/ih/a+n2fkt3ID0zDagP7PwvdH5cUSeD+TfgZBEoW4R4NTg6e5hEzRQvvNNN+TZHfE/z
 Ak007ZBNq10ZBHKrfo+vt7bdbiO4jyiXvn/LZJkT6Aduq5F0/gOuQTa36lFzFiGHnZp0trIaSHZ
 baELYJHgiLZYocIFawfpZuEuWLXZr+xtCda/a1C95PPrRWDaNYqdF30jHRHsJfQ940t4h8/0rwr
 QvW4wMw0FLFjPwU/1l1MtKR7DrkRcqu4g+ZeCbBadewUb/+ppHTLhSigyswTMm0Uj27Qbs8LKTF
 7rztdUxp3DL6RXjgRP2t3waI1T1byRGbtx+WxXOa5gKrA8UEpEnzBzCEOyIRPM1w8jtrBdJhP8j
 P2HQPgxIk+y71zbIHu7AVC8iiOJ0JJz9njOLKI1L/cDZYig9v4Z4SuD8AbegzUt4i5MmdwY2V+x
 sYmQKqWjicQpBvAnRxhiSQ+e9aGCaIDVewWtweBTGMrShYt5ZBU3D3sfPoFq6wdXmXm9qEeYZBk
 MSXUGfju9AznfOhPRtCIkztXfFbVftstevQxeidtEBU+FU1k4yTgSSzWAvqmHcVsV/K+nT6n4Zp
 xvvuSiv6zsUYCneXK9GDvkygABk4JINkTMEoY5Z5azcyFqB8Q+x+ZbdZe5IPPpO6Y1pRntjcQ5V
 NuW7jXoUvvxsqIw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248369

Changelog:

- Drop Python 3.12 support. Patch by Adam Turner.
- Support Docutils 0.23. Patch by Adam Turner.

Tested a buildtools-docs-tarball and an HTML documentation build with it
with no issues.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../python/{python3-sphinx_9.1.1.bb => python3-sphinx_9.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb b/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
index 36aed3a155..e54b35ca68 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=00d5910f77dc7db0f754b71c3c11317b"
 
-SRC_URI[sha256sum] = "48b627f02908f22c601b3ba9c7b17265b4f315dd05c8bc64cd4da41183f44fbc"
+SRC_URI[sha256sum] = "90470459f3cab15d9dfed146c71cf77694b0445df17b2e0e69059cb9f7fc9ee4"
 
 SRC_URI += "file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch"
 

-- 
2.55.0

