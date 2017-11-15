Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 19D0A78518
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:30 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r58so7411764qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2bKxJ0Ep3vbAHu4iBzgsWuUiu4gO9ynMWCPolMJ6sNI=;
	b=heNOm6yCv5Lzh3obLOsjeLIgTVP74ZkS8IOyLlG/CNXIRt9feixZmsKz+t2x2o41/t
	5CUx6MD6dpSiHGMrJ7ZKd+WSaE3ycwXB2X7nWj3Jx5pOnLFMQ82nTi8DoYDsDvW5fOyI
	UXqP1rkPTHmNTdXxC+7kGjFPh5a5YoKbqFp6s0fZJqH8SYcQsVoauPQSeE76rgTP/HSx
	f20mQq48jGME1dMSv6WQ94N+sDcETxHR0eJKyI1pOSP8z40AhfFC89T8OoEPv4u4LFYr
	HN+KCMOI57DBqJ0/R5HIiS1XGTbyvhWMoItP5I4wVVj5AddS5KOlAUbanJs6guW8YJQ/
	v8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2bKxJ0Ep3vbAHu4iBzgsWuUiu4gO9ynMWCPolMJ6sNI=;
	b=R1XJEclgy+xCYHpqFmBUNOAaO8C6xr9ujA30op0ZQC+syTi1cwEA1Nde1PyxxSjVyW
	j27HIf/1MtpH1HlTfncmjrSjeJXmgUEiCuWp1AHp7ykpYq0RS2jOYWU5C05LajU7mAAZ
	+QO0KeBjY/fm8DZoOeq4sh9MQjMJ8+vCdsAYW99HbSLcRXLV9IwfL7Jra6NL0GGp7h2R
	+66tdHs+l6rxMx6hbIU5JaXTtwqsZYROld4auGAURwXguBYl1X3LMNw6Inc7B23J5Wt1
	hsvPcs4I55CcCw5wVJBFkePQzt9VHA7aU0FMHms+X+DWXj0NLYzPZnkJVrEVSYT3lztk
	/04Q==
X-Gm-Message-State: AJaThX7fwVAcOH0WRIxCinpFuZocjsT+AvWwI7XIgInJ0NwgWy7XWBHI
	vCxYAevC69uHsp2MMpXi8wyDuw==
X-Google-Smtp-Source: AGs4zMYClKb/V7oeas3qeuGYiL7wfhFHsYMT8yvYmIHz2DpY5XArb9wC08ceGY6BDRzPb5zcDdOp5Q==
X-Received: by 10.200.4.7 with SMTP id v7mr8818832qtg.129.1510715371743;
	Tue, 14 Nov 2017 19:09:31 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:14 -0800
Message-Id: <070cd17f60090f3b08b24e8808aab67543a3eb88.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Subject: [PATCH 3/8] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:31 -0000

This makes it easy to override them in bbappends

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index d92bbbce5d..07a72e2b5a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -18,9 +18,10 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "90276f15379d380761fc499da2ba24cfb3c12a94"
+SRCREV ?= "90276f15379d380761fc499da2ba24cfb3c12a94"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
 SRC_URI = "\
-     git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
+     ${BINUTILS_GIT_URI} \
      file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
      file://0004-Point-scripts-location-to-libdir.patch \
      file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
-- 
2.15.0


