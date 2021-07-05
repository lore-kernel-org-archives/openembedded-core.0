Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13424.1625504665644906085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 10:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C7F91042
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB9BD3F694
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:24 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/5] util-linux: build chfn and chsh
Date: Mon,  5 Jul 2021 18:04:18 +0100
Message-Id: <20210705170421.533275-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705170421.533275-1-ross.burton@arm.com>
References: <20210705170421.533275-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As we now split util-linux per-binary there's no disadvantage to not
building chfn and chsh.

This also means that the tests pass instead of failing when the test
uses the binaries from shadow.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux_2.37.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.bb b/meta/recip=
es-core/util-linux/util-linux_2.37.bb
index 9a50c75e77d..933995ea94d 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.bb
@@ -71,7 +71,7 @@ EXTRA_OECONF =3D "\
     --enable-mount --enable-partx --enable-raw --enable-rfkill \
     --enable-unshare --enable-write \
     \
-    --disable-bfs --disable-chfn-chsh --disable-login \
+    --disable-bfs --disable-login \
     --disable-makeinstall-chown --disable-minix --disable-newgrp \
     --disable-use-tty-group --disable-vipw \
     \
@@ -209,6 +209,8 @@ ALTERNATIVE_PRIORITY =3D "80"
 ALTERNATIVE_LINK_NAME[blkid] =3D "${base_sbindir}/blkid"
 ALTERNATIVE_LINK_NAME[blockdev] =3D "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[cal] =3D "${bindir}/cal"
+ALTERNATIVE_LINK_NAME[chfn] =3D "${bindir}/chfn"
+ALTERNATIVE_LINK_NAME[chsh] =3D "${bindir}/chsh"
 ALTERNATIVE_LINK_NAME[chrt] =3D "${bindir}/chrt"
 ALTERNATIVE_LINK_NAME[dmesg] =3D "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[eject] =3D "${bindir}/eject"
--=20
2.25.1

