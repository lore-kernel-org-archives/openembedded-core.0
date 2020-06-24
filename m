Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.12337.1593001432019840107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 05:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=qz3Ja2BL;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (unknown [62.102.229.129])
	by koncepto.io (Postfix) with ESMTPSA id B99DA6023B;
	Wed, 24 Jun 2020 14:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593001429;
	bh=4+z4K1XK7PcUZSbTU78uPUuL35LTO0aDYhohXUb4jwo=;
	h=From:To:Cc:Subject:Date:From;
	b=qz3Ja2BL1cX8lZqPoyZlPDFyuSIi3y4JP2swcdxTHnsrYMdzZNdfXXEsZjH8LsQur
	 d0TnXLp4BGA6nJ35dnLDnoj80THyR/CjwBs82coeAVyZNzWf3vnvF1N7UojOP2ebMV
	 Cd6haCrUcqxlTEedxz8qkIizM5fBP1Iz4ibhzfjMgnHWvArSQ5HB99kT/e0RoHdgbW
	 OojkSe6/Q/hgfqYcgXc6BulPDAF1ytE4Hk2klHe0xtkISFxEFX/Uyr8KB4L209ZsHK
	 Gkf1Bkwuy2d0VRAhzUDzNJwxdHCLnW0UaG66MlJ3ptsfBksBGV0h09qhjoC7WfKIZE
	 u4Hxbfhys/OeQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] curl: upgrade 7.70.0 -> 7.71.0
Date: Wed, 24 Jun 2020 14:21:17 +0200
Message-Id: <1593001277-3587-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This release includes the following changes:

  - CURLOPT_SSL_OPTIONS: optional use of Windows' CA store (with openssl) [10]
  - setopt: add CURLOPT_PROXY_ISSUERCERT(_BLOB) for coherency [31]
  - setopt: support certificate options in memory with struct curl_blob [41]
  - tool: Add option --retry-all-errors to retry on any error [27]

This release includes the following bugfixes:

  - CVE-2020-8177: curl overwrite local file with -J [111]
  - CVE-2020-8169: Partial password leak over DNS on HTTP redirect [48]
  - *_sspi: fix bad uses of CURLE_NOT_BUILT_IN [21]
  - all: fix codespell errors [75]
  - altsvc: bump to h3-29 [114]
  ...

See full changelog: https://curl.haxx.se/changes.html#7_71_0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-support/curl/{curl_7.70.0.bb => curl_7.71.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.70.0.bb => curl_7.71.0.bb} (96%)

diff --git a/meta/recipes-support/curl/curl_7.70.0.bb b/meta/recipes-support/curl/curl_7.71.0.bb
similarity index 96%
rename from meta/recipes-support/curl/curl_7.70.0.bb
rename to meta/recipes-support/curl/curl_7.71.0.bb
index bb25677..c1abe01 100644
--- a/meta/recipes-support/curl/curl_7.70.0.bb
+++ b/meta/recipes-support/curl/curl_7.71.0.bb
@@ -9,8 +9,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "db69aa37476dfdf9abaa2fb01b8bbf1a"
-SRC_URI[sha256sum] = "a50bfe62ad67a24f8b12dd7fd655ac43a0f0299f86ec45b11354f25fbb5829d0"
+SRC_URI[sha256sum] = "600f00ac2481a89548a4141ddf983fd9386165e1960bac91d0a1c81dca5dd341"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4

