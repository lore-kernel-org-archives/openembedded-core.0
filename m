Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6971FC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 09:23:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.7001.1633339403438826169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 02:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TK4kPo3v;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so8447120wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5XazosCtvFb8VypW5onCiNK1b6C1735f4Q9eQxd78o=;
        b=TK4kPo3vpYZ9ce8JDQz6dZdd0OZlbauwU8uCx9eG9R4X1p9/p5jkoxzMZ8AcyygDK5
         JMCA/4GJ0XkROFrjtxDXrsBwh2o/GlLsp7n15aGeCdoQ7EqUZwmWVy/5wvyH3hZgggde
         KO/zrYHDEWuS+KyHFYgctojg1xMPYvsQX1y5j/WlY90f7Vi5al55hfQ9YkPeZ4GKS9EA
         hq052eeGYRcSxC0QnKA6yoIkyfbEnDFHMPkIiAAVGCdmLE/2BsGy+Ly0vzPX/uRdRJLo
         nWeQT9FbOapk4qQ4+y08E6zkLAJuMo9LEPKnk4a3bMcoi2o1FJI1/HeX7LBsSTAFs1cy
         NZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5XazosCtvFb8VypW5onCiNK1b6C1735f4Q9eQxd78o=;
        b=p49v9uNGiU5aWjv7amXM8WZq7OiHG3GPEPoLDUymmyzy7h9EpJFapxrCQ4vhS83YwO
         WGtqatYBCkhc5ehpfVv+Zyt9U3wBOxl31LMs98LjzaE4T0DsHbxoXKzYn4V18dDbVipG
         xPuRAJB7MeYpAM1FWI+RzSZVe4dwk6Xk7sIQhD1EUO5mbz3pdL91xn5DRpLeVNUOxufU
         5P55+qAtgI13hTIfEruOYKIOOx7Ah1kEP0TEpI9huEyAB0T4sk4mjbILT3hEQ3uk6Bf8
         pl/5aEEF0keRcgX7nKMkyzTNkhrDB534pDUvBRXvktuvszFwbDASpLm1cwCVUHGnc2LB
         pGyA==
X-Gm-Message-State: AOAM531cKSr0nVFnfkK96pig9q1jQzEeZmnittxZH9XCLLUiFyCX0wVh
	Oa0oosc1YZay2nkzXV4MsguhpPawGjY=
X-Google-Smtp-Source: 
 ABdhPJzA9CphvA6giTSIytqhgYx7ODlwxdOo6K8YCIZMQpLOZVKj1triXB/BAYo5CFGYicxCAXvadw==
X-Received: by 2002:a05:600c:240a:: with SMTP id
 10mr17334041wmp.170.1633339401976;
        Mon, 04 Oct 2021 02:23:21 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id
 c17sm15451556wmr.15.2021.10.04.02.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 02:23:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] inetutils: update 2.1 -> 2.2
