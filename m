Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id BF1D57D2D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:51:03 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id f23so4300925otl.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uknPDlZIkEYzrUmj15Ed/P0ISRQ8V60AEmZ1IwW7AlI=;
	b=PaHZpiV6i4wSfiD1vsAe8Lvz6mnHyC6obZfhwIvu3ryrLl0JKk50CjUSPbe2USraDy
	iGGp8Antvx4CCS2fcSY5CoNy6JEMN4L7qW6Od33Q+51cXvkSqrzcNE9OVPXG/KnhT4Gn
	tvz3nCawv86U85laHhqOxprNB4IBWNJHTgSLROrrvRl6+kiOZECBGkcu8v6FlVWWTYq2
	df+z+YPcvZcK4r7NvDhEKZ5cU7zXkcH680++nCj6knD+hQxgOhbSEv0J9kVJXB4ySaPr
	kcWgWRV1Tk7oIaMo9BGLEpwjCr1hBK10FotcPrHMG50hmlbu+X1zEgDGMP36JonQopRD
	INyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uknPDlZIkEYzrUmj15Ed/P0ISRQ8V60AEmZ1IwW7AlI=;
	b=TPl9hkbeURbaBL9Lu0lDJIsZiet31HYpI3OzZy5iXuV5DEvIC7eUBYJD2QlzxKG9IX
	zhGCAFBWhRz1wQ/dHTMsSzHdVB4xM5LrZiOoomkzUBj6iokNZTHA1Fy5GNARJfZ6PLhg
	hwpY28MJk333rL/hzVmWip2yVz/QhYMYgw8duUUHJOKxMr90rSgoC3yB5aISNUw5pmJs
	xqaBdKAKpTkHiolnL11MYiX5UVWK76s0P781sDK1cRhGKQeXtpH9E2s03hRtbxNyGCCi
	6vol1G3pYx4JBeTTLkxePYLKa63ZarPDLjN8bzuD41dB3/tfwxmN9DM0IJae9jCiqEbt
	CfEg==
X-Gm-Message-State: APjAAAXEWK4qQ1JiQrFTKxCreAiGKRx2CGelOacAciMolMN41cp54pU8
	EG9yuYHDdhVTVon7adlgxiUmFE1E8oe9RO9s6eM=
X-Google-Smtp-Source: APXvYqyWBXcPd8iZXLQQF153tUtnM6FZMCOBl9duSv6Iv/nT7uHnSB0ErqP5Af7JTonr65Et8VrLWHDKZ9eTZoj74cA=
X-Received: by 2002:a9d:32f5:: with SMTP id
	u108mr16324834otb.153.1556038264673; 
	Tue, 23 Apr 2019 09:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<20190423161916.25572-2-alex.kanavin@gmail.com>
	<CAJTo0LYTo400cfh1NkUzVr6v3LSH3SmEvK=L1N--w6cpYVuFqg@mail.gmail.com>
In-Reply-To: <CAJTo0LYTo400cfh1NkUzVr6v3LSH3SmEvK=L1N--w6cpYVuFqg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Apr 2019 18:50:53 +0200
Message-ID: <CANNYZj_m5Tu49kun_7ChXobxfumdYW3MWxas48WT65NEtO++1g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] acpica: update to 20190405
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
X-List-Received-Date: Tue, 23 Apr 2019 16:51:03 -0000
Content-Type: text/plain; charset="UTF-8"

Done; I have rebased my patch on top of yours.

Alex

