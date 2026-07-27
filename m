Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B17C54F4E
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43741.1785192971993790467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0ohtEn34;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so31573025e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192970; x=1785797770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WU+B07CSF1iTe9Hjn1I9bj5jA82zfVESlvb7YrV5XmQ=;
        b=0ohtEn34/cm9BqrFbbDiNutiBiusdFVe1sBNSSCHn5PIJ35Q7AhqrLn3xVN0h6ANnZ
         YA8AyUdhjQRH+b82NMML0ZNf0VGZNUc2QJg64i6qQznuCyIpLOmQj85sLLU5zX3gYWQN
         PlZKDtRzMqFy1VgSzIImFPtdS53J3fngpsdT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192970; x=1785797770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WU+B07CSF1iTe9Hjn1I9bj5jA82zfVESlvb7YrV5XmQ=;
        b=RHMtpSVjioIH4tJfmmM9CqY1VudKxIhC22Gc30EbZ8g+I0cUs+IheTw3g66FBB5Mi/
         XL57KtZCJViAskQSO+MqQ1W7eATvSKqQxjPmaypqSz4X9BlVsZpmE+6IhjbJ24W07UlT
         DD7I+G+NO2u9+M46n0IeYuBDPwDVCjcjNeOb02dbBw+WixaZXXmmlyyd3ypQ3OjBQNs8
         itdx4A2M47GmN+kxrYkKTjOQ1pG/y3slfwup8pX/KdsUilcoB/enBlRGZnsSwvZcPNPs
         oLWRUt1zEg07G6IioJRi1oWvTwwNCukdhzf6jmFBW0NPJp4OOiXEHp6xEpirJ8TWffxE
         RakA==
X-Gm-Message-State: AOJu0Yzvrlp9Z9vAj8M3t3EawZQBp2U4Wc/Y8kN8G325/nNFQkNTWTQe
	d/4FFoGwtHmadtRvWjbmwbfHKS5IroyNQ8KKEQBTrniO1iKKmAr89DoRpUtvlNiGsMBcx87L8i/
	+GWPApyo=
X-Gm-Gg: AR+sD11YUJ6lp9vTZaoJwzZHAyLCHZc24p+PsSb1ZqZK4sUE9kqiMqsQsGdaLfLw79i
	SLf9Ix2AJ1sOO8ztCrc4aup0yXP3wlAlHN8eCzqG7kwQyn20QW9DInoCuVtSva2DTfjzG9zPHVC
	b7yG/mbvaMMcUNYY3ue/qaUkOfRk4hzbHz/W/4zQuEYVkffYnT1D3rplNkp0a/Kuk/DTlIX3j+S
	XIH0vKJjzq4P0T6066nHoWOQK+XaN/psqx292KcwH1c/+crWFhiQdOIZqEY7xuQ886QPfhKIkSa
	tZ+A6l5Pn7j9fsQLNafqnI0Uc+LbNgIlBtLZ/yy0hAWkFKHB3hlMcC+THXDIN4azIpixlaU8UFi
	wnUR33a3wCsmMeUfad/DmhjK1wMkzlRzPz+wPPYt8iN8J+LaeUXqge2gAvaPkJrOGpQKFWBVxm9
	/5gSrb5T520/15WrYO/sm/jAA+vX4MYCzBxvxy+3pfj0xNUl6cEv/HOjSWb3yAExFWBaLRZQY7e
	0eECg==
X-Received: by 2002:a05:600c:4595:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-496b56f461dmr126958915e9.0.1785192970118;
        Mon, 27 Jul 2026 15:56:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/36] gawk: Fix CVE-2026-40553
Date: Tue, 28 Jul 2026 00:55:19 +0200
Message-ID: <279260734a9809abb681e04c39e0acd276b3ae27.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242113

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using the
commit shown in [1]. It also applies the corrective follow-up [2],
which fixes the snprintf() truncation boundary check. Both commits
are included in gawk 5.4.1, identified as the fixed release in [4].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40553
[4] https://cert.pl/en/posts/2026/07/CVE-2026-40467/

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gawk/gawk/CVE-2026-40553_p1.patch         | 50 +++++++++++++++++++
 .../gawk/gawk/CVE-2026-40553_p2.patch         | 44 ++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
new file mode 100644
index 00000000000..81e2efd6b96
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
@@ -0,0 +1,50 @@
+From 6e7695c994aa45c0f7e9f8b80aa6f99717bbaf60 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 15 Apr 2026 09:39:02 +0300
+Subject: [PATCH] Avoid buffer overflow in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843]
+
+(cherry picked from commit cca0366144336b49aaa7d5d949966ce8e2c70843)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 6 ++++++
+ extension/readdir.c | 6 +++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index b11e83ac..6f88eb19 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use snprintf() to check for buffer
++	overflow in the file name before calling stat(). Thanks to
++	Marcin Wyczechowski <mwyczechowski@afine.com> for the report.
++
+ 2026-02-22         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.4.0: Release tar ball made.
+diff --git a/extension/readdir.c b/extension/readdir.c
+index f876e168..5bbee261 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -118,8 +118,12 @@ ftype(struct dirent *entry, const char *dirname)
+ #endif
+ 	char fname[PATH_MAX];
+ 	struct stat sbuf;
++	int count;
++
++	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
++	if (count > sizeof(fname))
++		return "u";	// buffer overflow. skip stat() call.
+ 
+-	sprintf(fname, "%s/%s", dirname, entry->d_name);
+ 	if (stat(fname, &sbuf) == 0) {
+ 		if (S_ISBLK(sbuf.st_mode))
+ 			return "b";
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
new file mode 100644
index 00000000000..84bfdc54187
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
@@ -0,0 +1,44 @@
+From a98440e83cb19b042958a179293bd637c400a35b Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 17 Apr 2026 11:48:19 +0300
+Subject: [PATCH] Small fix in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e]
+
+(cherry picked from commit bfa2e4b890a44100a99d26b54af385479528b12e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 5 +++++
+ extension/readdir.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 6f88eb19..9fe216e6 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,8 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use >= in check of snprintf() return
++	value. Thanks to Andrew Schorr <aschorr@telemetry-investments.com>.
++
+ 2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* readdir.c (ftype): Use snprintf() to check for buffer
+diff --git a/extension/readdir.c b/extension/readdir.c
+index 5bbee261..3cb31834 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -121,7 +121,7 @@ ftype(struct dirent *entry, const char *dirname)
+ 	int count;
+ 
+ 	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
+-	if (count > sizeof(fname))
++	if (count >= sizeof(fname))
+ 		return "u";	// buffer overflow. skip stat() call.
+ 
+ 	if (stat(fname, &sbuf) == 0) {
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index a7c88224ddf..f44d82b37c5 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -31,6 +31,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
            file://CVE-2026-40469.patch \
+           file://CVE-2026-40553_p1.patch \
+           file://CVE-2026-40553_p2.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"

