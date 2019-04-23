Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 46E507D2D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:52:04 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id k64so1278678itb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=opMsUgSIehT18I8h0pqQY9MM9Knf/u6oUwTYdBWJ1ww=;
	b=zOnl2JT5X48fSPL9FPYO4gOi7eLK4v1tpzwkQ98XogIuSowiObUKCNqlfRbijk2SSE
	x+g7PsFQra544wi+4bYqpIfPZakJpANeNf+rJ2ESO2s5WmJFDBH5NpmdQQFPnVFZMEY+
	kJJQE/sa/f4Xqx0s7p+t31Ync+4oohTXVt5xaKLcE5YjfZML871aZI9NqdmkmwnmoMvl
	ApmbQ6o5h/fF6v3RHewZAl5EqM6SymNjGaTuEUM5gTsJcwVRWdLCjOaN3RwPMU2/HRbG
	XNAfylRHCXCLOYTTyosutzLEvcxDeO5bZLZFmMGE4k2n1b8dwTfNzZ0Cicxl3p8L0EQv
	1hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=opMsUgSIehT18I8h0pqQY9MM9Knf/u6oUwTYdBWJ1ww=;
	b=nKd85H1lpa7kifWB85AUAJqMCQzmClyYdBtcS85NAn+gAK5NBhqW5u2UXBlwH5/OiQ
	MmE6HJ8S0bGLfZ/JTzgwYu0C6Zg1X/CM8m9Mu83cnPnREq36pQ3DEIZ0s6zKHSnnybXP
	ncF4cx1VEk5nTFhYoM6hxFYvmT4gSg/KKYO7k1eoaAnGt1Hk4bWOt1SVS+j4IXHoxEUy
	kNWBo9b3l3uGosrAL8XCQ1SkTEAVHAPC8gwUYPmtXyxrpGOlpY2KNA0ZuOm+lqAVf+jG
	ADYcIBO8gzkYEi1G501k83+DV9zNm/wrz2EmnLLh7YDD2v2OmXRRz924Jttd7CJzdKYz
	YVBg==
X-Gm-Message-State: APjAAAWmaIQ0jtn1nu4nXqAHXgT1VK1cZC9Q7k11zmvJNztBYWdqN/78
	cIQO39lxCO4uqPhl1g5hjVWb57S81WHId9rqiDwJUw==
X-Google-Smtp-Source: APXvYqz5n0P5lLtf/WLsMswbYsc/uwli3XRtFCgTdLfqTwOfVI7RcZF/jtp6q2t++AonNA9KnQI53/LSIycewaBCSmA=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr2716049itj.62.1556038325299; 
	Tue, 23 Apr 2019 09:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<20190423161916.25572-2-alex.kanavin@gmail.com>
	<CAJTo0LYTo400cfh1NkUzVr6v3LSH3SmEvK=L1N--w6cpYVuFqg@mail.gmail.com>
	<CANNYZj_m5Tu49kun_7ChXobxfumdYW3MWxas48WT65NEtO++1g@mail.gmail.com>
In-Reply-To: <CANNYZj_m5Tu49kun_7ChXobxfumdYW3MWxas48WT65NEtO++1g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 17:51:53 +0100
Message-ID: <CAJTo0LZyfJ0Jm3bSvyPSeo0KDBBULnCRvLHYMGQ6dKDDM4fX9w@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Tue, 23 Apr 2019 16:52:04 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Alex, I must have forgot to actually post mine.

Ross

