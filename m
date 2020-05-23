Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.4660.1590268854894826967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 14:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=R38w1dn+;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=a6sh=7f=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Tx9H29JVz44
	for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 23:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590268851;
	bh=zAehnIaEIYpOeyJ5TinWgQzQwpJ6PimFzjJKFJ7qy6U=;
	h=From:To:Subject:Date:From;
	b=R38w1dn+CX1KW0Rb7Mj4pJdeNgOxhRChSra2IuzVRtC0VqHjh2wAza+3WqLCOtQdG
	 wr9TzCoPS2ByhF7mEUq6gR2Taa8s6Rj2g8RUZOfYdo/9MqG5ozSJOiry39utLwCD+7
	 c/C6RK4LqRf99U1p5yRWHJh/RjMLMfNJ1hMaimVUIzRhKDbGbkcoOOPvFmxgmVmDPI
	 nY3KrgaiAVl0pmG0o0XvLU4e8HcTIZoupfbobW3pPCi+vt7jJO0hHKt1BoE1dzShAV
	 /7s4amK//v/ftg3h+vCPHKfWnK8quWySdla1a/F92sFta4ZREXq1VHCObJYW1mhSlA
	 HtanU9JtizWXucyuwNK0yw53DPHCLXXspkcOR8BeHnsY/9J1PhW8ssgMMKGlEzuOsd
	 aTp9dcpC3pDPIcd+QS7PbgoEFaq9fVmMCXf1ZIHt11LshpT4xIQ7qNN1cs35iQ9rUk
	 zlMS4/54ISDNZ6XKwkBjYGOIMQ6YQL3/rcEjoa549Kh9AuzVjM2rB0MibQyyHttkbB
	 KKFA5uJgDLlEjeYFXrBTQTlqFv8YNrxYexbwh8ihk/JdDwaRGuUGDhMvYATcdUszaZ
	 +B9+dpTGgPZxx3bw1pa/2w3ztYjF97s0q2HoHgnOjZzdww+vifFHnm3YMsBXqpS4G5
	 Z/OLLHDBKYl+we8a0Q0BgG/I=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell][PATCH v2] git: Upgrade 2.24.1 -> 2.24.3
Date: Sun, 24 May 2020 00:20:47 +0300
Message-Id: <20200523212048.23036-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This includes the fixes for CVE-2020-5260 and CVE-2020-11008.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
---
 meta/recipes-devtools/git/git_2.24.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.24.3.bb |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.24.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.24.3.bb

diff --git a/meta/recipes-devtools/git/git_2.24.1.bb b/meta/recipes-devtools/git/git_2.24.1.bb
deleted file mode 100644
index daea31eab2..0000000000
--- a/meta/recipes-devtools/git/git_2.24.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "166bde96adbbc11c8843d4f8f4f9811b"
-SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
-SRC_URI[manpages.md5sum] = "31c2272a8979022497ba3d4202df145d"
-SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
diff --git a/meta/recipes-devtools/git/git_2.24.3.bb b/meta/recipes-devtools/git/git_2.24.3.bb
new file mode 100644
index 0000000000..ddd875f07b
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.24.3.bb
@@ -0,0 +1,9 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.sha256sum] = "ef6d1d1de1d7921a54d23d07479bd2766f050d6435cea5d3b5322aa4897cb3d7"
+SRC_URI[manpages.sha256sum] = "325795ba33c0be02370de79636f32ad3b447665c1f2b5b4de65181fa804bed31"
-- 
2.17.1

