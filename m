Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30973.1795560741990361336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=aKapO+hx;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4165972f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560740; x=1796165540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RyJ/exhlhxDgV5d5IIVwXOdPuDWA1tW6niRBhohRVmg=;
        b=aKapO+hxqNJh4IfRN78lzTAJCxTHZueDTnC0B6EUiA180sHheC30w87uaPkmNhQIRH
         M44ooQDo5oQaP2do1zVVc6mR9Nw6tsiGrh9gy7I476qOffFTCl4IZ8W9X2VJEBW/5rXt
         qnXHY09l6Lb5RNAHl6gVvxGcxrF0CfZ4Fdyf59bBPZJUxdKhe/TP/OfZZf8ijYeL4nrN
         rL0fZk0n9ml9gR26voxUTwieIax9U+e096xALtBu0jGRX+tXxxskTdxyQ+AuZdpj3NK3
         uI+pROVVJm77OLrMa+cPmiUCOWJohhiobK2zik/qpG3fMIZ5/8QwhvwoGaVfEB4+StSx
         ephQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560740; x=1796165540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RyJ/exhlhxDgV5d5IIVwXOdPuDWA1tW6niRBhohRVmg=;
        b=kgGXUVNiYRKNq45ZNCdhl5abS8r9TA2SxCW/7yh04Tr7QpkW+gkUmot7HxLjheDa6G
         g4CPOTpxRF2ihS1AcNOpr6aBEhwdL5jY7L3+AjlwfT12m9A7waszAVF5IO5Ihuux1QOC
         IZiYfvLklvcANmJHqFVQxh9n5pbVI5LwEG15fIUQf6yEAS9dC372mU+LRJkhkXLEFLgq
         haTcuIx4aSZ4BvT2ssQ1gqK6WdgnDxpUfVyPxUomcMcumrYL9HI6VShTBTFz84wNxPb4
         ngKX4MbG5vKY6JHIYVNHea8Wx/qdC6jeEe6kNDygPs6dM1ZlAKCpOp6QY7vKHAKNmUhv
         WZGQ==
X-Gm-Message-State: APuU4Z+PEAPO9YQFfHLxNPILVxPGAWHoGINzo6O9qvL7KOXbJpmVTzBO
	LyhD0ImsorHYYqZG53VVHWNkCX7eqIZtofSxmDQOVHluZG1CIRY9bFmWWT6/4uBE3OfCAqPYdP+
	A5Uh7qIg=
X-Gm-Gg: AZFdTZeRd8i7Fcmk0MBkl2fAo2hwqDDU8HrZv1/EXgGQEuItO7BUnoTih5pwLCfSgvN
	6VtRlefaDDURIjw/kjeHsj3ahz0M2wr3mx70Q0nFh3e225ZRHVS5jXu17s8ckz9FO2/ACDnFOuU
	IDUgMJUx30QqcoEmUqeL7NJmaiykWZss1eDoDS+BwxkGC/gLYNDYq/CFzRuLVSU9Cvm2kVJN3Kw
	Phel2c3t9kGcE3uR9pGV4sEcT2bpVaIq0Q+SNwOsTDfzGedXwaVIXxwv6lq7b4DJHCKNkvoGVzX
	ncgw+6KAi+Vr8ZEnAeBvizU48yKCqgAHjuKxqx7L/o1Gelb7yBDvOP4c/3fHcR376KYgX9NvlJi
	sAiHq5eTQVjFQ7eAktSmnkH0o0ffFX6ZOsj3b7jAVo2zHG/Js2ytJIz01+dMsEKUAZ9azrRcEi8
	iF10T1pfxYZ+HorQvC2VLYvR0qBoov4CSzDcza9qV2jmWHZDJbwF5HoulagIbRdakawzX8fLNjG
	NyS4RdvSntSBymLyCg8hw8P2trLY3yr+Hg+iMwV9xmU1ZLW7SMp+idcq8Yt8aLdBkFovu7OkI0k
	4rEk4wETU67UxscnZ676YMUDD0EbJBXN5U0XSj1qV5BseNoVwVa5e6McAYOO7VwvcvIuzWj81Ip
	02Ku00Z2QXs/j1GWGzm4u1rxWTe4Q
X-Received: by 2002:a05:6000:2b84:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-4abb42ea6e4mr20391830f8f.49.1795560740237;
        Tue, 24 Nov 2026 14:52:20 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 01/21] glibc: stable 2.44 branch updates to f715e9491c
