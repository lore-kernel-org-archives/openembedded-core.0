Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB73360290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:23:08 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k92so14790422edc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 23:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iE7dmnd4HLZ3wPDC77ksOHGLMd8iViv1a0IV8sKZwcs=;
	b=vnoSeQX9gUk2XcY1vjbcLfQe/hVhGqKWC03QdndHj+6VFv7yJFkNSCkFK7/BNlM8Cj
	OMp3GeRepnbdsW6ZfbkSbOVChkteoVxsluo5bxO3TRtGMbUhjntendnvX2fSNPWNP2E0
	XdyvipNSblk0gfn1yW45b0cOqpQ+Orj6skl4Z6d+EiRsqluWVvhae5S55yLnNSpdD49/
	6ETQFcMIT2/c3tWyprvt4dbHtaFSPDeuTg6Isuj1q0UfJZrApkOt+wAYP664lwSMn3I0
	3JCwgnPsVFZkHtpXir98ZV/909AvA1x3kroPlUYnNf9mRMlfonySP0Kl2NkmtrYASSvP
	OMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iE7dmnd4HLZ3wPDC77ksOHGLMd8iViv1a0IV8sKZwcs=;
	b=BfTUDSwjYdGskzeiTHEs2bo4OVYQNNLP12JotOkCcv0mjn5ftpNEsqjSaRs0xlomYa
	t/5aIHdGjcPGTQ5xL652priPGqQaCSDBHNxJLp1pA6DCBVUsAhb+ciozXEVyusAIdj3Z
	89Tz/XTGUmsE2TlKx1R0810Iauy7SlWhY0aRSPnLzsJFS4BtvK+lguhqfcXOW1FsPpm5
	wuu791oj30p06gHQm5zzs8lQbs3D/UoFg8uW6KjxbiY7cGm7dcBQ/mfQt9qZHdiPat9d
	QfTCn7arZPAdFja6HJLrgB6TcrwRFbXgGmqHdud9jycij7Q+KcWQ7ATvzZ5Ca1pK4vfT
	vXng==
X-Gm-Message-State: APjAAAUr2Kn9QWx600CgyocYO/bSl7NT/tJj9pU4bWobrMjQszHYDu7C
	vtawLi5ieJkvO6+K33MWnrVfIehsE0A=
X-Google-Smtp-Source: APXvYqy4aEp/2hIbTl1XmC2b6Hzeh34abz1aM/lF3y5508X5U/iUNembpV5YaACTw/LjQb1EO4F6Kw==
X-Received: by 2002:a50:9843:: with SMTP id h3mr9339769edb.74.1556086988892;
	Tue, 23 Apr 2019 23:23:08 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n14sm88973edr.35.2019.04.23.23.23.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 23:23:08 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 08:22:44 +0200
Message-Id: <20190424062244.1306-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] coreutils: update to 8.31
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
X-List-Received-Date: Wed, 24 Apr 2019 06:23:09 -0000

Musl fix was suggested by:
https://www.mail-archive.com/bug-coreutils@gnu.org/msg30888.html

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../coreutils/fix-minus_zero-first-defined-here.patch | 11 +++++++++++
 .../{coreutils_8.30.bb => coreutils_8.31.bb}          |  8 +++++---
 2 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch
 rename meta/recipes-core/coreutils/{coreutils_8.30.bb => coreutils_8.31.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch b/meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch
new file mode 100644
index 0000000000..fa9d047d4a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch
@@ -0,0 +1,11 @@
+--- a/lib/strtod.c
++++ b/lib/strtod.c
+@@ -302,7 +302,7 @@ compute_minus_zero (void)
+ }
+ # define minus_zero compute_minus_zero ()
+ #else
+-DOUBLE minus_zero = -0.0;
++static DOUBLE minus_zero = -0.0;
+ #endif
+ 
+ /* Convert NPTR to a DOUBLE.  If ENDPTR is not NULL, a pointer to the
diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.30.bb
rename to meta/recipes-core/coreutils/coreutils_8.31.bb
index 8f4ee55712..fa4c0d9007 100644
--- a/meta/recipes-core/coreutils/coreutils_8.30.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;beginline=1;endline=15;md5=dbe356a88b09c29232b083d1ff8ac82a"
+                    file://src/ls.c;beginline=1;endline=15;md5=c456f9896277a0543e3866777ccc0255"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
@@ -20,8 +20,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
           "
 
-SRC_URI[md5sum] = "ab06d68949758971fe744db66b572816"
-SRC_URI[sha256sum] = "e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057"
+SRC_URI_append_libc-musl = "file://fix-minus_zero-first-defined-here.patch"
+
+SRC_URI[md5sum] = "0009a224d8e288e8ec406ef0161f9293"
+SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
-- 
2.17.1


