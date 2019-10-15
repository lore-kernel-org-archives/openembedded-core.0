Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 054237F363
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:33:58 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q10so11388991pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h3i8HVmlAptwzDzbJwMb+nak+nj3ysBgLXkcKFE9bg0=;
	b=INrtCvXE1POugyq/FbSPGbkoB6oxc/snMcH9rVWI6eW9baSlAOeAWqFF+EbOnwBTOE
	Aeiyd9HDRw5dBVFMoc5pEbWimapWY2x2Fh0+CGjCNRJy+vyeKVKuZLnKG6xh1LrKCEHU
	mw1iLbcTGzFsRgWPxvf/bkwxw6XK1C/Uag475n9/S9QN8snP/nTXB0tJ3DbbIJl3vlvT
	Na9NEDDFANj3ZwKsvIyDz6YN82e1txJKdXXEDYwRo1ni4Y3nfY1vjcNvzu6TQ1DcenTX
	wrNMIQlviwoSOsV+sAlIfpnxA87vzs7i/T9IIZOCthv912dqmNlbItxCneyhAZEYLZI4
	DuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h3i8HVmlAptwzDzbJwMb+nak+nj3ysBgLXkcKFE9bg0=;
	b=LbFFzXEApU3UAN26tRmgCn5aZk8edXe6ksW49fmKBF82/o547erjxnos5GAVzyXCLQ
	u26um7LHApvnijEiW31GIa/+HgV3uqSvnTUOEpr4Zq14nZT750u+QISTUc+sxZ8lOPXv
	PGdLHgjjaSz8WjXLPNy2qCYUtgX1ukX7eot4uf4K5IS9mKvNn4btKwn7kVgQdP+t3bZH
	0eMwqlPKBQBSEQUNTTx1+SxwXLITHXPYgesfnZbX3yNtTK1PI4uCugSxABAD2nZpw5Tf
	mN16pjp2r7yJHy6r3mrmI/b75bTdRibJUhB0Bgp5E6FIJB9klfgu59lZExCH+TljqcWp
	nYfA==
X-Gm-Message-State: APjAAAWO+zOpBvqBAfDk9DNX+wqrmSj4+nximsMgwSQa44H7i7XkVdG1
	t6Lmn7YYsNRCzdOrWSTsfKyXV4jI
X-Google-Smtp-Source: APXvYqx/D1MVq+zZqf4f1WNbIXYEMlL8JTPqOY/PqflwPCrG29s2O6CIk7e7U55spjyW/rywWf4WYA==
X-Received: by 2002:a63:5712:: with SMTP id l18mr34573387pgb.197.1571103239759;
	Mon, 14 Oct 2019 18:33:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655])
	by smtp.gmail.com with ESMTPSA id
	b20sm22710629pff.158.2019.10.14.18.33.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Oct 2019 18:33:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 18:33:48 -0700
Message-Id: <57d30f26c3dbba720079e98d429dfcb53d527d54.1571103112.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571103112.git.akuster808@gmail.com>
References: <cover.1571103112.git.akuster808@gmail.com>
Subject: [thud 7/7] curl: Security fix for CVE-2019-5482
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2019 01:33:59 -0000

From: Muminul Islam <muislam@microsoft.com>

Signed-off-by: Muminul Islam <muislam@microsoft.com>
[Fixup for thud context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/curl/CVE-2019-5482.patch | 68 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.61.0.bb           |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5482.patch b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
new file mode 100644
index 0000000..91b1866
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
@@ -0,0 +1,68 @@
+From 38319e0717844c32464a6c7630de9be226f1c6f4 Mon Sep 17 00:00:00 2001
+From: Thomas Vegas <>
+Date: Sat, 31 Aug 2019 17:30:51 +0200
+Subject: [PATCH] tftp: Alloc maximum blksize, and use default unless OACK is
+ received
+Reply-To: muislam@microsoft.com
+
+Fixes potential buffer overflow from 'recvfrom()', should the server
+return an OACK without blksize.
+
+Bug: https://curl.haxx.se/docs/CVE-2019-5482.html
+
+CVE: CVE-2019-5482
+
+Upstream-Status: Backport
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+---
+ lib/tftp.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index 064eef318..2c148e3e1 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -969,6 +969,7 @@ static CURLcode tftp_connect(struct connectdata *conn, bool *done)
+ {
+   tftp_state_data_t *state;
+   int blksize;
++  int need_blksize;
+ 
+   blksize = TFTP_BLKSIZE_DEFAULT;
+ 
+@@ -983,15 +984,20 @@ static CURLcode tftp_connect(struct connectdata *conn, bool *done)
+       return CURLE_TFTP_ILLEGAL;
+   }
+ 
++  need_blksize = blksize;
++  /* default size is the fallback when no OACK is received */
++  if(need_blksize < TFTP_BLKSIZE_DEFAULT)
++    need_blksize = TFTP_BLKSIZE_DEFAULT;
++
+   if(!state->rpacket.data) {
+-    state->rpacket.data = calloc(1, blksize + 2 + 2);
++    state->rpacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->rpacket.data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+ 
+   if(!state->spacket.data) {
+-    state->spacket.data = calloc(1, blksize + 2 + 2);
++    state->spacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->spacket.data)
+       return CURLE_OUT_OF_MEMORY;
+@@ -1005,7 +1011,7 @@ static CURLcode tftp_connect(struct connectdata *conn, bool *done)
+   state->sockfd = state->conn->sock[FIRSTSOCKET];
+   state->state = TFTP_STATE_START;
+   state->error = TFTP_ERR_NONE;
+-  state->blksize = blksize;
++  state->blksize = TFTP_BLKSIZE_DEFAULT; /* Unless updated by OACK response */
+   state->requested_blksize = blksize;
+ 
+   ((struct sockaddr *)&state->local_addr)->sa_family =
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index c1e4342..cd880f9 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2018-16890.patch \
            file://CVE-2019-3822.patch \
            file://CVE-2019-3823.patch \
+           file://CVE-2019-5482.patch \
 "
 
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-- 
2.7.4


