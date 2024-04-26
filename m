Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228B6C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 04:21:43 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.6298.1714105295669619823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 21:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bqyIAvjI;
 spf=pass (domain: mvista.com, ip: 209.85.208.172, mailfrom: vkumbhar@mvista.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2dae975d0dcso28920741fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 21:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1714105294; x=1714710094; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Fo8EP87Qw4w7GOodorfHeDaAyJCkLLL92AtGzM4LYE=;
        b=bqyIAvjI9clVQNS/PXr9oVQEPFUwmUE4FpHh9La6SKKyaT95E5bSTxPSEMVTDskUmO
         VKWlBVRTYE6RNTHDbbNiKJJk/IRMgNjhftBNNaztt/V6bTMJaTtjHyeEG35dmRiHKUlG
         6yclfviJmwIbqAjr3tDRVRRL5P+lMArULtx+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714105294; x=1714710094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Fo8EP87Qw4w7GOodorfHeDaAyJCkLLL92AtGzM4LYE=;
        b=gB6+n6zi+iFjYXVHtQb48bgAFTHa3hc0jhwIWVBnJh1ByCpkPyiQTeDTZpP+PrYyLU
         Dx+F1KEzE+wzf13Pae0/PqKKgsR3ocLjqBr29E6M4EzHV6GXm3T4GIcT1Whp4PiutP5z
         Q6S8YF2qwDhph3AS9u/pHFS0dTOSmLFJJYWe1rj+wZ4wiqb9hPh8sENuEBkTpC6VgJja
         Vz6fdzDgqPg+5AUU01otmF2J6dAQgVUNSW0MRKRd/UaBBTsH8J9nwOrNGhEt9/h17m5Q
         RfmqpGTzhGUjTseaoebTOc7rAwMwLx2/aQ+x0LZnTPRZnCCFTRgV+M9mxiPIJXpwL5qB
         EJbg==
X-Gm-Message-State: AOJu0YwPvw1PHTy/rlgdDPX8wupcU35VnpzR1CuOM11jLjgfcmjhyQ5Y
	qCbsYzKsrL+UIfIX2rrRcR8nC1c6rlZLvJiuPsS1WxYbPk/oMHwMGU/thRubHf/mwCo6lccCpkY
	r1PRk2ipQwvwEJEfi+Mr1yuHbqB6JeCzGOkBz9w==
X-Google-Smtp-Source: AGHT+IHsMRMdwUyIFjhQoFoVGxi8Jzy5tRoC/omSMwd9+CB2K9KtCKrQRq1SZH/7hju/xFHfb3zWZy0Hq/rY0Ro8Y+E=
X-Received: by 2002:a05:651c:2129:b0:2dd:1f7c:d573 with SMTP id
 a41-20020a05651c212900b002dd1f7cd573mr612934ljq.19.1714105293111; Thu, 25 Apr
 2024 21:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240423162844.1563233-1-vkumbhar@mvista.com> <CAOSpxdZYEQCU6ufL=ngA1kZ26XEE1kUsX8duaPMpekffTNJrhQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZYEQCU6ufL=ngA1kZ26XEE1kUsX8duaPMpekffTNJrhQ@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Fri, 26 Apr 2024 09:51:21 +0530
Message-ID: <CAPun1rGTnKvF5jxy6w0vTCFeqEPdcDK6nECeVGxD6hHMZCzm9A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] rpm: Backport fix CVE-2021-35939
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001aa85e0616f83dda"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 04:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198710

--0000000000001aa85e0616f83dda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay, Will correct and send V2.

Thanks,
Vivek

On Fri, Apr 26, 2024 at 1:29=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:

