Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id C53897CE79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 14:21:06 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id f14so21551727wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 06:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=745Qp80k9DOder22E97nkb24Ne5RT8RAe2P/Btq73kw=;
	b=RosPIwY7jla4I14bW1ZcNkSX1+bVFGkPbvHVCu2gcEZ5AJQ9ZDtGw462mZdSQ0CPfG
	iZoyZpczYTQed2VWxuNdAexFMGKxYpIDUVtGR+vE7XfFJVGbvoyogzA2gZlZcdxzkOde
	KVpQ3JFtIZWnnrXv61M4eKxWkQYj6Y9L1ob+dC66hlJ3VIRt/OXXuDGd77OpE8aSjAKy
	NOOIg+J8phpDIe6AcbLRYIqnDzqQi/AKJwmmQbXIANDLTQEGQQL6J2UmpAWtKGkx2l9a
	DYIP6EgKkVonjxcIVItWhx03juOJ5CJilsCrzwBLNpoYaE44TGFxRyIrA0x9SlvjmxVK
	qh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=745Qp80k9DOder22E97nkb24Ne5RT8RAe2P/Btq73kw=;
	b=nZYVqqDneUmyvMYqj5LQaAru6My3IjjT9QQq0hyXgqUIawcgwsxe1lffSlPp11BiEj
	1LkkD9AbghH+Cee7jZhMTjxN6feFuFbJc7j7GPFFoaOFwt0kem10C4w99+128znxDHjv
	0QIdTa76OCGEccLkUtNxfba/CJTKoTxIKXUaQg+JOK4hLQi4fA44w/BUab59lnu6eiXL
	cm7dVTz2BCNK6rCPTEZDV1sAt9kA3D/l+l7UnlvImqF5Ef39lNHGmzz/zloTiNbM9XAc
	jr4CizFjV95oSXhf6lpdJLLMhxr1SKQMXu/7u+u+WXYlIo0tZ4Dif167yWntzjXZmXru
	2x3g==
X-Gm-Message-State: APjAAAXZupOXY031PeZR7wl+zPHaSHwdHFwZ3+CqsQs++3bTP9Dcq6E6
	6OPpDosZGFGg8FBUYRIMXmkj2xmWuVE=
X-Google-Smtp-Source: APXvYqzKLCiTmysEO+YPiGPxRAg8ZVP1yh7lqt9OtZ6W4w9uuRkh4qhSPwdKCaXceKF8ZT44IUo4gQ==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr11364601wro.16.1552054866543; 
	Fri, 08 Mar 2019 06:21:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x24sm4131279wmi.5.2019.03.08.06.21.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 06:21:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 14:20:59 +0000
Message-Id: <20190308142101.10299-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] libid3tag: actually apply 10_utf16
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
X-List-Received-Date: Fri, 08 Mar 2019 14:21:07 -0000

do_patch() doesn't apply files called .dpatch, so rename it to .patch.

Fixes CVE-2004-2779.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libid3tag/libid3tag/{10_utf16.dpatch => 10_utf16.patch}             | 0
 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libid3tag/libid3tag/{10_utf16.dpatch => 10_utf16.patch} (100%)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.dpatch b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
similarity index 100%
rename from meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.dpatch
rename to meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index fe316461071..43edd3fe6a9 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://addpkgconfig.patch \
            file://obsolete_automake_macros.patch \
            file://0001-Fix-gperf-3.1-incompatibility.patch \
-           file://10_utf16.dpatch \
+           file://10_utf16.patch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
-- 
2.11.0


