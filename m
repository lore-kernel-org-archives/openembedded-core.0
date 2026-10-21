Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5906.1792566763831715899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KyfGBalx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 882664E4125C
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49F28606E3
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B543610328C52;
	Wed, 21 Oct 2026 09:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792566760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/+Fr1zxrQvNTHH1rhe4F/qT2ZiiJtV29w2g/b9czt/4=;
	b=KyfGBalxM0i41jz3WEZe/IVfAnn+HBLO8gNjDQrV+5Coy+1F/kXCK1jy9OBgMhKgthnM1T
	jJ13/V1meimAYiej8WJz8DSsnV9AZn0BU24DahYPstg56JAGTLTwzM3Ts4HTF8NhAoK0Xi
	zxwlCCPLcRXYWGyTVREP/kQzQo5PenQtCQzvANi3P6AldICAzUvZEg0SBAmKAY71tgQvbZ
	3zeruJ/XH6uh2PHQ+Pt42J2BhRJP0wKsKL+NB7cxLMFctLnaltLgF0DLA4HUe1thcJHEhI
	2CWflLhX5zvh5H9KmLNS4UTX16dhdWcI/VmEMScNdISTVOqDQ+O1AB3eZNJHJQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] python3-sphinx: update 9.1.0 -> 9.2.0
Date: Wed, 21 Oct 2026 09:12:16 +0200
Message-Id: <20261021-sphinx-9-1-1-v2-0-d6414fff7bef@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQrCMBBFr1JmbWQS2tS66j2kiyRGO6JJSWqpl
 NzdpK5l4MOD/99sEG0gG+FcbRDsQpG8yyAOFZhRubtldM0MAoXkKJDFaSS3so7xfB1ybLCtT0r
 XkCdTsDdad91l+HF864c1c3GUxkhx9uGz/1t46f1RLyUMNlJ0qm6V1L32fn6SOxr/giGl9AW7V
 xUBvAAAAA==
X-Change-ID: 20261020-sphinx-9-1-1-901050748ab4
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=635;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=e6wT4FaGv+bKYs70EOSRMzzheScdTrrudke6fFnOIcw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq2GXYy/GSJ8wTu6R0OYP1D9byvKoB1JzKTegzW
 V7KkeXepYuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCathl2AAKCRDRgEFAKaOo
 Nkr1EACjGID/92IMffw2x19z2Ps76ALhQydZyK550r5DlMDArazjcsMbskx+4mTUvGNqyF6CMHx
 L1COWYyph4eI1rAbGmkxUeRoFIhXr0vZ7IbzzCEPOs3+fwGs58mfj1K+0sdJmvzGvO1AiSxatAy
 SE9OYESuqB2aM/PR+3H+/af+5+FSIlaR6adB3Nyi9BCGfSu+amg4gsW36U5aNs5snPaQTK/9J4V
 gnHCPl0FUA7fALLivIxAkloN4Fz9g2YDZwvua8RgsyknoIeN8uUyBYEiVT8t4UgUrBaKiuj5aMP
 Tak92HiDxzk2nXtwEp2+3YprhSC83zFn0Q3gXWqYsmTOxOL4C3XE3/2h8jscOezscTJFW/lt+Gr
 bNbfpGoGFyrzJItS2RgsJ1RHsStnzrAQeA7akHxReX8+CIdo5gjHH0OtErrltMfxHwdjHWGqcsR
 1QH6zrO7Gi4Aushuwa+w0LmPQeKoxTouYBrDjj3OAy5AAJ/895OJMcYdL3bz8wDJA9cBX7Llq5p
 znMLp7HqDEvS54y1fHquqYElsY62UrCGIh0+KBAF1elczQFS6tOBUJziLcG5LjdaqNRsvQM6wT0
 3PgDnWIpBGv/piWf9K+7gqYDfoydR7mFxGpK3dZjG5yDDbY6IG1nIz6F+O25iVk1AMLFMQhAPOi
 sWVhdQbskprYbVg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248370

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Upstream released 9.2.0 quickly after 9.1.1. Add a second patch for
  that. Patch 1/2 is unchanged.
- Link to v1: https://patch.msgid.link/20261020-sphinx-9-1-1-v1-1-c05629a47a6b@bootlin.com

---
Antonin Godard (2):
      python3-sphinx: update 9.1.0 -> 9.1.1
      python3-sphinx: update 9.1.1 -> 9.2.0

 .../python/{python3-sphinx_9.1.0.bb => python3-sphinx_9.2.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 94fd491210b5269f7242df59db1541379e25754f
change-id: 20261020-sphinx-9-1-1-901050748ab4

