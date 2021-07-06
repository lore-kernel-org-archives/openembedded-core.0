Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.3568.1625560772867421153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 01:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tCmp5wzZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id w3so2147898vsw.13
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SCZu1VggLxZMdyyxwSCTpXtvesMinlnqgMsQ9/xDu4c=;
        b=tCmp5wzZb7+K10qfk6P1tCd1528KcTHv3ibuO2xjzPphOxNqivTRyH9SZNRqjy9mtN
         ssRo5TgW9dBGrKodeDs+2PcQ/+bv/wmqKzFoFDzdnbh77zEoakCW4XWkSKCGfAvmv5Hx
         hHxUQpe9EuNzxKAbGrJqf6htKI3cKvwnylzD5Eb+HlOYLMVwWuSFg9wglNcBzc0zGpFd
         2WflVTSVaElqqpWU4tyYFisHq8nyX8I/bYllwqB5gIsHQ4QJ58uTGpjDmgXF4YpYbU7s
         MtMWqFCWFyZnDzsUhuzPb6G/eRN7U8RMpqYLEZRKF9d9m+PZc9E/FpBtuADtuh8uCZ3+
         M8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SCZu1VggLxZMdyyxwSCTpXtvesMinlnqgMsQ9/xDu4c=;
        b=dZXzWXHBtVkmVVHB8PVPl+GMm4xqEsdFWEhUJT+d4kTXKeo1EqLPuuDJV0KkHSLzTa
         VhnqtM7ZMaRAA1OtrdTrOIJgmhAYdApxhG3IUswBef8PxFR0PYyQhtCe/l4/JXDsBBP4
         oFk+udPsHeCihZ42dra0jEj2ukqWczAC9DkuZcIYoQWX0+5TcxxPDGbEBPaAuXBPKsmr
         AeRLZcq6vHbKhUPB1ogi9HOySVKjnJ0MpMRXg9+TjD44DcpmcvHWGO5TMoYyuvMqASd9
         f5zlMCcxWNYqQtHxnmQxFzJsdGB2o7fUcOOpk85qf0tQu1owDP8TGhuSAPn4IOW++1wt
         poUA==
X-Gm-Message-State: AOAM530ZvM4EaKgUW7rtDkm6fa83TQELxDShJeMjLBFuPaC+RsHALjTc
	WmcBwwwnzLTSboGU1nSUvkQ8LffKkREwKSeU4NY=
X-Google-Smtp-Source: ABdhPJxoBZL5vC9vsJa9vT65qcNT7hL8SP/BKxi0q534JuNzbLSpsszIz7Bm8fzgY7nceZXdjpvDnHATI77mjTVmO/4=
X-Received: by 2002:a67:ec97:: with SMTP id h23mr13646653vsp.41.1625560771937;
 Tue, 06 Jul 2021 01:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210705183526.72564-1-alex.kanavin@gmail.com>
 <CAMKF1srpfEMgmzyMuadLMDPFEK2xKWXpho-pCfmOk_-VJD_GJg@mail.gmail.com>
 <CANNYZj-huGoLSn5gw+qCju+Cx__NOcXGC-=d_afHmZ-q-PvDig@mail.gmail.com> <CAMKF1soR_B=BsYofCT8LKQT5Us_+hpeNQ8RKRyLVbPHWPm6_MA@mail.gmail.com>
In-Reply-To: <CAMKF1soR_B=BsYofCT8LKQT5Us_+hpeNQ8RKRyLVbPHWPm6_MA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 6 Jul 2021 10:39:20 +0200
Message-ID: <CANNYZj-J0XJmeMvtzEAS+30hj01gi4vKmh7SB3YR53uqX_RuGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] texinfo: update 6.7 -> 6.8
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005f483c05c6705c7d"

--0000000000005f483c05c6705c7d
Content-Type: text/plain; charset="UTF-8"

Once again: it was bundled with the initial recipe submission over 10 years
ago, without explanation or origin info, and not added later on. There was
never any indication anyone finds it useful. Probably someone just took all
of Red Hat's patches without reviewing their utility.

I am not porting it forward, the use case is simply not there, what you are
saying is utter madness, and we should spend our time on actually useful
things, where there is clear evidence they are useful.

Alex

