Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 11935793B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:20:26 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id y207-v6so3007392oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zfiKR0H1mx1DKZhofLPcaWLjLGZ3Prl32CIHrR4nrcU=;
	b=rC3VNiMcwfIZaJZWF71yjhjlr5gYeHfACk2+mb780lvfpNUIqQorU6pSVONJhcmERm
	3le+8RTE93pZHZJMhlQiCiIrNfDCqbZ3jpLzV8KURTb5R9n9ywBQP2Kk57QoJ6WwKiVj
	Bp821Fomt2O7zafPbexy7Ppu2ZphW/OEtXurh7w7R6W62FRlEXRQybub/fcIom9N0/Sh
	YTBn8grw8xFNX/dL26pco8lgoSyhYMXsv8jhLExYVqjXtcWRyUFmetR7BM1JCCCvgbnl
	8w/0ITdTM+b/FDXcBGhsyN5UB4yvXnRmeS2pNWLBczj8qJtELSv2w0jtWAYhV1xm7oM3
	E4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zfiKR0H1mx1DKZhofLPcaWLjLGZ3Prl32CIHrR4nrcU=;
	b=e4yOfrMkoDGLtXggpuz4FfWq3yQsC93RaXrYkewQc7pR1WOtn5xSCQT/fWBpM/W2Zt
	U+JSQ6YaRqhCHycNMU0xy/FJ+MgyZk+Ry/1GwWrHfnkhiK2Y3xiOK5Iq1Ec0GT3tHmsg
	ekW9wNNjHZ3qAzlqfZSu4ZWGiDdOSdSKcAcbNPDb7534GjfBvCCfhjg9EiCNtQ7nWDyh
	fUYB3F28fFehioB9vt9MLJ791lrEs8KNEwTGTp9lQwSDGLWRiBWl2b4DegFZ/HJP8jVB
	jPfeZxlZ1CaOJPTXvLsgDU3Arc8rKJ+YJSOw5AcUMEfvVnptfI96FFXqcFvrRMoa+VGe
	kCcA==
X-Gm-Message-State: APzg51DK9kpSy7wzTUPwD6KRC5G9SXe+l97/6XdcqKGs5eD1gTecpHD5
	+fBXVS3S/jGkO0YrHmIuYpvTifqy1a0=
X-Google-Smtp-Source: ANB0VdYmjfXYkieccL6nmwt2Pnnk2Qncy55Bo8z2Nw3my/9ZSvB/mbMh5ShWaBqwdIlDy2+cCASOuw==
X-Received: by 2002:aca:dfd4:: with SMTP id
	w203-v6mr4113841oig.81.1534944027672; 
	Wed, 22 Aug 2018 06:20:27 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.20.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:20:27 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:49:53 +0530
Message-Id: <1534944009-21362-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 03/19] coreutils: CVE-2017-18018
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
X-List-Received-Date: Wed, 22 Aug 2018 13:20:27 -0000

CVE-2017-18018-1:
doc: clarify chown/chgrp --dereference defaults
* doc/coreutils.texi: the documentation for the --dereference
  flag of chown/chgrp states that it is the default mode of
  operation. Document that this is only the case when operating
  non-recursively.

CVE-2017-18018-2:
doc: warn about following symlinks recursively in chown/chgrp
In both chown and chgrp (which shares its code with chown), operating
on symlinks recursively has a window of vulnerability where the
destination user or group can change the target of the operation.
Warn about combining the --dereference, --recursive, and -L flags.

* doc/coreutils.texi (warnOptDerefWithRec): Add macro.
(node chown invocation): Add it to --dereference and -L.
(node chgrp invocation): Likewise.

Affects coreutils <= 8.29

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../coreutils/coreutils/CVE-2017-18018-1.patch     | 40 +++++++++++
 .../coreutils/coreutils/CVE-2017-18018-2.patch     | 83 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.29.bb      |  2 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2017-18018-1.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2017-18018-2.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2017-18018-1.patch b/meta/recipes-core/coreutils/coreutils/CVE-2017-18018-1.patch
