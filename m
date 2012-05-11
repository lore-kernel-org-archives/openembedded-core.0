Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStNP-0002iI-3q
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:11:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2012 10:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141951459"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by azsmga001.ch.intel.com with ESMTP; 11 May 2012 10:01:38 -0700
Message-ID: <4FAD45F2.9030908@linux.intel.com>
Date: Fri, 11 May 2012 10:01:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAF6bG8dwwV-WymFvuZ9FXLb3wziR0mj9PfzP4qA31i79r_81wg@mail.gmail.com>
In-Reply-To: <CAF6bG8dwwV-WymFvuZ9FXLb3wziR0mj9PfzP4qA31i79r_81wg@mail.gmail.com>
Subject: Re: [PATCH] dpkg: update to upstream version 1.16.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2012 17:11:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 03:59 PM, Marko Lindqvist wrote:
> From: Marko Lindqvist<cazfi74@gmail.com>
> Date: Sat, 5 May 2012 00:02:06 +0300
> Subject: [PATCH] dpkg: update to upstream version 1.16.3
>

Marko,

Are you going to resend this and the apt patch in an uncorrupted format?

Thanks
	Sau!

> Update dpkg recipe to get latest upstream version (1.16.3) as
> 1.15.8.7 is no longer available.
> * check_version.patch : updated to apply cleanly
> * dpkg-dev-avoid-fflush.patch : removed as already part of upstream
> * ignore_extra_fields.patch : updated to apply cleanly
> * perllibdir.patch : removed as unnecessary after upstream changes
> * preinst.patch : updated to apply cleanly
>
> Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> ---
>   .../recipes-devtools/dpkg/dpkg/check_version.patch |   26 +--
>   .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 --------------------
>   .../dpkg/dpkg/ignore_extra_fields.patch            |   39 ++--
>   meta/recipes-devtools/dpkg/dpkg/perllibdir.patch   |   22 ---
>   meta/recipes-devtools/dpkg/dpkg/preinst.patch      |   45 +++--
>   meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |   15 --
>   meta/recipes-devtools/dpkg/dpkg_1.16.3.bb          |   13 ++
>   7 files changed, 75 insertions(+), 283 deletions(-)
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
>   create mode 100644 meta/recipes-devtools/dpkg/dpkg_1.16.3.bb
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg/check_version.patch
> b/meta/recipes-devtools/dpkg/dpkg/check_version.patch
> index 524e715..385e4c6 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/check_version.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/check_version.patch
> @@ -4,20 +4,24 @@ Signed-off-by: Dongxiao Xu<dongxiao.xu@intel.com>
>
>   Upstream-Status: Inappropriate [embedded specific]
>
> -diff -ruN dpkg-1.15.8.5-orig/lib/dpkg/parsehelp.c
> dpkg-1.15.8.5/lib/dpkg/parsehelp.c
> ---- dpkg-1.15.8.5-orig/lib/dpkg/parsehelp.c	2010-10-08 12:27:15.058572774 +0800
> -+++ dpkg-1.15.8.5/lib/dpkg/parsehelp.c	2010-10-09 11:18:15.484190771 +0800
> -@@ -268,11 +268,11 @@
> -
> -   /* XXX: Would be faster to use something like cisversion and cisrevision. */
> -   for (ptr = rversion->version; *ptr; ptr++) {
> +Updated to apply over dpkg-1.16.3
> +
> +Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> +
> +diff -Nurd dpkg-1.16.3/lib/dpkg/parsehelp.c dpkg-1.16.3/lib/dpkg/parsehelp.c
> +--- dpkg-1.16.3/lib/dpkg/parsehelp.c	2012-04-27 05:49:02.000000000 +0300
> ++++ dpkg-1.16.3/lib/dpkg/parsehelp.c	2012-05-04 13:46:27.000000000 +0300
> +@@ -253,11 +253,11 @@
> +   if (*ptr&&  !cisdigit(*ptr++))
> +     return dpkg_put_warn(err, _("version number does not start with digit"));
> +   for (; *ptr; ptr++) {
>   -    if (!cisdigit(*ptr)&&  !cisalpha(*ptr)&&  strchr(".-+~:", *ptr) == NULL)
>   +    if (!cisdigit(*ptr)&&  !cisalpha(*ptr)&&  strchr(".-+~:_", *ptr) == NULL)
> -       return _("invalid character in version number");
> +       return dpkg_put_warn(err, _("invalid character in version number"));
>      }
>      for (ptr = rversion->revision; *ptr; ptr++) {
> --    if (!cisdigit(*ptr)&&  !cisalpha(*ptr)&&  strchr(".-+~", *ptr) == NULL)
> -+    if (!cisdigit(*ptr)&&  !cisalpha(*ptr)&&  strchr(".-+~_", *ptr) == NULL)
> -       return _("invalid character in revision number");
> +-    if (!cisdigit(*ptr)&&  !cisalpha(*ptr)&&  strchr(".+~", *ptr) == NULL)
> ++    if (!cisdigit(*ptr)&&  !cisalpha(*ptr)&&  strchr(".+~_", *ptr) == NULL)
> +       return dpkg_put_warn(err, _("invalid character in revision number"));
>      }
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
> b/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
> deleted file mode 100644
> index a5d6b61..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
> +++ /dev/null
> @@ -1,198 +0,0 @@
> -From 78eaf928d30d0b16e05d8d63c55a3632a135ed9a Mon Sep 17 00:00:00 2001
> -From: Guillem Jover<guillem@debian.org>
> -Date: Thu, 4 Nov 2010 00:51:13 +0100
> -Subject: [PATCH] dpkg-deb: Use fd instead of stream based buffered I/O
> -
> -Behaviour of fflush() on input streams is undefined per POSIX, avoid
> -mixing stream and file descriptor based I/O, and only use the latter
> -instead.
> -
> -Upstream-Status: Backport of revision
> 2d420ee1d05033d237462a0075facfe406b08043 (in 1.16.x)
> -
> ----
> - dpkg-deb/extract.c |   83 ++++++++++++++++++++++++++++++++++++++-------------
> - 1 files changed, 62 insertions(+), 21 deletions(-)
> -
> -diff --git a/dpkg-deb/extract.c b/dpkg-deb/extract.c
> -index 22aea98..0f5ac88 100644
> ---- a/dpkg-deb/extract.c
> -+++ b/dpkg-deb/extract.c
> -@@ -31,6 +31,7 @@
> - #include<ctype.h>
> - #include<string.h>
> - #include<dirent.h>
> -+#include<fcntl.h>
> - #include<unistd.h>
> - #include<ar.h>
> - #include<stdbool.h>
> -@@ -61,13 +62,41 @@ static void movecontrolfiles(const char *thing) {
> - }
> -
> - static void DPKG_ATTR_NORET
> --readfail(FILE *a, const char *filename, const char *what)
> -+read_fail(int rc, const char *filename, const char *what)
> - {
> --  if (ferror(a)) {
> --    ohshite(_("error reading %s from file %.255s"), what, filename);
> --  } else {
> -+  if (rc == 0)
> -     ohshit(_("unexpected end of file in %s in %.255s"),what,filename);
> -+  else
> -+    ohshite(_("error reading %s from file %.255s"), what, filename);
> -+}
> -+
> -+static ssize_t
> -+read_line(int fd, char *buf, size_t min_size, size_t max_size)
> -+{
> -+  ssize_t line_size = 0;
> -+  size_t n = min_size;
> -+
> -+  while (line_size<  (ssize_t)max_size) {
> -+    ssize_t r;
> -+    char *nl;
> -+
> -+    r = read(fd, buf + line_size, n);
> -+    if (r<= 0)
> -+      return r;
> -+
> -+    nl = strchr(buf + line_size, '\n');
> -+    line_size += r;
> -+
> -+    if (nl != NULL) {
> -+      nl[1] = '\0';
> -+      return line_size;
> -+    }
> -+
> -+    n = 1;
> -   }
> -+
> -+  buf[line_size] = '\0';
> -+  return line_size;
> - }
> -
> - static size_t
> -@@ -115,19 +144,26 @@ void extracthalf(const char *debar, const char
> *directory,
> -   char versionbuf[40];
> -   float versionnum;
> -   size_t ctrllennum, memberlen= 0;
> -+  ssize_t r;
> -   int dummy;
> -   pid_t c1=0,c2,c3;
> -   int p1[2], p2[2];
> --  FILE *ar;
> -+  int arfd;
> -   struct stat stab;
> -   char nlc;
> -   int adminmember;
> -   bool oldformat, header_done;
> -   struct compressor *decompressor =&compressor_gzip;
> -
> --  ar= fopen(debar,"r"); if (!ar) ohshite(_("failed to read archive
> `%.255s'"),debar);
> --  if (fstat(fileno(ar),&stab)) ohshite(_("failed to fstat archive"));
> --  if (!fgets(versionbuf,sizeof(versionbuf),ar))
> readfail(ar,debar,_("version number"));
> -+  arfd = open(debar, O_RDONLY);
> -+  if (arfd<  0)
> -+    ohshite(_("failed to read archive `%.255s'"), debar);
> -+  if (fstat(arfd,&stab))
> -+    ohshite(_("failed to fstat archive"));
> -+
> -+  r = read_line(arfd, versionbuf, strlen(DPKG_AR_MAGIC), sizeof(versionbuf));
> -+  if (r<  0)
> -+    read_fail(r, debar, _("archive magic version number"));
> -
> -   if (!strcmp(versionbuf, DPKG_AR_MAGIC)) {
> -     oldformat = false;
> -@@ -137,8 +173,9 @@ void extracthalf(const char *debar, const char *directory,
> -     for (;;) {
> -       struct ar_hdr arh;
> -
> --      if (fread(&arh,1,sizeof(arh),ar) != sizeof(arh))
> --        readfail(ar,debar,_("between members"));
> -+      r = read(arfd,&arh, sizeof(arh));
> -+      if (r != sizeof(arh))
> -+        read_fail(r, debar, _("archive member header"));
> -
> -       dpkg_ar_normalize_name(&arh);
> -
> -@@ -153,8 +190,9 @@ void extracthalf(const char *debar, const char *directory,
> -         if (strncmp(arh.ar_name, DEBMAGIC, sizeof(arh.ar_name)) != 0)
> -           ohshit(_("file `%.250s' is not a debian binary archive
> (try dpkg-split?)"),debar);
> -         infobuf= m_malloc(memberlen+1);
> --        if (fread(infobuf,1, memberlen + (memberlen&1), ar) !=
> memberlen + (memberlen&1))
> --          readfail(ar,debar,_("header info member"));
> -+        r = read(arfd, infobuf, memberlen + (memberlen&  1));
> -+        if ((size_t)r != (memberlen + (memberlen&  1)))
> -+          read_fail(r, debar, _("archive information header member"));
> -         infobuf[memberlen] = '\0';
> -         cur= strchr(infobuf,'\n');
> -         if (!cur) ohshit(_("archive has no newlines in header"));
> -@@ -174,7 +212,8 @@ void extracthalf(const char *debar, const char *directory,
> -           /* Members with `_' are noncritical, and if we don't understand them
> -            * we skip them.
> -            */
> --	stream_null_copy(ar, memberlen + (memberlen&1),_("skipped member
> data from %s"), debar);
> -+        fd_null_copy(arfd, memberlen + (memberlen&  1),
> -+                     _("skipped archive member data from %s"), debar);
> -       } else {
> - 	if (strncmp(arh.ar_name, ADMINMEMBER, sizeof(arh.ar_name)) == 0)
> - 	  adminmember = 1;
> -@@ -198,7 +237,8 @@ void extracthalf(const char *debar, const char *directory,
> -           ctrllennum= memberlen;
> -         }
> -         if (!adminmember != !admininfo) {
> --	  stream_null_copy(ar, memberlen + (memberlen&1),_("skipped member
> data from %s"), debar);
> -+          fd_null_copy(arfd, memberlen + (memberlen&  1),
> -+                       _("skipped archive member data from %s"), debar);
> -         } else {
> -           break; /* Yes ! - found it. */
> -         }
> -@@ -221,8 +261,10 @@ void extracthalf(const char *debar, const char *directory,
> -     l = strlen(versionbuf);
> -     if (l&&  versionbuf[l - 1] == '\n')
> -       versionbuf[l - 1] = '\0';
> --    if (!fgets(ctrllenbuf,sizeof(ctrllenbuf),ar))
> --      readfail(ar, debar, _("control information length"));
> -+
> -+    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf));
> -+    if (r<  0)
> -+      read_fail(r, debar, _("archive control member size"));
> -     if (sscanf(ctrllenbuf,"%zi%c%d",&ctrllennum,&nlc,&dummy) !=2 ||
> nlc != '\n')
> -       ohshit(_("archive has malformatted control length `%s'"), ctrllenbuf);
> -
> -@@ -230,7 +272,8 @@ void extracthalf(const char *debar, const char *directory,
> -       memberlen = ctrllennum;
> -     } else {
> -       memberlen = stab.st_size - ctrllennum - strlen(ctrllenbuf) - l;
> --      stream_null_copy(ar, ctrllennum, _("skipped control area from
> %s"), debar);
> -+      fd_null_copy(arfd, ctrllennum,
> -+                   _("skipped archive control member data from %s"), debar);
> -     }
> -
> -     if (admininfo>= 2) {
> -@@ -252,13 +295,11 @@ void extracthalf(const char *debar, const char
> *directory,
> -
> -   }
> -
> --  safe_fflush(ar);
> --
> -   m_pipe(p1);
> -   c1 = subproc_fork();
> -   if (!c1) {
> -     close(p1[0]);
> --    stream_fd_copy(ar, p1[1], memberlen, _("failed to write to pipe
> in copy"));
> -+    fd_fd_copy(arfd, p1[1], memberlen, _("failed to write to pipe in copy"));
> -     if (close(p1[1]))
> -       ohshite(_("failed to close pipe in copy"));
> -     exit(0);
> -@@ -275,7 +316,7 @@ void extracthalf(const char *debar, const char *directory,
> -     decompress_filter(decompressor, 0, 1, _("data"));
> -   }
> -   close(p1[0]);
> --  fclose(ar);
> -+  close(arfd);
> -   if (taroption) close(p2[1]);
> -
> -   if (taroption&&  directory) {
> ---
> -1.7.7.6
> -
> diff --git a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> b/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> index 0ff09e7..2dbb5a2 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> @@ -1,22 +1,25 @@
>   Upstream-Status: Inappropriate [workaround]
>
> -diff -ruN dpkg-1.15.8.5-orig/dpkg-deb/build.c dpkg-1.15.8.5/dpkg-deb/build.c
> ---- dpkg-1.15.8.5-orig/dpkg-deb/build.c	2010-10-08 12:27:15.042083703 +0800
> -+++ dpkg-1.15.8.5/dpkg-deb/build.c	2010-10-08 12:31:53.822534277 +0800
> -@@ -275,14 +275,14 @@
> -               controlfile, checkedinfo->otherpriority);
> -       warns++;
> -     }
> --    for (field= checkedinfo->available.arbs; field; field= field->next) {
> -+    /*for (field= checkedinfo->available.arbs; field; field= field->next) {
> -       if (known_arbitrary_field(field))
> -         continue;
> +Updated to apply over dpkg-1.16.3
> +
> +Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> +
> +diff -Nurd dpkg-1.16.3/dpkg-deb/build.c dpkg-1.16.3/dpkg-deb/build.c
> +--- dpkg-1.16.3/dpkg-deb/build.c	2012-04-27 05:49:02.000000000 +0300
> ++++ dpkg-1.16.3/dpkg-deb/build.c	2012-05-04 13:28:39.000000000 +0300
> +@@ -340,6 +340,7 @@
> +   if (pkg->priority == pri_other)
> +     warning(_("'%s' contains user-defined Priority value '%s'"),
> +             controlfile, pkg->otherpriority);
> ++#if 0
> +   for (field = pkg->available.arbs; field; field = field->next) {
> +     if (known_arbitrary_field(field))
> +       continue;
> +@@ -347,6 +348,7 @@
> +     warning(_("'%s' contains user-defined field '%s'"), controlfile,
> +             field->name);
> +   }
> ++#endif
>
> -       warning(_("'%s' contains user-defined field '%s'"),
> -               controlfile, field->name);
> -       warns++;
> --    }
> -+    }*/
> +   free(controlfile);
>
> -     if (subdir) {
> -       versionstring=
> versiondescribe(&checkedinfo->available.version,vdew_never);
> diff --git a/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
> b/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
> deleted file mode 100644
> index 45973f0..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -We want to be able to set PERL_LIBDIR from the environment. This
> -hardcoded assignment prevents us from doing so and obtains an
> -incorrect value.
> -
> -Upstream-Status: Inappropriate [in this form at least]
> -
> -RP 14/11/2011
> -
> -Index: dpkg-1.15.8.7/m4/dpkg-progs.m4
> -===================================================================
> ---- dpkg-1.15.8.7.orig/m4/dpkg-progs.m4	2011-11-14 17:32:21.252053239 +0000
> -+++ dpkg-1.15.8.7/m4/dpkg-progs.m4	2011-11-14 17:32:55.180052455 +0000
> -@@ -9,9 +9,6 @@
> - [AC_ARG_VAR([PERL], [Perl interpreter])dnl
> - AC_PATH_PROG([PERL], [perl], [/usr/bin/perl])dnl
> - AC_ARG_VAR([PERL_LIBDIR], [Perl library directory])dnl
> --PERL_LIBDIR=$($PERL -MConfig -e 'my $r = $Config{vendorlibexp};
> --                                 $r =~ s/$Config{vendorprefixexp}/\$(prefix)/;
> --                                 print $r')dnl
> - ])# DPKG_PROG_PERL
> -
> - # DPKG_PROG_PO4A
> diff --git a/meta/recipes-devtools/dpkg/dpkg/preinst.patch
> b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
> index 06d2aac..557b423 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/preinst.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
> @@ -6,41 +6,48 @@ Upstream-Status: Inappropriate [OE Specific]
>
>   RP 2011/12/07
>
> -Index: dpkg-1.15.8.7/src/help.c
> -===================================================================
> ---- dpkg-1.15.8.7.orig/src/help.c	2010-12-20 01:25:36.000000000 +0000
> -+++ dpkg-1.15.8.7/src/help.c	2011-12-07 14:51:02.783461487 +0000
> -@@ -181,30 +181,9 @@
> -    * FIXME: none of the stuff here will work if admindir isn't inside
> -    * instdir as expected.
> -    */
> --  size_t instdirl;
> +Updated to apply over dpkg-1.16.3
> +
> +Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> +
> +diff -Nurd dpkg-1.16.3/src/help.c dpkg-1.16.3/src/help.c
> +--- dpkg-1.16.3/src/help.c	2012-04-27 05:49:03.000000000 +0300
> ++++ dpkg-1.16.3/src/help.c	2012-05-04 13:55:44.000000000 +0300
> +@@ -204,35 +204,10 @@
> + static const char *
> + preexecscript(struct command *cmd)
> + {
> +-  const char *admindir = dpkg_db_get_dir();
> +-  size_t instdirl = strlen(instdir);
> +-
> +   if (*instdir) {
> +-    if (strncmp(admindir, instdir, instdirl) != 0)
> +-      ohshit(_("admindir must be inside instdir for dpkg to work properly"));
> +-    if (setenv("DPKG_ADMINDIR", admindir + instdirl, 1)<  0)
> +-      ohshite(_("unable to setenv for subprocesses"));
>   -
> --  if (*instdir) {
>   -    if (chroot(instdir)) ohshite(_("failed to chroot to `%.250s'"),instdir);
>   -    if (chdir("/"))
>   -      ohshite(_("failed to chdir to `%.255s'"), "/");
>   -  }
> --  if (f_debug&  dbg_scripts) {
> +-  if (debug_has_flag(dbg_scripts)) {
>   -    struct varbuf args = VARBUF_INIT;
>   -    const char **argv = cmd->argv;
>   -
>   -    while (*++argv) {
> --      varbufaddc(&args, ' ');
> --      varbufaddstr(&args, *argv);
> +-      varbuf_add_char(&args, ' ');
> +-      varbuf_add_str(&args, *argv);
>   -    }
> --    varbufaddc(&args, '\0');
> +-    varbuf_end_str(&args);
>   -    debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename, args.buf);
>   -    varbuf_destroy(&args);
> --  }
> --  instdirl= strlen(instdir);
> ++    setenv("D", instdir, 1);
> +   }
>   -  if (!instdirl)
>   -    return cmd->filename;
>   -  assert(strlen(cmd->filename)>= instdirl);
>   -  return cmd->filename + instdirl;
> -+  if (*instdir)
> -+    setenv("D", instdir, 1);
>   +  return cmd->filename;
> - }
> + }
>
>    void
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
> b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
> deleted file mode 100644
> index 1e7ef25..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require dpkg.inc
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -
> -SRC_URI += "file://noman.patch \
> -            file://check_snprintf.patch \
> -            file://check_version.patch \
> -            file://perllibdir.patch \
> -            file://preinst.patch \
> -            file://dpkg-deb-avoid-fflush.patch"
> -
> -SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
> -SRC_URI[sha256sum] =
> "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
> -
> -PR = "${INC_PR}.4"
> -
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.16.3.bb
> b/meta/recipes-devtools/dpkg/dpkg_1.16.3.bb
> new file mode 100644
> index 0000000..6af7f2d
> --- /dev/null
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.16.3.bb
> @@ -0,0 +1,13 @@
> +require dpkg.inc
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +SRC_URI += "file://noman.patch \
> +            file://check_snprintf.patch \
> +            file://check_version.patch \
> +            file://preinst.patch"
> +
> +SRC_URI[md5sum] = "20189e2926ada3dda4f77ef2e36999af"
> +SRC_URI[sha256sum] =
> "8048890ca92a3ca317a4fdd557f8e9b2b3ce560743e8e70813496f9a7096d8d8"
> +
> +PR = "${INC_PR}.1"
> +


