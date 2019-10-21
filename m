Return-Path: <misla011@fiu.edu>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 372927F4DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:50:23 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o49so15484084qta.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=fMVgo7AXGc5E7BIR6IqNmZbAbM3xZ1TMH6kk0AzsZ2k=;
	b=K0oTbiKmZL8vHEnAGmVaPc6+Tefu5ezksP2/vW5a9Gv0U6Q9kf8OkqzKvJrdRVYAcZ
	/tIsP7b/q8F3WSYFKcMVROjoPMKtEhhi7ekSnYo9ZtSbxWtgegNDNl1T5ELoavdSUlOy
	pEab7YygLoE5NQk67uINRNAJkh/K1UYTh3T/YKzZ9tIDajkxtwI7cL1Wi9cZQBP60diL
	0sI72J1PmtPz4vhF8C3Hpxrlk3eJ0S4V9mwbf8ZbGdPOfH8i8dIt5Z5uUpu1OpqDqnDI
	5zT6gAkGNGlFjDLp2tqz1+DBupMNd6vpLwvUq3JGsUXPbquwHBFCXiTAYih5tI5dQtb6
	s6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=fMVgo7AXGc5E7BIR6IqNmZbAbM3xZ1TMH6kk0AzsZ2k=;
	b=TzeLo+EEDW47Nj3A+jgzjjPscWe3aVIk6fkdAabRCGwuWpb4qvYl8uZKf2aPHD2+rv
	xFLiJhnYE91svzXAHY/3PqlKzdNgYnLqFGUi6fjssR9+8HS3QnP+CohmPVhoq0tElNbx
	rjCx6ubZbB/z4tmRdMxcPQq02958kwOfbc1MjhdBRqe7MQ2tGAkhu8zgubDJgD5zUyWi
	kuOXY57tQA0rhhThC8Vjl3wVL78sS+6G0CPf02++RyT34XRyTWIdQxQmd593n5nqSoNM
	tIzFsfu8qtEWAHQiBF0SKUsa5rhluu5JicXGlCvWpjf5cqPOmmbZqIvHwPnW0VXELT9a
	i+bQ==
X-Gm-Message-State: APjAAAW5D7WvEEPtCc9wP3qlG1Hx1NlfYj7QHx+i7qOS+Tc5YRI04ilE
	ZA9qccQ+NhZOESm0vYFy0yN40ukpJzY=
X-Google-Smtp-Source: APXvYqwfxPui78lgJ7u2VfCxGd8DRfonFFKwaXbzKnWlOc8Tb7jP7KduqjScB04UPhV8xib2c1A2RA==
X-Received: by 2002:ad4:50a6:: with SMTP id d6mr25628263qvq.199.1571691024555; 
	Mon, 21 Oct 2019 13:50:24 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7])
	by smtp.gmail.com with ESMTPSA id c8sm5201470qkk.46.2019.10.21.13.50.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:50:23 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 20:50:15 +0000
Message-Id: <20191021205015.52158-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com; Content-Type: text/plain; charset="utf-8"
Subject: [thud][PATCH] libcroco: Fix two CVEs
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
X-List-Received-Date: Mon, 21 Oct 2019 20:50:24 -0000
Content-Transfer-Encoding: 8bit

CVE: CVE-2017-8834 CVE-2017-8871

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../libcroco/libcroco/CVE-2017-8834_71.patch  | 38 +++++++++++++++++++
 .../libcroco/libcroco_0.6.12.bb               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch
new file mode 100644
index 0000000000..cdfc9cf5e6
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch
@@ -0,0 +1,38 @@
+From 38bdf8e956218dd6a72942229cf39ef8e45dd28f Mon Sep 17 00:00:00 2001
+From: Mike Gorse <mgorse@alum.wpi.edu>
+Date: Thu, 2 May 2019 10:54:43 -0500
+Subject: [PATCH] cr_utils_read_char_from_utf8_buf: move past invalid UTF-8
+Reply-To: muislam@microsoft.com; Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+
+Otherwise, the offending character is never consumed, possibly leading
+to an infinite loop.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=782647
+
+CVE: CVE-2017-8834 CVE-2017-8871
+
+Upstream-Status: Backport
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+Upstream commit: https://bug782647.bugzilla-attachments.gnome.org/attachment.cgi?id=374219
+---
+ src/cr-utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/cr-utils.c b/src/cr-utils.c
+index 2420cec..6cf4849 100644
+--- a/src/cr-utils.c
++++ b/src/cr-utils.c
+@@ -505,6 +505,7 @@ cr_utils_read_char_from_utf8_buf (const guchar * a_in,
+ 
+         } else {
+                 /*BAD ENCODING */
++                nb_bytes_2_decode = 1;
+                 goto end;
+         }
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index f95a583134..85a120d80b 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -18,6 +18,7 @@ inherit gnomebase gtk-doc binconfig-disabled
 
 SRC_URI += "file://CVE-2017-7960.patch \
             file://CVE-2017-7961.patch \
+            file://CVE-2017-8834_71.patch \
             "
 
 SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
-- 
2.23.0