new file mode 100644
index 0000000..6f31eba
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2017-18018-1.patch
@@ -0,0 +1,40 @@
+From 7597cfa482e42a00a69fb9577ee523762980a9a2 Mon Sep 17 00:00:00 2001
+From: Michael Orlitzky <michael@orlitzky.com>
+Date: Thu, 28 Dec 2017 15:52:42 -0500
+Subject: doc: clarify chown/chgrp --dereference defaults
+
+* doc/coreutils.texi: the documentation for the --dereference
+  flag of chown/chgrp states that it is the default mode of
+  operation. Document that this is only the case when operating
+  non-recursively.
+
+CVE: CVE-2017-18018
+Upstream-Status: Backport from v8.30
+
+Signed-off-by: Michael Orlitzky <michael@orlitzky.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ doc/coreutils.texi | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff -Naurp coreutils-8.27_org/doc/coreutils.texi coreutils-8.27/doc/coreutils.texi
+--- coreutils-8.27_org/doc/coreutils.texi	2018-07-22 21:09:50.128736692 -0700
++++ coreutils-8.27/doc/coreutils.texi	2018-07-22 21:12:59.972219770 -0700
+@@ -10952,7 +10952,7 @@ chown -h -R --from=OLDUSER NEWUSER /
+ @cindex symbolic links, changing owner
+ @findex lchown
+ Do not act on symbolic links themselves but rather on what they point to.
+-This is the default.
++This is the default when not operating recursively.
+ 
+ @item -h
+ @itemx --no-dereference
+@@ -11082,7 +11082,7 @@ changed.
+ @cindex symbolic links, changing owner
+ @findex lchown
+ Do not act on symbolic links themselves but rather on what they point to.
+-This is the default.
++This is the default when not operating recursively.
+ 
+ @item -h
+ @itemx --no-dereference
diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2017-18018-2.patch b/meta/recipes-core/coreutils/coreutils/CVE-2017-18018-2.patch
new file mode 100644
index 0000000..c8f5f54
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2017-18018-2.patch
@@ -0,0 +1,83 @@
+From bc2fd9796403e03bb757b064d44c22fab92e6842 Mon Sep 17 00:00:00 2001
+From: Michael Orlitzky <michael@orlitzky.com>
+Date: Thu, 4 Jan 2018 11:38:21 -0500
+Subject: doc: warn about following symlinks recursively in chown/chgrp
+
+In both chown and chgrp (which shares its code with chown), operating
+on symlinks recursively has a window of vulnerability where the
+destination user or group can change the target of the operation.
+Warn about combining the --dereference, --recursive, and -L flags.
+
+* doc/coreutils.texi (warnOptDerefWithRec): Add macro.
+(node chown invocation): Add it to --dereference and -L.
+(node chgrp invocation): Likewise.
+
+See also: CVE-2017-18018
+CVE: CVE-2017-18018
+Upstream-Status: Backport from v8.30
+
+Signed-off-by: Michael Orlitzky <michael@orlitzky.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ doc/coreutils.texi | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/doc/coreutils.texi b/doc/coreutils.texi
+index 6bb9f09..9f5f95b 100644
+--- a/doc/coreutils.texi
++++ b/doc/coreutils.texi
+@@ -1428,6 +1428,19 @@ a command line argument is a symbolic link to a directory, traverse it.
+ In a recursive traversal, traverse every symbolic link to a directory
+ that is encountered.
+ @end macro
++
++@c Append the following warning to -L where appropriate (e.g. chown).
++@macro warnOptDerefWithRec
++
++Combining this dereferencing option with the @option{--recursive} option
++may create a security risk:
++During the traversal of the directory tree, an attacker may be able to
++introduce a symlink to an arbitrary target; when the tool reaches that,
++the operation will be performed on the target of that symlink,
++possibly allowing the attacker to escalate privileges.
++
++@end macro
++
+ @choptL
+ 
+ @macro choptP
+@@ -10995,6 +11008,7 @@ chown -h -R --from=OLDUSER NEWUSER /
+ @findex lchown
+ Do not act on symbolic links themselves but rather on what they point to.
+ This is the default when not operating recursively.
++@warnOptDerefWithRec
+ 
+ @item -h
+ @itemx --no-dereference
+@@ -11051,6 +11065,7 @@ Recursively change ownership of directories and their contents.
+ @xref{Traversing symlinks}.
+ 
+ @choptL
++@warnOptDerefWithRec
+ @xref{Traversing symlinks}.
+ 
+ @choptP
+@@ -11125,6 +11140,7 @@ changed.
+ @findex lchown
+ Do not act on symbolic links themselves but rather on what they point to.
+ This is the default when not operating recursively.
++@warnOptDerefWithRec
+ 
+ @item -h
+ @itemx --no-dereference
+@@ -11180,6 +11196,7 @@ Recursively change the group ownership of directories and their contents.
+ @xref{Traversing symlinks}.
+ 
+ @choptL
++@warnOptDerefWithRec
+ @xref{Traversing symlinks}.
+ 
+ @choptP
+-- 
+cgit v1.0-41-gc330
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.29.bb b/meta/recipes-core/coreutils/coreutils_8.29.bb
index 4704f32..b0572af 100644
--- a/meta/recipes-core/coreutils/coreutils_8.29.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.29.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://disable-ls-output-quoting.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://CVE-2017-18018-1.patch \
+           file://CVE-2017-18018-2.patch \
           "
 
 SRC_URI[md5sum] = "960cfe75a42c9907c71439f8eb436303"
-- 
2.7.4


