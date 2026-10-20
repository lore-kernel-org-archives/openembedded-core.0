Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4738.1792538582100912059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=NZ0cHtRI;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so690415e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538580; x=1793143380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WZD5hx3ySZOizCvlESRUe29eoGnRf/XzXkqfKW1d0zA=;
        b=NZ0cHtRIyIhrUpC21eRsriHzQuIuAEo9KpdzEmrACI5IM8rdpumTKC9s8FQGpwZzmV
         +Gn2MOgF7m7ldjFPhjEMIIEU1o9yXC93yasINf/xftXjEBNQA4Q6WgvBxn2y8nk77O1j
         lgaMHCuv2ESclGR5fy7SP9vAGAKL/ms+g7HAkK5J7XM/cpZ1KtfmmKVRQyEIdp6TrN64
         qzttNy28d1DECori15stFtWJD4tglOWSKMOuaXPZW1JOLpUNYN72m9v4paBXwWnYCIQh
         ZFAaLd7ihUMXffbjKvdMxGaTMwxtPTY+1iEY9IIQHFmvEOIK+IdnUCTgrv7OrJVaqXQv
         n5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538580; x=1793143380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WZD5hx3ySZOizCvlESRUe29eoGnRf/XzXkqfKW1d0zA=;
        b=gbhETSv2RrxEhi+MnvbgLisBQ7W2LbVuthGM293Mp0LGqHmJ8MShJfFVSBxgdsFpYK
         9HqiujkdZDGsw0W6HZugSTQZBopnziH3dJf6taNum3CCtwEichjKc934UowKmFzzWSi0
         KcHAEhJF0jq6qzzuu/Oqcc85jO3IBwck3PFJTscv0qy1S4G+QVhIyme4zdzBtQnZYOmy
         KleN9en4I4ia41/89KtxpvCMsoyByBMwbZpz2cmSa5BjfjfgHvvkiwrgPYcw9mt7Emmp
         pyX/DVbUlK777je/bnLz56tsz01GsOBpqcV9bVjs6NWQr/oDvqYzKq0WQTvDbeUO3/94
         1sIQ==
X-Gm-Message-State: AFq9FYKxLU/V2+5tTRg0v1CRlp301rfbGnE5xPq4kPx1jeXV9JshvpQw
	VjaK3rIlXuQU4/lrHvkcgcGIktivVgQgwHxGPUCqzL1S0iWffahOOOLYXei6QJ8+t5a6aUL7ocf
	rah6CwXE=
X-Gm-Gg: AYBFou2+inzNrF+pJ55nnBbU+VwGLey8+71qMwvLyIsSZhtilOPunB+XRkuGu0ge70f
	kPzPWy5gPtMUyrBmoyPLRBczF8hz6n0oDzdbi5L3rF+aRT/IVjtFM8Gkn0JIsZBvwaodo9blsyu
	5WgNuUFOVqYBYiPASmc/FDd+1RC//Qq9N2dj+AWiIKjqv+/kM+iynT0CM+UlqWOigFBLFcrHnO7
	VkGLS1wqwJ5Pz78wfoXykyRtdERy4dlFIkowzxJ4NvZB2GYnTFavmQjTShak9qIKCKBHogvX4Wv
	Hjc45UcPSNQz4sPJBvLEMdVm3n1o4b/R+2mov3eAtfaMUcKHRFTyLCzr6HkR9kc8rGbETXU8z8a
	H8rpr8FUkNj2X6YTpztfzwCMiX69+VzqRtPqpRBVQofLRdPue0E76ed6irGBSAY3kJG3HsWX2PQ
	q728OoUkg1IvCMokAxGoAqsavgV9S0BbcRu6FSMEezxhrCyv0/qBIC3hbqH0/yuCKNnp9Y0gMyJ
	x4FtklY7U7HyAq3P3x5Dbh1NHA9hyKpuXq8vClpv8cFH6W+Kk2x69pBKT/gUCp5r7Wqj+AbScaS
	aoRhwlXy2sAY81p+wpJyO7A59SDF/LeJnGO3v0b9E7DB2HpfQ7ycCexs
X-Received: by 2002:a05:600c:8506:b0:4a1:d957:733e with SMTP id 5b1f17b1804b1-4a1fdd4b4d9mr3509735e9.26.1792538580285;
        Tue, 20 Oct 2026 16:23:00 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/25] libpcre2: update to latest release branch hash c084f99ae0
Date: Wed, 21 Oct 2026 01:22:25 +0200
Message-ID: <d13c54dea0bc62cd9bbf36634b9f5e0139da506a.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248334
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-103111, CVE-2026-86145, CVE-2026-89158, CVE-2026-89160,
CVE-2026-89157, CVE-2026-89156, CVE-2026-89161, and CVE-2026-89162.

The project committed to have 5 year security support for each release
on a dedicated release branch.
Switch from release tarball to git fetcher to use this feature.

gitsm is used to fetch sljit subnmodule. It is not used by default but
can be enabled in downstream layers via configuration option.

Git log with all changes and manually created CVE annotations:
$ git log --oneline pcre2-10.47..c084f99ae0af664e86819fd1839a13c56dc0918c
c084f99a Backport of pcre2-10.49-Fix-large-stack-allocation.patch [CVE-2026-103111]
cb7193ac Backport of pcre2-10.48-Fix-DFA-workspace-overflows.patch [CVE-2026-86145]
586e2ea0 Backport of pcre2-10.48-Fix-compiler-integer-overflows.patch [CVE-2026-89158]
2c7492a0 Backport of pcre2-10.48-Fix-invalid-UTF-backwards-scans.patch [CVE-2026-89160]
1d6cc92c Backport of pcre2-10.48-Keep-escape-error-offset-in-pattern.patch
75ca1974 Backport of pcre2-10.48-Fix-allocation-byte-sizing.patch [CVE-2026-89157]
5528f329 Backport of pcre2-10.48-Check-JIT-mode-before-validation.patch [CVE-2026-89156]
69aa0df5 Backport of pcre2-10.48-Fix-JIT-match-context-reuse.patch [CVE-2026-89161]
1e058b41 Backport of pcre2-10.48-Fix-JIT-STR_END.patch
120f76cb Backport of pcre2-10.48-Fix-scan-prefix-repeat-reset.patch
e4d6d427 Backport of pcre2-10.48-Fix-repeated-substitute-escapes.patch
0ac26ee9 Backport of pcre2-10.48-Fix-character-list-generator.patch
dcfab032 Backport of pcre2-10.48-Write-serialization-padding.patch [CVE-2026-89162]

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libpcre/libpcre2_10.47.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 70079e0b65b..5bdb647f52e 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -12,25 +12,27 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
                     file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+BASE_VER = "${@d.getVar('PV').split('+')[0]}"
+SRC_URI = "gitsm://github.com/PCRE2Project/pcre2;protocol=https;branch=release/pcre2-${BASE_VER} \
            file://run-ptest \
 "
-
-GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
-
-SRC_URI[sha256sum] = "47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7"
+SRCREV = "c084f99ae0af664e86819fd1839a13c56dc0918c"
+PV .= "+git"
 
 CVE_PRODUCT = "pcre2"
 
-S = "${UNPACKDIR}/pcre2-${PV}"
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2026-103111 CVE-2026-86145 CVE-2026-89158 CVE-2026-89160 \
+    CVE-2026-89157 CVE-2026-89156 CVE-2026-89161 CVE-2026-89162 \
+"
+CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 PROVIDES += "pcre2"
 DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled github-releases ptest
+inherit autotools binconfig-disabled ptest
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
