Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id D4D597964F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 00:39:41 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id v22so1815784lje.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=U2S0SVFqw44nn7TltW1rl6Jbxqfh5Na0qs8rpNhH2gc=;
	b=bp28EE6E7Do4y9EqTF6bsbNtreMm8TeKkHBoPTqDBKMsBWKW7noF258a+w87Jvku3n
	Hp01mNPwAAJ2FXHQgQL4aPxhH5kgA2YL6fvCFYlAKwS2EdEflWIdqpc/esTGixsAxP2E
	eCpRWGscWRkYuN4weFCHBIciS0Jkzno5OGNOR5qnU+LB48UULNHG2ctFUDPnEBMVJadf
	6oYQTxboYnMDCJd8Qhh+Fw20TJJXapeepyOCNXjkaIeGCe86qldQzubPl3vsX+8V3w9y
	dtBQ7KLqc23v/4IPd1/1vWeBw3y+kvDJbgIpV43RJQKBRuHsjiDWyWpag5LxWSAqsKhk
	a9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U2S0SVFqw44nn7TltW1rl6Jbxqfh5Na0qs8rpNhH2gc=;
	b=Nfc0kh0GdpymvV7dw8vCDqsUeEbJlK4iGi9EHDBwABTpC3MPwtVZ1Qrqs8+GOEY9xx
	eeZ+Wntg1PiBwDtC3Ry0TtCGULw2dVOJ+LMabN+kzyALA010SzFAI0QhCVgonSUUD8t3
	TCd7cTk07BYBqBEKT8Ll51lhodmhLxTHChC+6eRHNIcrvpwVo1SwRinTuioc0jbyHp7C
	Hsg9Y6LzqsesCrb4PSlP8seTY4GsNS55VcT9YU1JiRmhYxJe9iigc+jRHIL7S49Wo1Uo
	HGh8lAjHVALCdpQrTK7Lw8YFRBnK2OGp33b1tuPrPDaJmbDmKtEWMCR8DX2AzJsKQfSo
	slCw==
X-Gm-Message-State: APjAAAUrsLva3iCm1IJ+1q+Wl2hgu0r0hm3k31udXRY8hzxkQWd+AyVG
	ZPznNZBjYcivfBNkKrQ+CU+4f6tf9uo=
X-Google-Smtp-Source: APXvYqwaRnG9eMt4UxITNjyD8sW867NtBuHEyvS8FKbD8J/1MH3FHXy3Mfr6dc6WEj1M4z7XWZdujQ==
X-Received: by 2002:a2e:1311:: with SMTP id 17mr11799025ljt.75.1554079181933; 
	Sun, 31 Mar 2019 17:39:41 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d17sm1523464lfb.60.2019.03.31.17.39.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 17:39:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 02:39:39 +0200
Message-Id: <20190401003939.22601-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] x11perf: update to 1.6.1
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
X-List-Received-Date: Mon, 01 Apr 2019 00:39:43 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-app/{x11perf_1.6.0.bb => x11perf_1.6.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{x11perf_1.6.0.bb => x11perf_1.6.1.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
rename to meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
index a06aa269b6..33c0c8a95c 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
@@ -19,5 +19,5 @@ do_install_append_class-target () {
 
 FILES_${PN} += "${libdir}/X11/x11perfcomp/*"
 
-SRC_URI[md5sum] = "f0b24e4d8beb622a419e8431e1c03cd7"
-SRC_URI[sha256sum] = "e87098dec1947572d70c62697a7b70bde1ab5668237d4660080eade6bc096751"
+SRC_URI[md5sum] = "e96b56756990c56c24d2d02c2964456b"
+SRC_URI[sha256sum] = "1c7e0b8ffc2794b4ccf11e04d551823abe0ea47b4f7db0637390db6fbe817c34"
-- 
2.17.1


