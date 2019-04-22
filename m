Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 027276D268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 21:42:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id h5so10068441lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=nvcdb1QkXW7yYQcw8cVfdaWxe6PjdpvNRvuwKVnKjnE=;
	b=djkSlURJ80nvQ8z1AVxSYL5cHsAIif+UqgcQiirk9dF0iKGhcInP8uglcibDhiRror
	y5FbQmOtwGS0YSuFmMLFrEVqJROuR95K24KlFyMjzgzGX0ZoT9YXZYxzMwpw9BJmmSZ6
	tXRaufv/9mlmJ2q2orsxPNJLQsfv+hRTsBQyey4bjh88R4Voeru3jeuuGZVSzVD4lHhO
	0YGBQFntcUi7NJlGH9Ecgr/U97KAh+W9NoyxgKMdfsixAMpSj2p9pxqNnO55xEC+LH+B
	0SwBJbWRQ/Cq0uryia1sfSw+9AmoIZPK9FAEGFt8ky0oJYG8eig/rWJG7sQhIvt7UalE
	is4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nvcdb1QkXW7yYQcw8cVfdaWxe6PjdpvNRvuwKVnKjnE=;
	b=gFvr8BCpW/DAro3YlLAKr/DIAOXfNvKPALlcIxCznSE7uJ/UQ0kSnir/r6uc7TfRFC
	RG+G1w3mhi6XZqcEpIFzTO6eRub3Kkr4Dyf2iXeGcifMUbw9yOhbkwVq3tAUMezJxaTr
	icZ2W1EA87/xUoxwvo5ivnc+vf0hmTdksxiaCj++QA+P7hjXTwy8cWRXGudEmUxZ75Zu
	Ryxww2RG2TDuZmOSl7wL5tn8FD6tJCMbP13paOfMn4H8FI48HumDVJ1QQUjjV24Mm3rz
	n82j2zLfulLHnHBQHG1SAdQzd3z2vpy290XpH6waDKYW46Ic04r+5Cf7RzhubRxOElHl
	Rrgg==
X-Gm-Message-State: APjAAAWHsdbjFOmDeHEh4x0FEjRvn43FpjhDH5jVLZ7cJNxS3NrOBMVv
	K2x4Th8LQElRqE+kiel+6HsaKQaXjjU=
X-Google-Smtp-Source: APXvYqxvdjuoSigm5D5TAy4NdjGJa8+ARPagOHwhxS0/nV16y9bPDuHh0qJZQgnlnjcTyOgXtytN5A==
X-Received: by 2002:a19:6619:: with SMTP id a25mr11382686lfc.21.1555969329966; 
	Mon, 22 Apr 2019 14:42:09 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z13sm2858042ljk.41.2019.04.22.14.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 14:42:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 23:42:04 +0200
Message-Id: <20190422214204.7775-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] git: update to 2.21.0
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
X-List-Received-Date: Mon, 22 Apr 2019 21:42:10 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/git/git_2.20.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.21.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.20.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.21.0.bb

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
diff --git a/meta/recipes-devtools/git/git_2.21.0.bb b/meta/recipes-devtools/git/git_2.21.0.bb
new file mode 100644
index 0000000000..434ff8f3d4
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.21.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "b8e00c2997774c5d4aaf26fd9d9aaf64"
+SRC_URI[tarball.sha256sum] = "85eca51c7404da75e353eba587f87fea9481ba41e162206a6f70ad8118147bee"
+SRC_URI[manpages.md5sum] = "8a168697b99a9a3f04f29f7d4bacd70b"
+SRC_URI[manpages.sha256sum] = "14c76ebb4e31f9e55cf5338a04fd3a13bced0323cd51794ccf45fc74bd0c1080"
-- 
2.17.1


