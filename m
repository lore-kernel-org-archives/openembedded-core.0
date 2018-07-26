Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9185278C83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:01:09 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id y2-v6so3455455wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dPHTfVuKiPP5pVPFxkAza7lg4uPIM65KeEZI5tXp95Y=;
	b=WqBgsHY7QdqPudoL/EgY/lkhBUifKrRB1Q7Vv5Cb+NE17Cu9H3czuw12njRP0kY855
	7sjzviaNz0CDvMW2Cw9TXtSczASGgSZ4TMys6N6AaFG/rhDu66orxJew1mmrniqAHKAK
	xcKm5jBSv210phZgxkq0O4fwhqfH9BEAD3fEtxy94hcUyZoJl19CK2x/Ye36xISzKXUq
	DRn+vvJKw9QtavtSaNOgNdwBTOvgTbfAXFC48vLCG8kjsi6NDzmLhJBwIb2wvIkABbur
	naw9LIw1zwVYp1k4VgXgTKAp2e6kDM6rlZN/K8ZV+4T9mffNoqqdrx8fP9rGv1wFcXXU
	RluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dPHTfVuKiPP5pVPFxkAza7lg4uPIM65KeEZI5tXp95Y=;
	b=unHyc+kZJmBVlVBTaEzZf85ptLd61oj5HrVXCW5ikuohl4GBbWVhF7dpJoy+LDzPAo
	QPIv1fA71GpW11xt9ypoESjjhZgmLdwy2UAWfSYh8hbwyLui2vwTreqCsCcfLKgIQWX1
	oHpDEeYkRKNCyHm8//Bnvf2nIDAPkAwmWRZT7nwh+/dyhVJnOllF2siTXj7AoQChQPPc
	bg/4aFiyqX6kSvIcZhMt8Uw++5fVmqkGJiwA7Bbo4XU/5RnoaXEydl3xxydAOSiq3lVH
	g52bq7hpRE3rXKdFHfKyelWNVlzsHHVQqAuZ0TQ+KLHZB3C7nm4t5pLdPRSnn0nsmpPt
	veJg==
X-Gm-Message-State: AOUpUlHJqgYKC7ZK+wtVJeMw/f7UqqG/gmDkP/ix9RNS08/F0BuFbyXU
	Mb3RWKNMhpxeimfr8ayC3iwCmHOr6G0=
X-Google-Smtp-Source: AAOMgpf6SqmMMq2wEhQr32j9jdXbZvVbrbWCzPHV1gsjqTp1K0kJkzYgKRdXt/MJXccyYU34RMpylA==
X-Received: by 2002:a1c:6b90:: with SMTP id
	a16-v6mr2625539wmi.74.1532646070010; 
	Thu, 26 Jul 2018 16:01:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h7-v6sm1948532wmb.48.2018.07.26.16.01.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 16:01:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 00:00:59 +0100
Message-Id: <20180726230100.6629-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180726230100.6629-1-ross.burton@intel.com>
References: <20180726230100.6629-1-ross.burton@intel.com>
Subject: [PATCH 4/5] update-rc.d: move to git.yoctoproject.org
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
X-List-Received-Date: Thu, 26 Jul 2018 23:01:10 -0000

The update-rc.d repository is now on git.yoctoproject.org, and has merged all of
the patches we were carrying.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../update-rc.d/update-rc.d/add-verbose.patch      | 49 ------------------
 .../update-rc.d/check-if-symlinks-are-valid.patch  | 59 ----------------------
 .../fix-to-handle-priority-numbers-correctly.patch | 28 ----------
 .../{update-rc.d_0.7.bb => update-rc.d_0.8.bb}     | 11 +---
 4 files changed, 2 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch
 delete mode 100644 meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
 delete mode 100644 meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch
 rename meta/recipes-core/update-rc.d/{update-rc.d_0.7.bb => update-rc.d_0.8.bb} (64%)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch b/meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch
