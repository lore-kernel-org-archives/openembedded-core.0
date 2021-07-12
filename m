Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11240.1626097924825793933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5159CD6E
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F01923F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] tcl: mark a patch as upstreamable
Date: Mon, 12 Jul 2021 14:51:53 +0100
Message-Id: <20210712135159.2131269-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135159.2131269-1-ross.burton@arm.com>
References: <20210712135159.2131269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No reason this shouldn't be fixed upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tcltk/tcl/tcl-remove-hardcoded-install-path.patch        | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install=
-path.patch b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-instal=
l-path.patch
index 17d251d554..386fbf83d0 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.p=
atch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.p=
atch
@@ -7,10 +7,7 @@ Remove hardcoded library install path. Change $(prefix)/=
lib/ to ${libdir}.
=20
 [YOCTO #2876]
=20
-This is not a bug, but libraries should be installed into directory .../=
lib/.
-On 64bit target that should be lib64/.
-
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Pending
=20
 Signed-off-by: Song.Li <Song.Li@windriver.com>
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
--=20
2.25.1

