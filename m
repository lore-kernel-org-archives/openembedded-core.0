Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web09.3030.1625556677348386260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 00:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L1rTxoa5;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id t19so5201242vst.9
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hINLc/RwsgaZcI09fwUjYBFOQg9IJYbZL8fPoLek880=;
        b=L1rTxoa5yXbPtRQ2hYJQKHr8uh42lRgWJhRn9Cx+7q562fysES5CB4lu8D2hTIhkON
         RdGfJSkemohsC8SyjartfQy6/PJlN5SVoRMqDbFNHvUcMjhCWuTWoCu9GzOvVtEwAjwt
         8slnUHlTq0/mv/7pU0n5zmkooKAtyz4ygzT33a1WYc54293Fqd1k0w3azK1fsEjcdnYL
         KmkD37uA0xMmo/dZRMy5sT2lUZFpECBjv+rAahzn/0/6xf7mb4AIGmOQnprUu9pTWqNU
         TvhZKux0OVAaDxlPHp3VRC0OEUNWd6lze3Sf9MG8lm08W4ew0DuX54Bz6Mmt+vYh2ZdE
         jMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hINLc/RwsgaZcI09fwUjYBFOQg9IJYbZL8fPoLek880=;
        b=rruf7c5zBzOtoR7QuNgk47YqcjCwFL7Esa6w0oipxe5cLCO6qPQEzRlabWLFvRDXIV
         YZr8kU4zC7en3/y3KC8y3W6LHdy2hER+0q0Jsc2HOlFdmm/d2b28ZKL7KIOuzkdun+e8
         vz8bIJntBp0daPE578bVaDs2yfOddu/W9pPPb5Amm4XMTpOEaGbeR2Qi16c62yH5KnJO
         r71/op4hDoBrveRWY6M/V4JDnKjgsx6CUutXOEWEEIkulabq6HBZg2R/N8g/7Z4fSdBh
         w43nzmxiO4NediAetTxobmK8haIMtHtANelwM3CHUazAH0I9xVmkuTQRc4rTtMdu9lOK
         caLQ==
X-Gm-Message-State: AOAM532Wzb8fcat0X0vo1YWmDKnLgNyPQoc0yVkOGIJeXgBk3jHGDGrH
	R3hVnHzezfuz1ibfzdFHs65G0qOI0pQXPaAG3pU=
X-Google-Smtp-Source: ABdhPJzSrpa3dw01CG7VIJLmR6VvwgZDEZo7v1LTU/DS5i+KqymzivrYu24IJcaBLYi75wOh91h4ql+G4Q9+Fk6BftM=
X-Received: by 2002:a67:7fd7:: with SMTP id a206mr12942424vsd.51.1625556676342;
 Tue, 06 Jul 2021 00:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210705183526.72564-1-alex.kanavin@gmail.com> <CAMKF1srpfEMgmzyMuadLMDPFEK2xKWXpho-pCfmOk_-VJD_GJg@mail.gmail.com>
In-Reply-To: <CAMKF1srpfEMgmzyMuadLMDPFEK2xKWXpho-pCfmOk_-VJD_GJg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 6 Jul 2021 09:31:05 +0200
Message-ID: <CANNYZj-huGoLSn5gw+qCju+Cx__NOcXGC-=d_afHmZ-q-PvDig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] texinfo: update 6.7 -> 6.8
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000041763405c66f6873"

--00000000000041763405c66f6873
Content-Type: text/plain; charset="UTF-8"

Khem, please. What is the use case you are trying to justify? Who on earth
would want to install and read .info files on a target device (of the kind
where saving a few kilobytes matters, no less!), when it's a million times
more convenient to do that on the host, or just open the same things hosted
online in a browser?

Sorry, no.

Alex

