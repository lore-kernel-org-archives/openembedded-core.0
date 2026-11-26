Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5437.1795726315676129869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 12:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KyHjiWRN;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38190551625so14249704eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 12:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726315; x=1796331115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEGWOtkPHfyJNqinGDruADJ5xdp+9jKY9k9J5M4a8v0=;
        b=KyHjiWRNv68xW4C1UZM/nyIpSOPTlpw1xFV5wXyOW207LUxsLSe2OEgeJHBIQLkOKp
         iFIUjrmNZcNCAQngAu6nwXjjjuV+AwiMpV71rF3+YjUQAvDBBom1r6iy2hc8iG711F0u
         TlfXNKZQdHUFbJzaOuHffxtfWzENkPT4G876A5lPboHLBeyaj4fjL4zLjQAN/bqVhVjT
         KEEqL/YHstfOWvOVkvF0AzZzNhSOL+VxXqhgz8NNQAzC8XgmWyNkQCi0B65TgKCkHnw2
         NlMoaZhSbmDIP6FbAV2uscRabK8zARhvmDfN0LCzHnM9IluxxQUysKsE6bYbvz6Rp+9p
         IQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726315; x=1796331115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEGWOtkPHfyJNqinGDruADJ5xdp+9jKY9k9J5M4a8v0=;
        b=uGT0tLOdETWfKSEes3MUrpzimSEuxu3DyyknOzwniQbRhIomM5gcePOGl+crpRuzi/
         /+RPoS/eWlpXhX7PtnpAlHPnd9qiaJApkyEauo+yHQuDJ6+Ox1ssld/N9OlaHmctTmSp
         mutwb0qLIwkB6HtKzVUgxJmlfOuiY6IoLv9FUmdxySJBmG8vdegs57SxHcpE1WpiHjUn
         1XYmWWKf3WV0RstmTUDc0OkmV8jbRTghI1kJRpHeeB6GlzYUgUqVsm90ruvKZxDz2f10
         ABhb8hV/VrNv9FrfRS1Et8cW+kkF7C5hmx1/RLmZ/VoneKR4mVS/qVwAU+e0SU7w2jia
         jJjQ==
X-Gm-Message-State: APuU4Z+d55orimaStSYdg9f7yULaDY1qA/uWAQg1AO05X/uhv+4Gi5Dy
	th4MHxoTG7I2E1c7Vl8xFeNvL6MBwRSjcSut/8bBrgSTyKx6DY5POVcUqjusv7UB
X-Gm-Gg: AZFdTZeaFj8KHvxd4TXvGTyMUWsJekFQqr03S37RlSycpMsYIJY9lLm2Opa8w9TzGUO
	R+cPT0M9kKptZHms7yHCTBkb2YncXAtSTOLMtbXEafBvzsCPcb5wmO/ArRMlrb6qYqNgl95V78h
	5bWqWRS91W+nCIVhNi4/R+IvGHUt3ZsbVvykoHKPNcKAHGfo34PfB2HL5o80QoNayY1JUiWomE1
	ZVIvn1jdpTESpbIp/SY1ZTdGbr2M0z8qUD7XTAaknV02Raok+MkVUEzUh4Gf0d6YEoem7rSUxCV
	PamPNF8LDhV6QwggFqDMXpw1Aa6nBINnY9uYE1vMGRQDjY4rDipb6DHxTRnu4CCnM0pJMIGK/IJ
	0jd6RBHxvHWSCWEjLUkec6Mz23+YhMiut0t2vC3hIfHv6kP2G1RCY6qLAqexmD5T8ZInvM1b6JI
	bpmPNWBLt+MUyHlyEpjusZPp7GNOMm0pHqS3bDqSIi2FGc1cWKPsjngj1MEGN44gn6r1HjYXGJw
	fu+2xj4k2iIl8bjFwaK73JYRAAXGpJjvIfe53SO9GEtYcNxltJfhY4TSf5UP6f8J78TdB2vqCfC
	93btgTLfBO+qhacut/W9hg8FEFt8UFtF8Lrwjqqm/PeVfn9cO8h4ZocqPrkFS1svRaG/3XRCDfu
	bGhZljZLvgUdyRE0384CSn6wb3fOSgh80gNpHuwXTwg+9iKgXgXZwpwtz5CuJv/PZSWltV7CNfe
	l9PX25r1X96NnaNm+ovDs9W+Pl8E6oiqzFdXsoXX5eBLczGbAu4WQ+1/+H1gIyVtu2qu+pI6SS0
	UFuqqSvFO7fSMKlijGmGbKKfOgjUM5S4+HUjgcRud/oDiJ+0pVHVrJUZnhVueyucadI5jBybcw4
	8FSu3fkVPlE6uQ9TDoNejz84Hg==
