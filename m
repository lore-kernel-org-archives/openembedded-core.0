Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.1290.1593621452302662682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 09:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=gMjt4vX6;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 3997C601D7;
	Wed,  1 Jul 2020 18:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593621450;
	bh=vDa9gAYrlSQShw/dfJ8J+POYu4HGPP3H4qgwkSkUz3o=;
	h=From:To:Cc:Subject:Date:From;
	b=gMjt4vX6libKUoUvwzEAkHs55UT3t/sxCNw6XOl1L4xDlDMvIB7Ufm6TIpyZ22ZuH
	 7jbG+oC93yF1JY7naFv/yABvhXIKkUomYZubsneVl4a5sLuL4Lg5fikEMKQAHDRmr8
	 c0Ig/5dOj9oXg6ygEJ3zN9yiivARHpGe4VaezGYHABH/9f8J0I7aruTs0WMsEjCd/7
	 B3+RKXNSu1zXQQhoKl08cdM+cSYYQWXpcov7Mtf+qD+qKZCyEpcuoVE2X0WeJcH28E
	 H+WflUVaSPnyHhj7Wmg16N0/HMY7fsfbM0+cIhCBBLCYNSmu2fQAs0Z0okQd8FVbCU
	 TVoIE7TEAKnUA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] curl: upgrade 7.71.0 -> 7.71.1
Date: Wed,  1 Jul 2020 18:37:25 +0200
Message-Id: <1593621445-8712-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This release includes the following bugfixes:

  - cirrus-ci: disable FreeBSD 13 (again)
  - Curl_inet_ntop: always check the return code
  - CURLOPT_READFUNCTION.3: provide the upload data size up front
  - DYNBUF.md: fix a typo: trail => tail
  - escape: make the URL decode able to reject only %00-bytes
  - escape: zero length input should return a zero length output
  - examples/multithread.c: call curl_global_cleanup()
  - http2: set the correct URL in pushed transfers
  - http: fix proxy auth with blank password
  - mbedtls: fix build with disabled proxy support
  - ngtcp2: sync with current master
  - openssl: Fix compilation on Windows when ngtcp2 is enabled
  - Revert "multi: implement wait using winsock events"
  - sendf: improve the message on client write errors
  - terminology: call them null-terminated strings
  - tool_cb_hdr: Fix etag warning output and return code
  - url: allow user + password to contain "control codes" for HTTP(S)
  - vtls: compare cert blob when finding a connection to reuse

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-support/curl/{curl_7.71.0.bb => curl_7.71.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.71.0.bb => curl_7.71.1.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.71.0.bb b/meta/recipes-support/curl/curl_7.71.1.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.71.0.bb
rename to meta/recipes-support/curl/curl_7.71.1.bb
index c1abe01..f028f1f 100644
--- a/meta/recipes-support/curl/curl_7.71.0.bb
+++ b/meta/recipes-support/curl/curl_7.71.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "600f00ac2481a89548a4141ddf983fd9386165e1960bac91d0a1c81dca5dd341"
+SRC_URI[sha256sum] = "9d52a4d80554f9b0d460ea2be5d7be99897a1a9f681ffafe739169afd6b4f224"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4