On Tue, 23 Apr 2019 at 18:34, Burton, Ross <ross.burton@intel.com> wrote:
>
> I thought I posted an upgrade earlier but maybe not, which had a few
> more cleanups in the recipe too.  I'll post it again, can you merge
> them into a greatest hits?
>
> Ross
>
> On Tue, 23 Apr 2019 at 17:19, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Drop manipulate-fds-instead-of-FILE.patch as upstream has fixed the issue
> > long time ago:
> >
> > https://github.com/acpica/acpica/commit/ecb91f4c3a151cbb280ee445166e7c6f4dc441a5
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...{acpica_20180508.bb => acpica_20190405.bb} |  5 +-
> >  .../manipulate-fds-instead-of-FILE.patch      | 71 -------------------
> >  2 files changed, 2 insertions(+), 74 deletions(-)
> >  rename meta/recipes-extended/acpica/{acpica_20180508.bb => acpica_20190405.bb} (90%)
> >  delete mode 100644 meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
> >
> > diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb b/meta/recipes-extended/acpica/acpica_20190405.bb
> > similarity index 90%
> > rename from meta/recipes-extended/acpica/acpica_20180508.bb
> > rename to meta/recipes-extended/acpica/acpica_20190405.bb
> > index b5c89fafc59..c0ebd5a9317 100644
> > --- a/meta/recipes-extended/acpica/acpica_20180508.bb
> > +++ b/meta/recipes-extended/acpica/acpica_20190405.bb
> > @@ -18,10 +18,9 @@ DEPENDS = "bison flex bison-native"
> >
> >  SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
> >             file://rename-yy_scan_string-manually.patch \
> > -           file://manipulate-fds-instead-of-FILE.patch \
> >             "
> > -SRC_URI[md5sum] = "31691e2eb82b2064f78536a3423c18d6"
> > -SRC_URI[sha256sum] = "5d8fc9d9db9e04830d40bec9add04b21c05d466e0187d354815006fdd823cf15"
> > +SRC_URI[md5sum] = "9ee30c8ff3012e213bc3b21a9d632215"
> > +SRC_URI[sha256sum] = "7e144fd011c23a0a10be0b0d7448c527a4c0f621f1f835a271636e448bc96643"
> >  UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
> >
> >  S = "${WORKDIR}/acpica-unix2-${PV}"
> > diff --git a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
> > deleted file mode 100644
> > index d8b5f9aa8a1..00000000000
> > --- a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
> > +++ /dev/null
> > @@ -1,71 +0,0 @@
> > -From 540d80469e6a7dce6baf7214df90e86daffc5175 Mon Sep 17 00:00:00 2001
> > -From: Fan Xin <fan.xin@jp.fujitsu.com>
> > -Date: Mon, 5 Jun 2017 13:26:38 +0900
> > -Subject: [PATCH] aslfiles.c: manipulate fds instead of FILE
> > -
> > -Copying what stdout/stderr point to is not portable and fails with
> > -musl because FILE is an undefined struct.
> > -
> > -Instead, use lower-level Unix functions to modify the file that stderr
> > -writes into. This works on the platforms that Yocto targets.
> > -
> > -Upstream-Status: Inappropriate [embedded specific]
> > -
> > -Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > -
> > -Rebase on acpica 20170303
> > -
> > -Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> > -
> > ----
> > - source/compiler/aslfiles.c | 15 ++++++++++++---
> > - 1 file changed, 12 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/source/compiler/aslfiles.c b/source/compiler/aslfiles.c
> > -index 82865db..cc072dc 100644
> > ---- a/source/compiler/aslfiles.c
> > -+++ b/source/compiler/aslfiles.c
> > -@@ -43,6 +43,11 @@
> > -
> > - #include "aslcompiler.h"
> > - #include "acapps.h"
> > -+#include "dtcompiler.h"
> > -+#include <sys/types.h>
> > -+#include <sys/stat.h>
> > -+#include <fcntl.h>
> > -+#include <unistd.h>
> > -
> > - #define _COMPONENT          ACPI_COMPILER
> > -         ACPI_MODULE_NAME    ("aslfiles")
> > -@@ -606,6 +611,8 @@ FlOpenMiscOutputFiles (
> > -
> > -     if (Gbl_DebugFlag)
> > -     {
> > -+      int fd;
> > -+
> > -         Filename = FlGenerateFilename (FilenamePrefix, FILE_SUFFIX_DEBUG);
> > -         if (!Filename)
> > -         {
> > -@@ -617,10 +624,10 @@ FlOpenMiscOutputFiles (
> > -         /* Open the debug file as STDERR, text mode */
> > -
> > -         Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Filename = Filename;
> > --        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle =
> > --            freopen (Filename, "w+t", stderr);
> > -
> > --        if (!Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle)
> > -+        fd = open(Filename, O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH);
> > -+        if (fd < 0 ||
> > -+            dup2(fd, fileno(stderr)))
> > -         {
> > -             /*
> > -              * A problem with freopen is that on error, we no longer
> > -@@ -634,6 +641,8 @@ FlOpenMiscOutputFiles (
> > -             exit (1);
> > -         }
> > -
> > -+        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
> > -+
> > -         AslCompilerSignon (ASL_FILE_DEBUG_OUTPUT);
> > -         AslCompilerFileHeader (ASL_FILE_DEBUG_OUTPUT);
> > -     }
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

