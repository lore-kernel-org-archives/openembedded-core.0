Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.7777.1619447978571126888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 07:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YK0v/CVt;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id c4so17258663wrt.8
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AA72GYfaLl/4IWaLVGVZ10nph77xZOWIjFiY8JuABWk=;
        b=YK0v/CVtFdHnt4Mlkjk2vyzME3UL2qk/otMEd4IY4jgKN81b5pdObjwYL68nFB/y5j
         0nwIQRDDrz45ToIRejY6Vcs7R/5ed1a8d2V7v2rrDhWZcOV6xKkqHLF8cZFBqHCjcExE
         F7j1vle5WPzd/Kwd+YA97FWwhV/ctIcm5o+cIilOQt2PJ/46+0c8hjTWw/bv2A+RnTQP
         CcJMkIqk2r4Vy4BSPzYqC/nSMxdlLZWpw0Ub6oRy/LlTeqeNAlbkXsXOLnydPiQzlPp3
         tBjdVSFjtjxjSFdPTVzzseSR3b9SJoycfuF0Ym4qYMMylTymm2ikgFX7J8+9nmf7DX+W
         S3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AA72GYfaLl/4IWaLVGVZ10nph77xZOWIjFiY8JuABWk=;
        b=aSKvVSL4hx0rpCjkAIK99c/5NdZYCX8geIrti7S6xwY68Z6nPc+mU33HloToXdTMMC
         2rtdcmhUv0Evpo7p4vGqyQcJ2jvk3WMtKJ5Mx0BH87vkWGAXzFecx9P1BXHgA/Rg0rKl
         1kovrvfpYFu3Q+Bo7bQEl6y0XThllldQvvvjrSaMjMrW+pyk/l3JsIL2XRrNSpy2WJ+R
         STIzzyfJ9rHmUSH7i4Liy92oWmQ89rzLtSxhBCJbuwtzkfuncMiQzDuCINHJDNVSpIXj
         x2/0I1zl9mwv2ewJDvr6xooqtIunQrVbC4dbEQ1JxWq9eURNXaENP70pmFkaLHxs6lU3
         Tfbw==
X-Gm-Message-State: AOAM532C55zvhFPRt3t+F3BpH//VxbOwZrnjtuZKd6FAnVDwlW1/CUgU
	iHNlRWD/VXpq7tckRkrswC6Az+YWCp69GfKlyMCr+A==
X-Google-Smtp-Source: ABdhPJxoSuJl390t3orh+BBDQYTJdEsd/aOpY1NDfsylQZPJhdGbtqRsTO6kvnPvkgsY9Po7d+Wp4P2JIAnbS/ZAacE=
X-Received: by 2002:a05:6000:120b:: with SMTP id e11mr23366993wrx.299.1619447976925;
 Mon, 26 Apr 2021 07:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210425124431.122855-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210425124431.122855-1-vinay.m.engg@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 26 Apr 2021 04:39:25 -1000
Message-ID: <CAOSpxda9YEyN_8=qd__hRwxGFFS6cWZDON9jdK-gbe-K1V=DWQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] Binutils: Fix CVE-2021-20197
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, vinay.kumar@blackfigtech.com, 
	rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 25, 2021 at 2:44 AM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> Source: git://sourceware.org/git/binutils-gdb.git
> Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=26945
>
> Backported upstream commit d3edaa91d4cf7202ec14342410194841e2f67f12 to
> binutils-2.34 source, along with commit id dependencies
> (8e03235147a9e774d3ba084e93c2daaa94d1cec and 365f5fb6d0f0da83817431a275e99e6f6babbe04).
>
> Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d3edaa91d4cf7202ec14342410194841e2f67f12]
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
> This patch is verified using poky image build and toolchain build for
> ARM and X86_64 targets. Also, verified for binutils regression testing with ARM target.

Unfortunately I am getting autobuilder compilation errors on the
meta-mingw build:

https://errors.yoctoproject.org/Errors/Details/577768/
https://errors.yoctoproject.org/Errors/Details/577769/

Steve