> This patch caused multiple build failures both locally and on the
> autobuilder.
>
> Here is a link to the autobuilder run:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6845
>
> Sample error log:
>
> https://errors.yoctoproject.org/Errors/Details/763370/
>
> Steve
>
> On Tue, Apr 23, 2024 at 9:30=E2=80=AFAM Vivek Kumbhar via
> lists.openembedded.org <vkumbhar=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > Upstream-Status: Backport
> https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e13=
7a2d5eb23b83a6377d556
> >
> https://github.com/rpm-software-management/rpm/commit/fb13f7fd9eff012cb7b=
9dbf94ac5381c69404055
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  .../rpm/files/CVE-2021-35939.patch            | 378 ++++++++++++++++++
> >  meta/recipes-devtools/rpm/rpm_4.17.1.bb       |   1 +
> >  2 files changed, 379 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-35939.patc=
h
> >
> > diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch
> b/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch
> > new file mode 100644
> > index 0000000000..b60cc0e5ce
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch
> > @@ -0,0 +1,378 @@
> > +From 96ec957e281220f8e137a2d5eb23b83a6377d556 Mon Sep 17 00:00:00 2001
> > +From: Panu Matilainen <pmatilai@redhat.com>
> > +Date: Thu, 10 Feb 2022 14:32:43 +0200
> > +Subject: [PATCH] Validate intermediate symlinks during installation,
> > + CVE-2021-35939
> > +
> > +Whenever directory changes during unpacking, walk the entire tree from
> > +starting from / and validate any symlinks crossed, fail the install
> > +on invalid links.
> > +
> > +This is the first of step of many towards securing our file operations
> > +against local tamperers and besides plugging that one CVE, paves the w=
ay
> > +for the next step by adding the necessary directory fd tracking.
> > +This also bumps the rpm OS requirements to a whole new level by
> requiring
> > +the *at() family of calls from POSIX-1.2008.
> > +
> > +This necessarily does a whole lot of huffing and puffing we previously
> > +did not do. It should be possible to cache secure (ie root-owned)
> > +directory structures to avoid validating everything a million times
> > +but for now, just keeping things simple.
> > +
> > +Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e13=
7a2d5eb23b83a6377d556
> ]
> > +CVE: CVE-2021-35939
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + INSTALL              |   2 +
> > + configure.ac         |   3 +-
> > + lib/fsm.c            | 144 +++++++++++++++++++++++++++++++++++++++++-=
-
> > + lib/rpmfi.c          |  27 +++++++-
> > + lib/rpmfi_internal.h |  17 +++++
> > + 5 files changed, 183 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/INSTALL b/INSTALL
> > +index 358e5ae0d..9a9c7b0d0 100644
> > +--- a/INSTALL
> > ++++ b/INSTALL
> > +@@ -103,6 +103,8 @@ option to configure).  For GCC, OpenMP 4.5 is full=
y
> supported since GCC 6.1,
> > + which is available from
> > +     http://www.gnu.org/
> > +
> > ++Rpm requires a POSIX.1-2008 level operating system.
> > ++
> > + To compile RPM:
> > + --------------
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 78c555f90..4ddacdfe2 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -570,7 +570,8 @@ AC_CHECK_FUNCS([secure_getenv __secure_getenv])
> > +
> > + AC_CHECK_FUNCS(
> > +    [mkstemp getcwd basename dirname realpath setenv unsetenv regcomp
> lchown \
> > +-    utimes getline localtime_r statvfs getaddrinfo ],
> > ++    utimes getline localtime_r statvfs getaddrinfo \
> > ++    openat mkdirat fstatat ],
> > +    [], [AC_MSG_ERROR([function required by rpm])])
> > +
> > + AC_LIBOBJ(fnmatch)
> > +diff --git a/lib/fsm.c b/lib/fsm.c
> > +index 935a0a5c6..0b29284e8 100644
> > +--- a/lib/fsm.c
> > ++++ b/lib/fsm.c
> > +@@ -8,6 +8,7 @@
> > + #include <inttypes.h>
> > + #include <utime.h>
> > + #include <errno.h>
> > ++#include <fcntl.h>
> > + #if WITH_CAP
> > + #include <sys/capability.h>
> > + #endif
> > +@@ -20,6 +21,7 @@
> > + #include "rpmio/rpmio_internal.h"     /* fdInit/FiniDigest */
> > + #include "lib/fsm.h"
> > + #include "lib/rpmte_internal.h"       /* XXX rpmfs */
> > ++#include "lib/rpmfi_internal.h" /* rpmfiSetOnChdir */
> > + #include "lib/rpmplugins.h"   /* rpm plugins hooks */
> > + #include "lib/rpmug.h"
> > +
> > +@@ -406,17 +408,118 @@ static int fsmRmdir(const char *path)
> > +     return rc;
> > + }
> > +
> > +-static int fsmMkdir(const char *path, mode_t mode)
> > ++static int fsmMkdir(int dirfd, const char *path, mode_t mode)
> > + {
> > +-    int rc =3D mkdir(path, (mode & 07777));
> > ++    int rc =3D mkdirat(dirfd, path, (mode & 07777));
> > +     if (_fsm_debug)
> > +-      rpmlog(RPMLOG_DEBUG, " %8s (%s, 0%04o) %s\n", __func__,
> > +-             path, (unsigned)(mode & 07777),
> > ++      rpmlog(RPMLOG_DEBUG, " %8s (%d %s, 0%04o) %s\n", __func__,
> > ++             dirfd, path, (unsigned)(mode & 07777),
> > +              (rc < 0 ? strerror(errno) : ""));
> > +     if (rc < 0)       rc =3D RPMERR_MKDIR_FAILED;
> > +     return rc;
> > + }
> > +
> > ++static int fsmOpenat(int dirfd, const char *path, int flags)
> > ++{
> > ++    struct stat lsb, sb;
> > ++    int sflags =3D flags | O_NOFOLLOW;
> > ++    int fd =3D openat(dirfd, path, sflags);
> > ++
> > ++    /*
> > ++     * Only ever follow symlinks by root or target owner. Since we
> can't
> > ++     * open the symlink itself, the order matters: we stat the link
> *after*
> > ++     * opening the target, and if the link ownership changed between
> the calls
> > ++     * it could've only been the link owner or root.
> > ++     */
> > ++    if (fd < 0 && errno =3D=3D ELOOP && flags !=3D sflags) {
> > ++      int ffd =3D openat(dirfd, path, flags);
> > ++      if (ffd >=3D 0 && fstatat(dirfd, path, &lsb, AT_SYMLINK_NOFOLLO=
W)
> =3D=3D 0) {
> > ++          if (fstat(ffd, &sb) =3D=3D 0) {
> > ++              if (lsb.st_uid =3D=3D 0 || lsb.st_uid =3D=3D sb.st_uid)=
 {
> > ++                  fd =3D ffd;
> > ++              } else {
> > ++                  close(ffd);
> > ++              }
> > ++          }
> > ++      }
> > ++    }
> > ++    return fd;
> > ++}
> > ++
> > ++static int fsmDoMkDir(rpmPlugins plugins, int dirfd, const char *dn,
> > ++                      int owned, mode_t mode)
> > ++{
> > ++    int rc;
> > ++    rpmFsmOp op =3D (FA_CREATE);
> > ++    if (!owned)
> > ++      op |=3D FAF_UNOWNED;
> > ++
> > ++    /* Run fsm file pre hook for all plugins */
> > ++    rc =3D rpmpluginsCallFsmFilePre(plugins, NULL, dn, mode, op);
> > ++
> > ++    if (!rc)
> > ++      rc =3D fsmMkdir(dirfd, dn, mode);
> > ++
> > ++    if (!rc) {
> > ++      rc =3D rpmpluginsCallFsmFilePrepare(plugins, NULL, dn, dn, mode=
,
> op);
> > ++    }
> > ++
> > ++    /* Run fsm file post hook for all plugins */
> > ++    rpmpluginsCallFsmFilePost(plugins, NULL, dn, mode, op, rc);
> > ++
> > ++    if (!rc) {
> > ++      rpmlog(RPMLOG_DEBUG,
> > ++              "%s directory created with perms %04o\n",
> > ++              dn, (unsigned)(mode & 07777));
> > ++    }
> > ++
> > ++    return rc;
> > ++}
> > ++
> > ++static int ensureDir(rpmPlugins plugins, const char *p, int owned, in=
t
> create)
> > ++{
> > ++    char *path =3D xstrdup(p);
> > ++    char *dp =3D path;
> > ++    char *sp =3D NULL, *bn;
> > ++    int oflags =3D O_RDONLY;
> > ++
> > ++    int dirfd =3D fsmOpenat(-1, "/", oflags);
> > ++    int fd =3D dirfd; /* special case of "/" */
> > ++
> > ++    while ((bn =3D strtok_r(dp, "/", &sp)) !=3D NULL) {
> > ++      struct stat sb;
> > ++      fd =3D fsmOpenat(dirfd, bn, oflags);
> > ++
> > ++      if (fd < 0 && errno =3D=3D ENOENT && create) {
> > ++          mode_t mode =3D S_IFDIR | (_dirPerms & 07777);
> > ++          if (fsmDoMkDir(plugins, dirfd, bn, owned, mode) =3D=3D 0) {
> > ++              fd =3D fsmOpenat(dirfd, bn, oflags|O_NOFOLLOW);
> > ++          }
> > ++      }
> > ++
> > ++      if (fd >=3D 0 && fstat(fd, &sb) =3D=3D 0 && !S_ISDIR(sb.st_mode=
)) {
> > ++          close(fd);
> > ++          errno =3D ENOTDIR;
> > ++          fd =3D -1;
> > ++      }
> > ++
> > ++      close(dirfd);
> > ++      if (fd >=3D 0) {
> > ++          dirfd =3D fd;
> > ++      } else {
> > ++          dirfd =3D -1;
> > ++          rpmlog(RPMLOG_ERR, _("failed to open dir %s of %s: %s\n"),
> > ++                              bn, p, strerror(errno));
> > ++          break;
> > ++      }
> > ++
> > ++      dp =3D NULL;
> > ++    }
> > ++
> > ++    free(path);
> > ++    return dirfd;
> > ++}
> > ++
> > + static int fsmMkfifo(const char *path, mode_t mode)
> > + {
> > +     int rc =3D mkfifo(path, (mode & 07777));
> > +@@ -507,7 +610,7 @@ static int fsmMkdirs(rpmfiles files, rpmfs fs,
> rpmPlugins plugins)
> > +               rc =3D rpmpluginsCallFsmFilePre(plugins, NULL, dn, mode=
,
> op);
> > +
> > +               if (!rc)
> > +-                  rc =3D fsmMkdir(dn, mode);
> > ++                  rc =3D fsmMkdir(-1, dn, mode);
> > +
> > +               if (!rc) {
> > +                   rc =3D rpmpluginsCallFsmFilePrepare(plugins, NULL, =
dn,
> dn,
> > +@@ -874,6 +977,21 @@ static void setFileState(rpmfs fs, int i)
> > +     }
> > + }
> > +
> > ++struct diriter_s {
> > ++    int dirfd;
> > ++};
> > ++
> > ++static int onChdir(rpmfi fi, void *data)
> > ++{
> > ++    struct diriter_s *di =3D data;
> > ++
> > ++    if (di->dirfd >=3D 0) {
> > ++      close(di->dirfd);
> > ++      di->dirfd =3D -1;
> > ++    }
> > ++    return 0;
> > ++}
> > ++
> > + int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
> > +               rpmpsm psm, char ** failedFile)
> > + {
> > +@@ -890,6 +1008,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te,
> rpmfiles files,
> > +     char *tid =3D NULL;
> > +     struct filedata_s *fdata =3D xcalloc(fc, sizeof(*fdata));
> > +     struct filedata_s *firstlink =3D NULL;
> > ++    struct diriter_s di =3D { -1 };
> > +
> > +     /* transaction id used for temporary path suffix while installing
> */
> > +     rasprintf(&tid, ";%08x", (unsigned)rpmtsGetTid(ts));
> > +@@ -929,6 +1048,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te,
> rpmfiles files,
> > +         rc =3D RPMERR_BAD_MAGIC;
> > +         goto exit;
> > +     }
> > ++    rpmfiSetOnChdir(fi, onChdir, &di);
> > +
> > +     /* Detect and create directories not explicitly in package. */
> > +     if (!rc)
> > +@@ -943,6 +1063,16 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te,
> rpmfiles files,
> > +           if (!fp->suffix) {
> > +               rc =3D fsmBackup(fi, fp->action);
> > +           }
> > ++
> > ++          if (di.dirfd =3D=3D -1) {
> > ++              di.dirfd =3D ensureDir(plugins, rpmfiDN(fi), 0,
> > ++                                  (fp->action =3D=3D FA_CREATE));
> > ++              if (di.dirfd =3D=3D -1) {
> > ++                  rc =3D RPMERR_OPEN_FAILED;
> > ++                  break;
> > ++              }
> > ++          }
> > ++
> > +           /* Assume file does't exist when tmp suffix is in use */
> > +           if (!fp->suffix) {
> > +               if (fp->action =3D=3D FA_TOUCH) {
> > +@@ -977,7 +1107,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te,
> rpmfiles files,
> > +                     mode_t mode =3D fp->sb.st_mode;
> > +                     mode &=3D ~07777;
> > +                     mode |=3D  00700;
> > +-                    rc =3D fsmMkdir(fp->fpath, mode);
> > ++                    rc =3D fsmMkdir(di.dirfd, fp->fpath, mode);
> > +                 }
> > +             } else if (S_ISLNK(fp->sb.st_mode)) {
> > +               if (rc =3D=3D RPMERR_ENOENT) {
> > +@@ -1019,6 +1149,8 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te,
> rpmfiles files,
> > +       fp->stage =3D FILE_UNPACK;
> > +     }
> > +     fi =3D rpmfiFree(fi);
> > ++    close(di.dirfd);
> > ++    di.dirfd =3D -1;
> > +
> > +     if (!rc && fx < 0 && fx !=3D RPMERR_ITER_END)
> > +       rc =3D fx;
> > +diff --git a/lib/rpmfi.c b/lib/rpmfi.c
> > +index 33b657aa2..740e257fe 100644
> > +--- a/lib/rpmfi.c
> > ++++ b/lib/rpmfi.c
> > +@@ -55,6 +55,9 @@ struct rpmfi_s {
> > +     int intervalStart;                /*!< Start of iterating
> interval. */
> > +     int intervalEnd;          /*!< End of iterating interval. */
> > +
> > ++    rpmfiChdirCb onChdir;     /*!< Callback for directory changes */
> > ++    void *onChdirData;                /*!< Caller private callback
> data */
> > ++
> > +     rpmfiles files;           /*!< File info set */
> > +     rpmcpio_t archive;                /*!< Archive with payload */
> > +     unsigned char * found;    /*!< Bit field of files found in the
> archive */
> > +@@ -309,6 +312,17 @@ int rpmfiDI(rpmfi fi)
> > + }
> > + #endif
> > +
> > ++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data)
> > ++{
> > ++    int rc =3D -1;
> > ++    if (fi !=3D NULL) {
> > ++      fi->onChdir =3D cb;
> > ++      fi->onChdirData =3D data;
> > ++      rc =3D 0;
> > ++    }
> > ++    return rc;
> > ++}
> > ++
> > + int rpmfiFX(rpmfi fi)
> > + {
> > +     return (fi !=3D NULL ? fi->i : -1);
> > +@@ -319,9 +333,17 @@ int rpmfiSetFX(rpmfi fi, int fx)
> > +     int i =3D -1;
> > +
> > +     if (fi !=3D NULL && fx >=3D 0 && fx < rpmfilesFC(fi->files)) {
> > +-      i =3D fi->i;
> > ++      int dx =3D fi->j;
> > ++      i =3D fi->i;
> > +       fi->i =3D fx;
> > +       fi->j =3D rpmfilesDI(fi->files, fi->i);
> > ++      i =3D fi->i;
> > ++
> > ++      if (fi->j !=3D dx && fi->onChdir) {
> > ++          int chrc =3D fi->onChdir(fi, fi->onChdirData);
> > ++          if (chrc < 0)
> > ++              i =3D chrc;
> > ++      }
> > +     }
> > +     return i;
> > + }
> > +@@ -1816,10 +1838,9 @@ static rpmfi initIter(rpmfiles files, int itype=
,
> int link)
> > +
> > +     if (files && itype>=3D0 && itype<=3DRPMFILEITERMAX) {
> > +       fi =3D xcalloc(1, sizeof(*fi));
> > +-      fi->i =3D -1;
> > ++      fi->j =3D -1;
> > +       fi->files =3D link ? rpmfilesLink(files) : files;
> > +       fi->next =3D nextfuncs[itype];
> > +-      fi->i =3D -1;
> > +       if (itype =3D=3D RPMFI_ITER_BACK) {
> > +           fi->i =3D rpmfilesFC(fi->files);
> > +       } else if (itype >=3DRPMFI_ITER_READ_ARCHIVE
> > +diff --git a/lib/rpmfi_internal.h b/lib/rpmfi_internal.h
> > +index dccc6ccbe..37f1d45f5 100644
> > +--- a/lib/rpmfi_internal.h
> > ++++ b/lib/rpmfi_internal.h
> > +@@ -13,6 +13,23 @@
> > + extern "C" {
> > + #endif
> > +
> > ++/** \ingroup rpmfi
> > ++ * Callback on file iterator directory changes
> > ++ * @param fi          file info
> > ++ * @param data                caller private callback data
> > ++ * @return            0 on success, < 0 on error (to stop iteration)
> > ++ */
> > ++typedef int (*rpmfiChdirCb)(rpmfi fi, void *data);
> > ++
> > ++/** \ingroup rpmfi
> > ++ * Set a callback for directory changes during iteration.
> > ++ * @param fi          file info
> > ++ * @param cb          callback function
> > ++ * @param data                caller private callback data
> > ++ * @return            string pool handle (weak reference)
> > ++ */
> > ++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data);
> > ++
> > + /** \ingroup rpmfi
> > +  * Return file info set string pool handle
> > +  * @param fi          file info
> > +--
> > +2.39.3
> > +
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > index 9b6446f265..aad8f2468f 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > @@ -40,6 +40,7 @@ SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.17.x;protoc
> >             file://0001-docs-do-not-build-manpages-requires-pandoc.patc=
h
> \
> >
>  file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
> >
>  file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
> > +           file://CVE-2021-35939.patch \
> >             "
> >
> >  PE =3D "1"
> > --
> > 2.39.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198630):
> https://lists.openembedded.org/g/openembedded-core/message/198630
> > Mute This Topic: https://lists.openembedded.org/mt/105692772/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000001aa85e0616f83dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay, Will correct and send V2.<div><br></div><div>Thanks,=
</div><div>Vivek</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Apr 26, 2024 at 1:29=E2=80=AFAM Steve Sakoman=
 &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch cause=
d multiple build failures both locally and on the autobuilder.<br>
<br>
Here is a link to the autobuilder run:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/6845" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/6845</a><br>
<br>
Sample error log:<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/763370/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/763370/</a><br>
<br>
Steve<br>
<br>
On Tue, Apr 23, 2024 at 9:30=E2=80=AFAM Vivek Kumbhar via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vkumbhar=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Upstream-Status: Backport <a href=3D"https://github.com/rpm-software-m=
anagement/rpm/commit/96ec957e281220f8e137a2d5eb23b83a6377d556" rel=3D"noref=
errer" target=3D"_blank">https://github.com/rpm-software-management/rpm/com=
mit/96ec957e281220f8e137a2d5eb23b83a6377d556</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/rpm-software-manag=
ement/rpm/commit/fb13f7fd9eff012cb7b9dbf94ac5381c69404055" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/rpm-software-management/rpm/commit/=
fb13f7fd9eff012cb7b9dbf94ac5381c69404055</a><br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../rpm/files/CVE-2021-35939.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 378 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 379 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3593=
9.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch b/me=
ta/recipes-devtools/rpm/files/CVE-2021-35939.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b60cc0e5ce<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch<br>
&gt; @@ -0,0 +1,378 @@<br>
&gt; +From 96ec957e281220f8e137a2d5eb23b83a6377d556 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Panu Matilainen &lt;<a href=3D"mailto:pmatilai@redhat.com" targ=
et=3D"_blank">pmatilai@redhat.com</a>&gt;<br>
&gt; +Date: Thu, 10 Feb 2022 14:32:43 +0200<br>
&gt; +Subject: [PATCH] Validate intermediate symlinks during installation,<=
br>
&gt; + CVE-2021-35939<br>
&gt; +<br>
&gt; +Whenever directory changes during unpacking, walk the entire tree fro=
m<br>
&gt; +starting from / and validate any symlinks crossed, fail the install<b=
r>
&gt; +on invalid links.<br>
&gt; +<br>
&gt; +This is the first of step of many towards securing our file operation=
s<br>
&gt; +against local tamperers and besides plugging that one CVE, paves the =
way<br>
&gt; +for the next step by adding the necessary directory fd tracking.<br>
&gt; +This also bumps the rpm OS requirements to a whole new level by requi=
ring<br>
&gt; +the *at() family of calls from POSIX-1.2008.<br>
&gt; +<br>
&gt; +This necessarily does a whole lot of huffing and puffing we previousl=
y<br>
&gt; +did not do. It should be possible to cache secure (ie root-owned)<br>
&gt; +directory structures to avoid validating everything a million times<b=
r>
&gt; +but for now, just keeping things simple.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/rpm-software=
-management/rpm/commit/96ec957e281220f8e137a2d5eb23b83a6377d556" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/rpm-software-management/rpm/c=
ommit/96ec957e281220f8e137a2d5eb23b83a6377d556</a>]<br>
&gt; +CVE: CVE-2021-35939<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + INSTALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt; + lib/fsm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 144 +++++++++++=
++++++++++++++++++++++++++++++--<br>
&gt; + lib/rpmfi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 27 +++++++-<br=
>
&gt; + lib/rpmfi_internal.h |=C2=A0 17 +++++<br>
&gt; + 5 files changed, 183 insertions(+), 10 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/INSTALL b/INSTALL<br>
&gt; +index 358e5ae0d..9a9c7b0d0 100644<br>
&gt; +--- a/INSTALL<br>
&gt; ++++ b/INSTALL<br>
&gt; +@@ -103,6 +103,8 @@ option to configure).=C2=A0 For GCC, OpenMP 4.5 i=
s fully supported since GCC 6.1,<br>
&gt; + which is available from<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.gnu.org/" rel=3D"noreferrer=
" target=3D"_blank">http://www.gnu.org/</a><br>
&gt; +<br>
&gt; ++Rpm requires a POSIX.1-2008 level operating system.<br>
&gt; ++<br>
&gt; + To compile RPM:<br>
&gt; + --------------<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 78c555f90..4ddacdfe2 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -570,7 +570,8 @@ AC_CHECK_FUNCS([secure_getenv __secure_getenv])<b=
r>
&gt; +<br>
&gt; + AC_CHECK_FUNCS(<br>
&gt; +=C2=A0 =C2=A0 [mkstemp getcwd basename dirname realpath setenv unsete=
nv regcomp lchown \<br>
&gt; +-=C2=A0 =C2=A0 utimes getline localtime_r statvfs getaddrinfo ],<br>
&gt; ++=C2=A0 =C2=A0 utimes getline localtime_r statvfs getaddrinfo \<br>
&gt; ++=C2=A0 =C2=A0 openat mkdirat fstatat ],<br>
&gt; +=C2=A0 =C2=A0 [], [AC_MSG_ERROR([function required by rpm])])<br>
&gt; +<br>
&gt; + AC_LIBOBJ(fnmatch)<br>
&gt; +diff --git a/lib/fsm.c b/lib/fsm.c<br>
&gt; +index 935a0a5c6..0b29284e8 100644<br>
&gt; +--- a/lib/fsm.c<br>
&gt; ++++ b/lib/fsm.c<br>
&gt; +@@ -8,6 +8,7 @@<br>
&gt; + #include &lt;inttypes.h&gt;<br>
&gt; + #include &lt;utime.h&gt;<br>
&gt; + #include &lt;errno.h&gt;<br>
&gt; ++#include &lt;fcntl.h&gt;<br>
&gt; + #if WITH_CAP<br>
&gt; + #include &lt;sys/capability.h&gt;<br>
&gt; + #endif<br>
&gt; +@@ -20,6 +21,7 @@<br>
&gt; + #include &quot;rpmio/rpmio_internal.h&quot;=C2=A0 =C2=A0 =C2=A0/* fd=
Init/FiniDigest */<br>
&gt; + #include &quot;lib/fsm.h&quot;<br>
&gt; + #include &quot;lib/rpmte_internal.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* XXX rpmfs */<br>
&gt; ++#include &quot;lib/rpmfi_internal.h&quot; /* rpmfiSetOnChdir */<br>
&gt; + #include &quot;lib/rpmplugins.h&quot;=C2=A0 =C2=A0/* rpm plugins hoo=
ks */<br>
&gt; + #include &quot;lib/rpmug.h&quot;<br>
&gt; +<br>
&gt; +@@ -406,17 +408,118 @@ static int fsmRmdir(const char *path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static int fsmMkdir(const char *path, mode_t mode)<br>
&gt; ++static int fsmMkdir(int dirfd, const char *path, mode_t mode)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 int rc =3D mkdir(path, (mode &amp; 07777));<br>
&gt; ++=C2=A0 =C2=A0 int rc =3D mkdirat(dirfd, path, (mode &amp; 07777));<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (_fsm_debug)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_DEBUG, &quot; %8s (%s, 0%04o) %s\=
n&quot;, __func__,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path, (unsigned)(mod=
e &amp; 07777),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_DEBUG, &quot; %8s (%d %s, 0%04o) =
%s\n&quot;, __func__,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirfd, path, (unsign=
ed)(mode &amp; 07777),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rc &lt; 0 ? strerro=
r(errno) : &quot;&quot;));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rc &lt; 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D R=
PMERR_MKDIR_FAILED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static int fsmOpenat(int dirfd, const char *path, int flags)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 struct stat lsb, sb;<br>
&gt; ++=C2=A0 =C2=A0 int sflags =3D flags | O_NOFOLLOW;<br>
&gt; ++=C2=A0 =C2=A0 int fd =3D openat(dirfd, path, sflags);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Only ever follow symlinks by root or target ow=
ner. Since we can&#39;t<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* open the symlink itself, the order matters: we=
 stat the link *after*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* opening the target, and if the link ownership =
changed between the calls<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* it could&#39;ve only been the link owner or ro=
ot.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if (fd &lt; 0 &amp;&amp; errno =3D=3D ELOOP &amp;&amp;=
 flags !=3D sflags) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ffd =3D openat(dirfd, path, flags);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ffd &gt;=3D 0 &amp;&amp; fstatat(dirfd, pat=
h, &amp;lsb, AT_SYMLINK_NOFOLLOW) =3D=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fstat(ffd, &amp;sb) =3D=3D 0)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lsb.st_uid =3D=
=3D 0 || lsb.st_uid =3D=3D sb.st_uid) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =
=3D ffd;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close=
(ffd);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 return fd;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int fsmDoMkDir(rpmPlugins plugins, int dirfd, const char *dn,=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int owned, mode_t mode)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 int rc;<br>
&gt; ++=C2=A0 =C2=A0 rpmFsmOp op =3D (FA_CREATE);<br>
&gt; ++=C2=A0 =C2=A0 if (!owned)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 op |=3D FAF_UNOWNED;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* Run fsm file pre hook for all plugins */<br>
&gt; ++=C2=A0 =C2=A0 rc =3D rpmpluginsCallFsmFilePre(plugins, NULL, dn, mod=
e, op);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (!rc)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rc =3D fsmMkdir(dirfd, dn, mode);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (!rc) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rc =3D rpmpluginsCallFsmFilePrepare(plugins, NU=
LL, dn, dn, mode, op);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* Run fsm file post hook for all plugins */<br>
&gt; ++=C2=A0 =C2=A0 rpmpluginsCallFsmFilePost(plugins, NULL, dn, mode, op,=
 rc);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (!rc) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_DEBUG,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s directory =
