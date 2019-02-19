Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 743617C9CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:30 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i12so23033113wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cLZMMlrDerOEN6DAu6bVmnnjSXHBFoVo939WSqerJ7o=;
	b=ka4JqonzJKxP+12QSPYmltUYUEzmhACEItlYuU3kaHI0c7zirQ5gLwjgKXA2Jn6NgU
	k+/ciUi1MULrNgWAIfCZv42izGPKr8I/eFvcVrIFXdQE/5kEQxLqH0+/69dgSN129RqP
	k10NTrj/ZCsnYwxRjbEtC2UJ4NzchwdmILnJGk9JoMKp0OsHaBXRCt1+Vk6nr/6WRcrr
	0C6VfBBB9hruBXeI0atQWjHho6OCZZhFpPp1/QmiunSE5RXBrEWgzSzbLCE8emmioQgH
	um9hs+2+8peNLl3gGIx7t+ooQ0fXUfnR2dihlZdhUEuFVpP9Yhf9A7ti6D+3BVQic8s9
	Hjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cLZMMlrDerOEN6DAu6bVmnnjSXHBFoVo939WSqerJ7o=;
	b=ehYU0/9X/6qA7Sle23lg6oaFVIJpcSMaaaxN/q/WU9AzRKjo1t0d5/jSqnhTvk50jn
	OkeyQlI8BN26ffxXyOq8vOhYRYM8Rb+G98ZF7bImjbs44p5nHnyppH45XY7sIskvDd5f
	3MMxDlxDRYOhkANdVBBEmGMvBCBW0qW9bGHZWKkX8XSPqtbnZmI2qC0GvzYabRiYAt2i
	hh5sUmshL5nCVeKM1L7NCNoFrSVIJakS65+Tuvw9JLv/UX9FT/xdXonJ0iNzCQ5dIokP
	KYUrfuxa+KSJF3bT34yXkQ21X+LvNNXHghtcVsYEt/NhcvDECS5ue7etacYvT8vDvJNe
	MPNA==
X-Gm-Message-State: AHQUAuYd6rNYg8Q0XmCXVQegB6LdW1N8h2hZKw9KI5tEjrShUoEdLs8j
	ztSMVcK+jLTpig6lS2nWGyZ+pInD
X-Google-Smtp-Source: AHgI3IZCdhqaZXursfJqV7lIrNh4ih77j+HcVLbBHOCooqW7Wgnke+F7gnJNc9y2iEZqZOA8d8lsIw==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr20438930wrq.90.1550598450924; 
	Tue, 19 Feb 2019 09:47:30 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:02 +0100
Message-Id: <20190219174712.60694-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/20] lighttpd: upgrade 1.4.52 -> 1.4.53
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:30 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.52.bb => lighttpd_1.4.53.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.52.bb => lighttpd_1.4.53.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
index fb76a8bbb1a..a58faa17be3 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "34f5c79137325ba31484bed1e54e66e6"
-SRC_URI[sha256sum] = "27bc0991c530b7c6335e6efff2181934d3c1a1c516f7401ea71d8302cefda764"
+SRC_URI[md5sum] = "f93436d8d400b2b0e26ee4bcc60b9ac7"
+SRC_URI[sha256sum] = "3bdfce1cf3e9650a556a8c26fb15342c5717c63f530c54693db632b0371dcb78"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.17.1