>
>  .../binutils/binutils-2.34.inc                |   1 +
>  .../binutils/binutils/CVE-2021-20197.patch    | 479 ++++++++++++++++++
>  2 files changed, 480 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
> index f557fe970c..a586faf5ab 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.34.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
> @@ -46,5 +46,6 @@ SRC_URI = "\
>       file://0001-gas-improve-reproducibility-for-stabs-debugging-data.patch \
>       file://CVE-2020-16592.patch \
>       file://CVE-2020-16598.patch \
> +     file://CVE-2021-20197.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
> new file mode 100644
> index 0000000000..c207afec4d
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
> @@ -0,0 +1,479 @@
> +From d3edaa91d4cf7202ec14342410194841e2f67f12 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Fri, 26 Feb 2021 11:30:32 +1030
> +Subject: [PATCH] Reinstate various pieces backed out from smart_rename changes
> +
> +In the interests of a stable release various last minute smart_rename
> +patches were backed out of the 2.36 branch.  The main reason to
> +reinstate some of those backed out changes here is to make necessary
> +followup fixes to commit 8e03235147a9 simple cherry-picks from
> +mainline.  A secondary reason is that ar -M support isn't fixed for
> +pr26945 without this patch.
> +
> +        PR 26945
> +        * ar.c: Don't include libbfd.h.
> +        (write_archive): Replace xmalloc+strcpy with xstrdup.
> +        * arsup.c (temp_name, real_ofd): New static variables.
> +        (ar_open): Use make_tempname and bfd_fdopenw.
> +        (ar_save): Adjust to suit ar_open changes.
> +        * objcopy.c: Don't include libbfd.h.
> +        * rename.c: Rename and reorder variables.
> +
> +(cherry picked from commit 95b91a043aeaeb546d2fea556d84a2de1e917770)
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d3edaa91d4cf7202ec14342410194841e2f67f12]
> +CVE: CVE-2021-20197
> +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> +
> +---
> + bfd/bfd-in2.h      |  2 ++
> + bfd/opncls.c       | 33 +++++++++++++++++++++++++
> + binutils/ar.c      | 15 +++++++-----
> + binutils/arsup.c   | 37 +++++++++++++++++++---------
> + binutils/bucomm.c  |  4 +--
> + binutils/bucomm.h  |  5 ++--
> + binutils/objcopy.c | 37 +++++++++++++++++-----------
> + binutils/rename.c  | 61 ++++++++++------------------------------------
> + 8 files changed, 110 insertions(+), 84 deletions(-)
> +
> +diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> +index 2e453c50c18..e53f54a8ab7 100644
> +--- a/bfd/bfd-in2.h
> ++++ b/bfd/bfd-in2.h
> +@@ -588,6 +588,8 @@ bfd *bfd_openr (const char *filename, const char *target);
> +
> + bfd *bfd_fdopenr (const char *filename, const char *target, int fd);
> +
> ++bfd *bfd_fdopenw (const char *filename, const char *target, int fd);
> ++
> + bfd *bfd_openstreamr (const char * filename, const char * target,
> +     void * stream);
> +
> +diff --git a/bfd/opncls.c b/bfd/opncls.c
> +index a03ad51c8fa..f9da97ed710 100644
> +--- a/bfd/opncls.c
> ++++ b/bfd/opncls.c
> +@@ -370,6 +370,39 @@ bfd_fdopenr (const char *filename, const char *target, int fd)
> +   return bfd_fopen (filename, target, mode, fd);
> + }
> +
> ++/*
> ++FUNCTION
> ++      bfd_fdopenw
> ++
> ++SYNOPSIS
> ++      bfd *bfd_fdopenw (const char *filename, const char *target, int fd);
> ++
> ++DESCRIPTION
> ++      <<bfd_fdopenw>> is exactly like <<bfd_fdopenr>> with the exception that
> ++      the resulting BFD is suitable for output.
> ++*/
> ++
> ++bfd *
> ++bfd_fdopenw (const char *filename, const char *target, int fd)
> ++{
> ++  bfd *out = bfd_fdopenr (filename, target, fd);
> ++
> ++  if (out != NULL)
> ++    {
> ++      if (!bfd_write_p (out))
> ++      {
> ++        close (fd);
> ++        _bfd_delete_bfd (out);
> ++        out = NULL;
> ++        bfd_set_error (bfd_error_invalid_operation);
> ++      }
> ++      else
> ++      out->direction = write_direction;
> ++    }
> ++
> ++  return out;
> ++}
> ++
> + /*
> + FUNCTION
> +       bfd_openstreamr
> +diff --git a/binutils/ar.c b/binutils/ar.c
> +index 1057db9980e..c33a11e0d70 100644
> +--- a/binutils/ar.c
> ++++ b/binutils/ar.c
> +@@ -1195,20 +1195,23 @@ write_archive (bfd *iarch)
> +   bfd *obfd;
> +   char *old_name, *new_name;
> +   bfd *contents_head = iarch->archive_next;
> ++  int ofd = -1;
> +
> +-  old_name = (char *) xmalloc (strlen (bfd_get_filename (iarch)) + 1);
> +-  strcpy (old_name, bfd_get_filename (iarch));
> +-  new_name = make_tempname (old_name);
> ++  old_name = xstrdup (bfd_get_filename (iarch));
> ++  new_name = make_tempname (old_name, &ofd);
> +
> +   if (new_name == NULL)
> +     bfd_fatal (_("could not create temporary file whilst writing archive"));
> +
> +   output_filename = new_name;
> +
> +-  obfd = bfd_openw (new_name, bfd_get_target (iarch));
> ++  obfd = bfd_fdopenw (new_name, bfd_get_target (iarch), ofd);
> +
> +   if (obfd == NULL)
> +-    bfd_fatal (old_name);
> ++    {
> ++      close (ofd);
> ++      bfd_fatal (old_name);
> ++    }
> +
> +   output_bfd = obfd;
> +
> +@@ -1246,7 +1249,7 @@ write_archive (bfd *iarch)
> +   /* We don't care if this fails; we might be creating the archive.  */
> +   bfd_close (iarch);
> +
> +-  if (smart_rename (new_name, old_name, 0) != 0)
> ++  if (smart_rename (new_name, old_name, NULL) != 0)
> +     xexit (1);
> +   free (old_name);
> +   free (new_name);
> +diff --git a/binutils/arsup.c b/binutils/arsup.c
> +index 00967c972cd..b8ae4f7ec1a 100644
> +--- a/binutils/arsup.c
> ++++ b/binutils/arsup.c
> +@@ -42,6 +42,8 @@ extern int deterministic;
> +
> + static bfd *obfd;
> + static char *real_name;
> ++static char *temp_name;
> ++static int real_ofd;
> + static FILE *outfile;
> +
> + static void
> +@@ -149,27 +151,24 @@ maybequit (void)
> + void
> + ar_open (char *name, int t)
> + {
> +-  char *tname;
> +-  const char *bname = lbasename (name);
> +-  real_name = name;
> ++  real_name = xstrdup (name);
> ++  temp_name = make_tempname (real_name, &real_ofd);
> +
> +-  /* Prepend tmp- to the beginning, to avoid file-name clashes after
> +-     truncation on filesystems with limited namespaces (DOS).  */
> +-  if (asprintf (&tname, "%.*stmp-%s", (int) (bname - name), name, bname) == -1)
> ++  if (temp_name == NULL)
> +     {
> +-      fprintf (stderr, _("%s: Can't allocate memory for temp name (%s)\n"),
> ++      fprintf (stderr, _("%s: Can't open temporary file (%s)\n"),
> +              program_name, strerror(errno));
> +       maybequit ();
> +       return;
> +     }
> +
> +-  obfd = bfd_openw (tname, NULL);
> ++  obfd = bfd_fdopenw (temp_name, NULL, real_ofd);
> +
> +   if (!obfd)
> +     {
> +       fprintf (stderr,
> +              _("%s: Can't open output archive %s\n"),
> +-             program_name,  tname);
> ++             program_name, temp_name);
> +
> +       maybequit ();
> +     }
> +@@ -344,16 +343,30 @@ ar_save (void)
> +     }
> +   else
> +     {
> +-      char *ofilename = xstrdup (bfd_get_filename (obfd));
> ++      struct stat target_stat;
> +
> +       if (deterministic > 0)
> +         obfd->flags |= BFD_DETERMINISTIC_OUTPUT;
> +
> +       bfd_close (obfd);
> +
> +-      smart_rename (ofilename, real_name, 0);
> ++      if (stat (real_name, &target_stat) != 0)
> ++      {
> ++        /* The temp file created in ar_open has mode 0600 as per mkstemp.
> ++           Create the real empty output file here so smart_rename will
> ++           update the mode according to the process umask.  */
> ++        obfd = bfd_openw (real_name, NULL);
> ++        if (obfd != NULL)
> ++          {
> ++            bfd_set_format (obfd, bfd_archive);
> ++            bfd_close (obfd);
> ++          }
> ++      }
> ++
> ++      smart_rename (temp_name, real_name, NULL);
> +       obfd = 0;
> +-      free (ofilename);
> ++      free (temp_name);
> ++      free (real_name);
> +     }
> + }
> +
> +diff --git a/binutils/bucomm.c b/binutils/bucomm.c
> +index 9e6a02843e6..53244201f89 100644
> +--- a/binutils/bucomm.c
> ++++ b/binutils/bucomm.c
> +@@ -532,7 +532,7 @@ template_in_dir (const char *path)
> +    as FILENAME.  */
> +
> + char *
> +-make_tempname (const char *filename)
> ++make_tempname (const char *filename, int *ofd)
> + {
> +   char *tmpname = template_in_dir (filename);
> +   int fd;
> +@@ -550,7 +550,7 @@ make_tempname (const char *filename)
> +       free (tmpname);
> +       return NULL;
> +     }
> +-  close (fd);
> ++  *ofd = fd;
> +   return tmpname;
> + }
> +
> +diff --git a/binutils/bucomm.h b/binutils/bucomm.h
> +index d8318343f78..2b164e0af68 100644
> +--- a/binutils/bucomm.h
> ++++ b/binutils/bucomm.h
> +@@ -51,7 +51,7 @@ int display_info (void);
> +
> + void print_arelt_descr (FILE *, bfd *, bfd_boolean, bfd_boolean);
> +
> +-char *make_tempname (const char *);
> ++char *make_tempname (const char *, int *);
> + char *make_tempdir (const char *);
> +
> + bfd_vma parse_vma (const char *, const char *);
> +@@ -71,7 +71,8 @@ extern void print_version (const char *);
> + /* In rename.c.  */
> + extern void set_times (const char *, const struct stat *);
> +
> +-extern int smart_rename (const char *, const char *, int);
> ++extern int smart_rename (const char *, const char *, struct stat *);
> ++
> +
> + /* In libiberty.  */
> + void *xmalloc (size_t);
> +diff --git a/binutils/objcopy.c b/binutils/objcopy.c
> +index 212e25144e6..5ccbd926610 100644
> +--- a/binutils/objcopy.c
> ++++ b/binutils/objcopy.c
> +@@ -3682,7 +3682,7 @@ set_long_section_mode (bfd *output_bfd, bfd *input_bfd, enum long_section_name_h
> + /* The top-level control.  */
> +
> + static void
> +-copy_file (const char *input_filename, const char *output_filename,
> ++copy_file (const char *input_filename, const char *output_filename, int ofd,
> +          const char *input_target,   const char *output_target,
> +          const bfd_arch_info_type *input_arch)
> + {
> +@@ -3757,9 +3757,14 @@ copy_file (const char *input_filename, const char *output_filename,
> +       else
> +       force_output_target = TRUE;
> +
> +-      obfd = bfd_openw (output_filename, output_target);
> ++      if (ofd >= 0)
> ++      obfd = bfd_fdopenw (output_filename, output_target, ofd);
> ++      else
> ++      obfd = bfd_openw (output_filename, output_target);
> ++
> +       if (obfd == NULL)
> +       {
> ++        close (ofd);
> +         bfd_nonfatal_message (output_filename, NULL, NULL, NULL);
> +         status = 1;
> +         return;
> +@@ -3787,13 +3792,19 @@ copy_file (const char *input_filename, const char *output_filename,
> +       if (output_target == NULL)
> +       output_target = bfd_get_target (ibfd);
> +
> +-      obfd = bfd_openw (output_filename, output_target);
> ++      if (ofd >= 0)
> ++      obfd = bfd_fdopenw (output_filename, output_target, ofd);
> ++      else
> ++      obfd = bfd_openw (output_filename, output_target);
> ++
> +       if (obfd == NULL)
> +       {
> ++        close (ofd);
> +         bfd_nonfatal_message (output_filename, NULL, NULL, NULL);
> +         status = 1;
> +         return;
> +       }
> ++
> +       /* This is a no-op on non-Coff targets.  */
> +       set_long_section_mode (obfd, ibfd, long_section_names);
> +
> +@@ -4746,6 +4757,7 @@ strip_main (int argc, char *argv[])
> +       int hold_status = status;
> +       struct stat statbuf;
> +       char *tmpname;
> ++      int tmpfd = -1;
> +
> +       if (get_file_size (argv[i]) < 1)
> +       {
> +@@ -4760,7 +4772,7 @@ strip_main (int argc, char *argv[])
> +
> +       if (output_file == NULL
> +         || filename_cmp (argv[i], output_file) == 0)
> +-      tmpname = make_tempname (argv[i]);
> ++      tmpname = make_tempname (argv[i], &tmpfd);
> +       else
> +       tmpname = output_file;
> +
> +@@ -4773,15 +4785,13 @@ strip_main (int argc, char *argv[])
> +       }
> +
> +       status = 0;
> +-      copy_file (argv[i], tmpname, input_target, output_target, NULL);
> ++      copy_file (argv[i], tmpname, tmpfd, input_target, output_target, NULL);
> +       if (status == 0)
> +       {
> +-        if (preserve_dates)
> +-          set_times (tmpname, &statbuf);
> +         if (output_file != tmpname)
> +           status = (smart_rename (tmpname,
> +                                   output_file ? output_file : argv[i],
> +-                                  preserve_dates) != 0);
> ++                                  preserve_dates ? &statbuf : NULL) != 0);
> +         if (status == 0)
> +           status = hold_status;
> +       }
> +@@ -4993,7 +5003,7 @@ copy_main (int argc, char *argv[])
> +   bfd_boolean formats_info = FALSE;
> +   bfd_boolean use_globalize = FALSE;
> +   bfd_boolean use_keep_global = FALSE;
> +-  int c;
> ++  int c, tmpfd = -1;
> +   struct stat statbuf;
> +   const bfd_arch_info_type *input_arch = NULL;
> +
> +@@ -5839,7 +5849,7 @@ copy_main (int argc, char *argv[])
> +      are the same, then create a temp and rename the result into the input.  */
> +   if (output_filename == NULL
> +       || filename_cmp (input_filename, output_filename) == 0)
> +-    tmpname = make_tempname (input_filename);
> ++    tmpname = make_tempname (input_filename, &tmpfd);
> +   else
> +     tmpname = output_filename;
> +
> +@@ -5847,14 +5857,13 @@ copy_main (int argc, char *argv[])
> +     fatal (_("warning: could not create temporary file whilst copying '%s', (error: %s)"),
> +          input_filename, strerror (errno));
> +
> +-  copy_file (input_filename, tmpname, input_target, output_target, input_arch);
> ++  copy_file (input_filename, tmpname, tmpfd, input_target, output_target,
> ++           input_arch);
> +   if (status == 0)
> +     {
> +-      if (preserve_dates)
> +-      set_times (tmpname, &statbuf);
> +       if (tmpname != output_filename)
> +       status = (smart_rename (tmpname, input_filename,
> +-                              preserve_dates) != 0);
> ++                              preserve_dates ? &statbuf : NULL) != 0);
> +     }
> +   else
> +     unlink_if_ordinary (tmpname);
> +diff --git a/binutils/rename.c b/binutils/rename.c
> +index bf3b68d0462..53f74717a64 100644
> +--- a/binutils/rename.c
> ++++ b/binutils/rename.c
> +@@ -122,26 +122,19 @@ set_times (const char *destination, const struct stat *statbuf)
> +     non_fatal (_("%s: cannot set time: %s"), destination, strerror (errno));
> + }
> +
> +-#ifndef S_ISLNK
> +-#ifdef S_IFLNK
> +-#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
> +-#else
> +-#define S_ISLNK(m) 0
> +-#define lstat stat
> +-#endif
> +-#endif
> +-
> +-/* Rename FROM to TO, copying if TO is a link.
> +-   Return 0 if ok, -1 if error.  */
> ++/* Rename FROM to TO, copying if TO exists.  TARGET_STAT has the file status
> ++   that, if non-NULL, is used to fix up timestamps after rename.  Return 0 if
> ++   ok, -1 if error.  */
> +
> + int
> +-smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNUSED)
> ++smart_rename (const char *from, const char *to,
> ++            struct stat *target_stat ATTRIBUTE_UNUSED)
> + {
> +-  bfd_boolean exists;
> +-  struct stat s;
> +   int ret = 0;
> ++  struct stat to_stat;
> ++  bfd_boolean exists;
> +
> +-  exists = lstat (to, &s) == 0;
> ++  exists = lstat (to, &to_stat) == 0;
> +
> + #if defined (_WIN32) && !defined (__CYGWIN32__)
> +   /* Win32, unlike unix, will not erase `to' in `rename(from, to)' but
> +@@ -158,38 +151,10 @@ smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNU
> +       unlink (from);
> +     }
> + #else
> +-  /* Use rename only if TO is not a symbolic link and has
> +-     only one hard link, and we have permission to write to it.  */
> +-  if (! exists
> +-      || (!S_ISLNK (s.st_mode)
> +-        && S_ISREG (s.st_mode)
> +-        && (s.st_mode & S_IWUSR)
> +-        && s.st_nlink == 1)
> +-      )
> ++  /* Avoid a full copy and use rename if TO does not exist.  */
> ++  if (!exists)
> +     {
> +-      ret = rename (from, to);
> +-      if (ret == 0)
> +-      {
> +-        if (exists)
> +-          {
> +-            /* Try to preserve the permission bits and ownership of
> +-               TO.  First get the mode right except for the setuid
> +-               bit.  Then change the ownership.  Then fix the setuid
> +-               bit.  We do the chmod before the chown because if the
> +-               chown succeeds, and we are a normal user, we won't be
> +-               able to do the chmod afterward.  We don't bother to
> +-               fix the setuid bit first because that might introduce
> +-               a fleeting security problem, and because the chown
> +-               will clear the setuid bit anyhow.  We only fix the
> +-               setuid bit if the chown succeeds, because we don't
> +-               want to introduce an unexpected setuid file owned by
> +-               the user running objcopy.  */
> +-            chmod (to, s.st_mode & 0777);
> +-            if (chown (to, s.st_uid, s.st_gid) >= 0)
> +-              chmod (to, s.st_mode & 07777);
> +-          }
> +-      }
> +-      else
> ++      if ((ret = rename (from, to)) != 0)
> +       {
> +         /* We have to clean up here.  */
> +         non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
> +@@ -202,8 +167,8 @@ smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNU
> +       if (ret != 0)
> +       non_fatal (_("unable to copy file '%s'; reason: %s"), to, strerror (errno));
> +
> +-      if (preserve_dates)
> +-      set_times (to, &s);
> ++      if (target_stat != NULL)
> ++      set_times (to, target_stat);
> +       unlink (from);
> +     }
> + #endif /* _WIN32 && !__CYGWIN32__ */
> +--
> +2.17.1
> +
> --
> 2.17.1
>
>
> 
>