Date: Mon,  4 Oct 2021 11:23:17 +0200
Message-Id: <20211004092317.384405-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 09:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156579

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../inetutils/inetutils/CVE-2021-40491.patch  | 88 -------------------
 ...ly-check-pam_appl.h-when-pam-enabled.patch | 12 +--
 .../{inetutils_2.1.bb => inetutils_2.2.bb}    |  3 +-
 3 files changed, 7 insertions(+), 96 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
 rename meta/recipes-connectivity/inetutils/{inetutils_2.1.bb => inetutils_2.2.bb} (98%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
deleted file mode 100644
index 202488f75c..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 98ccabf68e5b3f0a177bd1925581753d10041448 Mon Sep 17 00:00:00 2001
-From: Simon Josefsson <simon@josefsson.org>
-Date: Wed, 1 Sep 2021 09:09:50 +0200
-Subject: [PATCH] ftp: check that PASV/LSPV addresses match.
-
-* NEWS: Mention change.
-* ftp/ftp.c (initconn): Validate returned addresses.
-
-CVE: CVE-2021-40491
-
-Upstream-Status: Backport
-[https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- NEWS      |  9 +++++++++
- ftp/ftp.c | 21 +++++++++++++++++++++
- 2 files changed, 30 insertions(+)
-
-diff --git a/NEWS b/NEWS
-index 7c5e62c..bd9a4da 100644
---- a/NEWS
-+++ b/NEWS
-@@ -4,6 +4,15 @@ GNU inetutils NEWS -- history of user-visible changes.
- 
- ** ftp
- 
-+The ftp client now validate addresses returned by PASV/LSPV responses,
-+to make sure they match the server address.  Reported by ZeddYu Lu in
-+<https://lists.gnu.org/archive/html/bug-inetutils/2021-06/msg00002.html>.
-+
-+Thanks to Luke Mewburn <lukem@netbsd.org> for discussion and fix to
-+NetBSD code, we used a similar solution.
-+
-+** ftp
-+
- Disable use of readline when environment variable TERM is unset or set
- to "dumb" (caused problems with Emacs AngeFTP on MacOS).  Thanks to
- Alex Bochannek for report, debugging and patch.
-diff --git a/ftp/ftp.c b/ftp/ftp.c
-index d21dbdd..7513539 100644
---- a/ftp/ftp.c
-+++ b/ftp/ftp.c
-@@ -1365,6 +1365,13 @@ initconn (void)
- 		  uint32_t *pu32 = (uint32_t *) &data_addr_sa4->sin_addr.s_addr;
- 		  pu32[0] = htonl ( (h[0] << 24) | (h[1] << 16) | (h[2] << 8) | h[3]);
- 		}
-+		if (data_addr_sa4->sin_addr.s_addr
-+		    != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
-+		  {
-+		    printf ("Passive mode address mismatch.\n");
-+		    (void) command ("ABOR");	/* Cancel any open connection.  */
-+		    goto bad;
-+		  }
- 	    } /* LPSV IPv4 */
- 	  else /* IPv6 */
- 	    {
-@@ -1395,6 +1402,13 @@ initconn (void)
- 		  pu32[2] = htonl ( (h[8] << 24) | (h[9] << 16) | (h[10] << 8) | h[11]);
- 		  pu32[3] = htonl ( (h[12] << 24) | (h[13] << 16) | (h[14] << 8) | h[15]);
- 		}
-+		if (data_addr_sa6->sin6_addr.s6_addr
-+		    != ((struct sockaddr_in6 *) &hisctladdr)->sin6_addr.s6_addr)
-+		  {
-+		    printf ("Passive mode address mismatch.\n");
-+		    (void) command ("ABOR");	/* Cancel any open connection.  */
-+		    goto bad;
-+		  }
- 	    } /* LPSV IPv6 */
- 	}
-       else /* !EPSV && !LPSV */
-@@ -1415,6 +1429,13 @@ initconn (void)
- 			 | ((a2 & 0xff) << 8) | (a3 & 0xff) );
- 	      data_addr_sa4->sin_port =
- 		  htons (((p0 & 0xff) << 8) | (p1 & 0xff));
-+	      if (data_addr_sa4->sin_addr.s_addr
-+		  != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
-+		{
-+		  printf ("Passive mode address mismatch.\n");
-+		  (void) command ("ABOR");	/* Cancel any open connection.  */
-+		  goto bad;
-+		}
- 	    } /* PASV */
- 	  else
- 	    {
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
index 7d5c087c9d..2343c03cb4 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
@@ -1,4 +1,4 @@
-From 684e45b34a33186bb17bcee0b01814c549a60bf6 Mon Sep 17 00:00:00 2001
+From cc66e842e037fba9f06761f942abe5c4856492b8 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 6 Mar 2019 09:36:11 -0500
 Subject: [PATCH] inetutils: Import version 1.9.4
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 86136fb..b220319 100644
+index 5e16c3a..18510a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -183,6 +183,19 @@ AC_SUBST(LIBUTIL)
+@@ -182,6 +182,19 @@ AC_SUBST(LIBUTIL)
  
  # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
  if test "$with_pam" = yes ; then
@@ -38,12 +38,12 @@ index 86136fb..b220319 100644
    AC_CHECK_LIB(dl, dlopen, LIBDL=-ldl)
    AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=-lpam)
    if test "$ac_cv_lib_pam_pam_authenticate" = yes ; then
-@@ -620,7 +633,7 @@ AC_HEADER_DIRENT
- AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h errno.h fcntl.h features.h \
+@@ -617,7 +630,7 @@ AC_HEADER_DIRENT
+ AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h fcntl.h features.h \
  		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
  		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
 -		  security/pam_appl.h shadow.h \
 +		  shadow.h \
- 		  stdarg.h stdlib.h string.h stropts.h sys/tty.h \
+ 		  stropts.h sys/tty.h \
  		  sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
  		  sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
similarity index 98%
rename from meta/recipes-connectivity/inetutils/inetutils_2.1.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 45b88b1d7f..3bab137eb4 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "01b9a4bc73a47e63f6e8a07b76122d9ad2a2e46ebf14870e9c91d660b5647a22"
+SRC_URI[sha256sum] = "d547f69172df73afef691a0f7886280fd781acea28def4ff4b4b212086a89d80"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
@@ -21,7 +21,6 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
-           file://CVE-2021-40491.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.31.1


