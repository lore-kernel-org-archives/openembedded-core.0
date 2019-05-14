Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0086D7DF20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:24 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z3so7940475pgp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KXSNowB4P+YwhIHCLtgACDNt1ei+bUmG379qf6hPrfc=;
	b=W3aBJb7CYgx1/UWeCgD4o2bHCOlum3CaJJ+fwB1jE6ne+EypYEZ3y307O8C0OlohUQ
	/eDuwR4BVKMWzscCNdFxMD+ynISckJjTfXaRbEp1+yS7sQUmM8PfZDIljSPj7c/cYb/K
	rJgwJVu5z0TKqKrDVujU6H2dbVo4TNSfqmx/1GRDljqCuwca3tLg/18DxLZdmlIuxXxO
	c+2WRc0B4gMZR4vdYM7YcVyM2sY/J2bYQO9c5WK4/J0vtgM659jxDpxhC+JYtxOBtPQ7
	za2JRxggVSKuwsdsOalro5QUzvv2tXDf5btQvq0dzqoKwnXwOnMGdFKDgFWyNqkFbtTF
	+SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KXSNowB4P+YwhIHCLtgACDNt1ei+bUmG379qf6hPrfc=;
	b=gKBsucIflNwIvEwZoPxot2F5VywKVZz62NtTqNsc+SO22Mks8PWdEBU39uktixatFQ
	3h5v0/4//yeZmOPxUhvkUhunX6iwb65Wv+JVgBiOQ3y8DO4DaVKoN/j5Jx4IjmgMP/gY
	ZETYQs4o/O35+bzLVjTy9Pw5mSpMEPvVv7Xo/cpOSie7L/gy43APLQrsLuua7z4MItiR
	05aSUQ+fBuA0FHeVoJj8C3M9AjbV/nD2X7msf6r/Es6oqpNJsNXT/gC9bTkXsHEm4/Yo
	9sg0V5iJbJtOviNs+Rv2LEf2uh/s48KCfgpBUBlDcrHVUHA4rnUWUcyfqHecg3lY2T7C
	/o0g==
X-Gm-Message-State: APjAAAXGCKb+7uVtKLe1mJq3ivkOXL4WkQejXrXCsa5a51uK3C765tgK
	sLXslbTEq8Spt2/wC+Ow/M2eSRoi
X-Google-Smtp-Source: APXvYqwGC6y5HCz2hH1m3bJvjLyEwTXOIYDOWZlKBztBcqBvWjI1dJrcg6Y7orc8I7IA4e05fsMtrw==
X-Received: by 2002:a62:c4:: with SMTP id 187mr27009220pfa.55.1557809666109;
	Mon, 13 May 2019 21:54:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:54:02 -0700
Message-Id: <0e7cef6d2f1093eac3046499e99148efcf977713.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 20/23] bitbake.conf: use https instead of http
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
X-List-Received-Date: Tue, 14 May 2019 04:54:25 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Use HTTPS instead of HTTP whenever one is available.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/bitbake.conf | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b4e8990..a8bafd2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -628,28 +628,28 @@ BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 ##################################################################
 # Settings used by bitbake-layers.
 ##################################################################
-BBLAYERS_LAYERINDEX_URL ??= "http://layers.openembedded.org/layerindex/"
+BBLAYERS_LAYERINDEX_URL ??= "https://layers.openembedded.org/layerindex/"
 BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 
 ##################################################################
 # Download locations and utilities.
 ##################################################################
 
-APACHE_MIRROR = "http://archive.apache.org/dist"
+APACHE_MIRROR = "https://archive.apache.org/dist"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
-GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
-GNU_MIRROR = "http://ftp.gnu.org/gnu"
+GNOME_MIRROR = "https://ftp.gnome.org/pub/GNOME/sources"
+GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
-KERNELORG_MIRROR = "http://cdn.kernel.org/pub"
-SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
-XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
+KERNELORG_MIRROR = "https://cdn.kernel.org/pub"
+SOURCEFORGE_MIRROR = "https://downloads.sourceforge.net"
+XLIBS_MIRROR = "https://xlibs.freedesktop.org/release"
 XORG_MIRROR = "http://xorg.freedesktop.org/releases"
-SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
-SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
-CPAN_MIRROR = "http://search.cpan.org/CPAN"
+SAVANNAH_GNU_MIRROR = "https://download.savannah.gnu.org/releases"
+SAVANNAH_NONGNU_MIRROR = "https://download.savannah.nongnu.org/releases"
+CPAN_MIRROR = "https://search.cpan.org/CPAN"
 
 SRC_URI[vardepsexclude] += "\
     APACHE_MIRROR \
-- 
2.7.4


