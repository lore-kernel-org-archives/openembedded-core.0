Return-Path: <jpuhlman@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD6061895
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:04:46 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z12so459364pgl.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iygYnyQjBjCMBaRky0o76osFyU1eozbQJ9j+G5zCZGk=;
	b=Vuo7EbCs3Gn7zixSQxXAaNlLXk8W/WfTlfrrWaK1rbwNGjn501COfnESwJzaZoVvgS
	KuSoyTrpMV4moaMtwtDUZhNLiEwLvOOlu2hVVD6mgMLsLfyr/f2S1dsBrUyez3bp8bby
	ZdnayAJq0qzbJYufvnAXesww1t8fqglin6iwu2PNsnueWKX+6rWdWJ8SvBLwSHCA5vby
	H+tOAXrcxthQf3RN4tNZlOVyhpyaEEwaI359bxWJT5Yjl7d8cchBN7774p/mnsaJFhMW
	v6hijntozO5yO1AxjpXEIn307ywdU/oUFhY8/63UVuU3ljzbRsqdOIEc/FTj8eAs4QAa
	nnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=iygYnyQjBjCMBaRky0o76osFyU1eozbQJ9j+G5zCZGk=;
	b=B8KG9ATOj3J0Pwp2ZPmCcsrYEX0OBwyRVpzKGL/ftnSzouYSbFvLh3cTgic6nwEQ0x
	zk/BLeMOd2WJ1cY76gRxd5EsynPAhBEM6Nun5qS+AhT349MP42PscQUKOjl2utVzr2Uh
	8r5KgXSTWKs+QOn4xVK8qrbM6xDldKjghzjz3hq1/GoF4dr+N9oXKSuy8pitoX0yhkhJ
	Jni8UKoSItLqFGysd3vLdke/8hVaK8rOepMz7+cc0V9TCW1BiOftKKl6cD42A4yNhxDX
	ahkfQdadl9/Qn/qkG5oeG/vQmrdBT9r9wVVXyA+z+O6Bcp1t8wHdo3NhQVRMGT7NAeHH
	v9JA==
X-Gm-Message-State: APjAAAWeizKuv1hpDfiTa/3Rq1iLa61XJpH6lqboio1QudQw82J6oFx2
	gEOC7xP/JDLmk4orNEB8cY2nZucB
X-Google-Smtp-Source: APXvYqwfrso9xpVkk7JxRwCg/MeqMVuqxq6BgLwjuYb+NgguJFweNCQM3D3krI7FuYT+qHra/tAOMg==
X-Received: by 2002:a65:4382:: with SMTP id m2mr1570548pgp.3.1582844687629;
	Thu, 27 Feb 2020 15:04:47 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id 13sm8139965pfj.68.2020.02.27.15.04.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 15:04:46 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id CAA722A07BB; Thu, 27 Feb 2020 15:04:45 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 15:04:30 -0800
Message-Id: <20200227230430.10770-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] lsb-release: fix likely reproducabilty timestamp
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
X-List-Received-Date: Thu, 27 Feb 2020 23:04:47 -0000
Content-Transfer-Encoding: 8bit

Remove timestamp from gzipped manpage.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../0001-Remove-timestamp-from-manpage.patch  | 27 +++++++++++++++++++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch

diff --git a/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch b/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch
new file mode 100644
index 0000000000..af095fd322
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch
@@ -0,0 +1,27 @@
+From fb0b58be938bab5571ac0bdec3725f6d88b07e9f Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Sat, 22 Feb 2020 19:01:28 +0000
+Subject: [PATCH] Remove timestamp from manpage
+
+Upstream-Status: Submitted [lsb-discuss@lists.linux-foundation.org]
+Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 04fdecd..5be8081 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,7 +17,7 @@ man: lsb_release.1.gz
+ 
+ lsb_release.1.gz: lsb_release
+ 	@./help2man -N --include ./lsb_release.examples --alt_version_key=program_version ./lsb_release >lsb_release.1
+-	@gzip -9f lsb_release.1
++	@gzip -9fn lsb_release.1
+ 
+ install: all
+ 	install -D -m 644 lsb_release.1.gz ${mandir}/man1/lsb_release.1.gz
+-- 
+2.13.3
+
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index 52e30267f5..a06cbcf845 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
            file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
+           file://0001-Remove-timestamp-from-manpage.patch \
            "
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
-- 
2.20.1


