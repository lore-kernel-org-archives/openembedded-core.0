Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61A97784E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:58:59 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id z80so3087947pff.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eYKHUsABohQy4Im3fp1UP6sRLfgaU2dq94EkWZ53QXo=;
	b=Z1RQ1SlnJ3nw6zE4UuYwmkVcDfqBghl1t9VdcpWmzF0bsvriYsHBWQpwSQnru6oTMV
	6PuZNlIrp4+af+3tlRbXX+e5UFQ0lRoxfUXCk2NM8iWnBu909CQAhc+2XuYd0KLgVmOJ
	nzG6Ji5d7ovDVXyYXiHAUL6Xa9SjSHU8WD+/GsjS2IqXhTejqNnOuSSTyCBZT5DE47kK
	hg36mQAKiolntudnH1K7+NeqZkLaTwcrO1dt25xNyj4c8JkTG1hk3NYpGdFNskuNQgGa
	AdUWr2r7O72IF0mySkqTh/KDJIDZPbX5jEIaS4YNZpRNINJ5c0Qb2XoRaJIQzAup8Da0
	vDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eYKHUsABohQy4Im3fp1UP6sRLfgaU2dq94EkWZ53QXo=;
	b=tN83Zrt5qGNQxbUKdlzTzYWxHsAh6WZpGf0YPoDVFhIpvzW7XrIgmJWvEG3JKLsLqr
	KqAir73DRJbdsWcbdVMU161g0jvF4deOJ1JTOC0d6aTnhNpMdnhQ5XJNfJ2dbYUFG99H
	3ZEvBD/YfPZ7PpkkOPi+cDebYYCvVD7dXuH1rMU8xrB6BlKouXJWWWr2YnSHPDMXxK+h
	UO2QdkZiq93fudVzqqqzxH3ECGyGN49Xr8GhKKmwoHahZOcs5iY0jk+olW5/Ts00xvnk
	NiBOD3tWX+N7z5gFb8Rkyp000Wrd7opNY9+9iU0pGXRHPN+bBu5Fd1GBaXbU2g4pL3oc
	3Qmw==
X-Gm-Message-State: AJaThX4kzYEum18kJgEtHuXPamhhtOuV7zCxtko8fpUj+FpBNUvoHtsV
	zjVf64nz6NlUxtgx0T0mwcsnFA==
X-Google-Smtp-Source: ABhQp+TJPJJass4dYUpaR2vwiQiM85zuOVW8TDXCCKdpVGRxJzaeKfh/m6cq1nRbuPmy3DgKOlC7Rg==
X-Received: by 10.99.132.72 with SMTP id k69mr2305039pgd.437.1510192741280;
	Wed, 08 Nov 2017 17:59:01 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	w17sm10156709pfa.70.2017.11.08.17.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 17:58:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 17:58:48 -0800
Message-Id: <6eb7d501a2a8422cf0ee6a36bb99143f39255be3.1510192517.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510192517.git.raj.khem@gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Thu, 09 Nov 2017 01:59:00 -0000

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
2.15.0


