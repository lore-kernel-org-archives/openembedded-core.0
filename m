Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.9248.1625591266330715513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 10:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HArS23sL;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id j14so10083151qvu.6
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AR+bEC2W9xD4rVBU6iMMzK41gIATCiwVJpo2DrnpgIY=;
        b=HArS23sLr8uJx9pMqIFdML8Zku9+GwRJmTpFnFJ+HDupPa95jHcQPn5E7L5IZtvVq3
         uEZMK0cNpbbkSmNW0uBXBd+7rXc4/dya/rY2oJHsPLeXsrbAxi9D6ClEU+kyvHNlNC0n
         4qRCNhwAD4xHpKaXjtX2H9Tnts0G5gM3gzAb9ipvxnYLE44YDq/3rN62pH6oOJr66LqT
         IBTMGVDCAPTRtVJbmDXQ/N0UF4WVaZHY5QYbBpzkrT5p0qC/KSsAXYVGpOZSvFa5mh9t
         RutsJNopBgoRQ732Q+ldhMllcBp1lhKQNNc6ZqfBTNwrb7lXErGgXAnE1CuTOGpjv9iT
         FIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AR+bEC2W9xD4rVBU6iMMzK41gIATCiwVJpo2DrnpgIY=;
        b=bcK74vuv6RkRIqr7Z5NQq7+b+3Wsa0CA719Bp+EqKb46Hmub6HGL4G1SBaPMFncBP6
         VvCRUKRWdNJ/FbF5CUqc1wOeSa7iXdvQO1gg8PffyHw8BIRkj2tggFULBY2catnRSk90
         KPKLAuqhGZ+fVp5vcp0Mo4Xf/iNq9QBJKmPuj77XtcWZ5RipnQ7UXXhJ4Je2mywhkdse
         NuCzUDpAJT2HxGXVJpgzGfASGSTltoLbYzwhYSIhBqqF5jfeHHELSsL50RVrMdAv1tb1
         BH+nxF27qD1cy7RHq6celD3bNKhPinQK1SoPvzp857GugWcBGejnnLT2O9kHZ3XLofdk
         Ob4Q==
X-Gm-Message-State: AOAM533Y76TU1uaMDuxMRJ8PtzNRYmoFj5CfezBsYRMIZc+kBlPOew7s
	hhoaFeIl5TKElBI64uBXK4oDUjphXbusekL6NQg=
X-Google-Smtp-Source: ABdhPJzGnc6M7KvUVFcF782ia2mpYneI3KQh21AvQ5tpXHvzvoRibHvwguJl1cSdyn2s8f8FdK4gHF8vothThIdjiQA=
X-Received: by 2002:a0c:80c1:: with SMTP id 59mr19715619qvb.31.1625591265468;
 Tue, 06 Jul 2021 10:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210705183526.72564-1-alex.kanavin@gmail.com>
 <CAMKF1srpfEMgmzyMuadLMDPFEK2xKWXpho-pCfmOk_-VJD_GJg@mail.gmail.com>
 <CANNYZj-huGoLSn5gw+qCju+Cx__NOcXGC-=d_afHmZ-q-PvDig@mail.gmail.com>
 <CAMKF1soR_B=BsYofCT8LKQT5Us_+hpeNQ8RKRyLVbPHWPm6_MA@mail.gmail.com> <CANNYZj-J0XJmeMvtzEAS+30hj01gi4vKmh7SB3YR53uqX_RuGw@mail.gmail.com>
In-Reply-To: <CANNYZj-J0XJmeMvtzEAS+30hj01gi4vKmh7SB3YR53uqX_RuGw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Jul 2021 10:07:19 -0700
Message-ID: <CAMKF1sqdiP6v2eQBEqiccMvgs71hYBzmi+GqDZ3gwUaohTpqjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] texinfo: update 6.7 -> 6.8
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 6, 2021 at 1:39 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> Once again: it was bundled with the initial recipe submission over 10 ye=
ars ago, without explanation or origin info, and not added later on. There =
was never any indication anyone finds it useful. Probably someone just took=
 all of Red Hat's patches without reviewing their utility.
