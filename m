Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 67C5B71B2D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:35 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f201so80669249oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ww3YlI7wwmKLUtBxgHLhrLpuRQVQVylN92NP3BpcluM=;
	b=PK8uOlCFMDTlW8A53+f9nQaLL2xMqGl+Mz/e+beLa+tjybFsUJkLgiSNhgNPaDjoQJ
	Cz3uB4z4COqr3uFFlYZbzGMnR9znNgGU4B3rw5IosNSgIhAQIdbphB7gAad9KCu2xGQV
	cmAclT25RX8CRDauKRGWTcCrWBuCdi6iNBkJbs1x9m+h70aCEw8P+SAvNcFTX2gaiNZi
	NRcK/sgLb4uVRF5277eETEKKmDcXkbU8X6gib6oxl0+OBI/JhlW3tSRdc+u661/YbTrB
	W3eI3PY3hUKl+6fQkUaIYDRP2zDFo4Bw4MT+LAixNJEyAkZTY4WRZDOtys6LkdejDu38
	t6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ww3YlI7wwmKLUtBxgHLhrLpuRQVQVylN92NP3BpcluM=;
	b=WuZUVzQ9w4wrUTAS7QnUdGjJJ9lKYHsnigmklQCHYbSh5O4jy5huz2vize4sfMiq3I
	gctgZN3wOMTsgxZrX9ROBYfblL/22xG5JYsIUJH3oFJCDg/zZ7Jymcwh18Rhm4DVq31R
	hDGt81zZaD4PaCuWuTRd6vQKjPvv3BENJvUMl7A8dfn1mcEj5CAgEy8MwBsib4NLxyC6
	enccfHut3ZsWJbvjKqziQD2KusLHEjWasHMieGwVQ7wxP1AHifwOXiOqoV21I4EiYkn4
	brgxCqw/A+KHtqdtRUQLvhQ3/IwYKY69tz8Z43d1CgSMAw+kR3nV98geSiRjU9P318qM
	mFMA==
X-Gm-Message-State: AIkVDXKbyq/dq3sztZ6blCXBRIR/aqOwxD2m9j8npPZleywTfAm1NGBnJvER3K9ysbAkog==
X-Received: by 10.202.85.77 with SMTP id j74mr32076606oib.108.1483645595858;
	Thu, 05 Jan 2017 11:46:35 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:34 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:15 -0700
Message-Id: <b649d4ceff139f17938a3f842a73d8ca4fa51146.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 03/16] grub-efi: ignore arch mismatch for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

Ordinary 64-bit binaries are expected for the bootloader.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 531482b..03d273d 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -65,5 +65,8 @@ FILES_${PN} += "${libdir}/grub/${GRUB_TARGET}-efi \
                 ${datadir}/grub \
                 "
 
-BBCLASSEXTEND = "native"
+# 64-bit binaries are expected for the bootloader with an x32 userland
+INSANE_SKIP_${PN}_append_linux-gnux32 = " arch"
+INSANE_SKIP_${PN}-dbg_append_linux-gnux32 = " arch"
 
+BBCLASSEXTEND = "native"
-- 
2.8.0


