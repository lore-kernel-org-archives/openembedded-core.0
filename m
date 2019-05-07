Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE8A7D42D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 20:49:43 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id o16so12857623lfl.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 13:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8SMDe6JHVXCBlOwnAwXuF/KuUjqDpMmJJnF/nsKIus8=;
	b=HRi0COvfChMgXP8+x6KiHOtec1D86RzrTyoYf58T7IbVhyV0iocQaBowf2dOOZZWY2
	Peww12tw3XfZMF/0L13wLplWYepgYbvM4FfQJ/LmFZ/0oMHpHcjDUgy+Pa2X1hIjrJoC
	DgHbXs6dm+zdjqPtst01XJVmlOl/ImszYTWUM67Uans3cyMKVLvXsZjMo1yeQ5uOWY80
	saEsFtr4L9b/eLpeTjvL40Cw0N3BfbxpXGYeLdc5v0bLM76xmsKSNaYfJOjdYrKOFy2m
	jBnLWvX46PdunQrK6rMxEh6zEa1VSEO/NDx6Aq9oOm8x+hkvBQ3/ybYeGiuu5MUiwhf8
	MBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8SMDe6JHVXCBlOwnAwXuF/KuUjqDpMmJJnF/nsKIus8=;
	b=BFU5zDhvHbUCQHCR8asDKqA0sqqLPEWM0truqGlWVRX6zNOTNOyPo3ZjGZHEtPypyw
	3/I9pNVx4W7cczaCUsSmTWwt6cbuDP/bwGkLXvd1Nlkh9oNYEripBikRdyBfvPfAmryw
	DZYOctnG487Rjfvhq3UnngdkOarcIOCOJRSFVRARnernhYEjaCvaiBgHxL1sXBobJyJd
	6rv6ohot75hZ0IJD33gFNxqIOwxw4dwzJNiHeGukT66jXJXR+wyDrYNlYk5tDlDrmnrz
	NniHZT0lAGRJRJd/sNXwF2VVoXtefhN6ywIE5nnzpSBsfnkeawLKcBxdqZ4JkSYP+Q9w
	sMBw==
X-Gm-Message-State: APjAAAWLNw+6GwpTz3ygB9rJHsHcQPx9hGS6NMtpcH3oOqeGcsMd4Syb
	/hEKb6gXBYLp6VMJtAELjEaxDQSVpOw=
X-Google-Smtp-Source: APXvYqyvfERlRHNqPkM5AesjsrbMjWkMMpSdSiazz/o3Kq20hk5HFTjmk7l875uoOPfgiFMBm9ufuw==
X-Received: by 2002:ac2:443c:: with SMTP id w28mr15402363lfl.38.1557262183945; 
	Tue, 07 May 2019 13:49:43 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y10sm1889541lji.12.2019.05.07.13.49.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 13:49:43 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 22:49:33 +0200
Message-Id: <20190507204933.21767-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] mtools: update to 4.0.23
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
X-List-Received-Date: Tue, 07 May 2019 20:49:44 -0000

Removed patches were mainstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-fs-size-is-not-divisible-by-sectors.patch | 34 --------------
 ...move-LOCK_NB-to-use-blocking-request.patch | 44 -------------------
 .../{mtools_4.0.19.bb => mtools_4.0.23.bb}    |  6 +--
 3 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch
 delete mode 100644 meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
 rename meta/recipes-devtools/mtools/{mtools_4.0.19.bb => mtools_4.0.23.bb} (82%)

diff --git a/meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch b/meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch
deleted file mode 100644
index 1f8f8351c4..0000000000
--- a/meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5cc8d1f96ab6d3459e13631d8356f87381562352 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 2 Jun 2016 09:49:44 +0300
-Subject: [PATCH] Continue even if fs size is not divisible by
- sectors-per-track
-
-Filesystem with a size that is not divisible by sectors-per-track is
-not broken or invalid: it might be unoptimized on media where
-heads and cylinders actually matter but that should be it.
-
-Preserve the warning but make mtools continue even if fs size is not
-divisible by sectors-per-track.
-
-Upstream-Status: Submitted [info-mtools@gnu.org]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- init.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/init.c b/init.c
-index c9152e0..4e16a01 100644
---- a/init.c
-+++ b/init.c
-@@ -338,7 +338,6 @@ Stream_t *fs_init(char drive, int mode, int *isRop)
- 		fprintf(stderr,
- 			"Add mtools_skip_check=1 to your .mtoolsrc file "
- 			"to skip this test\n");
--		exit(1);
- 	}
- 
- 	/* full cylinder buffering */
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch b/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
deleted file mode 100644
index 47385a582b..0000000000
--- a/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5bdbfe0a63fed48104b17412854b26ee2275869a Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 22 Aug 2018 16:54:39 +0800
-Subject: [PATCH] remove LOCK_NB to use blocking request
-
-While invoking mtools frequently, the unblocking request
-caused race issue. Here is an example of syslinux
-[snip]
-dd if=/dev/zero of=floppy.img bs=1024 count=144
-losetup /dev/loop1 floppy.img
-mkdosfs /dev/loop1
-syslinux -i /dev/loop1
-|plain floppy: device "/proc/6351/fd/3" busy (Resource temporarily unavailable):
-|Cannot initialize 'S:'
-|Bad target s:/ldlinux.sys
-[snip]
-
-The idea is from:
-https://bugzilla.redhat.com/show_bug.cgi?id=1235016
-https://groups.google.com/a/chromium.org/forum/#!msg/chromium-os-dev/bRPUCFHoBTQ/ZjB8kjjx1vUJ
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lockdev.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lockdev.h b/lockdev.h
-index 4467bc2..5a135ad 100644
---- a/lockdev.h
-+++ b/lockdev.h
-@@ -43,7 +43,7 @@ int lock_dev(int fd, int mode, struct device *dev)
- 		return 0;
- 
- #if (defined(HAVE_FLOCK) && defined (LOCK_EX) && defined(LOCK_NB))
--	if (flock(fd, (mode ? LOCK_EX : LOCK_SH)|LOCK_NB) < 0)
-+	if (flock(fd, (mode ? LOCK_EX : LOCK_SH)) < 0)
- #else /* FLOCK */
- 
- #if (defined(HAVE_LOCKF) && defined(F_TLOCK))
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.19.bb b/meta/recipes-devtools/mtools/mtools_4.0.23.bb
similarity index 82%
rename from meta/recipes-devtools/mtools/mtools_4.0.19.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.23.bb
index 7d59d93a81..2ae69797a4 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.19.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.23.bb
@@ -24,14 +24,12 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[md5sum] = "f750246a65ee6f9d2e82d10b03a0aaaf"
-SRC_URI[sha256sum] = "1bc197199ea1c2c317f597879486eeb817f3199b526d94cc6841624768d910df"
+SRC_URI[md5sum] = "1d17b58c53a46b29c7f521d4a55ccef1"
+SRC_URI[sha256sum] = "f188db26751aeb5692a79b2380b440ecc05fd1848a52f869d7ca1193f2ef8ee3"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
            file://no-x11.gplv3.patch \
-           file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
-           file://0001-remove-LOCK_NB-to-use-blocking-request.patch \
            file://clang_UNUSED.patch \
            "
 
-- 
2.17.1


