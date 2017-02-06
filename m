Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2C8719B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:46:27 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f144so7611622pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zSYB3bkhYMXx0oOl9RvqIkbLcjiZxv4g/VbluUBTc5E=;
	b=rLcwitXKfHIXBP2R083CirY8fFjA4PtuWcVxAubd9wtGmOvs6Yuv5KSmTN6SAFwNpg
	ZPzgsDDlN10tkxtFdwCA+pCsZoFAOzDokbJAoHcWEUKr7ohbfYq7PJmk2xfmtGRIrvuJ
	fRt5P/6M4GH6QXeSJ10lPUYvt8gXQRfuUV2o38dtdsJsYwt05uQ2imWa5QFp8qwC0Sed
	JTVaiPMO5CHD6w9koiRkqi++KRn/gcE5fum4XF6aFM/tTQ/NynHjoJnXJtUX5afapJrV
	qnLxhD+vzeS7WE5/EeJO2f+AZPiCl0exPn/jbNNFXv64Y6plfyCUrl3K+v9Pk58Gr8Dc
	yLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zSYB3bkhYMXx0oOl9RvqIkbLcjiZxv4g/VbluUBTc5E=;
	b=QPrSRrL7r3vSkzMO1+irs491u0orkkYXUrvo4MkHvfNWUB9Y+2qfVaKXGG5dFC9EMW
	+jJpA2kF2FZ1eHoivXb8vKFDCwauTOleMi/dxGdGqtVbcGCd4K7gWFhVyNcL+nM35gZr
	OZqQGHVVwzaHM8aQbjH9BVC6rXRVtCF7xFyWh9gcirLGEpDQ4iELaCsFp+In2tBhtL5P
	qYLrN2nqgWRZZRBYgmAydI/G3dz2NGV03pTbK4HTcHZYGSkpS3ur6yE/b8AfUIejUlaQ
	+z5xhQgT93GScw43dI/WayEDoGpKy26mvV5LLzUdG1GxYQ2TG98hMfNDvKuXOfQZU4d3
	MFOQ==
X-Gm-Message-State: AIkVDXIkZ0XZLtbFcdutRyWGpKZd4RYR2jtXuPz7+Q1+pn0c1iye2+72zYc+lHcvwc2CKw==
X-Received: by 10.99.116.90 with SMTP id e26mr15581581pgn.135.1486413988199;
	Mon, 06 Feb 2017 12:46:28 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l12sm4868386pfj.37.2017.02.06.12.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 12:46:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 12:46:12 -0800
Message-Id: <20170206204616.26245-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH 1/5] qemu: Inherit pkgconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2017 20:46:28 -0000

Fixes

| ERROR: pkg-config binary 'pkg-config' not found
|

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e3af5c21c0..ef5d75c450 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -6,7 +6,7 @@ RDEPENDS_${PN}_class-target += "bash"
 RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools ptest
+inherit autotools pkgconfig ptest
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
-- 
2.11.1


