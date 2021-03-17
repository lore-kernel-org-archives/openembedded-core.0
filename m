Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.3706.1615970417172989466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 01:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id E4/5F-33844-E60C1506; Wed, 17 Mar 2021 08:40:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MRopt7IDD
  B4NZJM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNFywymgp9SFTveT2ZqYPwq3sXIxSEkMINJ
  4v7WTmYI5zijxI8zj9i6GDk52AQ0JXq3bGHsYuTgEBHQk7j6TxQkzCygLnFpXQsLiC0sYCXx9
  NI/RhCbRUBVYnPjcmYQm1fAVWLFxcnsILaEgILElIfvoeKCEidnPmGBmCMhcfDFC2aIGkWJ2Z
  ebWSDsSok9mx+yTmDknYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXXNdY2MDfUSq3S
  T9FJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBAZZSyP58B+OqNx/0DjFKcjApifKatgQm
  CPEl5adUZiQWZ8QXleakFh9ilOHgUJLgvb0PKCdYlJqeWpGWmQMMdpi0BAePkghvwn6gNG9xQ
  WJucWY6ROoUoy7HqgPTVzELseTl56VKifNWg8wQACnKKM2DGwGLvEuMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHkLQFbxZOaVwG16BXQEE9ARhtJ+IEeUJCKkpBqYrNpDCuaruusqHL3K6m1
  uyHVSa3X8vDDVwuTaKM5V2eZfAm7tPfBrT0GS44pa6T9lx8pmqV89t2pH964TJzc823JSQuJF
  qJK+s8Mn7wvKB59KCy/9evlBSQfnztJuNdO57+IPHWS59mLq7ZQ7ru+3rhH4d/uuLtPMA/21M
  kLyG9hswvbl1imbmSs03G9Ie8lV/7PdvuwDkzFz4YF1tYbWe5g3rfsUN0/PZe+CuneFrFIPZv
  Z+NTQxeXXoVY+5gp3urr3O6W/K2CsOnRe03qcvtlRO36KcedWetymeV26wp2t8eKrIs7vhGPf
  D5v8ifJ/vpG4SWvW2PuPBVvd9zPs+/vbjtu9Y76fQ49rKlWigxFKckWioxVxUnAgAaQuNnjcD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-33.tower-238.messagelabs.com!1615970413!3560533!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5990 invoked from network); 17 Mar 2021 08:40:13 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-33.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2021 08:40:13 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12H8e7di010931
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 08:40:13 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Mar 2021 08:40:06 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
Date: Wed, 17 Mar 2021 16:39:57 +0800
Message-ID: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

0f90440ca70abab947acbd77795e9f130967956c.patch
removed since it is included in 8.5p1

License Updated : 
2-clause BSD license and 4-clause BSD license added

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...440ca70abab947acbd77795e9f130967956c.patch | 28 -------------------
 .../{openssh_8.4p1.bb => openssh_8.5p1.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.4p1.bb => openssh_8.5p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch b/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
deleted file mode 100644
index b88bc18f12..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0f90440ca70abab947acbd77795e9f130967956c Mon Sep 17 00:00:00 2001
-From: Darren Tucker <dtucker@dtucker.net>
-Date: Fri, 20 Nov 2020 13:37:54 +1100
-Subject: [PATCH] Add new pselect6_time64 syscall on ARM.
-
-This is apparently needed on armhfp/armv7hl.  bz#3232, patch from
-jjelen at redhat.com.
----
- sandbox-seccomp-filter.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-Upstream-Status: Backport
-[fixes issues on 32bit IA and probably other 32 bit platforms too with glibc 2.33]
-
-diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
-index e0768c063..5065ae7ef 100644
---- a/sandbox-seccomp-filter.c
-+++ b/sandbox-seccomp-filter.c
-@@ -267,6 +267,9 @@ static const struct sock_filter preauth_insns[] = {
- #ifdef __NR_pselect6
- 	SC_ALLOW(__NR_pselect6),
- #endif
-+#ifdef __NR_pselect6_time64
-+	SC_ALLOW(__NR_pselect6_time64),
-+#endif
- #ifdef __NR_read
- 	SC_ALLOW(__NR_read),
- #endif
diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_8.4p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.5p1.bb
index 128e2e318a..61d9b95b9e 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
@@ -6,7 +6,7 @@ and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD & ISC & MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=18d9e5a8b3dd1790d73502f50426d4d3"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=d9d2753bdef9f19466dc7bc959114b11"
 
 DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -24,9 +24,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://0f90440ca70abab947acbd77795e9f130967956c.patch \
            "
-SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
+SRC_URI[sha256sum] = "f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25"
 
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
-- 
2.25.1