created with perms %04o\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dn, (unsigned)(mode=
 &amp; 07777));<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 return rc;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int ensureDir(rpmPlugins plugins, const char *p, int owned, i=
nt create)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 char *path =3D xstrdup(p);<br>
&gt; ++=C2=A0 =C2=A0 char *dp =3D path;<br>
&gt; ++=C2=A0 =C2=A0 char *sp =3D NULL, *bn;<br>
&gt; ++=C2=A0 =C2=A0 int oflags =3D O_RDONLY;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 int dirfd =3D fsmOpenat(-1, &quot;/&quot;, oflags);<br=
>
&gt; ++=C2=A0 =C2=A0 int fd =3D dirfd; /* special case of &quot;/&quot; */<=
br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 while ((bn =3D strtok_r(dp, &quot;/&quot;, &amp;sp)) !=
=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct stat sb;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fd =3D fsmOpenat(dirfd, bn, oflags);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0 &amp;&amp; errno =3D=3D ENOENT &a=
mp;&amp; create) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_t mode =3D S_IFDIR | (_dirPe=
rms &amp; 07777);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fsmDoMkDir(plugins, dirfd, bn=
, owned, mode) =3D=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D fsmOpenat(di=
rfd, bn, oflags|O_NOFOLLOW);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (fd &gt;=3D 0 &amp;&amp; fstat(fd, &amp;sb) =
=3D=3D 0 &amp;&amp; !S_ISDIR(sb.st_mode)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOTDIR;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 close(dirfd);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (fd &gt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirfd =3D fd;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirfd =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_ERR, _(&quot;failed=
 to open dir %s of %s: %s\n&quot;),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bn, p, strerror(errno));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dp =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 free(path);<br>
&gt; ++=C2=A0 =C2=A0 return dirfd;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static int fsmMkfifo(const char *path, mode_t mode)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int rc =3D mkfifo(path, (mode &amp; 07777));<br>
&gt; +@@ -507,7 +610,7 @@ static int fsmMkdirs(rpmfiles files, rpmfs fs, rp=
mPlugins plugins)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D rpmplug=
insCallFsmFilePre(plugins, NULL, dn, mode, op);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rc)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =
=3D fsmMkdir(dn, mode);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =
=3D fsmMkdir(-1, dn, mode);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rc =3D rpmpluginsCallFsmFilePrepare(plugins, NULL, dn, dn,<br>
&gt; +@@ -874,6 +977,21 @@ static void setFileState(rpmfs fs, int i)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; ++struct diriter_s {<br>
&gt; ++=C2=A0 =C2=A0 int dirfd;<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++static int onChdir(rpmfi fi, void *data)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 struct diriter_s *di =3D data;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (di-&gt;dirfd &gt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 close(di-&gt;dirfd);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 di-&gt;dirfd =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpmpsm psm, ch=
ar ** failedFile)<br>
&gt; + {<br>
&gt; +@@ -890,6 +1008,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, r=
pmfiles files,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tid =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct filedata_s *fdata =3D xcalloc(fc, sizeof(*=
fdata));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct filedata_s *firstlink =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 struct diriter_s di =3D { -1 };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* transaction id used for temporary path suffix =
while installing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rasprintf(&amp;tid, &quot;;%08x&quot;, (unsigned)=
rpmtsGetTid(ts));<br>
&gt; +@@ -929,6 +1048,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, r=
pmfiles files,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D RPMERR_BAD_MAGIC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 rpmfiSetOnChdir(fi, onChdir, &amp;di);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Detect and create directories not explicitly i=
n package. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!rc)<br>
&gt; +@@ -943,6 +1063,16 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, =
rpmfiles files,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fp-&gt;suffix) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D fsmBack=
up(fi, fp-&gt;action);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (di.dirfd =3D=3D -1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 di.dirfd =3D ensure=
Dir(plugins, rpmfiDN(fi), 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (fp-&gt;action =3D=3D =
FA_CREATE));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (di.dirfd =3D=3D=
 -1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =
=3D RPMERR_OPEN_FAILED;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Assume file does&#39;t ex=
ist when tmp suffix is in use */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fp-&gt;suffix) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fp-&gt;act=
ion =3D=3D FA_TOUCH) {<br>
&gt; +@@ -977,7 +1107,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, r=
pmfiles files,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mode_t mode =3D fp-&gt;sb.st_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mode &amp;=3D ~07777;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mode |=3D=C2=A0 00700;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rc =3D fsmMkdir(fp-&gt;fpath, mode);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rc =3D fsmMkdir(di.dirfd, fp-&gt;fpath, mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (S_ISLNK(fp=
-&gt;sb.st_mode)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc =3D=3D =
RPMERR_ENOENT) {<br>
&gt; +@@ -1019,6 +1149,8 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, =
rpmfiles files,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fp-&gt;stage =3D FILE_UNPACK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi =3D rpmfiFree(fi);<br>
&gt; ++=C2=A0 =C2=A0 close(di.dirfd);<br>
&gt; ++=C2=A0 =C2=A0 di.dirfd =3D -1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!rc &amp;&amp; fx &lt; 0 &amp;&amp; fx !=3D R=
PMERR_ITER_END)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D fx;<br>
&gt; +diff --git a/lib/rpmfi.c b/lib/rpmfi.c<br>
&gt; +index 33b657aa2..740e257fe 100644<br>
&gt; +--- a/lib/rpmfi.c<br>
&gt; ++++ b/lib/rpmfi.c<br>
&gt; +@@ -55,6 +55,9 @@ struct rpmfi_s {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int intervalStart;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /*!&lt; Start of iterating interval. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int intervalEnd;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /*!&lt; End of iterating interval. */<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 rpmfiChdirCb onChdir;=C2=A0 =C2=A0 =C2=A0/*!&lt; Callb=
ack for directory changes */<br>
&gt; ++=C2=A0 =C2=A0 void *onChdirData;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /*!&lt; Caller private callback data */<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rpmfiles files;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/*!&lt; File info set */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rpmcpio_t archive;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /*!&lt; Archive with payload */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char * found;=C2=A0 =C2=A0 /*!&lt; Bit f=
ield of files found in the archive */<br>
&gt; +@@ -309,6 +312,17 @@ int rpmfiDI(rpmfi fi)<br>
&gt; + }<br>
&gt; + #endif<br>
&gt; +<br>
&gt; ++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 int rc =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 if (fi !=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fi-&gt;onChdir =3D cb;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fi-&gt;onChdirData =3D data;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rc =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 return rc;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + int rpmfiFX(rpmfi fi)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (fi !=3D NULL ? fi-&gt;i : -1);<br>
&gt; +@@ -319,9 +333,17 @@ int rpmfiSetFX(rpmfi fi, int fx)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i =3D -1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fi !=3D NULL &amp;&amp; fx &gt;=3D 0 &amp;&am=
p; fx &lt; rpmfilesFC(fi-&gt;files)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 i =3D fi-&gt;i;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int dx =3D fi-&gt;j;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 i =3D fi-&gt;i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi-&gt;i =3D fx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi-&gt;j =3D rpmfilesDI(fi-&gt;files, fi-&=
gt;i);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 i =3D fi-&gt;i;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (fi-&gt;j !=3D dx &amp;&amp; fi-&gt;onChdir)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int chrc =3D fi-&gt;onChdir(fi, f=
i-&gt;onChdirData);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chrc &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D chrc;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return i;<br>
&gt; + }<br>
&gt; +@@ -1816,10 +1838,9 @@ static rpmfi initIter(rpmfiles files, int ityp=
e, int link)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (files &amp;&amp; itype&gt;=3D0 &amp;&amp; ity=
pe&lt;=3DRPMFILEITERMAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi =3D xcalloc(1, sizeof(*fi));<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 fi-&gt;i =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fi-&gt;j =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi-&gt;files =3D link ? rpmfilesLink(files=
) : files;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi-&gt;next =3D nextfuncs[itype];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 fi-&gt;i =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (itype =3D=3D RPMFI_ITER_BACK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi-&gt;i =3D rpmfilesFC(fi-&=
gt;files);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (itype &gt;=3DRPMFI_ITER_READ_AR=
CHIVE<br>
&gt; +diff --git a/lib/rpmfi_internal.h b/lib/rpmfi_internal.h<br>
&gt; +index dccc6ccbe..37f1d45f5 100644<br>
&gt; +--- a/lib/rpmfi_internal.h<br>
&gt; ++++ b/lib/rpmfi_internal.h<br>
&gt; +@@ -13,6 +13,23 @@<br>
&gt; + extern &quot;C&quot; {<br>
&gt; + #endif<br>
&gt; +<br>
&gt; ++/** \ingroup rpmfi<br>
&gt; ++ * Callback on file iterator directory changes<br>
&gt; ++ * @param fi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file info<br>
&gt; ++ * @param data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 caller private callback data<br>
&gt; ++ * @return=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 on success, &l=
t; 0 on error (to stop iteration)<br>
&gt; ++ */<br>
&gt; ++typedef int (*rpmfiChdirCb)(rpmfi fi, void *data);<br>
&gt; ++<br>
&gt; ++/** \ingroup rpmfi<br>
&gt; ++ * Set a callback for directory changes during iteration.<br>
&gt; ++ * @param fi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file info<br>
&gt; ++ * @param cb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback function<br>
&gt; ++ * @param data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 caller private callback data<br>
&gt; ++ * @return=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string pool hand=
le (weak reference)<br>
&gt; ++ */<br>
&gt; ++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data);<br>
&gt; ++<br>
&gt; + /** \ingroup rpmfi<br>
&gt; +=C2=A0 * Return file info set string pool handle<br>
&gt; +=C2=A0 * @param fi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file info<br>
&gt; +--<br>
&gt; +2.39.3<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb=
" rel=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a> b/meta/recipes-dev=
tools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">rpm_4.17.1.bb</a><br>
&gt; index 9b6446f265..aad8f2468f 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a><br>
&gt; @@ -40,6 +40,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/rpm-software-management/rpm;branch=3Drpm-4.17.x;protoc" rel=3D"noreferrer"=
 target=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4.17=
.x;protoc</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-docs-do-not=
-build-manpages-requires-pandoc.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-pack.=
c-do-not-insert-payloadflags-into-.rpm-me.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.a=
c-add-linux-gnux32-variant-to-triplet-han.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-35939.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt; --<br>
&gt; 2.39.3<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#198630): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/198630" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/198630</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10569277=
2/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/105692772/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000001aa85e0616f83dda--

