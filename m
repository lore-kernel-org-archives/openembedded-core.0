Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8B37317C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:34:13 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id oj9so16996607obc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BSOLgIB9qiAXDP4JSN0X3M9w/orBHvx/lJgaoJodjmY=;
	b=TRTCmKQkYy5YshjomFfhS4nlJgnzQAzibY61+oTfa0gQzh0BBCUYztU26qwLtnSzX4
	BrTVtV6kh748Nq7zSplz1Ts5QXbxxi0RPgg0lA3e3Ws2wsH0IbmGSsmzxwzS198aSHq+
	sYS8jERl0Pui8r6x1geat33tioN51cRv8F+kxcYXOTSO9/dwS2agXH07HR5dS/WuJyLF
	wpZtMuhMPPtpvnu0VWoTCHWyNSJ4I7c2Ff49I5bYw5OKBMpkDja9H8GdhURTJcHSyZPo
	8uZpZ9usHoyMVRPmkrjSpea9VR9ZmbVoLh++wCP22tJuOTc/j4eKoP0iE5yPbE5RTCBd
	v0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BSOLgIB9qiAXDP4JSN0X3M9w/orBHvx/lJgaoJodjmY=;
	b=ToRklR7ow7KPABVz21bb47rs6CnHg7NX4fdKLpxuV5JBzZizLP/b/FwQY92ba3iK4i
	dx1S7+3jkrCdqLdtHihn6nDm1Zhja7FtOelJUJ/qVC11DtCDsWrmN9cGbv+1vVP5JyDX
	8oN7l2HBQaPEPJbna1oF0tdA3pa1kO6NOzaKAmPg/sWg8asH5HivPGkrGKJ7jcTewpp9
	E1L8S0KHOLwJAt6Xk2R6dB5k3z9vzC/AizY5QSjzrcPfpz4MNy+F6zWnMq2cJP37lBsp
	1j5CiU5TxHuvGoZldSKkZ1TFUz8w+TWjs4zvA70ECGMfAPv4XkvHe4hNn62JjhtABhcx
	XXLA==
X-Gm-Message-State: ALoCoQkiQ1y4/PatbNACioCcf2tbXpZqQC0QEB7hQ9/1LUubQjzXeJOBr/aZHHbsmzYuPTNjJIiyQFQjJZOtRhN3L8Ky82yVkQ==
X-Received: by 10.60.60.3 with SMTP id d3mr20562668oer.24.1453152854454;
	Mon, 18 Jan 2016 13:34:14 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id v6sm5928816oer.10.2016.01.18.13.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 13:34:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 13:33:48 -0800
Message-Id: <1453152832-12019-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
References: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 1/5] strace: drop unnecessary dependency on acl
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
X-List-Received-Date: Mon, 18 Jan 2016 21:34:14 -0000

The dependency on acl was removed from strace prior to the v4.10
release, so it's no longer necessary to add a configure option to
allow acl to be disabled.

  http://sourceforge.net/p/strace/code/ci/681452b0f854833d4bd443fcd9bb0bab2b46339f

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../strace/strace-add-configure-options.patch      | 24 ++--------------------
 meta/recipes-devtools/strace/strace_4.10.bb        |  3 +--
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
index e48e4b3..a3f8ec4 100644
--- a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
+++ b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
@@ -1,4 +1,4 @@
-Add options "aio" and "acl" to enable/disable libaio and acl support.
+Add option "aio" to enable/disable libaio support.
 
 Upstream-Status: Pending
 
@@ -12,26 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index e73958c..9099370 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -270,6 +270,18 @@ AC_CHECK_HEADERS(m4_normalize([
- 	sys/vfs.h
- 	sys/xattr.h
- ]))
-+
-+AC_ARG_ENABLE([acl],
-+	[AS_HELP_STRING([--enable-acl], [turn on acl support])],
-+	[case $enableval in
-+	yes)
-+		AC_CHECK_HEADERS([sys/acl.h])
-+		;;
-+	no)  ;;
-+	*)   AC_MSG_ERROR([bad value $enableval for aio option]) ;;
-+	esac]
-+)
-+
- AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
-                  [], [], [#include <stddef.h>
- #include <sys/socket.h>
-@@ -745,6 +757,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes; then
+@@ -745,6 +745,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes;
  fi
  AC_SUBST(dl_LIBS)
  
@@ -54,4 +35,3 @@ index e73958c..9099370 100644
  dnl stack trace with libunwind
 --
 1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 20b7e3d..fe250b7 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -21,12 +21,11 @@ inherit autotools ptest bluetooth
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
 
 PACKAGECONFIG_class-target ??= "\
-    libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    libaio \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
 
 PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
 
-- 
1.9.1


