Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 223997F895
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:38:23 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t1so1132983wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZgdgeRPO98uQVWB+w6V4CQDAd0bmjCdSX7Eau6iVfgk=;
	b=wOVJWsudkjfuv6nF9n63EhniEuuWJyKJGrE9iyT8fAdl+MrjOPlQGH3R2LVWEPKVA/
	xzHPlJPMh+Mbha0KdyXHBYyKtnLT7pnR7N2OZ+AmTAJXPkVhWAE++sipyI04/S3hcs9c
	gWa7FuO2QvJ2FS8OsRkHuRJ3s+hKsPWU45knoWVkp0firQcXMt4eRsiFaTNkkV46zOni
	d1hISJzAWD3kBEr4UcIZutwAZdqwn7AMe3E91n7k5T+y5lwosnGgpwIRo3/iz3pm9iy1
	mSO/z9Lb6XAMM2XbNkYS8cyEaWifjHy6cKyD4+iHE6XJ8ejno0WQrWj1nKFU3XKnJm4t
	+fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZgdgeRPO98uQVWB+w6V4CQDAd0bmjCdSX7Eau6iVfgk=;
	b=rH/rlgjRWUZ+6AiYzJVvCKDw8WjyfPDhzmRoqEkw3VHLG5Z2rkhMRu6wUOcOF/osu+
	oPlh6FGB8lHhQXXyuCy72Os4pibIduI5Y0dnNkfAT+UDi1BB7OqiLYpRLnh9MNg/XB8v
	axmPEwdnN2rlpBKjovjhPcAtX76tvANpJLYdBh0CGgUGZbK9lxpQpZPc66mb9seN+sOS
	kFlYu+5KFJ4Kc2gNnBDOzJ37Rs6K2jzfkWEQ4EHJcGlXVRq9SQmtk6N1Dj+MzjBpcpBN
	ENec6/eE7dyUrFh5Kcs609yunZKetmIEKwyCZQzsB7XFJJdzJ++bO8fOrSXYjZa5rIuF
	LiAQ==
X-Gm-Message-State: APjAAAUupUDu4AO/9pWBL17rWoBVFm64PLXRSZGLytA6WU5K4MKSSIxZ
	Xa2MRVXmgT30Z0ICMHPqibUSgKwYaSE=
X-Google-Smtp-Source: APXvYqyw7gc9QlnofuvwRjb8nke1fwqGWdRVhjio5sqUGVHmWQPRb9jVuT35z5Uy+/RbC8EzQ8zqZw==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr5572002wrc.150.1574275103577; 
	Wed, 20 Nov 2019 10:38:23 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p25sm143652wma.20.2019.11.20.10.38.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 10:38:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 18:38:11 +0000
Message-Id: <20191120183813.9390-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120183813.9390-1-ross.burton@intel.com>
References: <20191120183813.9390-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] parted: fix whitespace
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
X-List-Received-Date: Wed, 20 Nov 2019 18:38:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/parted/parted_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 21a815345a9..fb5fa33a8ad 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
            file://0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch \
-	   file://0001-linux-Include-sys-sysmacros.h-for-major-macro.patch \
+           file://0001-linux-Include-sys-sysmacros.h-for-major-macro.patch \
            file://run-ptest \
            file://Makefile \
            file://0001-libparted-Use-read-only-when-probing-devices-on-linu.patch \
-- 
2.20.1


