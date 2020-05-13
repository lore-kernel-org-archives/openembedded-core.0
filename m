Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.7181.1589379988010471610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=e6D9o2ma;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ce53=63=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49McRh3X3Fz4c
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 16:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589379984;
	bh=zAehnIaEIYpOeyJ5TinWgQzQwpJ6PimFzjJKFJ7qy6U=;
	h=From:To:Subject:Date:From;
	b=e6D9o2maegzOcmP677a2P3kJpVe+gSbPJuI+QsYWhUlZZTVmV331mto5QjzFmJ++7
	 r1BLduiWprJr40s0HJBYF7DbKYjO0FMlNr2MG1qh4UCfCMfNeUld6vOKO/5WLveyry
	 Jsh4hA15Ew64YEFujUPT3SlI07dS0MbwVMvdkt+q0K9eCdSPuMqe3feMZAGsTg6cRK
	 HTIldHCcA4PdKYorQBzcqp2cy//uzpauwMkx9Xwur1tUyiQZl3j5r7tL7iZFPBH7xD
	 dawxI9vdUFASfli9Io4Pc20yR1ylMehZv8fS1yCe+GzXf7hvS+DYPjdLeayqPGKcGH
	 nOkMiSPzna+7tg2FGKWkzPpKLK3ynuvVXwJ+WhrHtXMRlzcTMVadfDmKEieAVmcqGw
	 9VIrrZS2/JUvOtSqW5k1df/4CkfNs27d6Us885bKTwSbtM/w4NtMyhRm5/i/d+5gaJ
	 9wLUMFTnN+jTcE8+k1hoDQw7Bt4wgElaNazaEHdxBHlI4mfYduFD8u5MiXAlM3ic6g
	 iu9/phw1yYHXurBP26jVxmxQuFTXMxC+q7Zj1O4t4Zlhbi5+tCb2PJZooGvn9b01up
	 0o4FHzkkzfomsVoVj6HwRjzUnoYb8upppB9prJ8VF0R2dTrAPKOXar9ftPnLhMiSDg
	 ft393CYY5hEvXk/bBE8cHaxM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell][PATCH] git: Upgrade 2.24.1 -> 2.24.3
Date: Wed, 13 May 2020 17:26:23 +0300
Message-Id: <20200513142623.26201-1-bunk@stusta.de>
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

