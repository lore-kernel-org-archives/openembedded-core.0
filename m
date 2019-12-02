Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 70FB97E71B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u8so401703wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/zZrLqO5cyc2sDkCafaYEOENr+eDLSQatTbi9fVsDjI=;
	b=EDC2ZfGjlCk9VreBYRUhPQ+GN3EzUspWazmI8G+pAnYhle+XC5w/49AU6jOX8abHre
	B9ZP3PXeMw+vH9bQrYTWC+VPBI00/7qrmuPruWWutilCk/kctbl18gkYS8rLEFtPxh2G
	EAEPNo0h+5VX3pA3pcOg8zNTa+5sUEovQPNgYqNQWwaKCcWB1VZZLE0Srpsq2gNJGSdH
	oruH7TlfE0/fhjnCjSdQjsM+NMW/hCQq7V2psv2lZuHkO+nRzCWtd51R3/tWKpptdav1
	QdJjTmnswY2DACpoSuQ01oxZgWm6hv0SMn0BFkX9olOkekIuNzh7OY3yt3A99jiS9H4w
	YPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/zZrLqO5cyc2sDkCafaYEOENr+eDLSQatTbi9fVsDjI=;
	b=frpZX0dyCIpd0+AK0poGcHOcr78vcfyAfH/4HaVMKNsKl3PfG2lsJkANwYVsxinDUK
	NFaqNxyDeDij1IB47y0jO2e8TZ19+GhH7VGixO8l8yid1xL5hXXBDcNqvN2JBXFG6+jL
	N/YWBbH96Gw2aQ3TX6GmGki3D7XMA/R08e7FbrPZ9SakZEzXue1RMiaAtx4n0v76qw8a
	gKde6JmAvxiEyk8nAOSCcke+ilMdbZSssdUoAu7vKr827ioJzNJCuSRbgdxDf45KXJIT
	GVjm1q1rXfgR3hCNiIhi7DzaKmCObV5qDMrBg7AJ8ImR9uAVjF1eK91i7ubnPmMn3IfO
	rVWg==
X-Gm-Message-State: APjAAAUODL51pmhQwDOcchrWlD5qwCwFvzVRvB8AnB30KrPKjxCvT2AK
	GA0vhi+KHQY/dU3W1BEsAp+ZRwPa
X-Google-Smtp-Source: APXvYqytj9zI3qHHr+itjOJatVP1oMIb/G7PT56SEsjVPnhvtVF2sZQI9ql0Sjv705qPBmc5wkF3pw==
X-Received: by 2002:a05:600c:cd:: with SMTP id
	u13mr20442568wmm.24.1575309317927; 
	Mon, 02 Dec 2019 09:55:17 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:55 +0100
Message-Id: <20191202175459.112655-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/18] openssh: update to 8.1p1
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:17 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...eger-overflow-in-XMSS-private-key-pa.patch | 40 -------------------
 .../{openssh_8.0p1.bb => openssh_8.1p1.bb}    |  7 ++--
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.0p1.bb => openssh_8.1p1.bb} (95%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
deleted file mode 100644
index 3265be34851..00000000000
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
similarity index 95%
rename from meta/recipes-connectivity/openssh/openssh_8.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.1p1.bb
index 2ffbc9a95f5..6dcdb9a7bf9 100644
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
@@ -24,10 +24,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
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
 
-- 
2.17.1