X-Received: by 2002:a05:7301:1402:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-3857025f297mr20505945eec.26.1795726314823;
        Thu, 26 Nov 2026 12:51:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm25002969eec.17.2026.11.26.12.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:51:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] musl: Fix local time before the first transition of a zone
Date: Thu, 26 Nov 2026 12:51:51 -0800
Message-ID: <20261126205151.830763-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 20:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251329
Content-Type: text/plain; charset="utf-8"

When a zoneinfo file has exactly one transition, scan_trans() applies
the footer's POSIX TZ rule to times before that transition instead of the
first time type. Slim zoneinfo files, which tzdata builds by default,
often have a single transition: Antarctica/Troll reported +02 summer
time in 1970 and Antarctica/Rothera -03 before 1976, where both should be
-00 with a zero offset. Python's zoneinfo gets these right, so the
python3-time-machine fuzz ptests failed on musl.

A scan of every zone from 1970 to 2038 comparing localtime() against
zoneinfo finds no remaining file-based mismatches with this fix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ime-type-before-the-first-transition.patch | 54 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0006-time-use-first-time-type-before-the-first-transition.patch

diff --git a/meta/recipes-core/musl/musl/0006-time-use-first-time-type-before-the-first-transition.patch b/meta/recipes-core/musl/musl/0006-time-use-first-time-type-before-the-first-transition.patch
new file mode 100644
index 0000000000..c5127237be
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0006-time-use-first-time-type-before-the-first-transition.patch
@@ -0,0 +1,54 @@
+From fdc1a798a6450803ebc08c3b66518bd8feba1c85 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 18 Nov 2026 05:16:17 +0000
+Subject: [PATCH] time: use first time type before the first transition with
+ one transition
+
+scan_trans() checks whether the binary search ended on the last
+transition before it checks whether t lies before the first one. When a
+zoneinfo file has exactly one transition, both are index 0, so times
+before that transition are handled by the POSIX TZ string in the footer
+instead of the lowest-index non-DST type, as RFC 8536 specifies.
+
+"Slim" zoneinfo files, as zic writes by default since tzdata 2020b,
+often have a single transition. For example Antarctica/Troll (footer
+"<+00>0<+02>-2,M3.5.0/1,M10.5.0/3") reported +02 summer time in 1970,
+and Antarctica/Rothera (footer "<-03>3") reported -03 before it was
+founded in 1976, where both should be "-00" with a zero offset.
+
+Check for t before the first transition first.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2026/11/26/5]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/time/__tz.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/time/__tz.c b/src/time/__tz.c
+index df57fec1..0f57a1d9 100644
+--- a/src/time/__tz.c
++++ b/src/time/__tz.c
+@@ -288,9 +288,10 @@ static size_t scan_trans(long long t, int local, size_t *alt)
+ 	}
+ 
+ 	/* First and last entry are special. First means to use lowest-index
+-	 * non-DST type. Last means to apply POSIX-style rule if available. */
++	 * non-DST type. Last means to apply POSIX-style rule if available.
++	 * Check for t before the first transition before checking for the
++	 * last entry, since with only one transition they are the same. */
+ 	n = (index-trans)>>scale;
+-	if (a == n-1) return -1;
+ 	if (a == 0) {
+ 		x = zi_read32(trans);
+ 		if (scale == 3) x = x<<32 | zi_read32(trans + 4);
+@@ -308,6 +309,7 @@ static size_t scan_trans(long long t, int local, size_t *alt)
+ 			return j/6;
+ 		}
+ 	}
++	if (a == n-1) return -1;
+ 
+ 	/* Try to find a neighboring opposite-DST-status rule. */
+ 	if (alt) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index fa5cbb04f5..cbdb7178f9 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
            file://0004-math-enable-FENV_ACCESS-in-expm1-expm1f-hypot-and-hy.patch \
            file://0005-math-disable-FP-contraction-in-jn.c.patch \
+           file://0006-time-use-first-time-type-before-the-first-transition.patch \
            file://ldd \
           "
 
