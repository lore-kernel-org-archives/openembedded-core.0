Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCDF780C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:51:01 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a7so15601132pfj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1/rVUVpTn9gJkeEgEI4fZtF71UFuYM+HH9pShRHZJFk=;
	b=CK1WFzOMYZf9QXo3AnvJmRB356Bgemg+iOHG1RZQY9fzTEkjY4GBSBysfUsAaQFuli
	Io7wIskkMTVpzRwzCdVHHRLWqoLM4qSW6vAhqqY3Hyd3u5ayvvYNqAub46RdQiu/bkcZ
	OGcptgJvwcw9kWxFnbC5WygF0hZIzh8mowngDkiktaJrA1XTQLtOaRUpaQS1ErK6IP1u
	JJ8ICbP4DNC6sHbTNLVzet5sAjtERhQShsrMB8msvL6bqaWnOUacOaTtnPnTe7zXCedb
	wEWqddl0hxvYH7HCRPymLrXa1efW9MHWZRdGo7oDlLrU145JRBPWmvKe5xEX+spxM76q
	q2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1/rVUVpTn9gJkeEgEI4fZtF71UFuYM+HH9pShRHZJFk=;
	b=CMp4wizhwkeP14+PvCWxo8RGf5KbfjHM8RjTwISZVq8UPKOlYjVRkc7Mxcqt5uLP0D
	BU29FonMGs3stSV3Zjs4x7CVM1hUtCNn4+MTF9Wfsn1Cv9ldzMRHz60NYjd0aYWNxoB8
	NwlJy08IdOCToRGSTOlHFHzH9U6EqS7dbDeTu+/zU9LHkrZUh5Csd0Qx318sn3Cj+DIY
	rrp/ad255MHOz6HiF4a+3Fu/Hb8iJbL307rWnhP5VgMm6sKQWV15LfYD+yxiLm8TK/Ss
	sMuJhNQFcNrm5IXEKMsmQ2EgGog6YG+Yh9VgxrmkMcnWHgT9v8Hr3plXHR4rmWCU0l/R
	Bixw==
X-Gm-Message-State: AMCzsaX1Shzkhtk4ORh1OdThzd5Kx2lA4QCZPLQvLfbmOpCxKnCJEKWO
	ASlTxHXE56ZRRWFL5xq9I/0rIg==
X-Google-Smtp-Source: AOwi7QAMKuzqedvTLQzhpDIQAfKQrvduvM24Evkz9QqFYUFOSWErJQLm73ZjSuMsl5qrRMF+nobu1A==
X-Received: by 10.84.128.69 with SMTP id 63mr403399pla.119.1507251062819;
	Thu, 05 Oct 2017 17:51:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:51:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:45 -0700
Message-Id: <1231bf23c001d44632edf9061b87ac6629d2fc83.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 06/10] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Fri, 06 Oct 2017 00:51:01 -0000

This makes it easy to override them in bbappends

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.inc b/meta/recipes-devtools/binutils/binutils-2.29.inc
index 27d46eb088..35f76cba6d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.inc
@@ -18,9 +18,10 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "37e991bb143ca2106330bcdc625590d53838b7a1"
+SRCREV ?= "37e991bb143ca2106330bcdc625590d53838b7a1"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
 SRC_URI = "\
-     git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
+     ${BINUTILS_GIT_URI} \
      file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
      file://0004-Point-scripts-location-to-libdir.patch \
      file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
-- 
2.14.2


