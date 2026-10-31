Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3730.1793405755315604870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZLEgMXIb;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so14290345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405753; x=1794010553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+cCW7z1GOgC62nQq2ic1PLhwlMAHSkksR3BwekheGs=;
        b=ZLEgMXIbM/Pd/6H0VK39gAZwoZrEFDzXM76FzXHhRXXScU2w+/dCk7bjTYakjAV9t2
         J2ZtGhYR6Av17Bxtrzxs6HFHeJD4uw9PkaCc8gEOtejYBDVC6sXo2SVBrt3lr1TAnGVb
         Teye2h9F+3YTOox2lLy4uinK2u7BBlMs2WlHHnM4yRwYQQO+zM8meucLMU3tRaLQSx6y
         c2hMlPKhuOqvrsHvD3awkVNsnSCEtiHVFQ9TVPG4AK1caBYLUUx7YGIrlAUiYlRDuLEF
         YGCEGEQ5frWN+94/F522zh7enIKuwzQz/96sjg2+h4JEj/WtuoWX4z1t5O4cq+kGhOtB
         GlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405753; x=1794010553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+cCW7z1GOgC62nQq2ic1PLhwlMAHSkksR3BwekheGs=;
        b=Hr+p4AsExvJKI18hxYLQ1iZBwGvivx6qvnvOAFVyIedOythFfAbomiHpuKYfViUeU9
         cWAO/B6AZ7ugt4pLzVjFhjSJ/xr2tv2PXDKkq7nuIfegP3RddMbEsJa7yJcKpFQUPque
         ofKyBvoRTgWoHhZaG7W5et2y+fLYR1CXi2GEk/hrDGgRsu8/7Ef6S5mU+OwtrwU0+W7M
         MSk5dDzSXGxZmbUS7y3uLMAdxvRm5hmbWupUJijisCbAdRZ7vbvLrrt5MHHJS78LuOH3
         2PQhQVK3gE3fIAqTc+C49UdipqbxIFsM8t99/P5Xx9j7PUsg3CtEmA76mI2Lw16HJp7l
         gTrQ==
X-Gm-Message-State: AFq9FYLMqRq3wBBpenVKpoj+oXwgrROC1xyp5TzFo7l9o5x34X1ad0ap
	D9un7d1Qwpys47LKHLsUOz1NHAFXBE1ILaW/Qz8EcppEIWHixl7rO0GB+Q6QU1aVi59mipRHy7U
	nWitXHxA=
X-Gm-Gg: AYBFou0X6aszXnx942ApJ+flHmQuk78mMqsKnruJihRSBwCfBnXA9gP0GCnFtHfFVG9
	DNj0tXd9B7C8NOLjeNVL7nC6ANARJFsHIOarTTfdMPykjJ9aPFHaO4hKrTU7jqbJCejZMJy6AGV
	l/Of/SgapP4C1o+ZGZ0MjwOQsKALMKcK3vDWjAj4fA/2oc1XRME52UJHZkWiulZqHDW4U9Fr8OG
	ghZ+p0cAVa5+Q5xP/uMSVtDfxt30Ldfn7l66HR++FNfAkhQIwx9arvIsP3kZZFCyMrQNmsaFoZz
	uoX2l19B1tz+ON6OtBSX+8dXtzQ5mz3Ux6kzX5r10UMafgUxytNwr+JtEmGB3hu8OsbGMJABhEX
	8+3RRfrlmy9AqCCP9IXMBnEyfixvjSDm71an60qV0r1PMqh7Vwm0BUx9CS4rwJpY2q0sQA5covJ
	J5Z9lLwl7DO7hmEdWQR/d/Z6C6Vq/u2UOOOQd4D7FFzYl5KgSbJynujX6l80Z414V0Z7UGXTvae
	T5BBP0Y5UeAjbOhm6XuOgNtByX38FCJ/F4i7m2CqHsYOLeWch0XjLYUQLQZdJfL/c9O9ugZl77S
	vdH53AAmnnG2Fo2aDky6IBD2FZdyFzrAHsPwtbl9NjoKAkjHsRJufD6ziY+yTdDJo5NRMML7nv5
	C3Xnn5BKMOy/V8VHkE9o16Q4DkfAJkSFmFkmKr9T/DFbM54iyfQ==
X-Received: by 2002:a05:600c:1d16:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4ac151a8fd2mr88694795e9.2.1793405753545;
        Fri, 30 Oct 2026 17:15:53 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/55] libpcre2: update to latest release branch hash 50b3c0d7ce