On Tue, 6 Jul 2021 at 01:01, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jul 5, 2021 at 11:35 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Drop texinfo-4.12-zlib.patch as it completely lacks a description,
>
> if it is not described then perhaps adding description to it will make
> things better, the patch is adding gz compressed
> info files which should reduce the size of these files which is quite
> good for embedded systems. Distros like fedora and suse
> are carrying this patch too.
>
> > was added together with the original recipe without an explanation in
> > the commit message, and is difficult to rebase.
> >
>
> Get it from
> https://src.fedoraproject.org/rpms/texinfo/raw/rawhide/f/texinfo-4.12-zlib.patch
> this time.
>
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../texinfo/texinfo/texinfo-4.12-zlib.patch   | 254 ------------------
> >  .../{texinfo_6.7.bb => texinfo_6.8.bb}        |   4 +-
> >  2 files changed, 1 insertion(+), 257 deletions(-)
> >  delete mode 100644
> meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> >  rename meta/recipes-extended/texinfo/{texinfo_6.7.bb => texinfo_6.8.bb}
> (94%)
> >
> > diff --git
> a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> > deleted file mode 100644
> > index f72097e639..0000000000
> > --- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
> > +++ /dev/null
> > @@ -1,254 +0,0 @@
> > -From 3d3b66cf398853c666e724c3dbcc37d53a2240d5 Mon Sep 17 00:00:00 2001
> > -From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> > -Date: Tue, 29 Nov 2016 12:27:17 -0600
> > -Subject: [PATCH] texinfo-4.12-zlib
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > -Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> > -
> > ----
> > - install-info/Makefile.in    |  2 +-
> > - install-info/install-info.c | 79 ++++++++++++++++++++++---------------
> > - 2 files changed, 48 insertions(+), 33 deletions(-)
> > -
> > -diff --git a/install-info/Makefile.in b/install-info/Makefile.in
> > -index c924509..746df05 100644
> > ---- a/install-info/Makefile.in
> > -+++ b/install-info/Makefile.in
> > -@@ -218,7 +218,7 @@ am__installdirs = "$(DESTDIR)$(bindir)"
> "$(DESTDIR)$(bindir)"
> > - PROGRAMS = $(bin_PROGRAMS)
> > - am_ginstall_info_OBJECTS = install-info.$(OBJEXT)
> > - ginstall_info_OBJECTS = $(am_ginstall_info_OBJECTS)
> > --ginstall_info_LDADD = $(LDADD)
> > -+ginstall_info_LDADD = $(LDADD) -lz
> > - am__DEPENDENCIES_1 =
> > - ginstall_info_DEPENDENCIES = $(top_builddir)/gnulib/lib/libgnu.a \
> > -       $(am__DEPENDENCIES_1) $(am__DEPENDENCIES_1)
> > -diff --git a/install-info/install-info.c b/install-info/install-info.c
> > -index 21f4fe3..a7aba82 100644
> > ---- a/install-info/install-info.c
> > -+++ b/install-info/install-info.c
> > -@@ -19,6 +19,7 @@
> > - #include <getopt.h>
> > - #include <regex.h>
> > - #include <argz.h>
> > -+#include <zlib.h>
> > -
> > - #define TAB_WIDTH 8
> > -
> > -@@ -681,15 +682,15 @@ The first time you invoke Info you start off
> looking at this node.\n\
> > -
> > -    Return either stdin reading the file, or a non-stdin pipe reading
> > -    the output of the compression program.  */
> > --FILE *
> > -+void *
> > - open_possibly_compressed_file (char *filename,
> > -     void (*create_callback) (char *),
> > --    char **opened_filename, char **compression_program)
> > -+    char **opened_filename, char **compression_program, int *is_pipe)
> > - {
> > -   char *local_opened_filename, *local_compression_program;
> > -   int nread;
> > -   char data[13];
> > --  FILE *f;
> > -+  gzFile *f;
> > -
> > -   /* We let them pass NULL if they don't want this info, but it's
> easier
> > -      to always determine it.  */
> > -@@ -697,48 +698,48 @@ open_possibly_compressed_file (char *filename,
> > -     opened_filename = &local_opened_filename;
> > -
> > -   *opened_filename = filename;
> > --  f = fopen (*opened_filename, FOPEN_RBIN);
> > -+  f = gzopen (*opened_filename, FOPEN_RBIN);
> > -   if (!f)
> > -     {
> > -       *opened_filename = concat (filename, ".gz", "");
> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> > -     }
> > -   if (!f)
> > -     {
> > -       free (*opened_filename);
> > -       *opened_filename = concat (filename, ".xz", "");
> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> > -     }
> > -   if (!f)
> > -     {
> > -       free (*opened_filename);
> > -       *opened_filename = concat (filename, ".bz2", "");
> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> > -     }
> > -   if (!f)
> > -     {
> > -       free (*opened_filename);
> > -       *opened_filename = concat (filename, ".lz", "");
> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> > -     }
> > -   if (!f)
> > -     {
> > -      free (*opened_filename);
> > -      *opened_filename = concat (filename, ".lzma", "");
> > --     f = fopen (*opened_filename, FOPEN_RBIN);
> > -+     f = gzopen (*opened_filename, FOPEN_RBIN);
> > -     }
> > - #ifdef __MSDOS__
> > -   if (!f)
> > -     {
> > -       free (*opened_filename);
> > -       *opened_filename = concat (filename, ".igz", "");
> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> > -     }
> > -   if (!f)
> > -     {
> > -       free (*opened_filename);
> > -       *opened_filename = concat (filename, ".inz", "");
> > --      f = fopen (*opened_filename, FOPEN_RBIN);
> > -+      f = gzopen (*opened_filename, FOPEN_RBIN);
> > -     }
> > - #endif /* __MSDOS__ */
> > -   if (!f)
> > -@@ -754,7 +755,7 @@ open_possibly_compressed_file (char *filename,
> > -           (*create_callback) (filename);
> > -
> > -           /* And try opening it again.  */
> > --          f = fopen (*opened_filename, FOPEN_RBIN);
> > -+          f = gzopen (*opened_filename, FOPEN_RBIN);
> > -           if (!f)
> > -             return 0;
> > -         }
> > -@@ -764,26 +765,26 @@ open_possibly_compressed_file (char *filename,
> > -
> > -   /* Read first few bytes of file rather than relying on the filename.
> > -      If the file is shorter than this it can't be usable anyway.  */
> > --  nread = fread (data, sizeof (data), 1, f);
> > --  if (nread != 1)
> > -+  nread = gzread (f, data, sizeof (data));
> > -+  if (nread != sizeof (data))
> > -     {
> > --      if (nread == 0)
> > -+      if (nread >= 0)
> > -         {
> > -           /* Try to create the file if its empty. */
> > --          if (feof (f) && create_callback)
> > -+          if (gzeof(f) && create_callback)
> > -             {
> > --              if (fclose (f) != 0)
> > -+              if (gzclose(f) != 0)
> > -                 return 0; /* unknown error closing file */
> > -
> > --              if (remove (filename) != 0)
> > -+              if (remove(filename) != 0)
> > -                 return 0; /* unknown error deleting file */
> > -
> > -               (*create_callback) (filename);
> > --              f = fopen (*opened_filename, FOPEN_RBIN);
> > -+              f = gzopen (*opened_filename, FOPEN_RBIN);
> > -               if (!f)
> > -                 return 0;
> > --              nread = fread (data, sizeof (data), 1, f);
> > --              if (nread == 0)
> > -+              nread = gzread(f, data, sizeof (data));
> > -+              if (nread >= 0)
> > -                 return 0;
> > -               goto determine_file_type; /* success */
> > -             }
> > -@@ -854,35 +855,40 @@ determine_file_type:
> > -     *compression_program = NULL;
> > -
> > -   /* Seek back over the magic bytes.  */
> > --  if (fseek (f, 0, 0) < 0)
> > -+  if (gzseek (f, 0, SEEK_SET) == -1)
> > -     return 0;
> > -
> > -   if (*compression_program)
> > -     { /* It's compressed, so open a pipe.  */
> > -+      FILE *p;
> > -       char *command = concat (*compression_program, " -d", "");
> > -
> > --      if (fclose (f) < 0)
> > -+      if (gzclose (f) < 0)
> > -         return 0;
> > --      f = freopen (*opened_filename, FOPEN_RBIN, stdin);
> > --      if (!f)
> > -+      p = freopen (*opened_filename, FOPEN_RBIN, stdin);
> > -+      if (!p)
> > -         return 0;
> > --      f = popen (command, "r");
> > --      if (!f)
> > -+      p = popen (command, "r");
> > -+      if (!p)
> > -         {
> > -           /* Used for error message in calling code. */
> > -           *opened_filename = command;
> > -           return 0;
> > -         }
> > -+      else
> > -+        *is_pipe = 1;
> > -+      return p;
> > -     }
> > -   else
> > -     {
> > --#if O_BINARY
> > -+#if 0 && O_BINARY
> > -       /* Since this is a text file, and we opened it in binary mode,
> > -          switch back to text mode.  */
> > -       f = freopen (*opened_filename, "r", f);
> > -       if (! f)
> > -       return 0;
> > - #endif
> > -+      *is_pipe = 0;
> > -     }
> > -
> > -   return f;
> > -@@ -901,7 +907,8 @@ readfile (char *filename, int *sizep,
> > -     void (*create_callback) (char *), char **opened_filename,
> > -     char **compression_program)
> > - {
> > --  FILE *f;
> > -+  void *f;
> > -+  int pipe_p;
> > -   int filled = 0;
> > -   int data_size = 8192;
> > -   char *data = xmalloc (data_size);
> > -@@ -909,14 +916,20 @@ readfile (char *filename, int *sizep,
> > -   /* If they passed the space for the file name to return, use it.  */
> > -   f = open_possibly_compressed_file (filename, create_callback,
> > -                                      opened_filename,
> > --                                     compression_program);
> > -+                                     compression_program,
> > -+                                     &pipe_p);
> > -
> > -   if (!f)
> > -     return 0;
> > -
> > -   for (;;)
> > -     {
> > --      int nread = fread (data + filled, 1, data_size - filled, f);
> > -+      int nread;
> > -+
> > -+      if (pipe_p)
> > -+        nread = fread (data + filled, 1, data_size - filled, f);
> > -+      else
> > -+        nread = gzread (f, data + filled, data_size - filled);
> > -       if (nread < 0)
> > -         return 0;
> > -       if (nread == 0)
> > -@@ -935,8 +948,10 @@ readfile (char *filename, int *sizep,
> > -   /* We need to close the stream, since on some systems the pipe
> created
> > -      by popen is simulated by a temporary file which only gets removed
> > -      inside pclose.  */
> > --  if (f != stdin)
> > -+  if (pipe_p)
> > -     pclose (f);
> > -+  else
> > -+    gzclose (f);
> > -
> > -   *sizep = filled;
> > -   return data;
> > diff --git a/meta/recipes-extended/texinfo/texinfo_6.7.bb
> b/meta/recipes-extended/texinfo/texinfo_6.8.bb
> > similarity index 94%
> > rename from meta/recipes-extended/texinfo/texinfo_6.7.bb
> > rename to meta/recipes-extended/texinfo/texinfo_6.8.bb
> > index d421b79a0b..e5046ffbe1 100644
> > --- a/meta/recipes-extended/texinfo/texinfo_6.7.bb
> > +++ b/meta/recipes-extended/texinfo/texinfo_6.8.bb
> > @@ -29,15 +29,13 @@ TARGET_PATCH = "file://use_host_makedoc.patch"
> >  TARGET_PATCH_class-native = ""
> >
> >  SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
> > -           file://texinfo-4.12-zlib.patch \
> >             file://disable-native-tools.patch \
> >             file://link-zip.patch \
> >             file://dont-depend-on-help2man.patch \
> >             ${TARGET_PATCH} \
> >             "
> >
> > -SRC_URI[md5sum] = "f0c1782f68ef73738d74bd1e9e30793a"
> > -SRC_URI[sha256sum] =
> "a52d05076b90032cb2523673c50e53185938746482cf3ca0213e9b4b50ac2d3e"
> > +SRC_URI[sha256sum] =
> "8e09cf753ad1833695d2bac0f57dc3bd6bcbbfbf279450e1ba3bc2d7fb297d08"
> >
> >  tex_texinfo = "texmf/tex/texinfo"
> >
> > --
> > 2.31.1
> >
> >
> > 
> >
>

--00000000000041763405c66f6873
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Khem, please. What is the use case you are trying to =
justify? Who on earth would want to install and read .info files on a targe=
t device (of the kind where saving a few kilobytes matters, no less!), when=
 it&#39;s a million times more convenient to do that on the host, or just o=
pen the same things hosted online in a browser?<br></div><div><br></div><di=
v>Sorry, no.<br></div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 6 Jul 2021 =
at 01:01, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Mon, Jul 5, 2021 at 11:35 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop texinfo-4.12-zlib.patch as it completely lacks a description,<br=
>
<br>
if it is not described then perhaps adding description to it will make<br>
things better, the patch is adding gz compressed<br>
info files which should reduce the size of these files which is quite<br>
good for embedded systems. Distros like fedora and suse<br>
are carrying this patch too.<br>
<br>
&gt; was added together with the original recipe without an explanation in=
<br>
&gt; the commit message, and is difficult to rebase.<br>
&gt;<br>
<br>
Get it from <a href=3D"https://src.fedoraproject.org/rpms/texinfo/raw/rawh=
ide/f/texinfo-4.12-zlib.patch" rel=3D"noreferrer" target=3D"_blank">https:/=
/src.fedoraproject.org/rpms/texinfo/raw/rawhide/f/texinfo-4.12-zlib.patch</=
a><br>
this time.<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../texinfo/texinfo/texinfo-4.12-zlib.patch=C2=A0 =C2=A0| 254 -=
-----------------<br>
&gt;=C2=A0 .../{<a href=3D"http://texinfo_6.7.bb" rel=3D"noreferrer" targe=
t=3D"_blank">texinfo_6.7.bb</a> =3D&gt; <a href=3D"http://texinfo_6.8.bb" r=
el=3D"noreferrer" target=3D"_blank">texinfo_6.8.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 2 files changed, 1 insertion(+), 257 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/texinfo/texinfo/texinf=
o-4.12-zlib.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/texinfo/{<a href=3D"http://texinfo=
_6.7.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a> =3D&gt; <a=
 href=3D"http://texinfo_6.8.bb" rel=3D"noreferrer" target=3D"_blank">texinf=
o_6.8.bb</a>} (94%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.=
patch b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f72097e639..0000000000<br>
&gt; --- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,254 +0,0 @@<br>
&gt; -From 3d3b66cf398853c666e724c3dbcc37d53a2240d5 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@inte=
l.com" target=3D"_blank">edwin.plauchu.camacho@intel.com</a>&gt;<br>
&gt; -Date: Tue, 29 Nov 2016 12:27:17 -0600<br>
&gt; -Subject: [PATCH] texinfo-4.12-zlib<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@i=
ntel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; -Signed-off-by: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.cam=
acho@intel.com" target=3D"_blank">edwin.plauchu.camacho@intel.com</a>&gt;<b=
r>
&gt; -<br>
&gt; ----<br>
&gt; - install-info/Makefile.in=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; - install-info/install-info.c | 79 ++++++++++++++++++++++------------=
---<br>
&gt; - 2 files changed, 48 insertions(+), 33 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/install-info/Makefile.in b/install-info/Makefile.in<br>
&gt; -index c924509..746df05 100644<br>
&gt; ---- a/install-info/Makefile.in<br>
&gt; -+++ b/install-info/Makefile.in<br>
&gt; -@@ -218,7 +218,7 @@ am__installdirs =3D &quot;$(DESTDIR)$(bindir)&qu=
ot; &quot;$(DESTDIR)$(bindir)&quot;<br>
&gt; - PROGRAMS =3D $(bin_PROGRAMS)<br>
&gt; - am_ginstall_info_OBJECTS =3D install-info.$(OBJEXT)<br>
&gt; - ginstall_info_OBJECTS =3D $(am_ginstall_info_OBJECTS)<br>
&gt; --ginstall_info_LDADD =3D $(LDADD)<br>
&gt; -+ginstall_info_LDADD =3D $(LDADD) -lz<br>
&gt; - am__DEPENDENCIES_1 =3D<br>
&gt; - ginstall_info_DEPENDENCIES =3D $(top_builddir)/gnulib/lib/libgnu.a =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__DEPENDENCIES_1) $(am__DEPENDENCIES_=
1)<br>
&gt; -diff --git a/install-info/install-info.c b/install-info/install-info=
.c<br>
&gt; -index 21f4fe3..a7aba82 100644<br>
&gt; ---- a/install-info/install-info.c<br>
&gt; -+++ b/install-info/install-info.c<br>
&gt; -@@ -19,6 +19,7 @@<br>
&gt; - #include &lt;getopt.h&gt;<br>
&gt; - #include &lt;regex.h&gt;<br>
&gt; - #include &lt;argz.h&gt;<br>
&gt; -+#include &lt;zlib.h&gt;<br>
&gt; -<br>
&gt; - #define TAB_WIDTH 8<br>
&gt; -<br>
&gt; -@@ -681,15 +682,15 @@ The first time you invoke Info you start off l=
ooking at this node.\n\<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 Return either stdin reading the file, or a non-stdin p=
ipe reading<br>
&gt; -=C2=A0 =C2=A0 the output of the compression program.=C2=A0 */<br>
&gt; --FILE *<br>
&gt; -+void *<br>
&gt; - open_possibly_compressed_file (char *filename,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0void (*create_callback) (char *),<br>
&gt; --=C2=A0 =C2=A0 char **opened_filename, char **compression_program)<b=
r>
&gt; -+=C2=A0 =C2=A0 char **opened_filename, char **compression_program, i=
nt *is_pipe)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0char *local_opened_filename, *local_compression_program=
;<br>
&gt; -=C2=A0 =C2=A0int nread;<br>
&gt; -=C2=A0 =C2=A0char data[13];<br>
&gt; --=C2=A0 FILE *f;<br>
&gt; -+=C2=A0 gzFile *f;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* We let them pass NULL if they don&#39;t want this in=
fo, but it&#39;s easier<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 to always determine it.=C2=A0 */<br>
&gt; -@@ -697,48 +698,48 @@ open_possibly_compressed_file (char *filename,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0opened_filename =3D &amp;local_opened_filename;<=
br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0*opened_filename =3D filename;<br>
&gt; --=C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br>
&gt; -+=C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (filename, &q=
uot;.gz&quot;, &quot;&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (filename, &q=
uot;.xz&quot;, &quot;&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (filename, &q=
uot;.bz2&quot;, &quot;&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (filename, &q=
uot;.lz&quot;, &quot;&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 free (*opened_filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 *opened_filename =3D concat (filename, &quot;.l=
zma&quot;, &quot;&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0f =3D fopen (*opened_filename, FOPEN_RBIN);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0f =3D gzopen (*opened_filename, FOPEN_RBIN);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - #ifdef __MSDOS__<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (filename, &q=
uot;.igz&quot;, &quot;&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free (*opened_filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D concat (filename, &q=
uot;.inz&quot;, &quot;&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, FOPEN_RBIN);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, FOPEN_RBIN);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - #endif /* __MSDOS__ */<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -@@ -754,7 +755,7 @@ open_possibly_compressed_file (char *filename,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*create_callback) (filenam=
e);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* And try opening it again=
.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D fopen (*opened_filename, F=
OPEN_RBIN);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*opened_filename, =
FOPEN_RBIN);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -764,26 +765,26 @@ open_possibly_compressed_file (char *filename,=
<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Read first few bytes of file rather than relying on =
the filename.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 If the file is shorter than this it can&#39;t b=
e usable anyway.=C2=A0 */<br>
&gt; --=C2=A0 nread =3D fread (data, sizeof (data), 1, f);<br>
&gt; --=C2=A0 if (nread !=3D 1)<br>
&gt; -+=C2=A0 nread =3D gzread (f, data, sizeof (data));<br>
&gt; -+=C2=A0 if (nread !=3D sizeof (data))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (nread =3D=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (nread &gt;=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to create the file i=
f its empty. */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (feof (f) &amp;&amp; create_c=
allback)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gzeof(f) &amp;&amp; create_c=
allback)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fclose (f) !=
=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gzclose(f) !=
=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 0; /* unknown error closing file */<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (remove (filena=
me) !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (remove(filenam=
e) !=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 0; /* unknown error deleting file */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*create_call=
back) (filename);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D fopen (*open=
ed_filename, FOPEN_RBIN);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D gzopen (*ope=
ned_filename, FOPEN_RBIN);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 0;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D fread (d=
ata, sizeof (data), 1, f);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nread =3D=3D 0=
)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D gzread(f=
, data, sizeof (data));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nread &gt;=3D =
0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto determin=
e_file_type; /* success */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -854,35 +855,40 @@ determine_file_type:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*compression_program =3D NULL;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Seek back over the magic bytes.=C2=A0 */<br>
&gt; --=C2=A0 if (fseek (f, 0, 0) &lt; 0)<br>
&gt; -+=C2=A0 if (gzseek (f, 0, SEEK_SET) =3D=3D -1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (*compression_program)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{ /* It&#39;s compressed, so open a pipe.=C2=A0 =
*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 FILE *p;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char *command =3D concat (*compression_pr=
ogram, &quot; -d&quot;, &quot;&quot;);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (fclose (f) &lt; 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (gzclose (f) &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D freopen (*opened_filename, FOPEN_RBIN, s=
tdin);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (!f)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 p =3D freopen (*opened_filename, FOPEN_RBIN, s=
tdin);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (!p)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 f =3D popen (command, &quot;r&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (!f)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 p =3D popen (command, &quot;r&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (!p)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Used for error message i=
n calling code. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*opened_filename =3D comman=
d;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *is_pipe =3D 1;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return p;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; --#if O_BINARY<br>
&gt; -+#if 0 &amp;&amp; O_BINARY<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Since this is a text file, and we open=
ed it in binary mode,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch back to text mode.=C2=A0 *=
/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D freopen (*opened_filename, &quot;r&=
quot;, f);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; - #endif<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 *is_pipe =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0return f;<br>
&gt; -@@ -901,7 +907,8 @@ readfile (char *filename, int *sizep,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0void (*create_callback) (char *), char **opened_=
filename,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char **compression_program)<br>
&gt; - {<br>
&gt; --=C2=A0 FILE *f;<br>
&gt; -+=C2=A0 void *f;<br>
&gt; -+=C2=A0 int pipe_p;<br>
&gt; -=C2=A0 =C2=A0int filled =3D 0;<br>
&gt; -=C2=A0 =C2=A0int data_size =3D 8192;<br>
&gt; -=C2=A0 =C2=A0char *data =3D xmalloc (data_size);<br>
&gt; -@@ -909,14 +916,20 @@ readfile (char *filename, int *sizep,<br>
&gt; -=C2=A0 =C2=A0/* If they passed the space for the file name to return=
, use it.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0f =3D open_possibly_compressed_file (filename, create_c=
allback,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opened_=
filename,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compress=
ion_program);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compress=
ion_program,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pip=
e_p);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (!f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0for (;;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 int nread =3D fread (data + filled, 1, data_si=
ze - filled, f);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 int nread;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (pipe_p)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D fread (data + filled, 1, data=
_size - filled, f);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nread =3D gzread (f, data + filled, dat=
a_size - filled);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nread &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nread =3D=3D 0)<br>
&gt; -@@ -935,8 +948,10 @@ readfile (char *filename, int *sizep,<br>
&gt; -=C2=A0 =C2=A0/* We need to close the stream, since on some systems t=
he pipe created<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 by popen is simulated by a temporary file which=
 only gets removed<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 inside pclose.=C2=A0 */<br>
&gt; --=C2=A0 if (f !=3D stdin)<br>
&gt; -+=C2=A0 if (pipe_p)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pclose (f);<br>
&gt; -+=C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 gzclose (f);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0*sizep =3D filled;<br>
&gt; -=C2=A0 =C2=A0return data;<br>
&gt; diff --git a/meta/recipes-extended/texinfo/<a href=3D"http://texinfo_=
6.7.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a> b/meta/reci=
pes-extended/texinfo/<a href=3D"http://texinfo_6.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">texinfo_6.8.bb</a><br>
&gt; similarity index 94%<br>
&gt; rename from meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6=
.7.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a><br>
&gt; rename to meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6.8=
.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.8.bb</a><br>
&gt; index d421b79a0b..e5046ffbe1 100644<br>
&gt; --- a/meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">texinfo_6.7.bb</a><br>
&gt; +++ b/meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">texinfo_6.8.bb</a><br>
&gt; @@ -29,15 +29,13 @@ TARGET_PATCH =3D &quot;file://use_host_makedoc.pa=
tch&quot;<br>
&gt;=C2=A0 TARGET_PATCH_class-native =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/texinfo/${BP}.tar.gz \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://texinfo-4.12-zlib.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-native-=
tools.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://link-zip.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dont-depend-on-=
help2man.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${TARGET_PATCH} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;f0c1782f68ef73738d74bd1e9e30793a&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;a52d05076b90032cb2523673c50e53185938746=
482cf3ca0213e9b4b50ac2d3e&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;8e09cf753ad1833695d2bac0f57dc3bd6bcbbfb=
f279450e1ba3bc2d7fb297d08&quot;<br>
&gt;<br>
&gt;=C2=A0 tex_texinfo =3D &quot;texmf/tex/texinfo&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--00000000000041763405c66f6873--
