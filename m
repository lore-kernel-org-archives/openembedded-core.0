Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 44380771BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:24:27 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c200so179813807wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=W5IJdn5Tls4QYDKyVVrpKOHDIGqHblNwYezdgWcVavw=;
	b=DoAXJbkoeyWmDSII4pt/kSnKYmcj1GByz8esJit+p/MAXzlo+Zi6ivXvvi0vVOC1fg
	mKKoYbyAQ94PJ4BX1AzJaZhAu9o+9/Ry+2xyP6KH7Iou1djqz0VnoUSHkKZii8VOQJj2
	2J86xQ+I9tb809BZF5+4WFQ7bNe5mEcpYDOyLEPkhr+5NVaMZ5COwDnCPBuo+SF/Fy4H
	D4qbUICcZlBtCDxCHwpyQnlBF592kxTYT5CZ5EWwNSV+2U62PiFSSCrYGNZreyeTAejt
	FAjqrcdn4PaxLcr2vTeXQqaMM7M91TDpQDAM0R66GkH6EwjWWXx7Q7fBLgavsqvkFqzy
	khpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=W5IJdn5Tls4QYDKyVVrpKOHDIGqHblNwYezdgWcVavw=;
	b=iSjCvdImFwDNDTDNkrd/bfWkenlYGYTf08OIwD3lEjAUI9R2A9xdyNDR3Sint/OL1T
	PlTy3TXuXcJQKKaUaBni3CbR8OKl5SZMze76DuaO0JSncsldQMS3Y/gcic1y2lKzpY6g
	Y/jaeszMBoygHbcWUZGAS+aMu4faN/9grp0r4rXC0ZIcMvRD67pJdiCKUpRQ4ghWoRG8
	Oz2LygVySfZVD49s6PE7lx3ry8fD6Ph2xRI3UkhHJUNiqWCQmrDPgrcuF5V3Ij6AnT1s
	Fpj4enT/HZLVYD58kJdhJ8w4N6bMCwb6tuhoXTbomvndFdMSmfEU6/R8O2bA91cllS0i
	fp0Q==
X-Gm-Message-State: AG10YORJbEkv8AUSuSptVEb3k6JYBCdKgdaMNuL8NK+XbSOAtzWvoYwbfRJ5lCvakU8aRKqM
X-Received: by 10.28.73.136 with SMTP id w130mr13973555wma.36.1456158267922;
	Mon, 22 Feb 2016 08:24:27 -0800 (PST)
Received: from flashheart.burtonini.com (94.197.121.248.threembb.co.uk.
	[94.197.121.248]) by smtp.gmail.com with ESMTPSA id
	k4sm21905299wmc.12.2016.02.22.08.24.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 08:24:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 16:24:21 +0000
Message-Id: <1456158261-13992-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] findutils: upgrade to 4.6.0
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
X-List-Received-Date: Mon, 22 Feb 2016 16:24:28 -0000

Inherit upstream-version-is-even as minor-odd releases (such as 4.5.x) are
development snapshots.

Change the SRC_URI back to using GNU_MIRROR now we're not using a development
release but a stable tarball.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/findutils/findutils.inc                       | 5 ++---
 .../findutils/{findutils_4.5.19.bb => findutils_4.6.0.bb}           | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/findutils/{findutils_4.5.19.bb => findutils_4.6.0.bb} (77%)

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 37c84cc..bfedf87 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -6,10 +6,9 @@ HOMEPAGE = "http://www.gnu.org/software/findutils/"
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
 SECTION = "console/utils"
 
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI = "ftp://alpha.gnu.org/gnu/${BPN}/${BP}.tar.gz"
-
-inherit autotools gettext texinfo update-alternatives
+inherit autotools gettext texinfo update-alternatives upstream-version-is-even
 
 ALTERNATIVE_${PN} = "find xargs"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/findutils/findutils_4.5.19.bb b/meta/recipes-extended/findutils/findutils_4.6.0.bb
similarity index 77%
rename from meta/recipes-extended/findutils/findutils_4.5.19.bb
rename to meta/recipes-extended/findutils/findutils_4.6.0.bb
index de39a89..072d3b3 100644
--- a/meta/recipes-extended/findutils/findutils_4.5.19.bb
+++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
@@ -3,13 +3,13 @@ require findutils.inc
 # GPLv2+ (<< 4.2.32), GPLv3+ (>= 4.2.32)
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
- 
+
 DEPENDS = "bison-native"
 
 SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
 
-SRC_URI[md5sum] = "1428516452520b51cf893c05500eda3d"
-SRC_URI[sha256sum] = "e9bc769d78573c91b1d4e504ad39621b870db6fa38fde923acf6896399f16f8e"
+SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
+SRC_URI[sha256sum] = "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"
 
 # http://savannah.gnu.org/bugs/?27299
 CACHED_CONFIGUREVARS += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
-- 
2.7.0


