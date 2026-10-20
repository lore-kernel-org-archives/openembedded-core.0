Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4734.1792538579045719740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=tYuWoE0H;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so690315e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538577; x=1793143377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8raidV7Zw4KrUEWE7Fhd23Veg2j7xVkSPcO/3jPZ5Bw=;
        b=tYuWoE0HBKJGBuVTyWWqKz3i+y3IwE/e9NHfHp1dB1r+J9BvobJSl4smBYcoxq+w0F
         dHl3Acf5EuRsgg2R/f3CprvWps6B55JoUB1x+8//6nF/eQqkBLnrGWM3E0F614Vht/q8
         eg5/HqAgFk2uFPLA1hK9jUpc9S1b93GCuyyGThmQ0n+pcZzVVgU4cNIwW25ZjiqF8cpo
         sDCofnF6liHeKcsU5m1RADeARJDruY1njKgdDzEBYtRnvBKrQWiprQc9fuEiGsjXcaT+
         iUdZ7VYc59Fu/GSipcaZbCKaJmfEVY8laBIDLW8A6EgN+l8xCAZXbuP9F1kF4dn11JAQ
         szgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538577; x=1793143377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8raidV7Zw4KrUEWE7Fhd23Veg2j7xVkSPcO/3jPZ5Bw=;
        b=lfJ5Qeu1vXF18rFDxYF2lVcQjfKhxPqHVMwhxoQua0NzHKiVmeZYYB5C2bOO4343iM
         7fkjQBGsDkeh9XUnCfzsSycGYSE+epMHZ/fMajvCXwWMxM4a2bEoPYhkx/ssMgiUg6ZT
         M3AcAc1I3CN5QeMUJ8YvKrCfJg3IgZM2r4SJam9kY2kUgg0AHsm2ZQinb7lJ0QlMjHQx
         MfJdAfgvjG1sf+GCkAoHivLd6KCNFBuj7I/46cmZ8zPJcaYxPXfMfjdr+5oSqkB1eGKI
         2//x0gy+edhmnz28ABL9J3qOkDxP9czCO3pysjfVkwAlSiFN/h4JtlfdloI+CUfMTfrS
         uBDw==
X-Gm-Message-State: AFq9FYINmINwlUCjDDIpPwPzJ+kxFHHC+ChPdOVkwoziC0MmuTYI33RB
	ur3pkG8eMubklJCH67LiM1l47U7tOOQ2RhSXWk8PE3ddQo+rNJkI31v3OR1qeubXQE4t545m68n
	dfI+OR8g=
X-Gm-Gg: AYBFou1hs2jXFXItvhKfS5WSFHjXHsQ2q3kjttADifiFll9b8yt7cikaLdK4T8Lrb52
	Q9qFTKJfZO7QJS0ujXtW2KkjrwlS/csJ6CcjDOgphPD0yihewgfPxwP5MeIHZIraz4mJIDolVjW
	OkVSTiBxJMetodBWjymjMLNgX1whmrczCUI+5pERHPGvm2GskUU8u0TFzMBRFPXzqMLMIDh6R7t
	JHeYi3tmMVB+CxhWlAChO9zSh0Cp0ygqgqD/BqeYYpdl4CudmqVKkmYjiPec8aynPdgN5xy9DFI
	JXwET1gz69QZxOqtvVyOqMVDl/X6cNdjEIyGJNw1Gih5dhLo279YJ5xKKOY5m6q3kHp76zlzmVs
	hbCFb1c7am26XtQpqCgbnbL4XuNQxsAuD3MvMO2DY50yH6dr4IBl4nFEWMoQ2+f77NJsgGPqCzM
	sjyXF5qT/laxsEWx9z4N5YjSLVrAlk4FjYzMz5Aud9xaZCZGRZjLCh5TR1QIdRbK7KhKqB7/MlU
	nFCn4Rlvi64M4O8T/L26E5T6jPgCNBwdisB2wv1IjUnKiW5rzJitLIezEsOLD0yvzOyYRlIxWfG
	z0iyTMyXA8juzU/+xaXHBEAoYwoYNokPiGTKpKYC89x2L5ta93L9kuY=
X-Received: by 2002:a05:600c:a48:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a1fd8a7f99mr3798695e9.3.1792538577170;
        Tue, 20 Oct 2026 16:22:57 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/25] u-boot: fix CVE-2026-29009
Date: Wed, 21 Oct 2026 01:22:20 +0200
Message-ID: <59655f16cee60b3a718f5db51ab2766ebbb192de.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248329
Content-Type: text/plain; charset="utf-8"

From: Roopa Kalmath <Roopa.Kalmath@windriver.com>

Backport commit[1] which fixes this vulnerability as mentioned NVD
report in [2].

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc
[2] https://nvd.nist.gov/vuln/detail/cve-2026-29009

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../u-boot/files/CVE-2026-29009.patch         | 53 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
new file mode 100644
index 00000000000..35f168005e7
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
@@ -0,0 +1,53 @@
+From d6694018eaddefac6aae974f9cec72fd6e58f1bc Mon Sep 17 00:00:00 2001
+From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
+Date: Thu, 9 Apr 2026 10:44:40 -0600
+Subject: [PATCH] net: nfs: fix buffer overflow in nfs_readlink_reply()
+
+nfs_readlink_reply() validates rlen only against the incoming packet
+length (inherited from CVE-2019-14195), but not against the destination
+buffer nfs_path_buff[2048]. A malicious NFS server can send a valid
+READLINK reply where pathlen + rlen exceeds sizeof(nfs_path_buff),
+overflowing the BSS buffer into adjacent memory.
+
+The recent fix in fd6e3d34097f addressed the same overflow class in
+net/lwip/nfs.c but left the legacy path in net/nfs-common.c unpatched.
+
+Add bounds checks before both memcpy calls in nfs_readlink_reply():
+- relative path branch: reject if pathlen + rlen >=
+  sizeof(nfs_path_buff)
+- absolute path branch: reject if rlen >= sizeof(nfs_path_buff)
+
+Fixes: cf3a4f1e86 ("net: nfs: Fix CVE-2019-14195")
+
+CVE: CVE-2026-29009
+
+Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
+
+Cc: stable@vger.kernel.org
+Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ net/nfs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 537d4c62..9b628ecf 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -698,11 +698,15 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
+ 
+ 		strcat(nfs_path, "/");
+ 		pathlen = strlen(nfs_path);
++		if (pathlen + rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path + pathlen,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
+ 		nfs_path[pathlen + rlen] = 0;
+ 	} else {
++		if (rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index 9610d9e8fe0..8dd15cf9cdc 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -3,7 +3,9 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-46728.patch"
+SRC_URI += "file://CVE-2026-46728.patch \
+            file://CVE-2026-29009.patch \
+"
 
 CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
 
