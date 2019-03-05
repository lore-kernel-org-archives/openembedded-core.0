Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id A47727C6AB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 04:37:07 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id q206so4706855pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 20:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=70z+xAF9tT4G8sWlGDX82tVPoqjhpKTrdKcuDvBkwbM=;
	b=hF4uS68zX3hcxCvtyYKwLCcVwlxRnNzL3+y9k+GzPUwgkwAYcOfLSCzS975UyRuhEh
	in0J+mVOFcDOrTclH4vV//TB0h6t+ikqrfi07YaVWKIQX2d+fb5kP74GWhSyRX/Z4r6B
	GXccHb5CICimt8xArWZkThEDt1ixEARN1H4p3r/74iJ+KdSKpiC1/0QnlE/sykf+M6UO
	EPlak3RXmskqX4cd5ySKOUZLEoprerEllpf/p05gv1dk/Ku9PKFTDupqqUN1KlqLzCWM
	Vt0kodmkOXYWpDyFumi0Fk/lK6kq/xxHYC+aB2ImK2/uuSVNP7IEX/KbuS464WulM+iC
	URpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=70z+xAF9tT4G8sWlGDX82tVPoqjhpKTrdKcuDvBkwbM=;
	b=K/oJdun52nhqmEj9kVKTSdIoChYZbFXY40MOuINDXo36HtQfGkowxZaiXNkvpXwisF
	YIcgVNygH7iACEDQJ/WPS5NJuiIqSdnWhx8g4gAqugNfs6hR7tqpi0k2XmCCiOA36I0P
	A1SDMdb0I69Ea+tutthHLjAkglMC3RE7oBv3T489EtGvpGBwFx9neWNQGn4flY431a/P
	jgiqZDZsyTkGS0gftNKOMCMBPIITZor1brpwzhn2+FgMsEBqfqem1PUopJxbVJ0aooKo
	3uZSittwPYG0McKUO6saV174J0T3FifROGPwPD19CUDLe2jj8IGulpwPpZywjPuB/m+N
	2lKA==
X-Gm-Message-State: APjAAAVeJpq9GUSl1qU4jsbPsgFoU9fmZO01tkpnVT+aof9xW05hAfDh
	+8KcDoyqAjmtgDGCiQirle0YPiNW
X-Google-Smtp-Source: APXvYqwtMGLXuzn0PqLl/5y2bihDWy1QuPrauHyMvJVmZzJUIxDNBrbcPapUviK/9/zyNnwZGSrBkw==
X-Received: by 2002:a63:fd07:: with SMTP id d7mr7383308pgh.199.1551760628325; 
	Mon, 04 Mar 2019 20:37:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::caa9])
	by smtp.gmail.com with ESMTPSA id
	g12sm15148070pgr.76.2019.03.04.20.37.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 20:37:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 20:37:00 -0800
Message-Id: <20190305043700.38645-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] musl: Update for few bugfixes
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
X-List-Received-Date: Tue, 05 Mar 2019 04:37:07 -0000
Content-Transfer-Encoding: 8bit

We have seen/reported few dlopen related fixes which has been fixed
upstream, therefore upgrade

all set of changes

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=6516282d2adfad2c7e66d854cde3357120c75dbd..43e7efb46555f13a556d92944ac05c19b8929b60

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musl/musl/out_of_bounds_read.patch        | 20 -------------------
 meta/recipes-core/musl/musl_git.bb            |  3 +--
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/out_of_bounds_read.patch

diff --git a/meta/recipes-core/musl/musl/out_of_bounds_read.patch b/meta/recipes-core/musl/musl/out_of_bounds_read.patch
deleted file mode 100644
index a681cc284e..0000000000
--- a/meta/recipes-core/musl/musl/out_of_bounds_read.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix out of bounds read
-
-self->dtv hasn't been extended yet
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/ldso/dynlink.c b/ldso/dynlink.c
-index e2c3259f..b23ea0df 100644
---- a/ldso/dynlink.c
-+++ b/ldso/dynlink.c
-@@ -1374,7 +1376,7 @@ static void install_new_tls(void)
- 	}
- 	/* Install new dtls into the enlarged, uninstalled dtv copies. */
- 	for (p=head; ; p=p->next) {
--		if (!p->tls_id || self->dtv[p->tls_id]) continue;
-+		if (p->tls_id <= old_cnt) continue;
- 		unsigned char *mem = p->new_tls;
- 		for (j=0; j<i; j++) {
- 			unsigned char *new = mem;
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 6a72b7d3bc..2d8dab90dd 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "6516282d2adfad2c7e66d854cde3357120c75dbd"
+SRCREV = "43e7efb46555f13a556d92944ac05c19b8929b60"
 
 BASEVER = "1.1.21"
 
@@ -15,7 +15,6 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://out_of_bounds_read.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.21.0