deleted file mode 100644
index fb443ff15e6..00000000000
--- a/meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status: Pending
-
---- update-rc.d/update-rc.d.org	2005-01-03 00:30:47.000000000 +0200
-+++ update-rc.d/update-rc.d	2007-12-01 19:41:08.000000000 +0200
-@@ -19,6 +19,7 @@
- notreally=0
- force=0
- dostart=0
-+verbose=0
- 
- usage()
- {
-@@ -28,6 +29,7 @@
-        update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl [runlvl] [...] .
- 		-n: not really
- 		-f: force
-+		-v: verbose
- 		-r: alternate root path (default is /)
- 		-s: invoke start methods if appropriate to current runlevel
- EOF
-@@ -69,7 +71,7 @@
- 	lev=`echo $2 | cut -d/ -f1`
- 	nn=`echo $2 | cut -d/ -f2`
- 	fn="${etcd}${lev}.d/${startstop}${nn}${bn}"
--	echo "  $fn -> ../init.d/$bn"
-+	[ $verbose -eq 1 ] && echo "  $fn -> ../init.d/$bn"
- 	if [ $notreally -eq 0 ]; then
- 		mkdir -p `dirname $fn`
-  		ln -s ../init.d/$bn $fn
-@@ -89,7 +91,7 @@
- 		exit 0
- 	fi
- 
--	echo " Adding system startup for $initd/$bn ..."
-+	echo " Adding system startup for $initd/$bn."
- 
- 	for i in $startlinks; do
- 		dolink S $i
-@@ -105,6 +107,10 @@
- 			shift
- 			continue
- 			;;
-+		-v)	verbose=1
-+			shift
-+			continue
-+			;;
- 		-f)	force=1
- 			shift
- 			continue
diff --git a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
deleted file mode 100644
index 075171a5a38..00000000000
--- a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Check if symlinks are valid
-
-When using root option and $initd/$bn is a symlink, the script would fail because
-the symlink points to a path on target. For example:
-
-/path/to/target/rootfs/etc/init.d/syslog -> /etc/init.d/syslog.busybox
-
-Hence, [ -f /path/to/target/rootfs/etc/init.d/syslog ] condition would return
-false.
-
-This patch adds the posibility to check whether the file the symlink points to
-actually exists in rootfs path and then continue.
-
-Upstream-Status: Pending
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com> 
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Index: git/update-rc.d
-===================================================================
---- git.orig/update-rc.d
-+++ git/update-rc.d
-@@ -147,13 +147,34 @@ fi
- bn=$1
- shift
- 
-+sn=$initd/$bn
-+if [ -L "$sn" -a -n "$root" ]; then
-+	if which readlink >/dev/null; then
-+		while true; do
-+			linksn="$(readlink "$sn")"
-+			if [ -z "$linksn" ]; then
-+				break
-+			fi
-+
-+			sn="$linksn"
-+			case "$sn" in
-+				/*) sn="$root$sn" ;;
-+				*)  sn="$initd/$sn" ;;
-+			esac
-+		done
-+	else
-+		echo "update-rc.d: readlink tool not present, cannot check whether \
-+				$sn symlink points to a valid file." >&2
-+	fi
-+fi
-+
- if [ $1 != "remove" ]; then
--	if [ ! -f "$initd/$bn" ]; then
-+	if [ ! -f "$sn" ]; then
- 		echo "update-rc.d: $initd/$bn: file does not exist" >&2
- 		exit 1
- 	fi
- else
--	if [ -f "$initd/$bn" ]; then
-+	if [ -f "$sn" ]; then
- 		if [ $force -eq 1 ]; then
- 			echo "update-rc.d: $initd/$bn exists during rc.d purge (continuing)" >&2
- 		else
diff --git a/meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch b/meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch
deleted file mode 100644
index 85bc234a275..00000000000
--- a/meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Fix to handle priority numbers correctly.
-Previously, if the priority number is '08' or '09', for example,
-the script cannot handle them correctly as these numbers are treated
-as octal numbers.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- update-rc.d |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/update-rc.d b/update-rc.d
-index ec50d15..c70b859 100644
---- a/update-rc.d
-+++ b/update-rc.d
-@@ -205,7 +205,7 @@ case $1 in
- 				exit 1
- 			fi
- 			shift
--			NN=`printf %02d $1`
-+			NN=`printf %02d $(expr $1 + 0)`
- 			shift
- 			while [ "x$1" != "x." ]; do
- 				if [ $# -eq 0 ]; then
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
similarity index 64%
rename from meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
rename to meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index d3d3e2f2377..baa21aeae13 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -6,16 +6,9 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=148a48321b10eb37c1fa3ee02b940a75"
 
-PR = "r5"
+SRC_URI = "git://git.yoctoproject.org/update-rc.d"
+SRCREV = "22e0692898c3e7ceedc8eb5ff4ec8e0b9c340b2d"
 
-# Revision corresponding to tag update-rc.d_0.7
-SRCREV = "eca680ddf28d024954895f59a241a622dd575c11"
-
-SRC_URI = "git://github.com/philb/update-rc.d.git \
-           file://add-verbose.patch \
-           file://check-if-symlinks-are-valid.patch \
-           file://fix-to-handle-priority-numbers-correctly.patch \
-          "
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.11.0