Date: Tue, 24 Nov 2026 23:51:08 +0100
Message-ID: <8fc17de6ee27f1b4e249c5e27afe51f5fa21e4c1.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251081
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Including fixes for the following CVEs:

CVE-2026-84243 CVE-2026-100290 CVE-2026-115819

git log --oneline 34106fee6...f715e9491c
f715e9491c (HEAD, origin/release/2.44/master) Add a few BZ entries to NEWS
063fdd4c7e stdio-common: Fix double null terminator in wide scanf %s and %[ (BZ 34989, CVE-2026-115819)
fcfb867c58 posix: Fix double free after allocation failure in regcomp and regexec (BZ 34991, CVE-2026-100290)
438677ef49 intl: Restrict path traversal when using LANGUAGE env var [BZ #17142, CVE-2026-84243]
48fa38b921 AArch64: Fix libmvec archive member collisions [BZ #34946]
47e2b57041 io: Fix silent readdir failures in ftw/nftw (BZ 33085)
c5c6fc6f44 elf: Set the library path for tst-ptrguard-static-dlopen (BZ 34966)
a0b0ef791e aarch64: Fix SVE tanf mixed-lane results [BZ #34922]
71eeab669c aarch64: Fix SVE log1pf special case results [BZ #34940]
f1bbb002b4 aarch64: Fix SVE log1p helper mixed-lane shortcut [BZ #34923]
21442dba0d linux: Add C++ and multiple inclusion guards to sys/pidfd.h (BZ 34752)
b9b1e925b6 AArch64: Preserve SVE pow/powf base magnitude across lanes [BZ #34921]
27fd010255 AArch64: Fix SVE pow and powf negative-base predication [BZ #34920]
a527fd2510 tests: elf: Fix flaky thp tests
534e36bbf7 io: Reject fts_open root arguments longer than USHRT_MAX (BZ 34782)
d1e132966e io: Fix fts_pathlen overflow for paths longer than USHRT_MAX (BZ 34782)
42c8bd03fb io: Fix fts_set FTS_FOLLOW in a physical walk (BZ 34775)
eb288d8cef io: Fix fts FTS_CWDFD return from a followed directory (BZ 34781)
5a068df1b6 configure: Fix have-no-error-execstack substitution
00f6968bbd aarch64: Return with ret from the la_pltexit path of _dl_runtime_profile
6b0445bd0b Makefile.in: Run the build directory goals serially (BZ 34699)
fb9f408983 x86: Bound Hygon non-temporal threshold [BZ #34875]
045c51476c linux: Do not return stack garbage in sparc tcgetattr c_cc [BZ #34734]

Testing Results:
             Before    After    Diff
PASS         6634      6634       0
FAIL         141       147       +6
XFAIL        16        16         0
UNSUPPORTED  606       607       +1

Changes in testcases:

testcase-name                             before  after
io/tst-fts-bz34782(new)                     -     PASS
io/tst-fts-bz34782-root(new)                -     PASS
io/tst-fts-cwdfd-follow(new)                -     PASS
io/tst-fts-follow(new)                      -     PASS
io/tst-ftw-bz33085(new)                     -     UNSUPPORTED
stdio-common/tst-wscanf-nul(new)            -     PASS
termios/tst-tcgetattr-stack(new)            -     PASS
stdio-common/tst-vfscanf-bz34008            FAIL  PASS
stdlib/tst-getenv-signal                    FAIL  PASS

malloc/*-malloc-check tests are flaky under QEMU user-mode and flip
in both directions between runs (14 PASS->FAIL, 6 FAIL->PASS this run,
net -8 reflected in the FAIL delta above). No malloc code paths relevant
to these were changed in this uplift;

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d6398249ff6fa5a35b7481979b2d168d69498bf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.44.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2fb355a29bd..0971422e4a2 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.44/master"
 PV = "2.44+git"
-SRCREV_glibc ?= "34106fee698c83eb0af71d4d0381e66b399be746"
+SRCREV_glibc ?= "f715e9491c062bbb50d32ccb05a8debc488dda39"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index 886a15f1572..c3400d98450 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -24,6 +24,7 @@ CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "\
     CVE-2026-5435 CVE-2026-19542 CVE-2026-18374 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 \
     CVE-2026-8674 CVE-2026-86805 CVE-2026-89092 CVE-2026-95818 CVE-2026-97399 \
+    CVE-2026-84243 CVE-2026-100290 CVE-2026-115819 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