>
> I am not porting it forward, the use case is simply not there, what you =
are saying is utter madness, and we should spend our time on actually usefu=
l things, where there is clear evidence they are useful.
>

My consideration was if it was being used for larger distributions
being built using OE they might be using this but then perhaps we do
not have data on someone using it and no one has raised their hand.
 I do not have a direct usecase where info files are shipped on target
either. in that light perhaps its fine to drop it.

> Alex
>
> On Tue, 6 Jul 2021 at 10:29, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Jul 6, 2021 at 12:31 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Khem, please. What is the use case you are trying to justify? Who on =
earth would want to install and read .info files on a target device (of the=
 kind where saving a few kilobytes matters, no less!), when it's a million =
times more convenient to do that on the host, or just open the same things =
hosted online in a browser?
>> >
>>
>> iff its added I would err on the side that patch is used by users,
>> since adding a patch to implement unused feature would be counter
>> intuitive.
>> This patch has been there for long time in OE, there is not much
>> effort to port it forward as other distros are maintaining this patch
>> too, perhaps its better to carry this on, I would have agreed if it
>> was something that OE was lugging along alone.
>>
>> > Sorry, no.
>>
>> thats fine, drop this upgrade.
>>
>> >
>> > Alex
>> >
>> > On Tue, 6 Jul 2021 at 01:01, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Mon, Jul 5, 2021 at 11:35 AM Alexander Kanavin
>> >> <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > Drop texinfo-4.12-zlib.patch as it completely lacks a description,
>> >>
>> >> if it is not described then perhaps adding description to it will ma=
ke
>> >> things better, the patch is adding gz compressed
>> >> info files which should reduce the size of these files which is quit=
e
>> >> good for embedded systems. Distros like fedora and suse
>> >> are carrying this patch too.
>> >>
>> >> > was added together with the original recipe without an explanation=
 in
>> >> > the commit message, and is difficult to rebase.
>> >> >
>> >>
>> >> Get it from https://src.fedoraproject.org/rpms/texinfo/raw/rawhide/f=
/texinfo-4.12-zlib.patch
>> >> this time.
>> >>
>> >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> >> > ---
>> >> >  .../texinfo/texinfo/texinfo-4.12-zlib.patch   | 254 -------------=
-----
>> >> >  .../{texinfo_6.7.bb =3D> texinfo_6.8.bb}        |   4 +-
>> >> >  2 files changed, 1 insertion(+), 257 deletions(-)
>> >> >  delete mode 100644 meta/recipes-extended/texinfo/texinfo/texinfo-=
4.12-zlib.patch
>> >> >  rename meta/recipes-extended/texinfo/{texinfo_6.7.bb =3D> texinfo=
_6.8.bb} (94%)
>> >> >
>> >> > diff --git a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zl=
ib.patch b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
>> >> > deleted file mode 100644
>> >> > index f72097e639..0000000000
>> >> > --- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patc=
h
>> >> > +++ /dev/null
>> >> > @@ -1,254 +0,0 @@
>> >> > -From 3d3b66cf398853c666e724c3dbcc37d53a2240d5 Mon Sep 17 00:00:00=
 2001
