Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2089.1794939637124347701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QOTp++lL;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so56434f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939635; x=1795544435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8mVLtEmEnFQ0XIsi9ECFtmqXmpe+dYG/8ln7WOGnDmY=;
        b=QOTp++lLpf48nH/MY2TAinGC0/Zi9K/B2Pf4SF/SWLoV1Egq7HpyQVdnNNFmXluknF
         RtVCMuVLmZOWhzoUyFKuzuDEcV7F25k0W5ufVVsurQkOfVOWOw8VUNIDgzSDBdJgse26
         AxEYBogynirER7iIlzCp7a9nI6zyPyP3A7qSDutwdZU+eOkTLJ8JN8je9gl+Nz4D8tzs
         sPc/NaQar7Ob05j/hFJYf17nKffDg9mw62uEypbGAt7XvXBED3lxVNj9SDGyvYj3KDhW
         E9VU7D6E6DYOe8oWuYa6ngMWRKDTKEIXrTeRiKFRC02zF1H6XNIN1p+w8XG7i2SUSem4
         bgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939635; x=1795544435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8mVLtEmEnFQ0XIsi9ECFtmqXmpe+dYG/8ln7WOGnDmY=;
        b=fwzJ9JImb8RQgpVHfJql5go+VoM1D6NEkwWtG5n4iCt5mKj+Hzsv77PUSVa4OSZgHF
         jZxz7JPbVH9wme8gzCvBjwMzBLjjQr0Umd6Awd/xpjNSRT5Xy5TL+VHzcGMknp5Xz+dY
         +IPWQgcHmzRpwnZudIW7ND24Bi8f6R/L3IUWokhYMYNSr0RZlWZ6Ic+iIovi5fmxCOzj
         GSB6rMSwXAuX/CfaSYcWyn7LN8kZXaKCMv131/HUrO/Wa009jW5W6YLc5tSILiPvRMxX
         4svyoE1502VFNJ+DMaAQQuAcMaU0RCa8uaJMMk/CSLCVIEhlgn3RtUpgzkpgkMzRvvfH
         pQhA==
X-Gm-Message-State: APuU4Z+GNudf2yzYopm015ext9ngeUtZfjkYP36jFGSmFNP3+Hko81Vm
	4+zc0zMq/t54TykTFbTNPBQAdtxIg/cekhRrerH5hUshtJ3hhOV8YMP83dmoveyEMnNUFSU3JVW
	Akwn6KgI=
X-Gm-Gg: AZFdTZcKIKD4dJwOHgv22ybT5EHSHB11znsxwbd+U5dXA2SLgwD2ut01TcEkGZDQ4Wc
	QpOuf8g53c2Tvzerl6qCvkfwvt+HryU7Qm9mkKijF+A5IWq8g7iHZkUI2U/1iystWyxhAmhV+GN
	6zR+oMaqU4DtWzolsfuGiCoiOqV8I74Dky15bYt/mxkZUExB6KiM6LARLrLrK4Bl1qIs8ohDL/v
	cHLBEymO4x1ZBV8OZVdWAmF6mRyDU38uUDNycn3mYP/pH76+tJQ4hat2lLTTyH3YipbZT4Y6qSC
	pbKceER4qAv+HcFHIbLSo53YA3xmeg/bH04i1FQXaZpikHy4lpiyruFe6zhPa5wsMIa0xVSWfuG
	trgJM/4a2hHpjLqumU7NAywMT1glRdXfwatzztHuQMiwK4lXumiQ7PLmXdmrUNelzhAWjikLuDL
	sSzM8Ue16NhNA75Vw20pG83UUVOrGkr3CsPmqDAVa6BL68E8+Sevv4ii3wG/5WLIh9qR9GGXZ3Z
	qVOIWLNzJjeIHp6p1v+Xxwsb28irwqs2dbpGH7ZO9LMNpP6eH5vAeUERw490npPRNVr2/xThYq5
	JxZiD+DVkXCzIXWU5Lj9HOJeUqEq+M1AGxYpZJSBqcyOdOYEdhO+geanA8CqtOR9JJ9iVpwy3SV
	I5583ODYBh3PtdrBxQ+T92D61dAJN
X-Received: by 2002:a05:6000:2686:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-4a637f64026mr640218f8f.13.1794939635255;
        Tue, 17 Nov 2026 10:20:35 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/17] rsync: upgrade 3.4.4 -> 3.5.0
