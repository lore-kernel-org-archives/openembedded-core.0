Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13292.1795504827483809315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 23:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=c59qa44E;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: braychur@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8567; q=dns/txt;
  s=iport01; t=1795504827; x=1796714427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yCCTTetAF1+kKcb7ObA7nLFfxNA/0+FULOxR7haAy84=;
  b=c59qa44EyoGw3Li+3LTkNGt5U/MQqVSGaJbQCrGGqM6n1ZK2gtYlKbEQ
   cE3zf0koZO6hPKExQPuqXGkzJnp6yEKhsCwOshbzNuQyQT1dgLs7Of/Gh
   Ap3k/bdj0AqFaCFq3K1sVS00l+pcxlK4HFHLW+43tIgJ5E+pKAfHYv66u
   +bWJiJkcWEsBJzgDNVh2ifzc3uSPrfu/Ee5zcZ3JkdljNnhpOxp/A64pQ
   pIbirRZ0ujjYjZDN1It4nrd3VulGl5x0vaW/kI1oaAjycDD2tk4WVHA+q
   yuKMRzj03HnSsZ1KVxhWYWX0np+vKahFvQK5gF3NdoxlMhD+gIRYC4GP2
   g==;
X-CSE-ConnectionGUID: Os4UJLeTQaGOHciwHfBDBA==
X-CSE-MsgGUID: sWkmNfgCTe2CKR+oaMcpjA==
X-IPAS-Result: =?us-ascii?q?A0BgAgAwOAVr/81K/pBaglmCV3VhQkkDhFSRdIt5hy6LB?=
 =?us-ascii?q?YF+DwEBAQ9EDQQBAYUFjiQCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEmBAsBGAEtLAMBAgMCJgItIyGDAgGCdAIBEbsAe?=
 =?us-ascii?q?n8zgQGDKQE/AkNQ2UuBaAELFAGBCi6FQoMgAYUDXRgBhH0nG4FJRIR/gQWHG?=
 =?us-ascii?q?oJqBIMugVQejHkCgU+ISUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXL?=
 =?us-ascii?q?1gbBgWBHIEegRKBA12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOA?=
 =?us-ascii?q?h8QBhYhCxsYDUgRLDcVGQQ9AW4HlBSCJyZNPRY7ASsEHnkFIxcjLxEhkl8uO?=
 =?us-ascii?q?ZF9oRGEK4wklToaM4VbpRcLmH2OCpZRhGqBaDxGgRNNIxWDIgkJQRkPjjmGT?=
 =?us-ascii?q?4IvNMkUIzUCCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:zbbIW6nJxJFwUBco0uLEWLTo5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYUGjXbv7bNGbwL9oiadjg80MFupGGyoVrSgFuqH89RVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaoDpttVJWxyz
 PU3DxAGbw+jicia6pvuH4GAhux7RCXqFIoSoDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUUSUrsUIMpWcOOAjGP2YjZYtUi9rqss6G+Vxwt0uFToGISPJYPQG5sJ9qqej
 nn5/GHfDB4xCNHF4hm/sXWlo+TXnwquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:E2x35KMSYrl8YMBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6ilfq
 GV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:2Km19WAejp5MV2r6Ew58qHM2Ps0ZS3Ty61fbIlCYB0xFYpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A83mEow1EiF9jhlaQRPLmeGuPkjUj+JutDWYDnr4?=
 =?us-ascii?q?6tpOvFhYzPD64hyy1a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62772664"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 07:20:25 +0000
