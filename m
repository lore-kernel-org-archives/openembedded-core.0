Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id C21A5605C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 15:49:50 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id t128so26239569lff.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 08:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TLysmZSDQw6WHmydhai0bZHopU9/VNCyqZnrbbA3NGo=;
	b=LcOdsdeNGT+wqFQfldBBNch3eHjJCsjxpv3gGFLAb65dxtgRLx5Qdji3MeYPNEn9Lf
	pIP8g/IP7f6+YtAxkZhssviPiqPuPSxaPv0EQc1h/jJnmlnWP4aHY1ENhtVK3ebzweOD
	lTR8ujo1ovueIQWGCkBanWXBx8aGDVhFamQFCLkFs2UgLcaXe2ovdrfADa7zwDbyjvg+
	aD80XkfhEIWtSrlFAebL240JJM2Sxe3s5rC/nnQPR6LjUdmhkL21FAWlL/7QHQKGYslr
	bApm8VT4/XsF/+erceVzrAkEYx0lbS0sqMGA1lnhvLTsLzT8Pi8U6e+y+SjNmCXf0Uc3
	vEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TLysmZSDQw6WHmydhai0bZHopU9/VNCyqZnrbbA3NGo=;
	b=PKasoMXD39mvFRLbNZOHaClM3cPSxsxU0VhAxxxgRKBVAZJ3+EpWBKKOH3md+EkvRb
	+bPKFT4Lg+IM4OaXlD10fULFrAMbpf/htTwfaJmnFqEqC4V04+6cUs2Z0yB43Lwa47gr
	KApge9HeZY9MYbMRr/ujBp1pMM5ui52DEHIKtklQRVjw5KOXuWhIkyYDCyuxUqBx0M5A
	uK6xMLnaMWUpPP2XE4EKWKLyBQ6I3tlbwMrycnw0NJmmtacQNL0qFsVf0HnKQfmHaerh
	ClaIt8ZmjBHeOz1oTtUwI8WQdRovk8s+4EPi3RFYiCvmXkGrC7KC2HyhkRyiNotptoMx
	35bQ==
X-Gm-Message-State: AHYfb5joaShEUjxjCS7vlhhTzg1EDXZxO8aDsoCtLU9juaGbTlysyRFA
	DxTJVuCCX/mmxTy0Tv8=
X-Received: by 10.46.78.1 with SMTP id c1mr6351639ljb.189.1502552991032;
	Sat, 12 Aug 2017 08:49:51 -0700 (PDT)
Received: from ubuntu.office.pelagicore.net
	(h-79-136-12-196.NA.cust.bahnhof.se. [79.136.12.196])
	by smtp.gmail.com with ESMTPSA id 1sm496317ljg.80.2017.08.12.08.49.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Aug 2017 08:49:50 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 17:49:28 +0200
Message-Id: <1502552968-13361-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe][PATCH] curl: upgrade to 7.55.0
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
X-List-Received-Date: Sat, 12 Aug 2017 15:49:51 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.55.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.55.0.bb
index f42582a..9284666 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.55.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "90cd4d6b20fa7655d2b75efe09fd7bfe"
+SRC_URI[sha256sum] = "af1d69ec6f15fe70a2cabaa98309732bf035ef2a735e4e1a3e08754d2780e5b1"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


