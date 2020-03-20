Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 98ED66188A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 00:21:59 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id j10so2304947pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 17:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0Qz5v59DFfQ6lxQLtLCCYxGhHuzokQISw2Ro5WuT2GQ=;
	b=IA4yqIXOvN4pMeA9jRFMlfRd85OYjVi0i/em7rPmE35nwAP08lZK7Iszk8DHgT8FIX
	tddb4daq2QidgYjswNEC0SMMMMQn4XiuVoKUq7IFsQvIn6kK+etn2uAA4j/Jjh3m5u0f
	t3goEGKHsB5EuCYfjZIiLgD9Q3cYjLIV7USm1rOzj+1eqQNRfAGQpd+F5wwETZULeeS3
	46ReFM8AB3ay52up0jDxpg549YtCNJ/hP32r+FGf48qLFajHWSN7Ksi5AKd5a/K3i7sv
	2aPJxhqnJT7ovzH9JCTtOSowyuna/eNLWzaY2RRESG5wtJGInLsnxB/uDGul2dfikd84
	EEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=0Qz5v59DFfQ6lxQLtLCCYxGhHuzokQISw2Ro5WuT2GQ=;
	b=IMy7wSLSMaHNtm+BXO/wyd3wNvjX9aDr2hn+bpk4VuAizkiJr9mafWFRSbxm4tiejA
	QPNMAR4hojg9CEtg6gpFExF6iPJzKT1L/ggvahZoYuGVknc2Nolj13FIZk7Z0rIEseqp
	iFlmNDQcHwMEXGQ9Ul7B/h1FztgUcPvjXRgYDrBO5l1Q2bJKWqwoIbfYQnEldf/1jXFB
	JnkNRw3MTdRW6/oepoYK+QGz3ymDD/z8dv/BEuKHq8m/3N3v0Rm2Z2KKTA7GQxLj2ON4
	Wgy3Za5rE7tKKzxtkSjWV0Z0oS4EPzIsQOFT1LbesPtXYoZU8cPT8wtH1o0OILTk0JsT
	vABA==
X-Gm-Message-State: ANhLgQ3UIbSDzi4ZvXH+VL2TBPCI6R1/gUNTZUE5BmUHlnPvriEPdpCd
	58LF6M7znRMowi8YXYP8I/P3HCru7c4=
X-Google-Smtp-Source: ADFU+vuJf5Ndm/MYAziqAV5oOtEAoZaLJAL42jB0HygSxBQOPaJNSRQRt3pe0BAa/3sZIaMIq0t/6A==
X-Received: by 2002:a63:6f0c:: with SMTP id k12mr6057989pgc.142.1584663720292; 
	Thu, 19 Mar 2020 17:22:00 -0700 (PDT)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	d11sm3464914pfo.39.2020.03.19.17.21.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 17:21:59 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 250F02A042C; Thu, 19 Mar 2020 17:21:58 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 17:21:56 -0700
Message-Id: <20200320002156.8456-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH v2] qemu-system-native: disable options not included in extended tarball
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
X-List-Received-Date: Fri, 20 Mar 2020 00:21:59 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

* Add PACKAGECONFIG option for xkbcommon
qemu-keymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or directory

* Add PACKAGECONFIG option and patch for libudev
commands-posix.c:53:10: fatal error: libudev.h: No such file or directory

* Add PACKAGECONFIG option for libxml2
util/osdep.c:136: undefined reference to `fcntl64'

- Without specifying libxml2, configure searches the system and pulls in the system
  libxml2 if it is present. In the process it adds -L/usr/lib64 which causes the
  system libc to be linked instead of the one from the extended tarball.

None of the above libraries appear to be included in the depends for any of the qemu
builds, so if they are getting linked in, its probably not intentionally.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  4 +++
 .../qemu/qemu/0001-Add-enable-disable-udev.patch   | 29 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3ce14d9fa0..7cf436783d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-1.patch \
            file://CVE-2020-7039-2.patch \
            file://CVE-2020-7039-3.patch \
+           file://0001-Add-enable-disable-udev.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -172,6 +173,9 @@ PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice"
 PACKAGECONFIG[usb-redir] = "--enable-usb-redir,--disable-usb-redir,usbredir"
 PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
+PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
+PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
+#PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 
 INSANE_SKIP_${PN} = "arch"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
new file mode 100644
index 0000000000..c2c5849d65
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
@@ -0,0 +1,29 @@
+From a471cf4e4c73350e090eb2cd87ec959d138012e5 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Thu, 19 Mar 2020 11:54:26 -0700
+Subject: [PATCH] Add enable/disable libudev
+
+Upstream-Status: Pending
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ configure | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure b/configure
+index cac271c..bd116eb 100755
+--- a/configure
++++ b/configure
+@@ -1539,6 +1539,10 @@ for opt do
+   ;;
+   --disable-plugins) plugins="no"
+   ;;
++  --enable-libudev) libudev="yes"
++  ;;
++  --disable-libudev) libudev="no"
++  ;;
+   *)
+       echo "ERROR: unknown option $opt"
+       echo "Try '$0 --help' for more information"
+-- 
+1.8.3.1
+
-- 
2.13.3