Received: from sjc-ads-22316.cisco.com (sjc-ads-22316.cisco.com [171.70.24.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id BDE81180001FC;
	Tue, 24 Nov 2026 07:20:24 +0000 (GMT)
Received: by sjc-ads-22316.cisco.com (Postfix, from userid 1893719)
	id 6E1D6CC1288; Mon, 23 Nov 2026 23:20:23 -0800 (PST)
From: Bansi Raychura <braychur@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Bansi Raychura <braychur@cisco.com>
Subject: [OE-core][wrynose][PATCH] dpkg: fix CVE-2026-91094
Date: Mon, 23 Nov 2026 23:20:17 -0800
Message-Id: <20261124072017.224940-1-braychur@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-22316.cisco.com [171.70.24.48];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.24.48, sjc-ads-22316.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 07:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250961
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix using the three commits below as
referenced in [4]. This CVE allows malicious symlinks in quilt’s .pc
state to cause writes outside the extracted source tree during
rollback. [1] prepares the tar exclusion options for reuse, [2] applies
those exclusions to debian.tar to prevent it from supplying a hostile
.pc directory with symlinks that escape the source tree, and [3]
removes any existing .pc state during unpack before quilt loads it,
preventing untrusted quilt data from triggering directory traversal.

[1] https://salsa.debian.org/dpkg-team/dpkg/-/commit/314abb9f28c247c61f6cde753b9c2491fabfc02f
[2] https://salsa.debian.org/dpkg-team/dpkg/-/commit/2a31760bc2a968878700476c1de5b8ea7809e460
[3] https://salsa.debian.org/dpkg-team/dpkg/-/commit/50fb8e7fe20cee0d5b14000c32ca8c31f3bf0574
[4] https://security-tracker.debian.org/tracker/CVE-2026-91094

Signed-off-by: Bansi Raychura <braychur@cisco.com>
---
 .../dpkg/dpkg/CVE-2026-91094_p1.patch         | 55 +++++++++++++++++++
 .../dpkg/dpkg/CVE-2026-91094_p2.patch         | 49 +++++++++++++++++
 .../dpkg/dpkg/CVE-2026-91094_p3.patch         | 50 +++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.23.7.bb     |  3 +
 4 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p1.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p2.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p3.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p1.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p1.patch
new file mode 100644
index 0000000000..e2aed5e574
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p1.patch
@@ -0,0 +1,55 @@
+From 7f4df29c9b70af244235f9f20a7e08dd443c0066 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sat, 5 Sep 2026 23:41:55 +0200
+Subject: [PATCH] Dpkg::Source::Package::V2: Move tar options into a variable
+
+We will be using these options for other tar invocations.
+
+Stable-Candidate: 1.20.x 1.21.x 1.22.x
+
+CVE: CVE-2026-91094
+Upstream-Status: Backport [https://salsa.debian.org/dpkg-team/dpkg/-/commit/314abb9f28c247c61f6cde753b9c2491fabfc02f]
+
+Signed-off-by: Bansi Raychura <braychur@cisco.com>
+---
+ scripts/Dpkg/Source/Package/V2.pm | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/scripts/Dpkg/Source/Package/V2.pm b/scripts/Dpkg/Source/Package/V2.pm
+index 720a8c127..047ee87eb 100644
+--- a/scripts/Dpkg/Source/Package/V2.pm
++++ b/scripts/Dpkg/Source/Package/V2.pm
+@@ -234,19 +234,20 @@ sub do_extract {
+     my $tar = Dpkg::Source::Archive->new(
+         filename => File::Spec->catfile($self->{basedir}, $tarfile),
+     );
+-    $tar->extract($newdirectory,
+-        options => [
+-            '--anchored',
+-            '--no-wildcards-match-slash',
+-            '--exclude',
+-            '*/.pc',
+-            '--exclude',
+-            '.pc',
+-        ],
+-    );
+     # The ".pc" exclusion is only needed for 3.0 (quilt) and to avoid having
+     # an upstream tarball provide a directory with symlinks that would be
+     # blindly followed when applying the patches.
++    my @tar_options = (
++        '--anchored',
++        '--no-wildcards-match-slash',
++        '--exclude',
++        '*/.pc',
++        '--exclude',
++        '.pc',
++    );
++    $tar->extract($newdirectory,
++        options => \@tar_options,
++    );
+ 
+     # Extract additional orig tarballs.
+     foreach my $subdir (sort keys %addonfile) {
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p2.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p2.patch
new file mode 100644
index 0000000000..5253575563
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p2.patch
@@ -0,0 +1,49 @@
+From 8ff10f5f51b3bbf4805a0ca68b32d2e73f92ef74 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sat, 5 Sep 2026 23:42:20 +0200
+Subject: [PATCH] Dpkg::Source::Package::V2: Pass the same tar exclusion
+ options for debian.tar
+
+This fixes a directory traversal bug, where the debian.tar part of the
+source package can contain a hostile .pc/ directory with symlink files
+pointing outside the current source tree root.
+
+Reported-by: Thai Duong <thai@calif.io>
+Analysis-by: Anthropic LLM, verified by humans at Calif.io
+Fixes: CVE-2026-91094
+Stable-Candidate: 1.20.x 1.21.x 1.22.x
+
+CVE: CVE-2026-91094
+Upstream-Status: Backport [https://salsa.debian.org/dpkg-team/dpkg/-/commit/2a31760bc2a968878700476c1de5b8ea7809e460]
+
+Signed-off-by: Bansi Raychura <braychur@cisco.com>
+---
+ scripts/Dpkg/Source/Package/V2.pm | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/Dpkg/Source/Package/V2.pm b/scripts/Dpkg/Source/Package/V2.pm
+index 047ee87eb..81833535d 100644
+--- a/scripts/Dpkg/Source/Package/V2.pm
++++ b/scripts/Dpkg/Source/Package/V2.pm
+@@ -235,8 +235,8 @@ sub do_extract {
+         filename => File::Spec->catfile($self->{basedir}, $tarfile),
+     );
+     # The ".pc" exclusion is only needed for 3.0 (quilt) and to avoid having
+-    # an upstream tarball provide a directory with symlinks that would be
+-    # blindly followed when applying the patches.
++    # an upstream or debian tarball provide a directory with symlinks that
++    # would be blindly followed when applying the patches.
+     my @tar_options = (
+         '--anchored',
+         '--no-wildcards-match-slash',
+@@ -279,6 +279,7 @@ sub do_extract {
+     );
+     $tar->extract($newdirectory,
+         in_place => 1,
++        options => \@tar_options,
+     );
+ 
+     # Apply patches (in a separate method as it might be overridden).
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p3.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p3.patch
new file mode 100644
index 0000000000..2a56f89f40
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-91094_p3.patch
@@ -0,0 +1,50 @@
+From da0b32192b4faa9da43006fefafa3f0fd9afd2dd Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Mon, 7 Sep 2026 01:03:12 +0200
+Subject: [PATCH] Dpkg::Source::Package::V3::Quilt: Remove database dir on
+ unpack
+
+Before applying the patches, after having unpacked a source archive,
+we should make sure we have no quilt db around, as that is coming
+from a potentially untrusted origin, and might contain hostile contents
+to cause directory traversal issues.
+
+We are already filtering the quilt db directory during extraction, so
+this code should not trigger, but we add it for defense in depth and out
+of robustness.
+
+Reported-by: Thai Duong <thai@calif.io>
+Detected-by: Anthropic LLM, verified by humans at Calif.io
+Fixes: CVE-2026-91094
+Stable-Candidate: 1.20.x 1.21.x 1.22.x
+
+CVE: CVE-2026-91094
+Upstream-Status: Backport [https://salsa.debian.org/dpkg-team/dpkg/-/commit/50fb8e7fe20cee0d5b14000c32ca8c31f3bf0574]
+
+Signed-off-by: Bansi Raychura <braychur@cisco.com>
+---
+ scripts/Dpkg/Source/Package/V3/Quilt.pm | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/scripts/Dpkg/Source/Package/V3/Quilt.pm b/scripts/Dpkg/Source/Package/V3/Quilt.pm
+index edc8da16c..6c18b9f00 100644
+--- a/scripts/Dpkg/Source/Package/V3/Quilt.pm
++++ b/scripts/Dpkg/Source/Package/V3/Quilt.pm
+@@ -131,6 +131,14 @@ sub apply_patches {
+         $opts{verbose} = 0;
+     }
+ 
++    if ($opts{usage} eq 'unpack') {
++        # When unpacking, make sure we have no quilt db, which would be coming
++        # from a potentially untrusted origin.
++        # FIXME: Do not hardcode ".pc" pathname, refactor Dpkg::Source::Quilt
++        # to abstract it, to avoid needing to construct the object that loads
++        # data from the untrusted db.
++        erasedir("$dir/.pc");
++    }
+     my $quilt = $self->_build_quilt_object($dir);
+     # Trigger warnings.
+     $quilt->load_series(%opts) if $opts{warn_options};
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
index 8e838b2d05..e836648653 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
@@ -15,6 +15,9 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main;
            file://0001-dpkg-Support-muslx32-build.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch \
+           file://CVE-2026-91094_p1.patch \
+           file://CVE-2026-91094_p2.patch \
+           file://CVE-2026-91094_p3.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.53.0