Date: Tue, 17 Nov 2026 19:20:04 +0100
Message-ID: <0cd228d028dcf9185ffdeb0b3a2a062917bc7e79.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250471
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NEWS: https://download.samba.org/pub/rsync/NEWS#3.5.0

CVE:

CVE-2026-53802
CVE-2026-53803
CVE-2026-53785
CVE-2026-53784
CVE-2026-53793
CVE-2026-53795
CVE-2026-53796
CVE-2026-53797
CVE-2026-53799
CVE-2026-53800
CVE-2026-53801
CVE-2026-53783
CVE-2026-53786
CVE-2026-53798
CVE-2026-53788
CVE-2026-53789
CVE-2026-53791
CVE-2026-53790
CVE-2026-53792
CVE-2026-53794
CVE-2026-70461
CVE-2026-70458
CVE-2026-70456
CVE-2026-70457
CVE-2026-70459
CVE-2026-70464
CVE-2026-70455
CVE-2026-70453
CVE-2026-70452
CVE-2026-70463
CVE-2026-70460
CVE-2026-70462
CVE-2026-70454

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a5de1c212718d3918dfbe9b6ab770dd76316d6f)
Suggested-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: Compare log: https://github.com/RsyncProject/rsync/compare/v3.4.4...v3.5.0
The Yocto Project TSC granted an exemption to the stable release
policy for this rsync version upgrade, see:
https://lists.openembedded.org/g/openembedded-core/message/248203]
---
 ...g-prototypes-to-function-declarations.patch | 18 +++++++++---------
 .../rsync/files/determism.patch                |  4 ++--
 .../rsync/files/makefile-no-rebuild.patch      |  6 +++---
 .../rsync/{rsync_3.4.4.bb => rsync_3.5.0.bb}   |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.4.4.bb => rsync_3.5.0.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index ede0238b2ef..5aed93e458d 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From c05cc113f925bda645c8e51b83e9dc30b0543bad Mon Sep 17 00:00:00 2001
+From 64e62c659649593239ed39ed40a3ae689bf2d593 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -24,10 +24,10 @@ Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
  4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 24e46bf..6ae3178 100644
+index 4c91c2b..b3635a0 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -796,7 +796,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -37,10 +37,10 @@ index 24e46bf..6ae3178 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 24de64f..a787488 100644
+index 7476f6a..b939a0c 100644
 --- a/exclude.c
 +++ b/exclude.c
-@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
+@@ -460,7 +460,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
  	memcpy(partial_string_buf, s_start, partial_string_len);
  }
  
@@ -50,10 +50,10 @@ index 24de64f..a787488 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index b948f16..afca81d 100644
+index 889b57b..19e5e98 100644
 --- a/log.c
 +++ b/log.c
-@@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
+@@ -140,7 +140,7 @@ static void logit(int priority, const char *buf)
  	}
  }
  
@@ -63,10 +63,10 @@ index b948f16..afca81d 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 229a889..aa158ad 100644
+index 6050d0e..45722c4 100644
 --- a/main.c
 +++ b/main.c
-@@ -246,7 +246,7 @@ void read_del_stats(int f)
+@@ -250,7 +250,7 @@ void read_del_stats(int f)
  	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index a8fee5ba0af..2eea267bb2d 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 32852028e95cdf78d09f1bd867f3b46b4728f9e3 Mon Sep 17 00:00:00 2001
+From c4c9b52a864c3b9ff67771b9d881a78276448100 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 0ba2d5c..b9c5438 100644
+index 91807d6..c18b4be 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 914b50a7b7e..4ff070ea3c6 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 50ef5ccd9149cee27bae29e767ff1c2e76bdc879 Mon Sep 17 00:00:00 2001
+From bab7abb3c7c1c1db8ef6c3084c1ffb5152f5bf1e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 79060b3..0ba2d5c 100644
+index 801e864..91807d6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -200,60 +200,6 @@ conf: configure.sh config.h.in
+@@ -265,60 +265,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.4.bb b/meta/recipes-devtools/rsync/rsync_3.5.0.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.4.4.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.0.bb
index fa9a61778f6..d9a4884d96e 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.4.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96"
+SRC_URI[sha256sum] = "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
