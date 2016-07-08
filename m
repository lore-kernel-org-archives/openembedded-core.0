Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA1060119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 22:48:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 66so9295352pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 15:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C/ROcJS54KC/Y7dlgl50V7I6CrqNuSh7iOlO0F8Reu8=;
	b=1CJckcIL2UN4HKJF/FcOccoTqyYo8DfLcAldOJTaFNj29IR4ZGZUWcj6XzJZ7PbDiL
	o6fMEJf6T/yORl+ti8XDlj4d7p7nRR2U66Vr8mWHbWj/95m7WLbpWtBWsQ8yTmHTpsJY
	nphu7czNrBcED/ysYF6S0XVE0pQfTUvFA6bRKIY4BIJ3vZaWf3SodbiUkzjNuAwOCpsg
	oS1ygIp3lSKa6y0In0jNlLZhqxHNAwj/EmFmpks8R4qFGSRGU9/mMx3x4n3Pc+AxAnIE
	0NZv/sEhUd/YbgCaFGNHfV9KGe8aCSGXP3DfKU0dYebHLHryZK5bDN48y2rdtHVxz7Xh
	T48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C/ROcJS54KC/Y7dlgl50V7I6CrqNuSh7iOlO0F8Reu8=;
	b=GCq9id7Onc48OEyXr72LqjkIfjyTzHtxcTzd4xYq73bDn4So0D1lkjPGdDo00IpVC+
	Lp1N/FDxk+b6X8QpZ1XifN3clYjCvRO12ol9TEgsle9fM4kEJ2Cfq7lvweW0W+TQXkMe
	wlC7DOnYtm2dfDYIz+seOtzmxuVAezbEnGe8soSesgFfhosdu92Te192+2TWE7HhBsG4
	E/dlVd3yUGvonptiZxT6GYNws5IOsUjN5ecS6JVjFRvBGJ50InA4VYkXH8dmLLcwmihO
	ECWiRF0YTgULL9tIlEj+X26GfQVTeqXMJ3QCo19WSbh/PmmMTrrSXhqKdbnXMEMr35tg
	y7EQ==
X-Gm-Message-State: ALyK8tLa6/AG3uaqBq6kzw+QwW5Zsh8abSS0MotS5c9+RFAwGfkx9NT7zKBmrhXjZl/q+Q==
X-Received: by 10.98.192.12 with SMTP id x12mr13733172pff.106.1468018118555;
	Fri, 08 Jul 2016 15:48:38 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	i68sm7007225pfe.64.2016.07.08.15.48.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jul 2016 15:48:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Fri,  8 Jul 2016 15:48:33 -0700
Message-Id: <1468018113-32659-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>, Armin Kuster <akuster@mvisa.com>
Subject: [master][PATCH] glibc: CVE-2016-4429
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
X-List-Received-Date: Fri, 08 Jul 2016 22:48:42 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvisa.com>
---
 meta/recipes-core/glibc/glibc/CVE-2016-4429.patch | 86 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb             |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-4429.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch b/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
new file mode 100644
index 0000000..074c60d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
@@ -0,0 +1,86 @@
+From bc779a1a5b3035133024b21e2f339fe4219fb11c Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 23 May 2016 20:18:34 +0200
+Subject: [PATCH] CVE-2016-4429: sunrpc: Do not use alloca in clntudp_call [BZ
+ #20112]
+
+The call is technically in a loop, and under certain circumstances
+(which are quite difficult to reproduce in a test case), alloca
+can be invoked repeatedly during a single call to clntudp_call.
+As a result, the available stack space can be exhausted (even
+though individual alloca sizes are bounded implicitly by what
+can fit into a UDP packet, as a side effect of the earlier
+successful send operation).
+---
+ ChangeLog         |  7 +++++++
+ NEWS              |  4 ++++
+ sunrpc/clnt_udp.c | 10 +++++++++-
+ 3 files changed, 20 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport
+CVE: CVE-2016-4429
+Signed-of-by: Armin Kuster <akuster@mvista.com>
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,9 @@
++2016-05-23  Florian Weimer  <fweimer@redhat.com>
++       CVE-2016-4429
++       [BZ #20112]
++       * sunrpc/clnt_udp.c (clntudp_call): Use malloc/free for the error
++       payload.
++
+ 2016-05-11  Florian Weimer  <fweimer@redhat.com>
+ 
+ 	Do not use mcheck in localedef.
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -48,6 +48,10 @@ Security related changes:
+   called with the GLOB_ALTDIRFUNC flag and encountered a long file name.
+   Reported by Alexander Cherepanov.  (CVE-2016-1234)
+ 
++* The Sun RPC UDP client could exhaust all available stack space when
++  flooded with crafted ICMP and UDP messages.  Reported by Aldy Hernandez'
++  alloca plugin for GCC.  (CVE-2016-4429)
++
+ The following bugs are resolved with this release:
+ 
+   [The release manager will add the list generated by
+Index: git/sunrpc/clnt_udp.c
+===================================================================
+--- git.orig/sunrpc/clnt_udp.c
++++ git/sunrpc/clnt_udp.c
+@@ -388,9 +388,15 @@ send_again:
+ 	  struct sock_extended_err *e;
+ 	  struct sockaddr_in err_addr;
+ 	  struct iovec iov;
+-	  char *cbuf = (char *) alloca (outlen + 256);
++	  char *cbuf = malloc (outlen + 256);
+ 	  int ret;
+ 
++	  if (cbuf == NULL)
++	    {
++	      cu->cu_error.re_errno = errno;
++	      return (cu->cu_error.re_status = RPC_CANTRECV);
++	    }
++
+ 	  iov.iov_base = cbuf + 256;
+ 	  iov.iov_len = outlen;
+ 	  msg.msg_name = (void *) &err_addr;
+@@ -415,10 +421,12 @@ send_again:
+ 		 cmsg = CMSG_NXTHDR (&msg, cmsg))
+ 	      if (cmsg->cmsg_level == SOL_IP && cmsg->cmsg_type == IP_RECVERR)
+ 		{
++		  free (cbuf);
+ 		  e = (struct sock_extended_err *) CMSG_DATA(cmsg);
+ 		  cu->cu_error.re_errno = e->ee_errno;
+ 		  return (cu->cu_error.re_status = RPC_CANTRECV);
+ 		}
++	  free (cbuf);
+ 	}
+ #endif
+       do
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 77630e3..c2a31e0 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://CVE-2016-4429.patch \
 "
 
 SRC_URI += "\
-- 
2.3.5


