Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5936F793FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:16 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k12-v6so3128386oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5a7RwrcinHcFFGJNkcrB3LOoSBbE228RgT1e8cB8Kp4=;
	b=VfiDPfMjMJVGwZQQGdre60ENz70KiaTYwqDoZKBOQIgB8kjtv7NaoSMxOJ/EoLbF30
	4GBsh5GgZ3ZOCF2I5Iv24jcuwe3OOoLE2usWPa8yDRbRZsHjQ6F82xVk+sxK/I9it69n
	mfvOsyZx3HciDbSVuBV/7JNOeocpI/y8KJwYXXiTwDEbk6CLcQYGF58wkoDGPRMJ9NQX
	qBgb93StZcJ7D9qAHmrs0rKGS3/C07IqSeXpQFz6N0pMYTpDFAuV7XZix6I7csw5qPRG
	aZ/86olvBBzevaH+p9+3TP61TmbLmaMAG07YlMX8ik7pIeG/A4TLJ/ptLNCfIjQLC496
	Fxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5a7RwrcinHcFFGJNkcrB3LOoSBbE228RgT1e8cB8Kp4=;
	b=dKjGJETDmgSNNGJTx8nlVHcYgue8CotUxfeE79+QDYuJQMQ2EOGc2FLMK004bWiKXC
	DQbdxTyqV21fhgV3AAIgMycbCLQXr4ZuQT2gABDbIZBIy7IuW8hWMyAfSNM2WELg/fK7
	01B8eqNuiV0U/vJzWUEHx0VNwk7j6EWzp+XdgD00yK89nJ2Pd1ziAnG86JfJnInvYe9u
	Lu5KBTQtfJJLtu1hR+ye8GUAcKDfY9mY1TC/0RolCcS5F20ZVWto7AxQMPvdS4ktQrYF
	ON6Lq8PDIFbJFP97oCZ7D/BAcw5+4rbYoWYUYd3mCgr5DA10hY3HWS2VqATJvBPDuvL0
	y1gQ==
X-Gm-Message-State: APzg51B/2BdJ1j8l13jsm6lgCJZZ36Vdl1AwAZxF+iX0pVu6cubqrz7I
	JTyhIPQncmU5+VVXtla2WN+/t3TcESU=
X-Google-Smtp-Source: ANB0VdYhGA6s0infGGHXqtEtFdP9H7HTh3o0+jcsL1N7XJS+qWzKcR7eYG3NLzZn12sb25YU1pX8zQ==
X-Received: by 2002:aca:aa06:: with SMTP id
	t6-v6mr4152993oie.152.1534944977072; 
	Wed, 22 Aug 2018 06:36:17 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:16 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:12 +0530
Message-Id: <1534944940-21566-6-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 06/34] coreutils: CVE-2017-18018
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:16 -0000

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
 meta/recipes-core/coreutils/coreutils_8.27.bb      |  2 +
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
diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.27.bb
index ea8740a..922ea8c 100644
--- a/meta/recipes-core/coreutils/coreutils_8.27.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.27.bb
@@ -21,6 +21,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://disable-ls-output-quoting.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://CVE-2017-18018-1.patch \
+           file://CVE-2017-18018-2.patch \
           "
 
 SRC_URI[tarball.md5sum] = "502795792c212932365e077946d353ae"
-- 
2.7.4


