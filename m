Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 04EB67D610
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:54:29 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id i68so15504092lfi.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3KTit7jyDxyljpUqxmnvLsMMJtDm+EhU+uADSPX3Bik=;
	b=JzcbK+FvBuGumn+SZzGVeJglG2kepJt3DOrB3QR/zHMrTgKoVWP0xWkk7RRLETMs7+
	qpe8gyY6HGs5lZ+L9XfcuHVBBAti9nDMwR/mQF2h0bHw0l+R+fVDPSzMHLMbmO4ORpyR
	RmKnMInpaLKRxJ0AC/7e6K60CGfz4e0E3iTLfA2S91Yrp9cVQP/I+3qHzQrCuhpkF9nm
	v7hZJvkVLxttsIdp9ignBUa9hgKTMh7ulu/MBaktTzMPFYSIhVhk90+zpAvCKA4Bh1pK
	/NcREGGHJLrWcdJ5FjJj12RKjgQqjLTCA8JGPu+YY8v9zjmaZ8kHjVV0rNm4u+BiZQxs
	RWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3KTit7jyDxyljpUqxmnvLsMMJtDm+EhU+uADSPX3Bik=;
	b=IoQS1cWxPIkny4bAih/EIIFUZXO1xx9oYekO5UvR2EG6zCJq/ilZ/Ehd3YU455iCLo
	Dc+1BCDlJ3vNrbnDLm9AJaZVh/j3SqyXUINF5Y4CvdPYuaA7rk5gbOO8yPhGEEr+YMW4
	AF/jtw8MmID3mFOheveIp2pcx01xITFuS1SYFGwFB8H0DvHGxmF+l/CvIUOgVTejcOe3
	ZHmRj/kiZSsnIvjXdb2wC57G164Chja25mlht2UavjlX0JPqplUhgfVWIwNGLwYOUEyx
	CHUAjiwVPcJ5bb+6oJGf4De/zsQeNQciuyjsB4b6f8FgG+qbPRdRi3B48vZmK5AolQw5
	2geg==
X-Gm-Message-State: APjAAAWaZn8fU2spYmQE3LJkpewMscLFAaLiB6ei+lX+0zbGTuOfbTsT
	MMyehWEX3RrsUYncqHABbeYo9tBkJEM=
X-Google-Smtp-Source: APXvYqxuvRhGo6Evn52KcmA5V+IMar+ZvY4+sF6myKm3wA0E7fymlhfDyvi57Xdx/n8dQYV35hq+EQ==
X-Received: by 2002:ac2:495e:: with SMTP id o30mr19369760lfi.35.1556132070087; 
	Wed, 24 Apr 2019 11:54:30 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	p11sm1563707lfh.27.2019.04.24.11.54.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 11:54:29 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 20:54:27 +0200
Message-Id: <20190424185427.3312-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python-setuptools: update to 41.0.1
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
X-List-Received-Date: Wed, 24 Apr 2019 18:54:31 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
 ...ython-setuptools_40.8.0.bb => python-setuptools_41.0.1.bb} | 0
 ...hon3-setuptools_40.8.0.bb => python3-setuptools_41.0.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_40.8.0.bb => python-setuptools_41.0.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_40.8.0.bb => python3-setuptools_41.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 9092d7ad03..357aa07086 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "712697a5bc975cf479d487cd68206c20"
-SRC_URI[sha256sum] = "6e4eec90337e849ade7103723b9a99631c1f0d19990d6e8412dc42f5ae8b304d"
+SRC_URI[md5sum] = "6404ca798bb9a9073aff3b91b2df35c8"
+SRC_URI[sha256sum] = "a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_40.8.0.bb b/meta/recipes-devtools/python/python-setuptools_41.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_40.8.0.bb
rename to meta/recipes-devtools/python/python-setuptools_41.0.1.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_40.8.0.bb b/meta/recipes-devtools/python/python3-setuptools_41.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_40.8.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_41.0.1.bb
-- 
2.17.1