>> >> > -From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>> >> > -Date: Tue, 29 Nov 2016 12:27:17 -0600
>> >> > -Subject: [PATCH] texinfo-4.12-zlib
>> >> > -
>> >> > -Upstream-Status: Pending
>> >> > -
>> >> > -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> >> > -Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>> >> > -
>> >> > ----
>> >> > - install-info/Makefile.in    |  2 +-
>> >> > - install-info/install-info.c | 79 ++++++++++++++++++++++---------=
------
>> >> > - 2 files changed, 48 insertions(+), 33 deletions(-)
>> >> > -
>> >> > -diff --git a/install-info/Makefile.in b/install-info/Makefile.in
>> >> > -index c924509..746df05 100644
>> >> > ---- a/install-info/Makefile.in
>> >> > -+++ b/install-info/Makefile.in
>> >> > -@@ -218,7 +218,7 @@ am__installdirs =3D "$(DESTDIR)$(bindir)" "$(=
DESTDIR)$(bindir)"
>> >> > - PROGRAMS =3D $(bin_PROGRAMS)
>> >> > - am_ginstall_info_OBJECTS =3D install-info.$(OBJEXT)
>> >> > - ginstall_info_OBJECTS =3D $(am_ginstall_info_OBJECTS)
>> >> > --ginstall_info_LDADD =3D $(LDADD)
>> >> > -+ginstall_info_LDADD =3D $(LDADD) -lz
>> >> > - am__DEPENDENCIES_1 =3D
>> >> > - ginstall_info_DEPENDENCIES =3D $(top_builddir)/gnulib/lib/libgnu=
.a \
>> >> > -       $(am__DEPENDENCIES_1) $(am__DEPENDENCIES_1)
>> >> > -diff --git a/install-info/install-info.c b/install-info/install-i=
nfo.c
>> >> > -index 21f4fe3..a7aba82 100644
>> >> > ---- a/install-info/install-info.c
>> >> > -+++ b/install-info/install-info.c
>> >> > -@@ -19,6 +19,7 @@
>> >> > - #include <getopt.h>
>> >> > - #include <regex.h>
>> >> > - #include <argz.h>
>> >> > -+#include <zlib.h>
>> >> > -
>> >> > - #define TAB_WIDTH 8
>> >> > -
>> >> > -@@ -681,15 +682,15 @@ The first time you invoke Info you start of=
f looking at this node.\n\
>> >> > -
>> >> > -    Return either stdin reading the file, or a non-stdin pipe rea=
ding
>> >> > -    the output of the compression program.  */
>> >> > --FILE *
>> >> > -+void *
>> >> > - open_possibly_compressed_file (char *filename,
>> >> > -     void (*create_callback) (char *),
>> >> > --    char **opened_filename, char **compression_program)
>> >> > -+    char **opened_filename, char **compression_program, int *is_=
pipe)
>> >> > - {
>> >> > -   char *local_opened_filename, *local_compression_program;
>> >> > -   int nread;
>> >> > -   char data[13];
>> >> > --  FILE *f;
>> >> > -+  gzFile *f;
>> >> > -
>> >> > -   /* We let them pass NULL if they don't want this info, but it'=
s easier
>> >> > -      to always determine it.  */
>> >> > -@@ -697,48 +698,48 @@ open_possibly_compressed_file (char *filena=
me,
>> >> > -     opened_filename =3D &local_opened_filename;
>> >> > -
>> >> > -   *opened_filename =3D filename;
>> >> > --  f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+  f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -   if (!f)
>> >> > -     {
>> >> > -       *opened_filename =3D concat (filename, ".gz", "");
>> >> > --      f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+      f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -     }
>> >> > -   if (!f)
>> >> > -     {
>> >> > -       free (*opened_filename);
>> >> > -       *opened_filename =3D concat (filename, ".xz", "");
>> >> > --      f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+      f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -     }
>> >> > -   if (!f)
>> >> > -     {
>> >> > -       free (*opened_filename);
>> >> > -       *opened_filename =3D concat (filename, ".bz2", "");
>> >> > --      f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+      f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -     }
>> >> > -   if (!f)
>> >> > -     {
>> >> > -       free (*opened_filename);
>> >> > -       *opened_filename =3D concat (filename, ".lz", "");
>> >> > --      f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+      f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -     }
>> >> > -   if (!f)
>> >> > -     {
>> >> > -      free (*opened_filename);
>> >> > -      *opened_filename =3D concat (filename, ".lzma", "");
>> >> > --     f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+     f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -     }
>> >> > - #ifdef __MSDOS__
>> >> > -   if (!f)
>> >> > -     {
>> >> > -       free (*opened_filename);
>> >> > -       *opened_filename =3D concat (filename, ".igz", "");
>> >> > --      f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+      f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -     }
>> >> > -   if (!f)
>> >> > -     {
>> >> > -       free (*opened_filename);
>> >> > -       *opened_filename =3D concat (filename, ".inz", "");
>> >> > --      f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+      f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -     }
>> >> > - #endif /* __MSDOS__ */
>> >> > -   if (!f)
>> >> > -@@ -754,7 +755,7 @@ open_possibly_compressed_file (char *filename=
,
>> >> > -           (*create_callback) (filename);
>> >> > -
>> >> > -           /* And try opening it again.  */
>> >> > --          f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+          f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -           if (!f)
>> >> > -             return 0;
>> >> > -         }
>> >> > -@@ -764,26 +765,26 @@ open_possibly_compressed_file (char *filena=
me,
>> >> > -
>> >> > -   /* Read first few bytes of file rather than relying on the fil=
ename.
>> >> > -      If the file is shorter than this it can't be usable anyway.=
  */
>> >> > --  nread =3D fread (data, sizeof (data), 1, f);
>> >> > --  if (nread !=3D 1)
>> >> > -+  nread =3D gzread (f, data, sizeof (data));
>> >> > -+  if (nread !=3D sizeof (data))
>> >> > -     {
>> >> > --      if (nread =3D=3D 0)
>> >> > -+      if (nread >=3D 0)
>> >> > -         {
>> >> > -           /* Try to create the file if its empty. */
>> >> > --          if (feof (f) && create_callback)
>> >> > -+          if (gzeof(f) && create_callback)
>> >> > -             {
>> >> > --              if (fclose (f) !=3D 0)
>> >> > -+              if (gzclose(f) !=3D 0)
>> >> > -                 return 0; /* unknown error closing file */
>> >> > -
>> >> > --              if (remove (filename) !=3D 0)
>> >> > -+              if (remove(filename) !=3D 0)
>> >> > -                 return 0; /* unknown error deleting file */
>> >> > -
>> >> > -               (*create_callback) (filename);
>> >> > --              f =3D fopen (*opened_filename, FOPEN_RBIN);
>> >> > -+              f =3D gzopen (*opened_filename, FOPEN_RBIN);
>> >> > -               if (!f)
>> >> > -                 return 0;
>> >> > --              nread =3D fread (data, sizeof (data), 1, f);
>> >> > --              if (nread =3D=3D 0)
>> >> > -+              nread =3D gzread(f, data, sizeof (data));
>> >> > -+              if (nread >=3D 0)
>> >> > -                 return 0;
>> >> > -               goto determine_file_type; /* success */
>> >> > -             }
>> >> > -@@ -854,35 +855,40 @@ determine_file_type:
>> >> > -     *compression_program =3D NULL;
>> >> > -
>> >> > -   /* Seek back over the magic bytes.  */
>> >> > --  if (fseek (f, 0, 0) < 0)
>> >> > -+  if (gzseek (f, 0, SEEK_SET) =3D=3D -1)
>> >> > -     return 0;
>> >> > -
>> >> > -   if (*compression_program)
>> >> > -     { /* It's compressed, so open a pipe.  */
>> >> > -+      FILE *p;
>> >> > -       char *command =3D concat (*compression_program, " -d", "")=
;
>> >> > -
>> >> > --      if (fclose (f) < 0)
>> >> > -+      if (gzclose (f) < 0)
>> >> > -         return 0;
>> >> > --      f =3D freopen (*opened_filename, FOPEN_RBIN, stdin);
>> >> > --      if (!f)
>> >> > -+      p =3D freopen (*opened_filename, FOPEN_RBIN, stdin);
>> >> > -+      if (!p)
>> >> > -         return 0;
>> >> > --      f =3D popen (command, "r");
>> >> > --      if (!f)
>> >> > -+      p =3D popen (command, "r");
>> >> > -+      if (!p)
>> >> > -         {
>> >> > -           /* Used for error message in calling code. */
>> >> > -           *opened_filename =3D command;
>> >> > -           return 0;
>> >> > -         }
>> >> > -+      else
>> >> > -+        *is_pipe =3D 1;
>> >> > -+      return p;
>> >> > -     }
>> >> > -   else
>> >> > -     {
>> >> > --#if O_BINARY
>> >> > -+#if 0 && O_BINARY
>> >> > -       /* Since this is a text file, and we opened it in binary m=
ode,
>> >> > -          switch back to text mode.  */
>> >> > -       f =3D freopen (*opened_filename, "r", f);
>> >> > -       if (! f)
>> >> > -       return 0;
>> >> > - #endif
>> >> > -+      *is_pipe =3D 0;
>> >> > -     }
>> >> > -
>> >> > -   return f;
>> >> > -@@ -901,7 +907,8 @@ readfile (char *filename, int *sizep,
>> >> > -     void (*create_callback) (char *), char **opened_filename,
>> >> > -     char **compression_program)
>> >> > - {
>> >> > --  FILE *f;
>> >> > -+  void *f;
>> >> > -+  int pipe_p;
>> >> > -   int filled =3D 0;
>> >> > -   int data_size =3D 8192;
>> >> > -   char *data =3D xmalloc (data_size);
>> >> > -@@ -909,14 +916,20 @@ readfile (char *filename, int *sizep,
>> >> > -   /* If they passed the space for the file name to return, use i=
t.  */
>> >> > -   f =3D open_possibly_compressed_file (filename, create_callback=
,
>> >> > -                                      opened_filename,
>> >> > --                                     compression_program);
>> >> > -+                                     compression_program,
>> >> > -+                                     &pipe_p);
>> >> > -
>> >> > -   if (!f)
>> >> > -     return 0;
>> >> > -
>> >> > -   for (;;)
>> >> > -     {
>> >> > --      int nread =3D fread (data + filled, 1, data_size - filled,=
 f);
>> >> > -+      int nread;
>> >> > -+
>> >> > -+      if (pipe_p)
>> >> > -+        nread =3D fread (data + filled, 1, data_size - filled, f=
);
>> >> > -+      else
>> >> > -+        nread =3D gzread (f, data + filled, data_size - filled);
>> >> > -       if (nread < 0)
>> >> > -         return 0;
>> >> > -       if (nread =3D=3D 0)
>> >> > -@@ -935,8 +948,10 @@ readfile (char *filename, int *sizep,
>> >> > -   /* We need to close the stream, since on some systems the pipe=
 created
>> >> > -      by popen is simulated by a temporary file which only gets r=
emoved
>> >> > -      inside pclose.  */
>> >> > --  if (f !=3D stdin)
>> >> > -+  if (pipe_p)
>> >> > -     pclose (f);
>> >> > -+  else
>> >> > -+    gzclose (f);
>> >> > -
>> >> > -   *sizep =3D filled;
>> >> > -   return data;
>> >> > diff --git a/meta/recipes-extended/texinfo/texinfo_6.7.bb b/meta/r=
ecipes-extended/texinfo/texinfo_6.8.bb
>> >> > similarity index 94%
>> >> > rename from meta/recipes-extended/texinfo/texinfo_6.7.bb
>> >> > rename to meta/recipes-extended/texinfo/texinfo_6.8.bb
>> >> > index d421b79a0b..e5046ffbe1 100644
>> >> > --- a/meta/recipes-extended/texinfo/texinfo_6.7.bb
>> >> > +++ b/meta/recipes-extended/texinfo/texinfo_6.8.bb
>> >> > @@ -29,15 +29,13 @@ TARGET_PATCH =3D "file://use_host_makedoc.patc=
h"
>> >> >  TARGET_PATCH_class-native =3D ""
>> >> >
>> >> >  SRC_URI =3D "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
>> >> > -           file://texinfo-4.12-zlib.patch \
>> >> >             file://disable-native-tools.patch \
>> >> >             file://link-zip.patch \
>> >> >             file://dont-depend-on-help2man.patch \
>> >> >             ${TARGET_PATCH} \
>> >> >             "
>> >> >
>> >> > -SRC_URI[md5sum] =3D "f0c1782f68ef73738d74bd1e9e30793a"
>> >> > -SRC_URI[sha256sum] =3D "a52d05076b90032cb2523673c50e5318593874648=
2cf3ca0213e9b4b50ac2d3e"
>> >> > +SRC_URI[sha256sum] =3D "8e09cf753ad1833695d2bac0f57dc3bd6bcbbfbf2=
79450e1ba3bc2d7fb297d08"
>> >> >
>> >> >  tex_texinfo =3D "texmf/tex/texinfo"
>> >> >
>> >> > --
>> >> > 2.31.1
>> >> >
>> >> >
>> >> >=20
>> >> >
