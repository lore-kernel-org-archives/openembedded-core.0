Return-Path: <livinsunny519@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF51104891D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 22:43:45 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108696.1772232221524187735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 14:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxnoEvrb;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: livinsunny519@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7d18c654458so1210724a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 14:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772232220; x=1772837020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zibqCtcubVgCQXE5zJVCTnbnhkbME18DCkzCzjvQQPY=;
        b=hxnoEvrba+EROvhKnYwKHOhO69ZqraXmV5LSCMiBQUowPxfs6fWc7secuXKlCNgj4Q
         DH6kW2Uc1pKeMmjmQ1sgiyV0F0J6EstSVg8GKief5jBg3wE+/uNTtamDdU+DDz8sXh7x
         yogB90VT7SLF7UC1A2GZni+oO8IiF+DvGCzE2TiWJd+bDdGzHn54AVbIuX4vvv8dWX4I
         oY608DeU1yf4pBOz0vKU9wAsZj4TNA315QNpb6eeKxPwAcxNeYM9CngtKx30N34Cvmai
         EPEbb8tp8zvH5be5P3/IFVlQkuN5CYSRuDWqVDdGsr4OtL7aYuPkAn4MHZmzQzakYIyO
         ceAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772232220; x=1772837020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zibqCtcubVgCQXE5zJVCTnbnhkbME18DCkzCzjvQQPY=;
        b=O2rJK7LxJlarBX0nVLKE2K7xgojIez9sGOZAOtj8LWAcfRMPj9dvdXgfa1aAe5Hv8W
         Oi0kZOBCuGQs1S8Q/Ux5cMQbaXR+EbYbA/+qWZz6hDU0a7ic46iPJLSIRayhnokXARBu
         0ZMo2cbO9Ww3FzAErHHLyf/phpfJ1OXkAHa0LZiTVL3akeVSheMIrFCb+JdmuFY6/3yX
         wg3bEJWlruT/tGd1/9705FqmiWZHx8Y9Pm3rPLAfGnZCDbWLeeQg/CSMnZR5/q+lklrA
         +DXenmQAzx+TPxBY2cE6vw0RLNTE1uvzrUVxKca0qu3yhevBHoiThIMI2d5DjElSAOcq
         LdjA==
X-Gm-Message-State: AOJu0Yx/Zw58pnLVRRMXUxNhDIJodnU2anP7FmCkl5sXd8Fmj2I10iJW
	Ao7Z4qPJfoI3+KBbvit1KTfApUBtkfGC0sR1z59Zemdp1+lCOvvOQrq73dzQQDyK
X-Gm-Gg: ATEYQzypS7rScwzWyvd8gu3FUclyM5poJWW9OMAnNFRqLaQYUjcUBBWJsx3qRS9n2ze
	0teElc9i7QdXaCVKlnNJAXINGdjVy8hDJoEBx+VM7IgE53G2z4RXelyxFUbo72HLGdDo0N4osb9
	SAezt7xVRB0YXUzzolO+WVyAOxIVMbeSCeQ3F8n8f01c/89VL6fEc9J2EZ1MyjtsS7wunVXpyO9
	prhsqMsj4DLMTMjSfjy62HOjIw9bGg25LUOvefflPG7hNVW/X4RMh+MmFyOETBss5H2h95AXKAA
	Qn0hs4J5ZZZu8OO2YcyAZD9RFqkDwXZ/AQnbxknYF+IHW9VDqYwdkc3Yn7jTcVvevkQF5WxJbE8
	1JDSnhL93d82NhqokC1N/9l2WnC1PEfDZKK7UglVk2iPusmEhxQo+v0PFIaLNcbQrzx2Z3u7PgO
	W1p6OlMBdFHoFNuVXM8rIRLrqftSWD/6xa2C/hA5AdowjruQ==
X-Received: by 2002:a05:6830:40c1:b0:7c7:6bb4:1197 with SMTP id 46e09a7af769-7d591be492bmr2993124a34.24.1772232220503;
        Fri, 27 Feb 2026 14:43:40 -0800 (PST)
Received: from OLA-4NW0K93.ad.garmin.com ([185.153.204.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644edfbsm5081934a34.6.2026.02.27.14.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:43:40 -0800 (PST)
From: Livin Sunny <livinsunny519@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	yoann.congal@smile.fr,
	Livin Sunny <livinsunny519@gmail.com>
Subject: [OE-core][PATCH] busybox: Fixes CVE-2025-60876
Date: Fri, 27 Feb 2026 16:38:02 -0600
Message-ID: <20260227223836.505041-1-livinsunny519@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 22:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232117

This addresses CVE-2025-60876[1], which allows malicious URLs to inject
HTTP headers. It has been accepted by Debian[2] and is tracked here [4].
The upstream fix has been submitted [3] and is pending merge.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-60876
[2] https://bugs.debian.org/1120795
[3] https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
[4] https://security-tracker.debian.org/tracker/CVE-2025-60876

Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/0918
40.html]

Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
---
 .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
new file mode 100644
index 0000000000..1cf29680e0
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
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
+	char *url, *p, *sp;
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
+	free(h->allocated);
+	h->allocated = url = xstrdup(src_url);
+
+--
+2.47.3
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 9e6a7b7b4c..d3851a27b9 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -58,6 +58,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
+           file://CVE-2025-60876.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
-- 
2.53.0


