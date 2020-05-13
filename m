Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.7135.1589379993704930069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=bt0yovHp;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ce53=63=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49McRq6wjrz4c
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 16:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589379992;
	bh=JFvUX4DP5bFdiE6TmBK2i5Nbwa4FTTKHmhpPXg8z2tM=;
	h=From:To:Subject:Date:From;
	b=bt0yovHpDT4WzvUU3QaILcjef+Gl9QPjEwVxVChi9G5NzAK5PHZFFBkuEsMo1VIL5
	 e/SraOUEnFutmSINE7h8Tg3IToWq/z8udBEcEr9NZYQge3kNwIiQev7GdL5nvg4mGj
	 zPDXMrm+SClr7DVxGFB78SmRtdleknWQtnK0YkMsHSRqlTfmS76d3JGOuvOUkaKw3K
	 lJuU9JPnGElCEvNEPsqRu94xdsVENxy0oghzFlQA0EfuLg3VpCZacMpoY8z8aDoTWZ
	 QTgsPVwHwBkgkp5RO1M7j5xWbM2TIdhb0UKlewLBBHeIp/umUNnPDQ0F2Rjcmz+lyw
	 54hJjveOhHN040W6L6Q8g0wN/JMytx1ph4mD6ANCsdtKpswTzzxHJkSoIeGTM1Kgj0
	 pRJupStUz+pmDhiDf7v4Ep6hObrZrcoB7u61MeXD4eOpnHGMk/CR0o7BnCFtMArNzq
	 CR5wUqTYzKeO2e3Yv+lou1RLxTAcW9Jp+Wl8h34/rQx3tyIkr7LAQCd1zFpxNiXwvp
	 8WXN6cHBNyykOai9mWEohBiyBEI5fpfhH1NjDwr000NBqshFOQKLz10t/Z3BTSYqGx
	 AAjsEcy+vqt0PZul6Aoh1mtl+S8zrwStAvi64uHfconClGbavZpy3N2ZR3QqRtP/m9
	 JH9M6ikr2QFeZVaCXlJ52stQ=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][warrior][PATCH] git: Upgrade 2.20.1 -> 2.20.4
Date: Wed, 13 May 2020 17:26:31 +0300
Message-Id: <20200513142631.26247-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This includes the fixes for CVE-2020-5260 and CVE-2020-11008.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
---
 meta/recipes-devtools/git/git_2.20.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.20.4.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.20.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.20.4.bb

diff --git a/meta/recipes-devtools/git/git_2.20.1.bb b/meta/recipes-devtools/git/git_2.20.1.bb
deleted file mode 100644
index 877fb05e58..0000000000
--- a/meta/recipes-devtools/git/git_2.20.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "7a7769e5c957364ed0aed89e6e67c254"
-SRC_URI[tarball.sha256sum] = "edc3bc1495b69179ba4e272e97eff93334a20decb1d8db6ec3c19c16417738fd"
-SRC_URI[manpages.md5sum] = "78c6e54a61a167dab5e8ae07036293ab"
-SRC_URI[manpages.sha256sum] = "e9c123463abd05e142defe44a8060ce6e9853dfd8c83b2542e38b7deac4e6d4c"
diff --git a/meta/recipes-devtools/git/git_2.20.4.bb b/meta/recipes-devtools/git/git_2.20.4.bb
new file mode 100644
index 0000000000..e44da452ad
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.20.4.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "6f524e37186a79848a716e2a91330868"
+SRC_URI[tarball.sha256sum] = "92719084d7648b69038ea617a3bc45ec74f60ed7eef753ae2ad84b6f0b268e9a"
+SRC_URI[manpages.md5sum] = "dceabcda244042a06ed4cabd754627a5"
+SRC_URI[manpages.sha256sum] = "72fdd1799756b1240921d10eb5c67de9a651b44d429ba7293929c9d5344ad3e0"
-- 
2.17.1

