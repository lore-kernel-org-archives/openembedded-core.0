Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF6FD745E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m21-v6so4916147pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3DGvKFoZh+MQzz1o0j040YS0FlZCeqavuYA9r83umDw=;
	b=W4Q/hTnv0mEVJ9bGa0ptLVH5hzgrU3qciXIJiILbUbE6YBdHTyXo4D6enaSjPICbub
	a8JhlY3RXGMMqhKsNswlinZAnBe0eXDqWMyy8A+xwFCT3tbOAzPnGKJ9666PHzuwGX38
	YjTtDphkiWCbw1NVeOx8G4hJXhwu4qd4HTPEfEBSPtK2/yINf7ZQWbgafePibgg8KNnJ
	hntA3yBcyKlNJ3F+0uL7JGVOhnzxt91++hVQ1IZK9dADqbYagLy6H28OuqrYghCdPDvg
	54S1AvPkzi+ms6LN2sYT/bkiVovwMCTev6QAzNC8+Fx486Q2FrvChtNBhOouB3dWErzs
	dWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3DGvKFoZh+MQzz1o0j040YS0FlZCeqavuYA9r83umDw=;
	b=JBPgV2GMBGkwTMwRYW2zB30RA12N+PsRcMFH9VUcLOTJEzOwctFGzG3DLai0istA/c
	VGKTAhi/vcuDpYtyk4aGgb7LRdJBuzw4L7L7vsex7UnOSldXZ409pCJf2Q40M2u76TL8
	qZBIAi6b5sfQKgBX07uK7N/3h3Q2oN0Oex9yMx85ASg9A7D8Zz3oicGW+VYj1NPJUryN
	PqwXCgJIpM+Ed/8lBFOXszOe0YvHVPBupDH81/SiIRwGiR5a/8NkZz66PiBFQorVqbpE
	zY86acBww5TKUZpd1wCxHMKDrOjkyMGlbNXA7gfTpTqWDMfNHtWT5BjzLgK4WSCKa8oc
	lOJA==
X-Gm-Message-State: ALQs6tAFqQc0GNdLbllCh6EfxsFHMzw1cXZmKf18jwIC8qa6QSMWtsx/
	ThSVMljvA9fC8QU1TD0pcc68+Q==
X-Google-Smtp-Source: AB8JxZoycEyla1MKZ8Xj4azmKse8a9qf2xo6dMN3J/7dIa2VpLxmi2O55dKeMmGfqSM+O4r0sEAtpw==
X-Received: by 2002:a17:902:2006:: with SMTP id
	n6-v6mr10070131pla.125.1525030599790; 
	Sun, 29 Apr 2018 12:36:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:06 -0700
Message-Id: <5a84f730b0824ced68f13e26aac5aad96c4b6033.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 19/24] Use libtirpc even on glibc
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:39 -0000

We dropped in-tree obsoleted rpc from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 37b37ae12f..24791c4170 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -22,12 +22,13 @@ SRC_URI[sha256sum] = "ffdc865137ad5d8e53664bd22bad4de6ca136d1b4636720320cb52af0c
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
-inherit autotools update-rc.d systemd
+inherit autotools update-rc.d systemd pkgconfig
 
-DEPENDS_append_libc-musl = " libtirpc "
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
-LDFLAGS_append_libc-musl = " -ltirpc "
-EXTRA_OECONF_append_libc-musl = " --disable-nfs "
+DEPENDS += "libtirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += "-ltirpc"
+
+EXTRA_OECONF += " --disable-nfs "
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
-- 
2.17.0


