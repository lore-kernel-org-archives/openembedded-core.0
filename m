Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 19E4060FAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 17:49:16 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id cb5so5227782wib.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 10:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jy0lhVyQkvnS6QWMNWTGYoF62qLb+2MMHcHXCinWOFM=;
	b=ciU1ZHmvwpi3QilJa3TQhBgCvi9bVra8OKjpQHvQ/BlHJEoJyw6kpolJHtlEgxC8TY
	kDreW6ZHb4yn03I3HiPbQHZRSrwYvRczaPQfMvj6bCBRKuUtYDervEHGkAS/gOAWDCDN
	L2Yy9EdjkTZOpL9p/e7Mj/iOqnVMwRKk06AlhBc3srb01jKl9YacHXZcQ9Ep921RVhL7
	ZVU0m8b0qe7K/MGzkwEEvXDBvP3K8OCFIgM0hzAPLGHRLHm5dfJjvvoYqOpZkuEJlLmy
	PPBuFA5gReJhssIY+6o5dtfewyqufsaXIwQkpq7Eod31VipeXTtPIlj7kXnQ1Yy05WDO
	n4rw==
X-Gm-Message-State: ALoCoQk6bDBrg7dJbDbjdXr9LeuQrjm1ZH18qSm83lDef9ToMHjy+jIwQpa8NtQmBJBgekV7qSVH
X-Received: by 10.180.90.197 with SMTP id by5mr19718409wib.43.1381168158379;
	Mon, 07 Oct 2013 10:49:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jf2sm41481831wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 10:49:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 18:49:08 +0100
Message-Id: <1381168150-25518-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
References: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] atk: upgrade to 2.10.0.
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
X-List-Received-Date: Mon, 07 Oct 2013 17:49:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/atk_2.10.0.bb |   23 +++++++++++++++++++++++
 meta/recipes-support/atk/atk_2.8.0.bb  |   23 -----------------------
 2 files changed, 23 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-support/atk/atk_2.10.0.bb
 delete mode 100644 meta/recipes-support/atk/atk_2.8.0.bb

diff --git a/meta/recipes-support/atk/atk_2.10.0.bb b/meta/recipes-support/atk/atk_2.10.0.bb
new file mode 100644
index 0000000..2e8216a
--- /dev/null
+++ b/meta/recipes-support/atk/atk_2.10.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "An accessibility toolkit for GNOME."
+HOMEPAGE = "http://live.gnome.org/GAP/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/libs"
+
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
+                    file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
+
+DEPENDS = "glib-2.0"
+
+inherit gnomebase gtk-doc
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "e77833d4445ebe6842e9f9a0667b0be7"
+SRC_URI[archive.sha256sum] = "636917a5036bc851d8491194645d284798ec118919a828be5e713b6ecc5b50b0"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF = "--disable-glibtest \
+                --disable-introspection"
diff --git a/meta/recipes-support/atk/atk_2.8.0.bb b/meta/recipes-support/atk/atk_2.8.0.bb
deleted file mode 100644
index 9a36ae4..0000000
--- a/meta/recipes-support/atk/atk_2.8.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "An accessibility toolkit for GNOME."
-HOMEPAGE = "http://live.gnome.org/GAP/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "x11/libs"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
-                    file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
-
-DEPENDS = "glib-2.0"
-
-inherit gnomebase gtk-doc
-
-GNOME_COMPRESS_TYPE = "xz"
-
-SRC_URI[archive.md5sum] = "c652bd25530825d604dae1c1ebd2da02"
-SRC_URI[archive.sha256sum] = "b22519176226f3e07cf6d932b77852e6b6be4780977770704b32d0f4e0686df4"
-
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF = "--disable-glibtest \
-                --disable-introspection"
-- 
1.7.10.4


