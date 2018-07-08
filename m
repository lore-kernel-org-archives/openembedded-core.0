Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9FD754CE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 14:45:40 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id f4-v6so681393plb.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2018 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x4RqcjAYSfnesQJbG1U7a06QNU/rFfKrikT7L3oyR50=;
	b=o2E9W9WvqpgwH0ArhCAYNq9ypDFSAy38+gMMa944DOFxhto0iqxuf80sXtstyQf0cE
	l+s+bpwqDGJA8+HZZKoAhqS0jHexXb46g19LpofqbKm79RiDCIEtWLx9RgESzcEPxOOC
	4ESEfrhXzboYDaZcV6N0xkqUI4qoC/fR401/GkkE57j45WaAMxhzJGt4DkC4XDg/gvyu
	DoE8HEUa2rFpnPJVmY9nxuzLuoOzX1LxPuTQoFVX34k9x1GzMKDJvGiuwW927glHEqxt
	mF8gpREPj1bh9qnD8V9lEBfPzuw7NWiXlksqkTGlDvnvHk0d5OB7JfPT5+w4WaQ8EEnO
	rEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x4RqcjAYSfnesQJbG1U7a06QNU/rFfKrikT7L3oyR50=;
	b=puczuazlxLqSZwZ+4Sa54/+x8OxbqnCYf6ODRIVFPTu40QObDyrGuoT9uBKYgqfdUJ
	6jGaBhiLXsl23J8rT3v2GuM1u8RRvIeGz0t17zkMfRyQjbzkIDfBz8F9sGT+y5G/WoEO
	VIBZKceGovjjHdFBwYzpXHi0aIDFwUyNIswJXaWlCe6J9HwFyYOPGfFzUmmNJg6LUOOo
	K2t4UaMQ0EEk5Mwn4Ce6y0GsbcWoMzVdSP/+i6W7ViFUiUjoPptFSZ6uL+AGh0Q+UGh9
	XIjO9hgnr0jkBviRoTNHHD42krp+KZ6WQob1lfbLkYwUuyOz69w6xvx9k2IZw4BewBVA
	aRnw==
X-Gm-Message-State: APt69E1qX1h8w/Yk7tst/dfOUT24bHchAQwoq5LMvRKVPNoPj+azAzhN
	TZwteWjn0FAmBRKEK2mtWcA=
X-Google-Smtp-Source: AAOMgpe5y15XZXuIKULRSLiy4i+WmrpzRUbAEw1/LW6Wv7MwBqP9QGJZstOGb1LYecJX38NTv1f37A==
X-Received: by 2002:a17:902:8549:: with SMTP id
	d9-v6mr17266336plo.81.1531061141673; 
	Sun, 08 Jul 2018 07:45:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:3c1b:9cfb:14ee:ef7a])
	by smtp.gmail.com with ESMTPSA id
	e186-v6sm25076064pfc.13.2018.07.08.07.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Jul 2018 07:45:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2018 07:45:37 -0700
Message-Id: <1531061139-14602-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531061139-14602-1-git-send-email-akuster808@gmail.com>
References: <1531061139-14602-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/4] libxscrnsaver: update to 1.2.3
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
X-List-Received-Date: Sun, 08 Jul 2018 14:45:40 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxscrnsaver_1.2.2.bb => libxscrnsaver_1.2.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxscrnsaver_1.2.2.bb => libxscrnsaver_1.2.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
rename to meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.3.bb
index ddf09af..aed52e7 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.3.bb
@@ -19,5 +19,5 @@ PE = "1"
 
 XORG_PN = "libXScrnSaver"
 
-SRC_URI[md5sum] = "7a773b16165e39e938650bcc9027c1d5"
-SRC_URI[sha256sum] = "8ff1efa7341c7f34bcf9b17c89648d6325ddaae22e3904e091794e0b4426ce1d"
+SRC_URI[md5sum] = "eeea9d5af3e6c143d0ea1721d27a5e49"
+SRC_URI[sha256sum] = "f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8"
-- 
2.7.4


