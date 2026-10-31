Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3724.1793405747426523394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=lbhXekNF;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso13070825e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405746; x=1794010546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tihIuS6HEYFiLoZFeu6yeoBHUuRFrXSHpwSm7TMmtrE=;
        b=lbhXekNFxGeRxDcfB9BVo44MzsAgezr9Ug4MSnmdCN2t2tP+Wul0AvDhmY5JB7PAZm
         R+SYGMkvhIpSvq2657M29C6uGxGPDX8ZWap5i3e/eKwasVl/Mm2YtrmxPNVAq1E+BIO2
         9L/CuKo0lljSvlYeiU4iNjyLK7NcavBD6UBrHVFGQ3r/jDBM8THuEvK9hv3XGE/HGTsa
         vXkTReIZeWRWZn12dBxVU8Nu0bdrmekWY0kqBO/1lCiLcos2I4VeqLMg1UqsV/dvQ1bu
         iceaSJBLwiFO2705l35xNKpT5gwO2QDp22LSR3KbVCqwFucumbMpvr+XYfS6YIqovtrY
         muRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405746; x=1794010546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tihIuS6HEYFiLoZFeu6yeoBHUuRFrXSHpwSm7TMmtrE=;
        b=Lfrz1IH0g9ZKQQH0083DkFV+iyE3lyn9PEhQnuqswR1FyaBz1Z7eQss0TBsFfrgHJk
         Qu8u9sEpm3kLY0uhoVkiRbE3S2Jvy2gD02kZssYFP4/sdYTHD8VbY/1hWLZMYF3221y9
         QhB1xs1e+8w1ACJFRYb5SK2Cq654KgqNwYB2F8R51BNuj6R923iZh0MK1RLk9NK1T95+
         s2ZVbwBA8Oj8UjD6m80eUR7mTXINrGPWHZ41CFikiNMsB26qWQk3HRL9RlSAJYilwnho
         TrpIu0wa6Xp//uzMn5NwKOfAcMICfh93tz1BQupmQKhNSEA/ZTFU43c+c2XeMEK4t4ZT
         Mp/w==
X-Gm-Message-State: AFq9FYI/qEOw/0xHk6jGDe8sAw0UfKxzIJSXnXzHuU5YxFw7xWXJiYHy
	OnIeGFlGzUT+H3hjsdCSIzyQn0rIPy1xeVmrUNgmUhXyS2OHD9laXqHrE2f9kRLjo4hqt2YycQS
	+Re+5Usk=
X-Gm-Gg: AYBFou0HjFr+WdMWrN1o64KABxv03+1QAzQuDtp+1GBE/0WMkd2Mwha9Hh9fPPrMCxi
	t5XOXjDN9PkQDzNyIWkJhtX9LgjpoU/SDhT3PUry4z48K78P5Emf3Rh68G+Uao6veCZxg1f57fK
	vCPP4QWHJA99T4NmmJ/a7JAyv8ys8VVnW5o+moziJRC/vbCatBSVJpdrepV5MrdSItBgkL1IeXl
	Yvh/DcMSqAvD6kfdYY9Gz3epczihcEnoJnuQSPlhyeHGPQwHExl6CrVYDfAw5zy9p+WsPIx/1y/
	BQjRhffJxdgT8tHuDLkszJ4lflT6VkGOIHGlRdJ2GBP7fGCxgYBpfjbqNFKHsUhgMXM5OwKw/+n
	W72z2jJYJx9LGWo7W/21y09o7MEcO2pvueEdE8eCWG6cF2ak0XcWKfZdzoSK0lJuNWviRrzCKws
	gsXFetXGV0g+5KigLu5E/taYRd0wS4g1ExO84s51JuFSKron+iNUgZPWzT/ri9MVXDIXEcvOAmj
	8rOe/+8Q4/M8mSZ270EJou6JaF1SR+cubBNmI/6iBROhWeXv4X+bXZ1dUmelRaPKVv27qZaau86
	tPrSoosRfPfdxHCdUs36I6dZ5qZ0SA1rldpJmvtQTK4RBixQCDvMiv5GXKqhGPDtMAJ/053tmuO
	zbOCJXKSRfYFR+SbUWTBCZ+aYF1RK