On Tue, 23 Apr 2019 at 17:51, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Done; I have rebased my patch on top of yours.
>
> Alex
>
> On Tue, 23 Apr 2019 at 18:34, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > I thought I posted an upgrade earlier but maybe not, which had a few
> > more cleanups in the recipe too.  I'll post it again, can you merge
> > them into a greatest hits?
> >
> > Ross
> >
> > On Tue, 23 Apr 2019 at 17:19, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >
> > > Drop manipulate-fds-instead-of-FILE.patch as upstream has fixed the issue
> > > long time ago:
> > >
> > > https://github.com/acpica/acpica/commit/ecb91f4c3a151cbb280ee445166e7c6f4dc441a5
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  ...{acpica_20180508.bb => acpica_20190405.bb} |  5 +-
> > >  .../manipulate-fds-instead-of-FILE.patch      | 71 -------------------
> > >  2 files changed, 2 insertions(+), 74 deletions(-)
> > >  rename meta/recipes-extended/acpica/{acpica_20180508.bb => acpica_20190405.bb} (90%)
> > >  delete mode 100644 meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
> > >
> > > diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb b/meta/recipes-extended/acpica/acpica_20190405.bb
> > > similarity index 90%
> > > rename from meta/recipes-extended/acpica/acpica_20180508.bb
> > > rename to meta/recipes-extended/acpica/acpica_20190405.bb
> > > index b5c89fafc59..c0ebd5a9317 100644
> > > --- a/meta/recipes-extended/acpica/acpica_20180508.bb
> > > +++ b/meta/recipes-extended/acpica/acpica_20190405.bb
> > > @@ -18,10 +18,9 @@ DEPENDS = "bison flex bison-native"
> > >
> > >  SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
> > >             file://rename-yy_scan_string-manually.patch \
> > > -           file://manipulate-fds-instead-of-FILE.patch \
> > >             "
> > > -SRC_URI[md5sum] = "31691e2eb82b2064f78536a3423c18d6"
> > > -SRC_URI[sha256sum] = "5d8fc9d9db9e04830d40bec9add04b21c05d466e0187d354815006fdd823cf15"
> > > +SRC_URI[md5sum] = "9ee30c8ff3012e213bc3b21a9d632215"
> > > +SRC_URI[sha256sum] = "7e144fd011c23a0a10be0b0d7448c527a4c0f621f1f835a271636e448bc96643"
> > >  UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
> > >
> > >  S = "${WORKDIR}/acpica-unix2-${PV}"
> > > diff --git a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
> > > deleted file mode 100644
> > > index d8b5f9aa8a1..00000000000
> > > --- a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
> > > +++ /dev/null
> > > @@ -1,71 +0,0 @@
> > > -From 540d80469e6a7dce6baf7214df90e86daffc5175 Mon Sep 17 00:00:00 2001
> > > -From: Fan Xin <fan.xin@jp.fujitsu.com>
> > > -Date: Mon, 5 Jun 2017 13:26:38 +0900
> > > -Subject: [PATCH] aslfiles.c: manipulate fds instead of FILE
> > > -
> > > -Copying what stdout/stderr point to is not portable and fails with
> > > -musl because FILE is an undefined struct.
> > > -
> > > -Instead, use lower-level Unix functions to modify the file that stderr
> > > -writes into. This works on the platforms that Yocto targets.
> > > -
> > > -Upstream-Status: Inappropriate [embedded specific]
> > > -
> > > -Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > > -
> > > -Rebase on acpica 20170303
> > > -
> > > -Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> > > -
> > > ----
> > > - source/compiler/aslfiles.c | 15 ++++++++++++---
> > > - 1 file changed, 12 insertions(+), 3 deletions(-)
> > > -
> > > -diff --git a/source/compiler/aslfiles.c b/source/compiler/aslfiles.c
> > > -index 82865db..cc072dc 100644
> > > ---- a/source/compiler/aslfiles.c
> > > -+++ b/source/compiler/aslfiles.c
> > > -@@ -43,6 +43,11 @@
> > > -
> > > - #include "aslcompiler.h"
> > > - #include "acapps.h"
> > > -+#include "dtcompiler.h"
> > > -+#include <sys/types.h>
> > > -+#include <sys/stat.h>
> > > -+#include <fcntl.h>
> > > -+#include <unistd.h>
> > > -
> > > - #define _COMPONENT          ACPI_COMPILER
> > > -         ACPI_MODULE_NAME    ("aslfiles")
> > > -@@ -606,6 +611,8 @@ FlOpenMiscOutputFiles (
> > > -
> > > -     if (Gbl_DebugFlag)
> > > -     {
> > > -+      int fd;
> > > -+
> > > -         Filename = FlGenerateFilename (FilenamePrefix, FILE_SUFFIX_DEBUG);
> > > -         if (!Filename)
> > > -         {
> > > -@@ -617,10 +624,10 @@ FlOpenMiscOutputFiles (
> > > -         /* Open the debug file as STDERR, text mode */
> > > -
> > > -         Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Filename = Filename;
> > > --        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle =
> > > --            freopen (Filename, "w+t", stderr);
> > > -
> > > --        if (!Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle)
> > > -+        fd = open(Filename, O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH);
> > > -+        if (fd < 0 ||
> > > -+            dup2(fd, fileno(stderr)))
> > > -         {
> > > -             /*
> > > -              * A problem with freopen is that on error, we no longer
> > > -@@ -634,6 +641,8 @@ FlOpenMiscOutputFiles (
> > > -             exit (1);
> > > -         }
> > > -
> > > -+        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
> > > -+
> > > -         AslCompilerSignon (ASL_FILE_DEBUG_OUTPUT);
> > > -         AslCompilerFileHeader (ASL_FILE_DEBUG_OUTPUT);
> > > -     }
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

