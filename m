Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6677F610
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:47:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so19336134wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ghCxztgd1SmPY8LWpxHkOeVmxGsPB89/Pn0nuPteCns=;
	b=mIEMU4ud6dJqMwAQM4Dz84Vx2MrvCbpqkNWmLS0fBaIA5JWkT8moCtW12Qml1XV7NO
	6DGTsnDsUJwtLP+GzLk7mgWmGjm7AThn2pR5naRWXch+NRuZEYj5ZUCL+fmCYveeEVS5
	I15QaoF84EcVeCNm0XDlPsaN4J+bziyxUyss0r53spD095xPzaaUEzkdCY6A4ly9Qg5D
	42aV4gIvplKl6xG9r+gUTEk6EiMD9kET2wQaZtuOZ5esc3IRE8VI4TQfuALn2GJsMLH0
	gL9twa+YSqQXrLyk/ctxILrNmu1IXs/XvTD720pI/6tpRcNe32VZ+KQJ+ddB9WEtLpYd
	s1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ghCxztgd1SmPY8LWpxHkOeVmxGsPB89/Pn0nuPteCns=;
	b=mI2HIHWx/nbjv5XPBUPiaH03gMXOBtXc5I41Tc/54L72e50H9E7k4KH7C8rVdlwUwV
	TI2v5/cjeY3ErzBkuGeXykolr/2czz7qjUK5o4MmxuHmAnvIhg0d7+sIPv/G5qkuIXPp
	X/FdnkZKbcVPxkIFkVfWnzbvkd1hlSCIuFd6ReqR5txlHs2BOye3yj9YY8W61rBRkmoV
	0E5b3YJNA5aCVvrdTlDmjHjviKt1NHgXpsfH3VkAjFNrZAe2gDPmdJ2/zqrvpAcg/GNy
	pvVB3Snor70/ldvs9okM1OFKSJhASgZj9gG7TfS5Npem8k58XM6o02ESQKYsaluakA43
	jh9Q==
X-Gm-Message-State: APjAAAV6iLUptuyZfNqnpig1FMBvcxbW5g+8XPIbLmraeRPpHO27kfaF
	5m1Ca1GJkMiTLpVXQZYQZvamOQKi
X-Google-Smtp-Source: APXvYqwkb26t0XaLwYucxQfwGU0NIblNSm/GzmgLrryfw/tWOAPQQdg0VmdmW52pykZBZHHhgjAn6w==
X-Received: by 2002:a05:600c:21d6:: with SMTP id
	x22mr24932977wmj.126.1575226059585; 
	Sun, 01 Dec 2019 10:47:39 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c9sm7417746wmc.47.2019.12.01.10.47.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:47:39 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Dec 2019 18:47:33 +0000
Message-Id: <20191201184733.77259-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] openssh: Upgrade 8.0p1 -> 8.1p1
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
X-List-Received-Date: Sun, 01 Dec 2019 18:47:39 -0000

Drop upstream backport of integer overflow in XMSS private key parsing.
Add PACKAGECONFIG for kerberos, libedit and ldns. If api-documentation
is enabled then install man(7) manpages rather than catman pages.

License-Update: convert to UTF-8
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...eger-overflow-in-XMSS-private-key-pa.patch | 40 -------------------
 .../{openssh_8.0p1.bb => openssh_8.1p1.bb}    | 15 ++++---
 2 files changed, 10 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.0p1.bb => openssh_8.1p1.bb} (92%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
deleted file mode 100644
index 3265be348519..000000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2014fad3d28090b59d2f8a0971166c06e5fa6da6 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 18 Oct 2019 14:56:58 +0800
-Subject: [PATCH] upstream: fix integer overflow in XMSS private key parsing.
-
-Reported by Adam Zabrocki via SecuriTeam's SSH program.
-
-Note that this code is experimental and not compiled by default.
-
-ok markus@
-
-OpenBSD-Commit-ID: cd0361896d15e8a1bac495ac583ff065ffca2be1
-
-Signed-off-by: "djm@openbsd.org" <djm@openbsd.org>
-
-Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/a546b17bbaeb12beac4c9aeed56f74a42b18a93a]
-CVE: CVE-2019-16905
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- sshkey-xmss.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/sshkey-xmss.c b/sshkey-xmss.c
-index aaae702..c57681a 100644
---- a/sshkey-xmss.c
-+++ b/sshkey-xmss.c
-@@ -977,7 +977,8 @@ sshkey_xmss_decrypt_state(const struct sshkey *k, struct sshbuf *encoded,
- 		goto out;
- 	}
- 	/* check that an appropriate amount of auth data is present */
--	if (sshbuf_len(encoded) < encrypted_len + authlen) {
-+	if (sshbuf_len(encoded) < authlen ||
-+	    sshbuf_len(encoded) - authlen < encrypted_len) {
- 		r = SSH_ERR_INVALID_FORMAT;
- 		goto out;
- 	}
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
similarity index 92%
rename from meta/recipes-connectivity/openssh/openssh_8.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.1p1.bb
index 2ffbc9a95f59..024ebca40228 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
@@ -6,7 +6,7 @@ and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD & ISC & MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=18d9e5a8b3dd1790d73502f50426d4d3"
 
 DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -24,14 +24,13 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch \
            "
-SRC_URI[md5sum] = "bf050f002fe510e1daecd39044e1122d"
-SRC_URI[sha256sum] = "bd943879e69498e8031eb6b7f44d08cdc37d59a7ab689aa0b437320c3481fd68"
+SRC_URI[md5sum] = "513694343631a99841e815306806edf0"
+SRC_URI[sha256sum] = "02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff"
 
 PAM_SRC_URI = "file://sshd"
 
-inherit useradd update-rc.d update-alternatives systemd
+inherit manpages useradd update-rc.d update-alternatives systemd
 
 USERADD_PACKAGES = "${PN}-sshd"
 USERADD_PARAM_${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
@@ -44,6 +43,12 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 
 inherit autotools-brokensep ptest
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
+PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
+PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
+PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
+
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # login path is hardcoded in sshd
-- 
2.17.1