X-Received: by 2002:a05:600c:4e48:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4ac183d16eemr82871405e9.23.1793405745645;
        Fri, 30 Oct 2026 17:15:45 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/55] util-linux: patch CVE-2024-28085 regression
Date: Sat, 31 Oct 2026 01:14:26 +0100
Message-ID: <c7ffef273beba79f1c63eb1598b9cae98efc3f70.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249080
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.6 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2024-28085-0003.patch      | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4b889927c80..6598a92b30f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -56,6 +56,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch \
            file://CVE-2026-53613.patch \
            file://CVE-2026-53612.patch \
+           file://CVE-2024-28085-0003.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
new file mode 100644
index 00000000000..63d09ef4a1b
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
@@ -0,0 +1,77 @@
+From 61b49b7160bbb6780279344574746617e7fb11a4 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 24 Aug 2026 16:37:28 +0200
+Subject: [PATCH] wall, write: sanitize hostname in banner header
+
+The CVE-2024-28085 fix sanitized only message bodies via
+fputs_careful(), but the banner headers in wall(1) and write(1)
+still interpolate the system hostname without sanitization.
+
+An unprivileged user can set a malicious hostname containing
+terminal escape sequences via a user namespace (unshare -Ur -u
++ sethostname(2)), and wall/write will deliver those sequences
+to the terminals of all logged-in users.
+
+Fix by routing the banner output through fputs_careful() which
+strips control characters.
+
+This is an additional fix for CVE-2024-28085 (CVSS 3.1 score: 3.3).
+A new CVE ID has not been assigned (yet).
+
+Reported-by: Skyler Ferrante <sjf5462@rit.edu>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 9ce8f2b5aefa011ef5b0c34aa14df9bb9db02dab)
+(cherry picked from commit f358b098d47659837d85b66fb387201224b272a0)
+
+CVE: CVE-2024-28085
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/61b49b7160bbb6780279344574746617e7fb11a4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ term-utils/wall.c  | 3 ++-
+ term-utils/write.c | 6 ++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index 7a4a858f5..c1c47d531 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -316,7 +316,8 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		snprintf(lbuf, lbuflen,
+ 				_("Broadcast message from %s@%s (%s) (%s):"),
+ 				whom, hostname, where, date);
+-		fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
++		fputs_careful(lbuf, fs, '^', true, TERM_WIDTH);
++		fprintf(fs, "\007\007\r\n");
+ 		free(hostname);
+ 	}
+ 	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+diff --git a/term-utils/write.c b/term-utils/write.c
+index 3784f0300..d680d7464 100644
+--- a/term-utils/write.c
++++ b/term-utils/write.c
+@@ -233,6 +233,7 @@ static void do_write(const struct write_control *ctl)
+ 	time_t now;
+ 	struct tm *tm;
+ 	char *host, *line = NULL;
++	char buf[512];
+ 	size_t linelen = 0;
+ 	struct sigaction sigact;
+ 
+@@ -262,14 +263,15 @@ static void do_write(const struct write_control *ctl)
+ 	/* print greeting */
+ 	printf("\r\n\a\a\a");
+ 	if (strcmp(login, pwuid) != 0)
+-		printf(_("Message from %s@%s (as %s) on %s at %02d:%02d ..."),
++		snprintf(buf, sizeof(buf), _("Message from %s@%s (as %s) on %s at %02d:%02d ..."),
+ 		       login, host, pwuid, ctl->src_tty_name,
+ 		       tm->tm_hour, tm->tm_min);
+ 	else
+-		printf(_("Message from %s@%s on %s at %02d:%02d ..."),
++		snprintf(buf, sizeof(buf), _("Message from %s@%s on %s at %02d:%02d ..."),
+ 		       login, host, ctl->src_tty_name,
+ 		       tm->tm_hour, tm->tm_min);
+ 	free(host);
++	fputs_careful(buf, stdout, '^', true, 0);
+ 	printf("\r\n");
+ 
+ 	while (getline(&line, &linelen, stdin) >= 0) {
