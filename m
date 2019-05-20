Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 358797E07C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 15:48:14 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m141so23675096ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5lyb/LE4zvC9IdDDJrXwu1GamAaqnXoZhoiTHvKiOa8=;
	b=mbq2Q9FSDDt1dUfYJ86Hp7fI7Z7X4VsCbwgCkivVOuN16cAza9oaykHPecUViDUqzi
	KBYKficvt8yelDQw2T6dbr2rS0gOyySVfVKZfgu7RcKPwvgniFcx8XGRWIcs/6a0tMX7
	t8HUqtHHefkoWVzEV4aHlbf4igee+hIURdVm2VVwZq8+7Kbr04r+EU2B1PHOd8zCS47D
	RQTQmsNalfiNBXHyhDhfnaL1qx089rDFwfNN366cZLwwdb/sk71cEukVWd8Sg2BnKiCK
	WJ6i03K2qDDhC7fLBpnBKQHzmf0mBCNMNXan3rBvmHvcs2UFJI3yKHviOcmTpTT1Mzj8
	tOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5lyb/LE4zvC9IdDDJrXwu1GamAaqnXoZhoiTHvKiOa8=;
	b=EQipKljtuofm2IKJF16EKkw4hH+/5UV3RnIn3fQx7FVKe9WfitBOjmCztLyC/XHKhW
	o+iiejO+7V7IHHoJk0D2dfasiA+Zly6rK3QqcUyo4t5v1U/DQ9ItHnOYayghwj8WY11G
	SDi6tK/hoR1RpW1Ym0ETzpFT/Dn6xF5i8U6/jRSpgo8IesAA1YddQ9UVMjOK2anKgOYb
	wT5Lil13C0aVv6P+LsifPWhEVXU2+R0EGnixQoZOGkEnRX3+ZlJFv1gKXQLgiFmlCYH1
	LrJW8L6oKizzc0bO+cVi4Vw5vxFIlIj4aNtNfj1uhZJKnULIiqHOTZtxeo6lIdK6+1Ze
	1XQw==
X-Gm-Message-State: APjAAAXDkzyLJ2sEiWA1oYq4oU3Xt+lIPeakpzjewjK2HWwRn8A82xOa
	DU7AP/LpljqbRBR5/WuzV/zQDbxe
X-Google-Smtp-Source: APXvYqy2ufF+ljpMbDE7SWNVzbqjUjxoEMD2ya9rG2Y8+KLKGpBHkH5JIlc13MjrNC2DrECMezRxYg==
X-Received: by 2002:a05:6638:518:: with SMTP id
	i24mr15375294jar.3.1558367294837; 
	Mon, 20 May 2019 08:48:14 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x20sm5765983ioa.40.2019.05.20.08.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 08:48:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 10:48:12 -0500
Message-Id: <20190520154812.17088-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] zip: Remove build date to improve reproducibility
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
X-List-Received-Date: Mon, 20 May 2019 15:48:14 -0000
Content-Transfer-Encoding: 8bit

Applies a patch from Debian to remove the build date from zip.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../zip/zip-3.0/10-remove-build-date.patch    | 19 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch b/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch
new file mode 100644
index 00000000000..244ddea363a
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch
@@ -0,0 +1,19 @@
+From: Santiago Vila <sanvila@debian.org>
+Subject: Remove (optional) build date to make the build reproducible
+Bug-Debian: http://bugs.debian.org/779042
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+
+--- a/unix/unix.c
++++ b/unix/unix.c
+@@ -1020,7 +1020,7 @@
+ 
+ 
+ /* Define the compile date string */
+-#ifdef __DATE__
++#if 0
+ #  define COMPILE_DATE " on " __DATE__
+ #else
+ #  define COMPILE_DATE ""
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index de779e94aae..a2cd7717caf 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -10,7 +10,9 @@ PR = "r2"
 S = "${WORKDIR}/zip30"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
-           file://fix-security-format.patch"
+           file://fix-security-format.patch \
+           file://10-remove-build-date.patch \
+           "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
-- 
2.21.0


