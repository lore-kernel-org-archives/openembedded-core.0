Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A481072EB2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:36 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i29-v6so4908074pgn.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EFX1ar+1wpkjGK2hy4+ZXhxFM6AEDNJXgrkAWgfIWOA=;
	b=koCN1zIqLE5fBGtB1xmTegAWkfNZW+XfcXu64POJiKy2ZRPAqdG3wK3X7EdzezGEJC
	qU59nqnDy0pEZlx38Rn9MVm2eXkUxOXhm8DRfTpamAZRi0uwkZ7GV4THdMfUXLFgOKZ7
	3EgAhr8kd35sh+Tku1KfG6uFwgYhuFi2kK2nYNLxIkVWLTryOBHb9WVIZQA5CzgWZRVV
	ca+LLYXUbAfCXNtO5A+IcYEQPYPSpcwk2JzrLX9d9PYKKmRgSadv5AoMMzIDyZFFgq9e
	eiqQcmgfazmxo/gvQmHTdRosTH0mkidirlQUo7Ns/KXmywXGtdPsSuPSXzicui9UrRJS
	5Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EFX1ar+1wpkjGK2hy4+ZXhxFM6AEDNJXgrkAWgfIWOA=;
	b=Dxezgiyvwyy3eAtLtT0YDaxc8PtcbIhpZUXDihAx4clBZsui4A/XVv5YYikNGGeQAF
	+8E5vXnwGrD6gvZv1xs4SGhPklG/98BK+rDW6U1J0B2YRQVQo89OddSp+a3lwNt+rKxO
	jHPSlra0XEg9g88SsjJVzKqFwvYGtGXy4fucoIFDtmGX5UZaUsQLRbHAxhoxe2ThNBUG
	PeP9wxxMObLfJLCaQ55SYdt1hyss/s4CgkNq6nRMWuV6zQO3PO+P8DKK4KkNymPBBbJZ
	o4DJW2aUbxn+OfEvo3wODHUbLhd3fCtMETC3VO3E/KQOhs2DhJgVRx0x92Wk39CMuXUD
	qzMw==
X-Gm-Message-State: ALQs6tCUW2+7FoBGykXe9TcrfFfRwpIVgG3GXu2niUXlrFzxvyqPYuaF
	zqZO8d4tjX/GntiitWtI/XubPg==
X-Google-Smtp-Source: AB8JxZoMl+OLQk8ARo/fGifIIwVTahmRFy1qeYSsrr6nnV4+3AoMdKyWYJpoSEGt1y0oG9A6wdLkyQ==
X-Received: by 2002:a17:902:7844:: with SMTP id
	e4-v6mr9874066pln.296.1525030597540; 
	Sun, 29 Apr 2018 12:36:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:04 -0700
Message-Id: <7fe631d7aec5bf488447dbbaffef649f6b2dfa89.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 17/24] xinetd: Use libtirpc even on glibc
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:37 -0000

We dropped in-tree obsoleted rpc from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 1beb5456e1..6e43f5be6f 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://github.com/xinetd-org/xinetd"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
-DEPENDS = ""
-DEPENDS_append_libc-musl = " libtirpc "
+DEPENDS += "libtirpc"
 PR = "r2"
 
 # Blacklist a bogus tag in upstream check
@@ -42,8 +41,8 @@ EXTRA_OECONF="--disable-nls"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
 
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
-LDFLAGS_append_libc-musl = " -ltirpc "
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += "-ltirpc"
 
 do_configure() {
 	# Looks like configure.in is broken, so we are skipping
-- 
2.17.0


