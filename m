Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30974.1795560744095113304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=M7MV2PJ9;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2987054f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560742; x=1796165542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LzhjiGZz+X3HLXWMkRqRj/II/KLaj7MDSWyCSrojDq0=;
        b=M7MV2PJ9Az4bS4AMMMkYOu8bXeKBUr355eJtZp4z/rBIHJeVnb6AxQn+ARx+n//4oJ
         onVdl6ZqaXqLMFF5EV414DotyNkBg7mCKvYJB73aXbSQJqDqcqjPmOFbvAUzEimSut4N
         rRmQqkiUYAHktgwc4C+FmwbT/aVhyApIcrenrbSmcgBF7cklH1YGb49bAWmu6DOZEzOr
         IgGFyTEQOkUYLECLbOu4EndYUKgJVC4Xv4aV31hIkb3/mZnkjwV/tFwTL202050fN9ko
         l6GmiU08HFgbrCc/FIozCzjfOeKgc5sjHDCbSlf0oDHVToKqxnFsN0Vt1mmixn8Lr4ud
         Ie1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560742; x=1796165542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LzhjiGZz+X3HLXWMkRqRj/II/KLaj7MDSWyCSrojDq0=;
        b=YNMmZNzWxBF875zolbCJo63RIxCVrR9AMKT7NAWTAvcAToJzzuqvPhNLeptTmQj9Kg
         ECpkq8oj6bXtqaCPoyV/NmI65W5DYTa7Lc9ByEdW092yVFYrY91GTqVN+dFa/Rfqv32R
         mLwI/KUxflXSPKXGgWVLooVGMMkkwL1RsmzE8YiBL1jeyLDcTYMw4evsrvDS3uiFB5UD
         IEMctG55tT8DPqS/tRYGnUg8/5MGJQk+D5Vv6vfSmAPWX/z3RRimF9ttNvNLj1SFnXK3
         hQviaJBwwkCZ+xZs9D+2UJB+UDVzh+h39n3iATKjXU8GcnYBWdN+ziIyPY2CpkApQ1SO
         mozg==
X-Gm-Message-State: APuU4Z9wXsbXiHUlogryhZGr3sSqEDAtbnoepJxcMIs4ge94udeWEbEW
	w33eaUjopwWgNJglo4vHXEjB1/ewrCLQi9HNROSwUNj6wQQMWo2EDYNtKS6iCY5zw9zkD3A5VOv
	uAyiDsjk=
X-Gm-Gg: AZFdTZduWqDOH21agkJreykKXEH0TR1AI87JjLiT32viLhZ8mYRewOHB4FCuiH07g6r
	gmQm2yN0UT/HzrQTdljjqeWxZAeiKBz3TcjJesPuPex+8a3yhs3gS4jUUqltpkHWNMuT+BMtiNp
	CJ+khcybFsP1/d820TemqkOkSnvges/I3E+OHpmbv5gEyLFZgN+fP2Twb4K2dQByyi2futFR746
	igdxZXgYGdWhiMGszof3zF5z9JxPvIRgG2njw4M9EFOGmCIqOxuioj2Z2Sg+4jwOynrJvW54kaN
	DYcaGcqYVhz8YaUx4q7MF+GfSg14+Ah5D+nLMwQoQhE9mX5mkolratbTmgDDz3A/XmIkpCQyxRy
	U1hEvQrbgFFlLG82tlgo92fMdHpHyw7+aKp8NOYfwScRKZMDYfOg5RtXiszR16pNDyBZrWRTvyO
	+9ojyQKpkCipLAYAmwqbRfGNtcfQa0iCRMzLiGkKcrODGAGswde5lhYz8ur+/LCXDWISe40VPTm
	mKVageg5Ncm6+M/bjog+pU6mQzMH6ALJryRzC2VpefTnTedyfs7JH2fIbKbBkBiqMth+6hxMXNa
	vZyIdRk8y7Axe6Bs+zb8mC0qnAL6bozZ0OjIXwylN2zV3HkWW0YTVYRQ7azqxiYp3eufDPzMM4B
	wExCzBCUmWMVBU0TYuOYxC552qJwD
X-Received: by 2002:a5d:5d88:0:b0:4b4:510c:51da with SMTP id ffacd0b85a97d-4b4510c553amr13688021f8f.11.1795560742267;
        Tue, 24 Nov 2026 14:52:22 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 05/21] sqlite3: fix CVE-2026-119375
Date: Tue, 24 Nov 2026 23:51:12 +0100
Message-ID: <4168ff6284885b059a5bed1749f5d149b372f8d6.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251085
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which fully initializes the
page read when the WAL and database page sizes differ, preventing
disclosure of uninitialized page data. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e5bf119821f25be1d7f10ef0a2edbe175289166e
[2] https://sqlite.org/src/info/f9b4ee369557c36c

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119375

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119375.patch      | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
new file mode 100644
index 00000000000..149889f90ce
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
@@ -0,0 +1,47 @@
+From c9e05db641c387aad309081b35afa3e703aa075d Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Aug 2026 10:49:39 +0000
+Subject: [PATCH] When reading a frame from a WAL file where the WAL pagesize
+ and the database pagesize disagree, be sure to fully initialize the page that
+ is read.
+
+FossilOrigin-Name: f9b4ee369557c36c606666bd7e6d8dc4685d87531993d3ce4e7a718aa814a5ac
+
+CVE: CVE-2026-119375
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e5bf119821f25be1d7f10ef0a2edbe175289166e]
+
+Backport Changes:
+- Applied the src/wal.c change to sqlite3.c because the recipe source
+  uses the amalgamated SQLite layout.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed in this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 4fb0674..04f4eea 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -71183,11 +71183,15 @@ SQLITE_PRIVATE int sqlite3WalReadFrame(
+   i64 iOffset;
+   sz = pWal->hdr.szPage;
+   sz = (sz&0xfe00) + ((sz&0x0001)<<16);
++  if( nOut>sz ){
++    memset(pOut+sz, 0, nOut-sz);
++    nOut = sz;
++  }
+   testcase( sz<=32768 );
+   testcase( sz>=65536 );
+   iOffset = walFrameOffset(iRead, sz) + WAL_FRAME_HDRSIZE;
+   /* testcase( IS_BIG_INT(iOffset) ); // requires a 4GiB WAL */
+-  return sqlite3OsRead(pWal->pWalFd, pOut, (nOut>sz ? sz : nOut), iOffset);
++  return sqlite3OsRead(pWal->pWalFd, pOut, nOut, iOffset);
+ }
+ 
+ /*
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 0c7b7137289..29187e75b4b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
 	file://CVE-2026-119374.patch \
+	file://CVE-2026-119375.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
