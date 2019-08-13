Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6C46C1C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 20:04:18 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id c19so77664779lfm.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 13:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DoAKHQEWWpphnijnL02eQ2KmV6w01oW+3uziOfFjrZA=;
	b=uT1VHinj6//FntwPNavVe7foYGUef9FhsaQB7s0KIDlb1nQShluhKVMVtfgKNnM0Yj
	2bfNRAqz4UsL932j+m31RaTKCwVc3v4FZgF27SjFQQXFFqNnkAdvxNZbZTp1q/6X1+3i
	BKkB8CRskEUANylXm/Xg6/6NC13fstgnauJsi6pMK9Dml0X09SrUOOZYVXnh11FsENnM
	dpkQ2slmnyI4HxcMXg7AA8R3whGioL/8wncCXJPMfMrrKRYlvKknQHfuDVIHOc7BZby+
	nYjvI+F26XvkxY9zUvPXffDFb7+4wRTYvPvuZHuJ4dpZAWAxNpQgS/npCE3gRB4HKsd0
	rCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DoAKHQEWWpphnijnL02eQ2KmV6w01oW+3uziOfFjrZA=;
	b=HwtrgHAYp5h37ZGLqV5f1jWxU/+eTzvjBLf6bHTVx1+p1v9KGn6qHm8KIPlyW9FVl8
	B94sj+5mj+gAUHdS9Cm4qHldHxLsvR1H6IpTfuriJyciS7EmPTCCudJeVl8lQXFQH+mS
	F9JfUtH00j5VXlPtMEwkbdid1BGVExiug+AwhKK/yH21BOlEDu4f6Of7rYpoNM8deGKG
	CuloW7l6c6+5QrdQNRTzNqMsC9QK776utpt+evleRbfG9DXnFm6Mjuh9gikaXiH6FqxH
	U1SA/k09k7c0nb8P0qZtFKRUoHiSbf6SuwTRSuGCNFDA8tiql9QmGUnNd5AdUKRUMC7t
	PEGw==
X-Gm-Message-State: APjAAAVbLob47JfaqPPLCABYyyRyX5d0fQFgVEk+K29Jk6zSR0WbrwXB
	fwmrZ4mpU7MYQeok/R/F2ml8E+XPhfo=
X-Google-Smtp-Source: APXvYqzb4quwxau/XGUL7oj1RIhUKxleWbyWLppDbNUwStGZTdIcTfjBc5fqoTvhvN6H9F6rcjfZHA==
X-Received: by 2002:a05:6512:4c8:: with SMTP id
	w8mr14597407lfq.98.1565726659265; 
	Tue, 13 Aug 2019 13:04:19 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d2sm634791ljc.15.2019.08.13.13.04.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 13:04:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 22:04:15 +0200
Message-Id: <20190813200415.8366-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] git: update to 2.22.1
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
X-List-Received-Date: Tue, 13 Aug 2019 20:04:19 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/git/git_2.22.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.22.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.22.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.22.1.bb

diff --git a/meta/recipes-devtools/git/git_2.22.0.bb b/meta/recipes-devtools/git/git_2.22.0.bb
deleted file mode 100644
index 9e55fd6eae..0000000000
--- a/meta/recipes-devtools/git/git_2.22.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "6deab33485c07cb3391ea0f255a936f2"
-SRC_URI[tarball.sha256sum] = "a4b7e4365bee43caa12a38d646d2c93743d755d1cea5eab448ffb40906c9da0b"
-SRC_URI[manpages.md5sum] = "d6cb42f12185a47ce3adaac24a1ded50"
-SRC_URI[manpages.sha256sum] = "f6a5750dfc4a0aa5ec0c0cc495d4995d1f36ed47591c3941be9756c1c3a1aa0a"
diff --git a/meta/recipes-devtools/git/git_2.22.1.bb b/meta/recipes-devtools/git/git_2.22.1.bb
new file mode 100644
index 0000000000..e0ed146b27
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.22.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "b379ee9b8c7733d01fc49998148621ef"
+SRC_URI[tarball.sha256sum] = "83bf264bfa4573faddb396cbc7f5518db082f9573aa3c8ea08b8a30d23a46adc"
+SRC_URI[manpages.md5sum] = "70aaf2da41c21b0864e9b1bb8231172c"
+SRC_URI[manpages.sha256sum] = "228da34377a6795619e1822a4fad00c87300135b811643bdb816afe4a92040f9"
-- 
2.17.1


