Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.6244.1623305064349559764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 23:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W1hBVeJN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623305061; i=@fujitsu.com;
	bh=0R/hmHl3NvSrv2OoIsN3Z3sBQEOzHzsbpT3b6j3fO88=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W1hBVeJNHTTNmMFkVoZlT8ndUcmTsP3UH+IqZoN6fE8IdND4ybgiTDQF9hYpU+vF2
	 Wnpnud01lAfYzfeh3arkWsurQZIXOve32iySK/PFFfOtKrUWeu4bDfmuKN6AxPnv+n
	 UxK/F3ubTeDT6Zyc5+YoBo7p+F+tdFog5XLkwq018A8aqEdCvo0fOD9k15zaXhv+Vy
	 pGCkPhM8JMqijWC+SyH/PxoA8zHHaSWW8Mbr5BMGcDEUFjC5QbFSci38jqmFU/O1rF
	 bmJYBXQ7327EnB82jVs18VO2zbogsyIqV1aapUo2lj4+NeeBiX7npzEAaYHoEEqJxi
	 amvuziC+jif9Q==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 7F/F1-57985-56BA1C06; Thu, 10 Jun 2021 06:04:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxVTd19cE
  Eg9Z/whZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8azI4dYCj6LVNw5/Ze9gXGLUBcjF4eQwCwm
  ie49hxghnBOMEhOmfGPvYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vASoQFzCTOt
  bexgJSwCKhK7PooAxLmFXCSeHptNyuILSGgIDHl4XtmEJtTwFni6bbFLCC2EFDNzx9fmCDqBS
  VOznzCAjFeQuLgixfMEL2KErMvN7NA2BUSrw9fYp7AyD8LScssJC0LGJlWMVomFWWmZ5TkJmb
  m6BoaGOgaGhrrmusaGhnqJVbpJumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAsMxpZC9
  cgfj2jcf9A4xSnIwKYny3l5wMEGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG/cSqCcYFFqempFW
  mYOMDZg0hIcPEoivLNWAKV5iwsSc4sz0yFSpxhdOd79XLyImePN2iVAsu3eXSA5c8HB1cwc99
  sPrWYWYsnLz0uVEud9DzJbAKQ5ozQPbjQsri8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua
  VXAU0hSczrwTugldAxzEBHedovA/kuJJEhJRUA5P8/gf7zC9VvXS++O6Mgd5EO8fd1fPct89f
  5aG6o3rNF3uHn+4rtrfWxP6z5Ui+3Zou0Dw5zSrvw5nkrxM22ysYereFTVG/uJpJ/nFp9NfLE
  S4Nz6+/lWJ84tJt/u7QDJ97zSlzWCdPDtCuOHbE/nlbYo+FqfaSpJ+lFg/fM10RYa6q7HXMO7
  LlV17n3LJTwtHyX+y6J0cdmGzufu2RYe7BDpv+vo7YnK1x/hPu/xZwmuPdpjbtncts3UMam1z
  15iuwLP9Q3ZJV7Gm1s4Cxcy7DDs7Jistin8R4Jy3911DxenbKxt0+LdN2lhl84raaJl4xwzN2
  W+mrv86MUz7LFJX9XrvA44K5/8GXOtXXzJVYijMSDbWYi4oTAYz/UVNmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-245.messagelabs.com!1623305060!116611!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2304 invoked from network); 10 Jun 2021 06:04:21 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 06:04:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A64KCl023833
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 07:04:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 07:04:19 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dtc: upgrade 1.6.0 -> 1.6.1
Date: Thu, 10 Jun 2021 14:03:50 +0800
Message-ID: <1623305030-45242-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623305030-45242-1-git-send-email-wangmy@fujitsu.com>
References: <1623305030-45242-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-fdtdump-Fix-gcc11-warning.patch
removed since it is included in 1.6.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dtc/0001-fdtdump-Fix-gcc11-warning.patch  | 35 -------------------
 .../dtc/{dtc_1.6.0.bb => dtc_1.6.1.bb}        |  4 +--
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch
 rename meta/recipes-kernel/dtc/{dtc_1.6.0.bb => dtc_1.6.1.bb} (68%)

diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch
deleted file mode 100644
index ec825cbf7b..0000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4827e0db6c4f7dea7f4094f49d3bb48ef6dfdc2d Mon Sep 17 00:00:00 2001
-From: David Gibson <david@gibson.dropbear.id.au>
-Date: Wed, 6 Jan 2021 14:52:26 +1100
-Subject: [PATCH] fdtdump: Fix gcc11 warning
-
-In one place, fdtdump abuses fdt_set_magic(), passing it just a small char
-array instead of the full fdt header it expects.  That's relying on the
-fact that in fact fdt_set_magic() will only actually access the first 4
-bytes of the buffer.
-
-This trips a new warning in GCC 11 - and it's entirely possible it was
-always UB.  So, don't do that.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/patch/?id=ca16a723fa9dde9c5da80dba567f48715000e77c]
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
----
- fdtdump.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fdtdump.c b/fdtdump.c
-index 9613bef..d9fb374 100644
---- a/fdtdump.c
-+++ b/fdtdump.c
-@@ -217,7 +217,7 @@ int main(int argc, char *argv[])
- 		char *p = buf;
- 		char *endp = buf + len;
- 
--		fdt_set_magic(smagic, FDT_MAGIC);
-+		fdt32_st(smagic, FDT_MAGIC);
- 
- 		/* poor man's memmem */
- 		while ((endp - p) >= FDT_MAGIC_SIZE) {
--- 
-2.30.1
-
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.0.bb b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
similarity index 68%
rename from meta/recipes-kernel/dtc/dtc_1.6.0.bb
rename to meta/recipes-kernel/dtc/dtc_1.6.1.bb
index a407137859..de9a46d3ef 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
@@ -3,9 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
 
-SRCREV = "2525da3dba9beceb96651dc2986581871dbeca30"
-
-SRC_URI += "file://0001-fdtdump-Fix-gcc11-warning.patch"
+SRCREV = "b6910bec11614980a21e46fbccc35934b671bd81"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

