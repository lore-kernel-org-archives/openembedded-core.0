Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 63F586011A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:33:35 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id g134so15593450lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 04:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2tz69IkMnawcVS9ywJ3JohOuqD8ulGnwC8b37Vgp0FU=;
	b=HVP5DgbJiTjopCtwMbXCTGJZgDvyvdIPhbbZifM3+3kvzufdIfBLhTbg0nZ7A+oeXm
	STg10h/ornDY2LhPg97RhwteiEB8kz27Fhwqxh2jYzCgE5FVGwtHzzyBcri94af4H6sE
	30JvNUS+42gaGcQSj6t7sGNJtuMVjS8Lcmcr5rJujoE2AiuNCZaIEVr8+Lc6yVZoopsS
	DsdGNp4G04nqrkqOUvbPeRIqMyTtNTk23fUhiUa1UquDf6Sal+MdZsfFXlgV7jo/hEx/
	PthSGVnz2HtxPV0CE+PKPF+wT1aE4wAa5s8nHV1m2dUO/IKa+Hgj1rGwBTsJQz/mjEc+
	Yu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2tz69IkMnawcVS9ywJ3JohOuqD8ulGnwC8b37Vgp0FU=;
	b=hdRp/p0+DcDhWD8xBq3htmlAsZwXiNVO/Wz1qxWTjSAV0OeMIPvUt2c1uwIj31a0Fm
	CXBRD7/y0X8sfi0EcYf0XcYzOFho0+J0oZWDtr3yNYqRmQHqkDlrqjnbIN2/z76HP6mm
	B3aqpr+5J7O7IM9VJgU3bZSSusFK0ioFEUB+hKteTg8HOalzlfENiQEvTnOR+vCl/vOg
	oOT01QDVAUfCgOqDFxf3SHROHwsVKDLzmKbdlj4OyW8nlhBXvPAv7rCtnpp1Z+UI8n/W
	tqrMXfSgsUK7JO6SIt2wzwpolbJ2soR36QqDuHvCY/lxZV/kmoUBw8j7UTHKlFgq5+x3
	iQTA==
X-Gm-Message-State: AMke39nT+RUzAANb+tDqOcb5BuR/i2X12dlYvkarKMAXUXO6rUvRtR/nktT1W20MVCvkry6q
X-Received: by 10.25.145.77 with SMTP id y13mr979305lfj.49.1487853216565;
	Thu, 23 Feb 2017 04:33:36 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	s20sm1248519lfe.41.2017.02.23.04.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 04:33:35 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 13:33:34 +0100
Message-Id: <1487853214-16571-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] curl: upgrade to 7.53.0
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
X-List-Received-Date: Thu, 23 Feb 2017 12:33:36 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-support/curl/{curl_7.52.1.bb => curl_7.53.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.52.1.bb => curl_7.53.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.52.1.bb b/meta/recipes-support/curl/curl_7.53.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.52.1.bb
rename to meta/recipes-support/curl/curl_7.53.0.bb
index 2882bc0..130643c 100644
--- a/meta/recipes-support/curl/curl_7.52.1.bb
+++ b/meta/recipes-support/curl/curl_7.53.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "dd014df06ff1d12e173de86873f9f77a"
-SRC_URI[sha256sum] = "d16185a767cb2c1ba3d5b9096ec54e5ec198b213f45864a38b3bda4bbf87389b"
+SRC_URI[md5sum] = "ede199c63b84df39f42da9da68de85c5"
+SRC_URI[sha256sum] = "b2345a8bef87b4c229dedf637cb203b5e21db05e20277c8e1094f0d4da180801"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


