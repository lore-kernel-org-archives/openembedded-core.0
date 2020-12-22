Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14648.1608657801145498391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 09:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C55F9106F
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 09:23:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 719A53F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 09:23:19 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] local.conf: add aarch64 to the SDKMACHINE example values
Date: Tue, 22 Dec 2020 17:23:15 +0000
Message-Id: <20201222172315.3913967-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222172315.3913967-1-ross.burton@arm.com>
References: <20201222172315.3913967-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf=
.sample
index 68e71b930b..096359ee8a 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -112,7 +112,7 @@ PACKAGE_CLASSES ?=3D "package_rpm"
 # This variable specifies the architecture to build SDK items for and me=
ans
 # you can build the SDK packages for architectures other than the machin=
e you are
 # running the build on (i.e. building i686 packages on an x86_64 host).
-# Supported values are i686 and x86_64
+# Supported values are i686, x86_64, aarch64
 #SDKMACHINE ?=3D "i686"
=20
 #
--=20
2.25.1