Date: Sat, 31 Oct 2026 01:14:39 +0100
Message-ID: <dc683396c1a767e7f3125daa4a4335b850c58b67.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249093
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-103111, CVE-2026-86145, CVE-2026-89158, CVE-2026-89160,
CVE-2026-89157, CVE-2026-89156 and CVE-2026-89161.

The project committed to have 5 year security support for each release
on a dedicated release branch.
Switch from release tarball to git fetcher to use this feature.

Git log with all changes and manually created CVE annotations:
$ git log --oneline pcre2-10.43..50b3c0d7ceaf23578d04e644c02781c322ef6cb0
50b3c0d7 Backport of pcre2-10.49-Fix-large-stack-allocation.patch [CVE-2026-103111]
b7d3ffd4 Backport of pcre2-10.48-Fix-DFA-workspace-overflows.patch [CVE-2026-86145]
9c11f0dc Backport of pcre2-10.48-Fix-compiler-integer-overflows.patch [CVE-2026-89158]
2866e543 Backport of pcre2-10.48-Fix-invalid-UTF-backwards-scans.patch [CVE-2026-89160]
714e1062 Backport of pcre2-10.48-Fix-allocation-byte-sizing.patch [CVE-2026-89157]
91759151 Backport of pcre2-10.48-Check-JIT-mode-before-validation.patch [CVE-2026-89156]
87f50503 Backport of pcre2-10.48-Fix-JIT-match-context-reuse.patch [CVE-2026-89161]
ed0e58f5 Backport of pcre2-10.48-Fix-JIT-STR_END.patch
dc733f56 Backport of pcre2-10.44-Fix-incorrect-compiling.patch
7f3e5400 Backport of pcre2-10.44-Fix-locking-region.patch

Diff of release tarball and git repository is:
Only in pcre2-10.43/: aclocal.m4
Only in pcre2-10.43/: ar-lib
Only in libpcre2-10.43+git/: autogen.sh
Only in libpcre2-10.43+git/: .bazelrc
Only in libpcre2-10.43+git/: BUILD.bazel
Only in libpcre2-10.43+git/: build.zig
Only in pcre2-10.43/: compile
Only in pcre2-10.43/: config.guess
Only in pcre2-10.43/: config.sub
Only in pcre2-10.43/: configure
Only in pcre2-10.43/: depcomp
Only in libpcre2-10.43+git/: .git
Only in libpcre2-10.43+git/: .github
Only in libpcre2-10.43+git/: .gitignore
Only in libpcre2-10.43+git/: index.md
Only in pcre2-10.43/: INSTALL
Only in pcre2-10.43/: install-sh
Only in pcre2-10.43/: ltmain.sh
Only in pcre2-10.43/m4: libtool.m4
Only in pcre2-10.43/m4: lt~obsolete.m4
Only in pcre2-10.43/m4: ltoptions.m4
Only in pcre2-10.43/m4: ltsugar.m4
Only in pcre2-10.43/m4: ltversion.m4
Only in libpcre2-10.43+git/: maint
Only in pcre2-10.43/: Makefile.in
Only in pcre2-10.43/: missing
Only in libpcre2-10.43+git/: MODULE.bazel
Only in libpcre2-10.43+git/: pcre2_fuzzer_16.dict
Only in libpcre2-10.43+git/: pcre2_fuzzer_16.options
Only in libpcre2-10.43+git/: pcre2_fuzzer_32.dict
Only in libpcre2-10.43+git/: pcre2_fuzzer_32.options
Only in libpcre2-10.43+git/: pcre2_fuzzer.dict
Only in libpcre2-10.43+git/: pcre2_fuzzer.options
Only in libpcre2-10.43+git/: README.md
Only in pcre2-10.43/: test-driver
Only in libpcre2-10.43+git/: WORKSPACE.bazel

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-support/libpcre/libpcre2_10.43.bb | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
index f744df88fad..743b0ec04e5 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -10,23 +10,27 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
-
-GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
-
-SRC_URI[sha256sum] = "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb"
+BASE_VER = "${@d.getVar('PV').split('+')[0]}"
+SRC_URI = "git://github.com/PCRE2Project/pcre2;protocol=https;branch=release/pcre2-${BASE_VER}"
+SRCREV = "50b3c0d7ceaf23578d04e644c02781c322ef6cb0"
+PV .= "+git"
 
 CVE_PRODUCT = "pcre2"
 
-S = "${WORKDIR}/pcre2-${PV}"
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2026-103111 CVE-2026-86145 CVE-2026-89158 CVE-2026-89160 \
+    CVE-2026-89157 CVE-2026-89156 CVE-2026-89161 \
+"
+CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
+
+S = "${WORKDIR}/git"
 
 PROVIDES += "pcre2"
 DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled github-releases
+inherit autotools binconfig-disabled
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