On Tue, 6 Jul 2021 at 10:29, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jul 6, 2021 at 12:31 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Khem, please. What is the use case you are trying to justify? Who on
> earth would want to install and read .info files on a target device (of the
> kind where saving a few kilobytes matters, no less!), when it's a million
> times more convenient to do that on the host, or just open the same things
> hosted online in a browser?
> >
>
> iff its added I would err on the side that patch is used by users,
> since adding a patch to implement unused feature would be counter
> intuitive.
> This patch has been there for long time in OE, there is not much
> effort to port it forward as other distros are maintaining this patch
> too, perhaps its better to carry this on, I would have agreed if it
> was something that OE was lugging along alone.
>
> > Sorry, no.
>
> thats fine, drop this upgrade.
>
> >
> > Alex
> >
> > On Tue, 6 Jul 2021 at 01:01, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Mon, Jul 5, 2021 at 11:35 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Drop texinfo-4.12-zlib.patch as it completely lacks a description,
> >>
> >> if it is not described then perhaps adding description to it will make
> >> things better, the patch is adding gz compressed
> >> info files which should reduce the size of these files which is quite
> >> good for embedded systems. Distros like fedora and suse
> >> are carrying this patch too.
> >>
> >> > was added together with the original recipe without an explanation in
> >> > the commit message, and is difficult to rebase.
> >> >
> >>
> >> Get it from
> https://src.fedoraproject.org/rpms/texinfo/raw/rawhide/f/texinfo-4.12-zlib.patch
> >> this time.
> >>
> >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > ---
> >> >  .../texinfo/texinfo/texinfo-4.12-zlib.patch   | 254
> ------------------
> >> >  .../{texinfo_6.7.bb => texinfo_6.8.bb}        |   4 +-
> >> >  2 files changed, 1 insertion(+), 257 deletions(-)
> >> >  delete mode 100644
> meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> >> >  rename meta/recipes-extended/texinfo/{texinfo_6.7.bb =>
> texinfo_6.8.bb} (94%)
> >> >
> >> > diff --git
> a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> >> > deleted file mode 100644
> >> > index f72097e639..0000000000
> >> > --- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> >> > +++ /dev/null
> >> > @@ -1,254 +0,0 @@
> >> > -From 3d3b66cf398853c666e724c3dbcc37d53a2240d5 Mon Sep 17 00:00:00
> 2001
> >> > -From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> >> > -Date: Tue, 29 Nov 2016 12:27:17 -0600
> >> > -Subject: [PATCH] texinfo-4.12-zlib
> >> > -
> >> > -Upstream-Status: Pending
> >> > -
> >> > -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> >> > -Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> >> > -
> >> > ----
> >> > - install-info/Makefile.in    |  2 +-
> >> > - install-info/install-info.c | 79
> ++++++++++++++++++++++---------------
> >> > - 2 files changed, 48 insertions(+), 33 deletions(-)
> >> > -
> >> > -diff --git a/install-info/Makefile.in b/install-info/Makefile.in
> >> > -index c924509..746df05 100644
> >> > ---- a/install-info/Makefile.in
> >> > -+++ b/install-info/Makefile.in
> >> > -@@ -218,7 +218,7 @@ am__installdirs = "$(DESTDIR)$(bindir)"
> "$(DESTDIR)$(bindir)"
> >> > - PROGRAMS = $(bin_PROGRAMS)
> >> > - am_ginstall_info_OBJECTS = install-info.$(OBJEXT)
> >> > - ginstall_info_OBJECTS = $(am_ginstall_info_OBJECTS)
> >> > --ginstall_info_LDADD = $(LDADD)
> >> > -+ginstall_info_LDADD = $(LDADD) -lz
> >> > - am__DEPENDENCIES_1 =
> >> > - ginstall_info_DEPENDENCIES = $(top_builddir)/gnulib/lib/libgnu.a \
> >> > -       $(am__DEPENDENCIES_1) $(am__DEPENDENCIES_1)
> >> > -diff --git a/install-info/install-info.c
> b/install-info/install-info.c
> >> > -index 21f4fe3..a7aba82 100644
> >> > ---- a/install-info/install-info.c
> >> > -+++ b/install-info/install-info.c
> >> > -@@ -19,6 +19,7 @@
> >> > - #include <getopt.h>
> >> > - #include <regex.h>
> >> > - #include <argz.h>
> >> > -+#include <zlib.h>
> >> > -
> >> > - #define TAB_WIDTH 8
> >> > -
> >> > -@@ -681,15 +682,15 @@ The first time you invoke Info you start off
> looking at this node.\n\
> >> > -
> >> > -    Return either stdin reading the file, or a non-stdin pipe reading
> >> > -    the output of the compression program.  */
> >> > --FILE *
> >> > -+void *
> >> > - open_possibly_compressed_file (char *filename,
> >> > -     void (*create_callback) (char *),
> >> > --    char **opened_filename, char **compression_program)
> >> > -+    char **opened_filename, char **compression_program, int
> *is_pipe)
> >> > - {
> >> > -   char *local_opened_filename, *local_compression_program;
> >> > -   int nread;
> >> > -   char data[13];
> >> > --  FILE *f;
> >> > -+  gzFile *f;
> >> > -
> >> > -   /* We let them pass NULL if they don't want this info, but it's
> easier
> >> > -      to always determine it.  */
> >> > -@@ -697,48 +698,48 @@ open_possibly_compressed_file (char *filename,
> >> > -     opened_filename = &local_opened_filename;
> >> > -
> >> > -   *opened_filename = filename;
> >> > --  f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+  f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -   if (!f)
> >> > -     {
> >> > -       *opened_filename = concat (filename, ".gz", "");
> >> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -     }
> >> > -   if (!f)
> >> > -     {
> >> > -       free (*opened_filename);
> >> > -       *opened_filename = concat (filename, ".xz", "");
> >> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -     }
> >> > -   if (!f)
> >> > -     {
> >> > -       free (*opened_filename);
> >> > -       *opened_filename = concat (filename, ".bz2", "");
> >> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -     }
> >> > -   if (!f)
> >> > -     {
> >> > -       free (*opened_filename);
> >> > -       *opened_filename = concat (filename, ".lz", "");
> >> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -     }
> >> > -   if (!f)
> >> > -     {
> >> > -      free (*opened_filename);
> >> > -      *opened_filename = concat (filename, ".lzma", "");
> >> > --     f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+     f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -     }
> >> > - #ifdef __MSDOS__
> >> > -   if (!f)
> >> > -     {
> >> > -       free (*opened_filename);
> >> > -       *opened_filename = concat (filename, ".igz", "");
> >> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -     }
> >> > -   if (!f)
> >> > -     {
> >> > -       free (*opened_filename);
> >> > -       *opened_filename = concat (filename, ".inz", "");
> >> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -     }
> >> > - #endif /* __MSDOS__ */
> >> > -   if (!f)
> >> > -@@ -754,7 +755,7 @@ open_possibly_compressed_file (char *filename,
> >> > -           (*create_callback) (filename);
> >> > -
> >> > -           /* And try opening it again.  */
> >> > --          f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+          f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -           if (!f)
> >> > -             return 0;
> >> > -         }
> >> > -@@ -764,26 +765,26 @@ open_possibly_compressed_file (char *filename,
> >> > -
> >> > -   /* Read first few bytes of file rather than relying on the
> filename.
> >> > -      If the file is shorter than this it can't be usable anyway.  */
> >> > --  nread = fread (data, sizeof (data), 1, f);
> >> > --  if (nread != 1)
> >> > -+  nread = gzread (f, data, sizeof (data));
> >> > -+  if (nread != sizeof (data))
> >> > -     {
> >> > --      if (nread == 0)
> >> > -+      if (nread >= 0)
> >> > -         {
> >> > -           /* Try to create the file if its empty. */
> >> > --          if (feof (f) && create_callback)
> >> > -+          if (gzeof(f) && create_callback)
> >> > -             {
> >> > --              if (fclose (f) != 0)
> >> > -+              if (gzclose(f) != 0)
> >> > -                 return 0; /* unknown error closing file */
> >> > -
> >> > --              if (remove (filename) != 0)
> >> > -+              if (remove(filename) != 0)
> >> > -                 return 0; /* unknown error deleting file */
> >> > -
> >> > -               (*create_callback) (filename);
> >> > --              f = fopen (*opened_filename, FOPEN_RBIN);
> >> > -+              f = gzopen (*opened_filename, FOPEN_RBIN);
> >> > -               if (!f)
> >> > -                 return 0;
> >> > --              nread = fread (data, sizeof (data), 1, f);
> >> > --              if (nread == 0)
> >> > -+              nread = gzread(f, data, sizeof (data));
> >> > -+              if (nread >= 0)
> >> > -                 return 0;
> >> > -               goto determine_file_type; /* success */
> >> > -             }
> >> > -@@ -854,35 +855,40 @@ determine_file_type:
> >> > -     *compression_program = NULL;
> >> > -
> >> > -   /* Seek back over the magic bytes.  */
> >> > --  if (fseek (f, 0, 0) < 0)
> >> > -+  if (gzseek (f, 0, SEEK_SET) == -1)
> >> > -     return 0;
> >> > -
> >> > -   if (*compression_program)
> >> > -     { /* It's compressed, so open a pipe.  */
> >> > -+      FILE *p;
> >> > -       char *command = concat (*compression_program, " -d", "");
> >> > -
> >> > --      if (fclose (f) < 0)
> >> > -+      if (gzclose (f) < 0)
> >> > -         return 0;
> >> > --      f = freopen (*opened_filename, FOPEN_RBIN, stdin);
> >> > --      if (!f)
> >> > -+      p = freopen (*opened_filename, FOPEN_RBIN, stdin);
> >> > -+      if (!p)
> >> > -         return 0;
> >> > --      f = popen (command, "r");
> >> > --      if (!f)
> >> > -+      p = popen (command, "r");
> >> > -+      if (!p)
> >> > -         {
> >> > -           /* Used for error message in calling code. */
> >> > -           *opened_filename = command;
> >> > -           return 0;
> >> > -         }
> >> > -+      else
> >> > -+        *is_pipe = 1;
> >> > -+      return p;
> >> > -     }
> >> > -   else
> >> > -     {
> >> > --#if O_BINARY
> >> > -+#if 0 && O_BINARY
> >> > -       /* Since this is a text file, and we opened it in binary mode,
> >> > -          switch back to text mode.  */
> >> > -       f = freopen (*opened_filename, "r", f);
> >> > -       if (! f)
> >> > -       return 0;
> >> > - #endif
> >> > -+      *is_pipe = 0;
> >> > -     }
> >> > -
> >> > -   return f;
> >> > -@@ -901,7 +907,8 @@ readfile (char *filename, int *sizep,
> >> > -     void (*create_callback) (char *), char **opened_filename,
> >> > -     char **compression_program)
> >> > - {
> >> > --  FILE *f;
> >> > -+  void *f;
> >> > -+  int pipe_p;
> >> > -   int filled = 0;
> >> > -   int data_size = 8192;
> >> > -   char *data = xmalloc (data_size);
> >> > -@@ -909,14 +916,20 @@ readfile (char *filename, int *sizep,
> >> > -   /* If they passed the space for the file name to return, use it.
> */
> >> > -   f = open_possibly_compressed_file (filename, create_callback,
> >> > -                                      opened_filename,
> >> > --                                     compression_program);
> >> > -+                                     compression_program,
> >> > -+                                     &pipe_p);
> >> > -
> >> > -   if (!f)
> >> > -     return 0;
> >> > -
> >> > -   for (;;)
> >> > -     {
> >> > --      int nread = fread (data + filled, 1, data_size - filled, f);
> >> > -+      int nread;
> >> > -+
> >> > -+      if (pipe_p)
> >> > -+        nread = fread (data + filled, 1, data_size - filled, f);
> >> > -+      else
> >> > -+        nread = gzread (f, data + filled, data_size - filled);
> >> > -       if (nread < 0)
> >> > -         return 0;
> >> > -       if (nread == 0)
> >> > -@@ -935,8 +948,10 @@ readfile (char *filename, int *sizep,
> >> > -   /* We need to close the stream, since on some systems the pipe
> created
> >> > -      by popen is simulated by a temporary file which only gets
> removed
> >> > -      inside pclose.  */
> >> > --  if (f != stdin)
> >> > -+  if (pipe_p)
> >> > -     pclose (f);
> >> > -+  else
> >> > -+    gzclose (f);
> >> > -
> >> > -   *sizep = filled;
> >> > -   return data;
> >> > diff --git a/meta/recipes-extended/texinfo/texinfo_6.7.bb
> b/meta/recipes-extended/texinfo/texinfo_6.8.bb
> >> > similarity index 94%
> >> > rename from meta/recipes-extended/texinfo/texinfo_6.7.bb
> >> > rename to meta/recipes-extended/texinfo/texinfo_6.8.bb
> >> > index d421b79a0b..e5046ffbe1 100644
> >> > --- a/meta/recipes-extended/texinfo/texinfo_6.7.bb
> >> > +++ b/meta/recipes-extended/texinfo/texinfo_6.8.bb
> >> > @@ -29,15 +29,13 @@ TARGET_PATCH = "file://use_host_makedoc.patch"
> >> >  TARGET_PATCH_class-native = ""
> >> >
> >> >  SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
> >> > -           file://texinfo-4.12-zlib.patch \
> >> >             file://disable-native-tools.patch \
> >> >             file://link-zip.patch \
> >> >             file://dont-depend-on-help2man.patch \
> >> >             ${TARGET_PATCH} \
> >> >             "
> >> >
> >> > -SRC_URI[md5sum] = "f0c1782f68ef73738d74bd1e9e30793a"
> >> > -SRC_URI[sha256sum] =
> "a52d05076b90032cb2523673c50e53185938746482cf3ca0213e9b4b50ac2d3e"
> >> > +SRC_URI[sha256sum] =
> "8e09cf753ad1833695d2bac0f57dc3bd6bcbbfbf279450e1ba3bc2d7fb297d08"
> >> >
> >> >  tex_texinfo = "texmf/tex/texinfo"
> >> >
> >> > --
> >> > 2.31.1
> >> >
> >> >
> >> > 
> >> >
>

--0000000000005f483c05c6705c7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Once again: it was bundled with the initial recipe su=
bmission over 10 years ago, without explanation or origin info, and not add=
ed later on. There was never any indication anyone finds it useful. Probabl=
y someone just took all of Red Hat&#39;s patches without reviewing their ut=
ility.<br></div><div><br></div><div>I am not porting it forward, the use ca=
se is simply not there, what you are saying is utter madness, and we should=
 spend our time on actually useful things, where there is clear evidence th=
ey are useful. <br></div><div></div><div><br></div><div>Alex<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, 6 Jul 2021 at 10:29, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, Jul 6, 2021 at 12:31 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Khem, please. What is the use case you are trying to justify? Who on =
earth would want to install and read .info files on a target device (of the=
 kind where saving a few kilobytes matters, no less!), when it&#39;s a mill=
ion times more convenient to do that on the host, or just open the same thi=
ngs hosted online in a browser?<br>
&gt;<br>
<br>
iff its added I would err on the side that patch is used by users,<br>
since adding a patch to implement unused feature would be counter<br>
intuitive.<br>
This patch has been there for long time in OE, there is not much<br>
effort to port it forward as other distros are maintaining this patch<br>
too, perhaps its better to carry this on, I would have agreed if it<br>
was something that OE was lugging along alone.<br>
<br>
&gt; Sorry, no.<br>
<br>
thats fine, drop this upgrade.<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 6 Jul 2021 at 01:01, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jul 5, 2021 at 11:35 AM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Drop texinfo-4.12-zlib.patch as it completely lacks a descri=
ption,<br>
&gt;&gt;<br>
&gt;&gt; if it is not described then perhaps adding description to it will=
 make<br>
&gt;&gt; things better, the patch is adding gz compressed<br>
&gt;&gt; info files which should reduce the size of these files which is q=
uite<br>
&gt;&gt; good for embedded systems. Distros like fedora and suse<br>
&gt;&gt; are carrying this patch too.<br>
&gt;&gt;<br>
&gt;&gt; &gt; was added together with the original recipe without an expla=
nation in<br>
&gt;&gt; &gt; the commit message, and is difficult to rebase.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Get it from <a href=3D"https://src.fedoraproject.org/rpms/texinfo=
/raw/rawhide/f/texinfo-4.12-zlib.patch" rel=3D"noreferrer" target=3D"_blank=
">https://src.fedoraproject.org/rpms/texinfo/raw/rawhide/f/texinfo-4.12-zli=
b.patch</a><br>
&gt;&gt; this time.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../texinfo/texinfo/texinfo-4.12-zlib.patch=C2=A0 =C2=
=A0| 254 ------------------<br>
&gt;&gt; &gt;=C2=A0 .../{<a href=3D"http://texinfo_6.7.bb" rel=3D"noreferr=
er" target=3D"_blank">texinfo_6.7.bb</a> =3D&gt; <a href=3D"http://texinfo_=
6.8.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.8.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 1 insertion(+), 257 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-extended/texinfo/texin=
fo/texinfo-4.12-zlib.patch<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-extended/texinfo/{<a href=3D"http:=
//texinfo_6.7.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a> =
=3D&gt; <a href=3D"http://texinfo_6.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">texinfo_6.8.bb</a>} (94%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-extended/texinfo/texinfo/texinfo-4=
.12-zlib.patch b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.pa=
tch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index f72097e639..0000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zli=
b.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,254 +0,0 @@<br>
&gt;&gt; &gt; -From 3d3b66cf398853c666e724c3dbcc37d53a2240d5 Mon Sep 17 00=
:00:00 2001<br>
&gt;&gt; &gt; -From: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.cam=
acho@intel.com" target=3D"_blank">edwin.plauchu.camacho@intel.com</a>&gt;<b=
r>
&gt;&gt; &gt; -Date: Tue, 29 Nov 2016 12:27:17 -0600<br>
&gt;&gt; &gt; -Subject: [PATCH] texinfo-4.12-zlib<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Pending<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.k=
ukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
&gt;&gt; &gt; -Signed-off-by: Edwin Plauchu &lt;<a href=3D"mailto:edwin.pl=
auchu.camacho@intel.com" target=3D"_blank">edwin.plauchu.camacho@intel.com<=
/a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - install-info/Makefile.in=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt; &gt; - install-info/install-info.c | 79 ++++++++++++++++++++++---=
------------<br>
&gt;&gt; &gt; - 2 files changed, 48 insertions(+), 33 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/install-info/Makefile.in b/install-info/Makefi=
le.in<br>
&gt;&gt; &gt; -index c924509..746df05 100644<br>
&gt;&gt; &gt; ---- a/install-info/Makefile.in<br>
&gt;&gt; &gt; -+++ b/install-info/Makefile.in<br>
&gt;&gt; &gt; -@@ -218,7 +218,7 @@ am__installdirs =3D &quot;$(DESTDIR)$(b=
indir)&quot; &quot;$(DESTDIR)$(bindir)&quot;<br>
&gt;&gt; &gt; - PROGRAMS =3D $(bin_PROGRAMS)<br>
&gt;&gt; &gt; - am_ginstall_info_OBJECTS =3D install-info.$(OBJEXT)<br>
&gt;&gt; &gt; - ginstall_info_OBJECTS =3D $(am_ginstall_info_OBJECTS)<br>
&gt;&gt; &gt; --ginstall_info_LDADD =3D $(LDADD)<br>
&gt;&gt; &gt; -+ginstall_info_LDADD =3D $(LDADD) -lz<br>
&gt;&gt; &gt; - am__DEPENDENCIES_1 =3D<br>
&gt;&gt; &gt; - ginstall_info_DEPENDENCIES =3D $(top_builddir)/gnulib/lib/=
libgnu.a \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__DEPENDENCIES_1) $(am__DEPE=
NDENCIES_1)<br>
&gt;&gt; &gt; -diff --git a/install-info/install-info.c b/install-info/ins=
tall-info.c<br>
&gt;&gt; &gt; -index 21f4fe3..a7aba82 100644<br>
&gt;&gt; &gt; ---- a/install-info/install-info.c<br>
&gt;&gt; &gt; -+++ b/install-info/install-info.c<br>
&gt;&gt; &gt; -@@ -19,6 +19,7 @@<br>
&gt;&gt; &gt; - #include &lt;getopt.h&gt;<br>
&gt;&gt; &gt; - #include &lt;regex.h&gt;<br>
&gt;&gt; &gt; - #include &lt;argz.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;zlib.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #define TAB_WIDTH 8<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -681,15 +682,15 @@ The first time you invoke Info you st=
art off looking at this node.\n\<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 Return either stdin reading the file, or a no=
n-stdin pipe reading<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 the output of the compression program.=C2=A0 =
*/<br>
&gt;&gt; &gt; --FILE *<br>
&gt;&gt; &gt; -+void *<br>
&gt;&gt; &gt; - open_possibly_compressed_file (char *filename,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0void (*create_callback) (char *),<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 char **opened_filename, char **compression_p=
rogram)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char **opened_filename, char **compression_p=
rogram, int *is_pipe)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0char *local_opened_filename, *local_compressio=
n_program;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0int nread;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0char data[13];<br>
&gt;&gt; &gt; --=C2=A0 FILE *f;<br>
&gt;&gt; &gt; -+=C2=A0 gzFile *f;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0/* We let them pass NULL if they don&#39;t wan=
t this info, but it&#39;s easier<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 to always determine it.=C2=A0 */<br>
&gt;&gt; &gt; -@@ -697,48 +698,48 @@ open_possibly_compressed_file (char *=
filename,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0opened_filename =3D &amp;local_opened_f=
ilename;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0*opened_filename =3D filename;<br>
&gt;&gt; &gt; --=C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (fil=
ename, &quot;.gz&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_=
RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN=
_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (fil=
ename, &quot;.xz&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_=
RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN=
_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (fil=
ename, &quot;.bz2&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_=
RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN=
_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (fil=
ename, &quot;.lz&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_=
RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN=
_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 free (*opened_filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 *opened_filename =3D concat (filename,=
 &quot;.lzma&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0f =3D fopen (*opened_filename, FOPEN_R=
BIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0f =3D gzopen (*opened_filename, FOPEN_=
RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - #ifdef __MSDOS__<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (fil=
ename, &quot;.igz&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_=
RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN=
_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (fil=
ename, &quot;.inz&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_=
RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN=
_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - #endif /* __MSDOS__ */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -@@ -754,7 +755,7 @@ open_possibly_compressed_file (char *fi=
lename,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*create_callback)=
 (filename);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* And try opening=
 it again.=C2=A0 */<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_fi=
lename, FOPEN_RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_f=
ilename, FOPEN_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -764,26 +765,26 @@ open_possibly_compressed_file (char *=
filename,<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0/* Read first few bytes of file rather than re=
lying on the filename.<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 If the file is shorter than this it ca=
n&#39;t be usable anyway.=C2=A0 */<br>
&gt;&gt; &gt; --=C2=A0 nread =3D fread (data, sizeof (data), 1, f);<br>
&gt;&gt; &gt; --=C2=A0 if (nread !=3D 1)<br>
&gt;&gt; &gt; -+=C2=A0 nread =3D gzread (f, data, sizeof (data));<br>
&gt;&gt; &gt; -+=C2=A0 if (nread !=3D sizeof (data))<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (nread =3D=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (nread &gt;=3D 0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to create t=
he file if its empty. */<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (feof (f) &amp;&amp;=
 create_callback)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gzeof(f) &amp;&amp;=
 create_callback)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fclos=
e (f) !=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gzclo=
se(f) !=3D 0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0return 0; /* unknown error closing file */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (remov=
e (filename) !=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (remov=
e(filename) !=3D 0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0return 0; /* unknown error deleting file */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*cr=
eate_callback) (filename);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D fop=
en (*opened_filename, FOPEN_RBIN);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D gzo=
pen (*opened_filename, FOPEN_RBIN);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0return 0;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D=
 fread (data, sizeof (data), 1, f);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nread=
 =3D=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D=
 gzread(f, data, sizeof (data));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nread=
 &gt;=3D 0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0return 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto=
 determine_file_type; /* success */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -854,35 +855,40 @@ determine_file_type:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*compression_program =3D NULL;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0/* Seek back over the magic bytes.=C2=A0 */<br=
>
&gt;&gt; &gt; --=C2=A0 if (fseek (f, 0, 0) &lt; 0)<br>
&gt;&gt; &gt; -+=C2=A0 if (gzseek (f, 0, SEEK_SET) =3D=3D -1)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (*compression_program)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{ /* It&#39;s compressed, so open a pip=
e.=C2=A0 */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 FILE *p;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char *command =3D concat (*compr=
ession_program, &quot; -d&quot;, &quot;&quot;);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (fclose (f) &lt; 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (gzclose (f) &lt; 0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D freopen (*opened_filename, FOPE=
N_RBIN, stdin);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (!f)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 p =3D freopen (*opened_filename, FOPE=
N_RBIN, stdin);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (!p)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 f =3D popen (command, &quot;r&quot;);=
<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (!f)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 p =3D popen (command, &quot;r&quot;);=
<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (!p)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Used for error =
message in calling code. */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =
=3D command;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *is_pipe =3D 1;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return p;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; --#if O_BINARY<br>
&gt;&gt; &gt; -+#if 0 &amp;&amp; O_BINARY<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Since this is a text file, an=
d we opened it in binary mode,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch back to text mode=
.=C2=A0 */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D freopen (*opened_filename,=
 &quot;r&quot;, f);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 *is_pipe =3D 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0return f;<br>
&gt;&gt; &gt; -@@ -901,7 +907,8 @@ readfile (char *filename, int *sizep,<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0void (*create_callback) (char *), char =
**opened_filename,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char **compression_program)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; --=C2=A0 FILE *f;<br>
&gt;&gt; &gt; -+=C2=A0 void *f;<br>
&gt;&gt; &gt; -+=C2=A0 int pipe_p;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0int filled =3D 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0int data_size =3D 8192;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0char *data =3D xmalloc (data_size);<br>
&gt;&gt; &gt; -@@ -909,14 +916,20 @@ readfile (char *filename, int *sizep,=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0/* If they passed the space for the file name =
to return, use it.=C2=A0 */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0f =3D open_possibly_compressed_file (filename,=
 create_callback,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
opened_filename,<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0compression_program);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0compression_program,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;pipe_p);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0if (!f)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0for (;;)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 int nread =3D fread (data + filled, 1=
, data_size - filled, f);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 int nread;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (pipe_p)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D fread (data + filled=
, 1, data_size - filled, f);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D gzread (f, data + fi=
lled, data_size - filled);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nread &lt; 0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nread =3D=3D 0)<br>
&gt;&gt; &gt; -@@ -935,8 +948,10 @@ readfile (char *filename, int *sizep,<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0/* We need to close the stream, since on some =
systems the pipe created<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 by popen is simulated by a temporary f=
ile which only gets removed<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 inside pclose.=C2=A0 */<br>
&gt;&gt; &gt; --=C2=A0 if (f !=3D stdin)<br>
&gt;&gt; &gt; -+=C2=A0 if (pipe_p)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0pclose (f);<br>
&gt;&gt; &gt; -+=C2=A0 else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 gzclose (f);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0*sizep =3D filled;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0return data;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-extended/texinfo/<a href=3D"http:/=
/texinfo_6.7.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a> b/=
meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">texinfo_6.8.bb</a><br>
&gt;&gt; &gt; similarity index 94%<br>
&gt;&gt; &gt; rename from meta/recipes-extended/texinfo/<a href=3D"http://=
texinfo_6.7.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-extended/texinfo/<a href=3D"http://te=
xinfo_6.8.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.8.bb</a><br>
&gt;&gt; &gt; index d421b79a0b..e5046ffbe1 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-extended/texinfo/<a href=3D"http://texinf=
o_6.7.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-extended/texinfo/<a href=3D"http://texinf=
o_6.8.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.8.bb</a><br>
&gt;&gt; &gt; @@ -29,15 +29,13 @@ TARGET_PATCH =3D &quot;file://use_host_m=
akedoc.patch&quot;<br>
&gt;&gt; &gt;=C2=A0 TARGET_PATCH_class-native =3D &quot;&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/texinfo/${BP}.tar.gz \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://texinfo-4.1=
2-zlib.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disabl=
e-native-tools.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://link-z=
ip.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dont-d=
epend-on-help2man.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${TARGET_PATC=
H} \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -SRC_URI[md5sum] =3D &quot;f0c1782f68ef73738d74bd1e9e30793a&=
quot;<br>
&gt;&gt; &gt; -SRC_URI[sha256sum] =3D &quot;a52d05076b90032cb2523673c50e53=
185938746482cf3ca0213e9b4b50ac2d3e&quot;<br>
&gt;&gt; &gt; +SRC_URI[sha256sum] =3D &quot;8e09cf753ad1833695d2bac0f57dc3=
bd6bcbbfbf279450e1ba3bc2d7fb297d08&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 tex_texinfo =3D &quot;texmf/tex/texinfo&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.31.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt;<br>
</blockquote></div>

--0000000000005f483c05c6705c7d--
