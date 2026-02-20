Return-Path: <livinsunny519@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB5DC5CFE6
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 21:51:21 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8665.1771624275019722267
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 13:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JG7HZA/G;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: livinsunny519@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7d4c383f2fcso2175820a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 13:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771624274; x=1772229074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOqRDXTa8CwzsFZQ0bXih5jy5JRx9OU3Tf8rRlui/GU=;
        b=JG7HZA/Gxf5GNlmZ/IRUk+PBlAJRdS6Q4r+R4L+Bjx9U0jusIAbaQfi1luZw7SfU3Z
         uushZjVNAQ8Y/wYPMaeQ3mMIZUCQxS6NLIcH6xRvnuWFaMDpeJ2O0eMEbchHLIbRk9jE
         sF2cNH3MU4rrI2zV/U4/y137oi1qd6/7mhQwTO3aLRCx3gcy/hRZb7mL6trIgiDg67rB
         eqAQY4xulMuizmcc+JaZxPFFbUHWL8fg1YI8y85t14Uak+iagCCbcO8NrRb5fH6qBSpp
         n58N3UMPsodN/RgrOepYAP7GXZjSqaSBCL40f+pAp5O1wJ/jH6dZCxnP8F30svmiERV5
         OqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624274; x=1772229074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOqRDXTa8CwzsFZQ0bXih5jy5JRx9OU3Tf8rRlui/GU=;
        b=qIFdgKZBEs5wu0HGAbB+/UYRtqlg47roC21Bs+5IAMrxye+IHeP0SN5oMCbEkQK5k7
         bd76fYUbqkbD/r96rJyNnq9i3BEENllqz6+B65OvApESnM5lbZ8acAutQeS3jP12m8c7
         JcFxW0P7876vP/3DUdBEDRAJZEklD3Q/8pKw69tb/badiARBJuf+WmgDszS8drEEdFs+
         N0sYueEfGZd0jg9vSJQ20m/vOkm/g6m5N3qSrgpuj7H5xx6fxqEZOJI9KQGgs9e5Ds6A
         /VFHIs3gUmJ1C/pdrA3DxAGn6m/s6tEVQr8D4G3OhGraQDicUZGF8KS67wj/DIQQJ3Lx
         /Q2Q==
X-Gm-Message-State: AOJu0YwBj07OVNMQe3o/2ZeoZNg6Z08J7wd2gmHLrFOlGvtaBmV7LEbt
	8MKkKgciyUt33Ap7fQb6ytwBdWqPULS3qjPTqpxFW9pwseP1YFoIjpgDNpyf0mZX
X-Gm-Gg: AZuq6aJGP3ajW9EhWeQgcuIA7AxIlQTtr3ixsKVnOxdTx+LHna/gaWiaPPdSLNCnaft
	Qqyf7nF4bKoGg+TuuIq5qh/xZ0bKbKrEw3TDDxZWvtfBKVxQdaXrE2Mq1OLoHq3BZGRQMl3xEo3
	lGe5CzY66DTPllNmovgjN04HGrqfs1jcbfJ4cq2pyY0lqTuYmF+Ft7wqEjr1EVGqN6cTiNlxdTe
	XNls1TbS5QZ7D9hMm5Qtb2tnJJFoFH2vySmzTcpXXPlkVmgTplWTcJcTCnmHmCCXht79+x40aFH
	bAypRT1vHVQOLuj9d41LX2x06ZKdr8AmMAg8U2F7N38iItY2b7aMIhodZy54tsgTRhxGJ5D+Pyr
	F4Z+8ViZJgsm3aFOo8r4SJO6Z96AzPLtPz6roUAxNOTzx2RXcq0iTbJeAA7IaC3q9wwdxeXAKDI
	3WZ58Iacahr/BClakl/GseqcOvQCTmaB6CegP/2ql+T9ozAi4wQnpBU2Hf
X-Received: by 2002:a05:6830:6adf:b0:7c7:6977:17cb with SMTP id 46e09a7af769-7d52bf17394mr813630a34.21.1771624273885;
        Fri, 20 Feb 2026 13:51:13 -0800 (PST)
Received: from OLA-4NW0K93.ad.garmin.com ([185.153.204.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf9f5b9sm598013a34.8.2026.02.20.13.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 13:51:13 -0800 (PST)
From: Livin Sunny <livinsunny519@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Livin Sunny <livinsunny519@gmail.com>
Subject: [OE-core][scarthgap][PATCH] busybox: Fixes CVE-2025-60876 malicious URL can be used to inject HTTP headers in the request.
Date: Fri, 20 Feb 2026 15:49:13 -0600
Message-ID: <20260220215043.2883581-1-livinsunny519@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231552

This is a backport of the fix from [1], which has been submitted to
the busybox upstream project and is tracked in [2].

[1] https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
[2] https://security-tracker.debian.org/tracker/CVE-2025-60876

Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
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
+Upstream-Status: Backport [https://lists.busybox.net/pipermail/busybox/2025-November/091840.html]
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

