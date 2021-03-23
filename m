Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.2972.1616463778495063658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 18:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JeoQBYfD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616463776; i=@fujitsu.com;
	bh=rs6oJR+YhlI7Aj/wOL5uSnwC7n1dhjL8OsasMZfSCLU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JeoQBYfDNQYZjqXOHt0Jssmamepor9Mp+vB07zM/4zoNAXlDJHSoDpe0zNsQS0flb
	 DUxl6aKEzgM9GIqZx0mYSrUd/YYoRmuUQiUJCtwmLfYqzFUWl0IxGY9mD4Ak8oFXSR
	 lqPwTpxThLjSFlo8grH9r+9bvnuQhsL3Iojx7Kcur0+kd7ohuDOUFv+UcAtYJvMi0Z
	 W1lP8mOVsteYj8CLlmQp6Mf7AJrWUURVP6V+aEInP5of+lcqlpO9xGrpgPno49eEvU
	 Ur3cLntIQPjksrbXOxA1jW7f0GKiGb6Bd3I9hD7ceTwl5BSTljC9r33FrykXuLqvLq
	 2sQZ3oDEkOVsA==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 24/6F-56778-0A749506; Tue, 23 Mar 2021 01:42:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MRojvfPTL
  BYP9uDYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNR40u2gsXSFb9u72drYJwt0cXIxSEksJlJ
  4tqpg4xdjJxAzglGieuT7EFsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQl7i0roUFxBYWsJNY9
  mszmM0ioCqx4NxzNhCbV8BJYt+TB2C2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYnZl5
  tZIOwqiTUd09gmMPLOQtIyC0nLAkamVYzmSUWZ6RkluYmZObqGBga6hoZGuoaWRromJnqJVbq
  JeqmluuWpxSW6hnqJ5cV6xZW5yTkpenmpJZsYgaGVUnBAZwfjz1cf9A4xSnIwKYnyiopHJgjx
  JeWnVGYkFmfEF5XmpBYfYpTh4FCS4LVwA8oJFqWmp1akZeYAwxwmLcHBoyTCq+wKlOYtLkjML
  c5Mh0idYtTlWHVg+ipmIZa8/LxUKXHeEJAZAiBFGaV5cCNgMXeJUVZKmJeRgYFBiKcgtSg3sw
  RV/hWjOAejkjDvM5BVPJl5JXCbXgEdwQR0xAfmMJAjShIRUlINTFrTC/+6CwtddGL4+MnRb+G
  rZzbXVgRGfRE1drPYN2tl5s6n8Tf5VHz8HgnIG5p0KdVZ7EmqXJ68+2RL4z1z3bCc3sObjFpb
  Z60KCV3Tvnt6w4EDB6Ljkn/wHOG4/rXsQGKm5EZbUeHNba4Shc3HJhc/8Os/8fBacci25vWXU
  2+9zzu7JOZ8dFqZxrefqg7cKhssdr/Zw6vKcVY+3/7br9j0z6UhZg+vmC9mv/Ax+NOD6QsL5q
  5zT1HPkO18et27XqQorC77Y/Bj6d5C0SdTuBqm+/G4ZfwrD5habBX5UFkh1eKuqkj0vNMqUb6
  yu+1Ki7aIOx/Lluo8q7p7l7dU87WJh7dN5ZHYtlvg3SwNJZbijERDLeai4kQAPQJwajQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-35.tower-265.messagelabs.com!1616463775!456314!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24828 invoked from network); 23 Mar 2021 01:42:55 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-35.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2021 01:42:55 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12N1gnu0014697
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 01:42:55 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 01:42:48 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 1/2] openssh: upgrade 8.4p1 -> 8.5p1
Date: Tue, 23 Mar 2021 09:42:38 +0800
Message-ID: <1616463759-38618-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

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

