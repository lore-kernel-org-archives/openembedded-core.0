Return-Path: <livinsunny519@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086EBC5DF68
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 01:09:32 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11974.1771636168462925697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 17:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VtBB2pHo;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: livinsunny519@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7d4c307db9aso1338119a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 17:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771636167; x=1772240967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uniOxKKiULdgLzosKiww5K+6hlIYLTZBVy49P6NHlpg=;
        b=VtBB2pHosiME5uV78AETkft3Iug5p1/YfsLL0LwLGrzj9PxPboZlIlZPZ06A7wsnTQ
         2hKoEMHiM9uRmDV7Tt1SJFyCWoC3fpyHTUb7Vz5XEGEkCSI4F3aonO9AP9+92Ehj3Zgz
         J0hZanTjjLaTZd0aWD5WLoYO2lxtfHOnlr2vua/wGDFq25GRU4ssV25afJ00uqDOnOtw
         GB97/sMqOr/3aUlptpoof9xeS2mSodq6sbW9ggEDCsF71NkXDNRN/Z8iK7O1bSj61Luv
         U+Yh3JFJYGRuC4OF7IdnK1wf4B70v9fwodNKV0AW+CE+6ZmsHqRUBUzAJ0f5f9QS7jBI
         JTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771636167; x=1772240967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uniOxKKiULdgLzosKiww5K+6hlIYLTZBVy49P6NHlpg=;
        b=Ck/q+0mK4WmUKgcEV58FzAxuEuL20BqYOzck9zOETCKcA2ZO8jO6XczTm0FaczHnn1
         N8im27QEOVJbk+i2bf0ozO1OBhzNZho1bRHNT3fvO2jkna7BFH3rdhNbDeao5/a4htNz
         8ViiZHOCNxwpw4AGvRx09k7P5ZzKgsvi9xFyYZcQKWS8yA5tyHa8mRiOk7PAGk8yL1Li
         yFZOKBMad0C7Xo2Nquu+tRN5TOO9GCy9sKJz7/InZXYRzBf0NDMWXedfCV7YdpTxhHEI
         KQSH76IzxNS3zATNkdEOovxBmTtpfwvLyVgWmMJhBn9gcMvGO9pdhKzwASQXZsOCj9Ab
         dQhA==
X-Gm-Message-State: AOJu0YyI8uxWXN6lc+5yYKZ0FA5gRI4ZrtSwefiVfq2VE4jT7/Jmk/OV
	Fav2t+H5OYyW59OD8R03+8HIajuHxwNjILrSPXbhTy2NWSrcMZKMXVkhEemRb1YZ
X-Gm-Gg: AZuq6aJ90dRC81RhDVWAM4ezZgKZVF9mDbxVbYwmxxW5S7R5s4mnOUTTouwYjN5Tcha
	qWT/3fSbmxs/tXqDbaQvM0nio34Noi5doLyWyuyIAP5iMoGBcgnmiDtIP3vAnRe+taH62+MfS7b
	3q/eW52961TMJewjcmR1o2kl0pTO2lCVmyMMqi0g6SWi9QG8ldft3AnPrkT/kFpcf1FAgLSJwLy
	mPRs0r6hhiCAdVPvECXzUoGH/6Sxbz4E/Atp3JDA6j3EuLRB88hQCSfgNYR8cbdITNmQYiNM5Iw
	vFrcRKwzKPMqfu08bR0WfgiNn8C/ESYNEeKHkfLH4ADRcZBU+BkEEW9c28y720mBZFm1WltarwY
	VCmTkqIsWseG9/daK5v4tlNo/WYyz7t73+zjYvkY4q0v2fFkPOH34rYjY0HuIl9mKBb0dbYlmkl
	VdkJ5zw0BHMvDWOj5Xk8vnpdAyQxHV6UOfmS68bdGm04RQGw==
X-Received: by 2002:a05:6830:651b:b0:7d1:94d0:e8f1 with SMTP id 46e09a7af769-7d52bedcb8fmr1078877a34.15.1771636167405;
        Fri, 20 Feb 2026 17:09:27 -0800 (PST)
Received: from OLA-4NW0K93.ad.garmin.com ([185.153.204.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52ce63069sm1159609a34.0.2026.02.20.17.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 17:09:26 -0800 (PST)
From: Livin Sunny <livinsunny519@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Peter.Marko@siemens.com,
	Livin Sunny <livinsunny519@gmail.com>
Subject: [OE-core][scarthgap][PATCH v2] busybox: Fixes CVE-2025-60876
Date: Fri, 20 Feb 2026 19:05:36 -0600
Message-ID: <20260221010838.3369126-1-livinsunny519@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 01:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231555


This patch addresses CVE-2025-60876[1], which allows malicious URLs to inject
HTTP headers. It has been accepted by Debian[2] and is tracked here [4].
The upstream fix has been submitted [3] and is pending merge.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-60876
[2] https://bugs.debian.org/1120795
[3] https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
[4] https://security-tracker.debian.org/tracker/CVE-2025-60876

Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
---
Changes in v2:
    - Updated the commit message to include details from debian.
    - Updated the upstream status to submitted.
---
 ...control-chars-in-URLs-CVE-2025-60876.patch | 42 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch

diff --git a/meta/recipes-core/busybox/busybox/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch
new file mode 100644
index 0000000000..aafd0ec60b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch
@@ -0,0 +1,42 @@
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Fri, 21 Nov 2025 11:21:18 +0200
+Subject: wget: don't allow control characters or spaces in the URL
+Bug-Debian: https://bugs.debian.org/1120795
+
+Fixes CVE-2025-60876 malicious URL can be used to inject
+HTTP headers in the request.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Reviewed-by: Emmanuel Deloget <logout@free.fr>
+
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/091840.html]
+
+CVE: CVE-2025-60876
+
+Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
+---
+ networking/wget.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index ec3767793..fa555427b 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
+ {
+ 	char *url, *p, *sp;
+
++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces in the URL */
++	/* otherwise a malicious URL can be used to inject HTTP headers in the request */
++	const unsigned char *u = (void *) src_url;
++	while (*u) {
++		if (*u <= ' ')
++			bb_simple_error_msg_and_die("Unencoded control character found in the URL!");
++		u++;
++	}
++
+ 	free(h->allocated);
+ 	h->allocated = url = xstrdup(src_url);
+
+--
+2.47.3
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index d3f259d45b..b7a8ad2ed5 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -61,6 +61,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-39810.patch \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
+           file://wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
--
2.53.0

