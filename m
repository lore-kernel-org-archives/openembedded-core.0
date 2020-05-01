Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5210.1588370193372719417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 14:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=OLGUkO5j;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=4yvm=6p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49DR0b3Ccfz5R
	for <openembedded-core@lists.openembedded.org>; Fri,  1 May 2020 23:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588370191;
	bh=ZQZ+F6kmtEP/+9FiWaA5M2mgM8TsGFx+AyzidNkoE9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OLGUkO5jzxIspeMuUaVX2nMnck0VDjzZjrbSWuVeVPuC5o9E8tdHHtBr44NQVS692
	 C9jCJWWWmJyEpEvc4zK6S6q9h6cO7q19aqOzfJV3Hw1WwI8bd2fxvtyWpzRzwdYHts
	 KsWa++SfLqt8Tt6B3/uK1womHlNrLg5UZpxbymF9Yj0a/l24d4ROHDxsEBJwtbMXuH
	 ECz3Yn8VvAAhtkOj5YUsesvcneNtz8SScLIoIWWy3sEdG/wlX0zMVIsI4/CSEElauF
	 YbuZXtQs4L/a8YVHzoyogNAt8ikR8uzVdbOC4QlrS9nA6Y3lL6ROg+Wu0tGwUVFU32
	 6FLL+6C99DomiCGjNrVe1cR8YcHrNRIqSgAoiIt9gp2NdQTWF9ALPj7UpqSc1LvJZU
	 DOCtPW6USUQMEAby5jfEa7NcLSnUUr3eb8NFwepDYpt4lK2PzqlhpAcpx6dI3feYND
	 meDTW40SWa9w4kxN4bxQTSX+1E6vxBz+zG+Nrvsjhj/xwOh45dBvQJDXCsAo1Zab88
	 dCBgWC9c3cdAn7p7w8fUvChSOOSbOqBlFcTiFZ5jWI7g5ExWXTlMWhcWSTK7AUpppd
	 cpQK0Z2E6DLSkdhcvK4LZylQYAiQGeBZO8JRDFhozOX75RprW0WUF33JKCud3l/4Gz
	 XWgbZIq9VJpbNSilU2O3hK1k=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] gnutls: upgrade 3.6.12 -> 3.6.13
Date: Sat,  2 May 2020 00:56:28 +0300
Message-Id: <20200501215628.9472-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501215628.9472-1-bunk@stusta.de>
References: <20200501215628.9472-1-bunk@stusta.de>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 5cc0f0dcf1f41bc148b034b3f7abef756a328cd3)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ includes the fix for CVE-2020-11501 ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.12.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.13.bb
index f1eeebc807..f56d42a613 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "a23900f14980a467bdce3a0fd31dfa18"
-SRC_URI[sha256sum] = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b"
+SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
+SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1

