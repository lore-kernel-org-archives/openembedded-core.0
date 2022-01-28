Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA31EC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 16:45:16 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.797.1643388315118603974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 08:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=INK4dZx7;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id s13so17949903ejy.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 08:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNqul+tYt0Ry73GGaI1pZXlGHhjriv3+3tac1ti+RSg=;
        b=INK4dZx7EtKs1XggCVwtv5notfch6HvbSbD9MUJcLCvODe6xgZI6bVsMCmdL1gUxIP
         Tu2EhzbTATAXFlrdRRugYb4zUMRRtI/CAFA9KIAriBd8jN/9M7UPhGt6DgE2mQ2l2DDW
         1aGShUrUIJrg8SwvqUqAuZrfo5JerBcn2weWclK8z5FHWwpnEvGY5+JUgCNzql0QBNF/
         fv9TVgITfPBrBracjYL1RMhyW/oP/9J7eXQtOoRf7y9DfHFemiu999V3fuNN5gNyHpmm
         vO3qQdAOriLRChogarEA9JGJGmA8V3Z6nvJ76wzGblRb/CNfxTvJqsQjjqEg6fUeOv76
         MR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNqul+tYt0Ry73GGaI1pZXlGHhjriv3+3tac1ti+RSg=;
        b=ROa26hkc2TK5Pll9VA90cNUxXbfzX5u+57NjIjQDInlc6GlnuJ88/cr73z3JsblXBN
         aapLonL9NDf4c06nqfDmF8u+dD9mHaWDEi+szwghMQIYGd26nPedIr4VD4yo/Feu4Sa5
         7rRXUewQXEjd8hSMV342bA6sIRUuUYTiI6bIywYmXvsys1wqFBkXK9c+3CaaNTl9dVG8
         OUcNdj52Cd0P5VCddmuYBxWqEo2HS6R1SNGQAEl2SdWLb185R86vbg62t8ZU7rFV8MfX
         KDlMiVlngMhFCTWBRkx9GLeVoIrWBXL+JD5Ma+987J2UadYcFV/h9OV/AjT18/9iFvsg
         fwdw==
X-Gm-Message-State: AOAM530r5ivNDzxouD/aT/kE9e9iR/VM+BgmH+d+sPI2uVnYNXNNcRGU
	Vw9DkL3xz7aLEYed5bO11pyq4w4VVOJDMx9Zz3Y=
X-Google-Smtp-Source: 
 ABdhPJyniMvhup3XQvHbuAgjYRu63if6OLL2FVeIIhx/RAMen5hGTcWyyxBVmnz1AH72p9mt2+ZvRlDqI6MhsovOT28=
X-Received: by 2002:a17:907:3e8d:: with SMTP id
 hs13mr7744851ejc.0.1643388313212;
 Fri, 28 Jan 2022 08:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20220128134551.14630-1-ranjitsinhrathod1991@gmail.com>
 <CAOSpxdabAT=TvmL=-QUNGJA5Kq8v5qOjDoDjbZ9mdnumNp61cQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdabAT=TvmL=-QUNGJA5Kq8v5qOjDoDjbZ9mdnumNp61cQ@mail.gmail.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Fri, 28 Jan 2022 22:15:00 +0530
Message-ID: 
 <CACpMEhMNNwxDe-YNHYE73kPD_hdQ2f2oijA6QoqV7ibZ_k35gw@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] util-linux: Fix for
 CVE-2021-3995 and CVE-2021-3996
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, akash.hadke@kpit.com,
	Purushottam.Choudhary@kpit.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000a31ec405d6a72813"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 16:45:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161081

--000000000000a31ec405d6a72813
Content-Type: text/plain; charset="UTF-8"

Hi Steve,

I have also faced this problem during the patch test. Actually, this is due
to the code itself has next line character between 'foo' and 'bar'.

This is maybe because of the below change
https://github.com/util-linux/util-linux/commit/5b13d6a1c905e1e425e6b7ca340a410c580f0f75

Then I have manually added '^M' character as line break between 'foo' and
'bar' and it worked.

Do you know anything else to avoid these errors?

Thanks,
Ranjitsinh

On Fri, 28 Jan, 2022, 8:44 pm Steve Sakoman, <steve@sakoman.com> wrote:

> On Fri, Jan 28, 2022 at 3:46 AM Ranjitsinh Rathod
> <ranjitsinhrathod1991@gmail.com> wrote:
> >
> > From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> >
> > Add patches to fix CVE-2021-3995 and CVE-2021-3996
> > Also, add support include-strutils-cleanup-strto-functions.patch to
> > solve compilation error where `ul_strtou64` function not found which is
> > used in CVE-2021-3995.patch
> >
> > Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> > ---
> >  .../util-linux/util-linux/CVE-2021-3995.patch | 139 +++++++++
> >  .../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++++
> >  ...ude-strutils-cleanup-strto-functions.patch | 270 ++++++++++++++++++
> >  .../util-linux/util-linux_2.35.1.bb           |   3 +
> >  4 files changed, 638 insertions(+)
> >  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
> >  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
> >  create mode 100644
> meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
> b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
> > new file mode 100644
> > index 0000000000..1dcb66ad1d
> > --- /dev/null
> > +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
> > @@ -0,0 +1,139 @@
> > +From f3db9bd609494099f0c1b95231c5dfe383346929 Mon Sep 17 00:00:00 2001
> > +From: Karel Zak <kzak@redhat.com>
> > +Date: Wed, 24 Nov 2021 13:53:25 +0100
> > +Subject: [PATCH] libmount: fix UID check for FUSE umount [CVE-2021-3995]
> > +
> > +Improper UID check allows an unprivileged user to unmount FUSE
> > +filesystems of users with similar UID.
> > +
> > +Signed-off-by: Karel Zak <kzak@redhat.com>
> > +
> > +CVE: CVE-2021-3995
> > +Upstream-Status: Backport [
> https://github.com/util-linux/util-linux/commit/f3db9bd609494099f0c1b95231c5dfe383346929
> ]
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +---
> > + include/strutils.h            |  2 +-
> > + libmount/src/context_umount.c | 14 +++---------
> > + libmount/src/mountP.h         |  1 +
> > + libmount/src/optstr.c         | 42 +++++++++++++++++++++++++++++++++++
> > + 4 files changed, 47 insertions(+), 12 deletions(-)
> > +
> > +diff --git a/include/strutils.h b/include/strutils.h
> > +index 6e95707ea9..a84d29594d 100644
> > +--- a/include/strutils.h
> > ++++ b/include/strutils.h
> > +@@ -91,8 +91,8 @@ static inline char *mem2strcpy(char *dest, const void
> *src, size_t n, size_t nma
> > +       if (n + 1 > nmax)
> > +               n = nmax - 1;
> > +
> > ++      memset(dest, '\0', nmax);
> > +       memcpy(dest, src, n);
> > +-      dest[nmax-1] = '\0';
> > +       return dest;
> > + }
> > +
> > +diff --git a/libmount/src/context_umount.c
> b/libmount/src/context_umount.c
> > +index 173637a15a..8773c65ffa 100644
> > +--- a/libmount/src/context_umount.c
> > ++++ b/libmount/src/context_umount.c
> > +@@ -393,10 +393,7 @@ static int is_fuse_usermount(struct libmnt_context
> *cxt, int *errsv)
> > +       struct libmnt_ns *ns_old;
> > +       const char *type = mnt_fs_get_fstype(cxt->fs);
> > +       const char *optstr;
> > +-      char *user_id = NULL;
> > +-      size_t sz;
> > +-      uid_t uid;
> > +-      char uidstr[sizeof(stringify_value(ULONG_MAX))];
> > ++      uid_t uid, entry_uid;
> > +
> > +       *errsv = 0;
> > +
> > +@@ -413,11 +410,7 @@ static int is_fuse_usermount(struct libmnt_context
> *cxt, int *errsv)
> > +       optstr = mnt_fs_get_fs_options(cxt->fs);
> > +       if (!optstr)
> > +               return 0;
> > +-
> > +-      if (mnt_optstr_get_option(optstr, "user_id", &user_id, &sz) != 0)
> > +-              return 0;
> > +-
> > +-      if (sz == 0 || user_id == NULL)
> > ++      if (mnt_optstr_get_uid(optstr, "user_id", &entry_uid) != 0)
> > +               return 0;
> > +
> > +       /* get current user */
> > +@@ -434,8 +427,7 @@ static int is_fuse_usermount(struct libmnt_context
> *cxt, int *errsv)
> > +               return 0;
> > +       }
> > +
> > +-      snprintf(uidstr, sizeof(uidstr), "%lu", (unsigned long) uid);
> > +-      return strncmp(user_id, uidstr, sz) == 0;
> > ++      return uid == entry_uid;
> > + }
> > +
> > + /*
> > +diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h
> > +index d43a835418..22442ec55e 100644
> > +--- a/libmount/src/mountP.h
> > ++++ b/libmount/src/mountP.h
> > +@@ -400,6 +400,7 @@ extern const struct libmnt_optmap
> *mnt_optmap_get_entry(
> > +                            const struct libmnt_optmap **mapent);
> > +
> > + /* optstr.c */
> > ++extern int mnt_optstr_get_uid(const char *optstr, const char *name,
> uid_t *uid);
> > + extern int mnt_optstr_remove_option_at(char **optstr, char *begin,
> char *end);
> > + extern int mnt_optstr_fix_gid(char **optstr, char *value, size_t
> valsz, char **next);
> > + extern int mnt_optstr_fix_uid(char **optstr, char *value, size_t
> valsz, char **next);
> > +diff --git a/libmount/src/optstr.c b/libmount/src/optstr.c
> > +index 921b9318e7..16800f571c 100644
> > +--- a/libmount/src/optstr.c
> > ++++ b/libmount/src/optstr.c
> > +@@ -1090,6 +1090,48 @@ int mnt_optstr_fix_user(char **optstr)
> > +       return rc;
> > + }
> > +
> > ++/*
> > ++ * Converts value from @optstr addressed by @name to uid.
> > ++ *
> > ++ * Returns: 0 on success, 1 if not found, <0 on error
> > ++ */
> > ++int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t
> *uid)
> > ++{
> > ++      char *value = NULL;
> > ++      size_t valsz = 0;
> > ++      char buf[sizeof(stringify_value(UINT64_MAX))];
> > ++      int rc;
> > ++      uint64_t num;
> > ++
> > ++      assert(optstr);
> > ++      assert(name);
> > ++      assert(uid);
> > ++
> > ++      rc = mnt_optstr_get_option(optstr, name, &value, &valsz);
> > ++      if (rc != 0)
> > ++              goto fail;
> > ++
> > ++      if (valsz > sizeof(buf) - 1) {
> > ++              rc = -ERANGE;
> > ++              goto fail;
> > ++      }
> > ++      mem2strcpy(buf, value, valsz, sizeof(buf));
> > ++
> > ++      rc = ul_strtou64(buf, &num, 10);
> > ++      if (rc != 0)
> > ++              goto fail;
> > ++      if (num > ULONG_MAX || (uid_t) num != num) {
> > ++              rc = -ERANGE;
> > ++              goto fail;
> > ++      }
> > ++      *uid = (uid_t) num;
> > ++
> > ++      return 0;
> > ++fail:
> > ++      DBG(UTILS, ul_debug("failed to convert '%s'= to number [rc=%d]",
> name, rc));
> > ++      return rc;
> > ++}
> > ++
> > + /**
> > +  * mnt_match_options:
> > +  * @optstr: options string
> > diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
> b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
> > new file mode 100644
> > index 0000000000..1610b5a0fe
> > --- /dev/null
> > +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
> > @@ -0,0 +1,226 @@
> > +From 018a10907fa9885093f6d87401556932c2d8bd2b Mon Sep 17 00:00:00 2001
> > +From: Karel Zak <kzak@redhat.com>
> > +Date: Tue, 4 Jan 2022 10:54:20 +0100
> > +Subject: [PATCH] libmount: fix (deleted) suffix issue [CVE-2021-3996]
> > +
> > +This issue is related to parsing the /proc/self/mountinfo file allows an
> > +unprivileged user to unmount other user's filesystems that are either
> > +world-writable themselves or mounted in a world-writable directory.
> > +
> > +The support for "(deleted)" is no more necessary as the Linux kernel
> does
> > +not use it in /proc/self/mountinfo and /proc/self/mount files anymore.
> > +
> > +Signed-off-by: Karel Zak <kzak@redhat.com>
> > +
> > +CVE: CVE-2021-3996
> > +Upstream-Status: Backport [
> https://github.com/util-linux/util-linux/commit/018a10907fa9885093f6d87401556932c2d8bd2b
> ]
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +---
> > + libmount/src/tab_parse.c                            |  5 -----
> > + tests/expected/findmnt/filter-options               |  1 -
> > + tests/expected/findmnt/filter-options-nameval-neg   |  3 +--
> > + tests/expected/findmnt/filter-types-neg             |  1 -
> > + tests/expected/findmnt/outputs-default              |  3 +--
> > + tests/expected/findmnt/outputs-force-tree           |  3 +--
> > + tests/expected/findmnt/outputs-kernel               |  3 +--
> > + tests/expected/libmount/tabdiff-mount               |  1 -
> > + tests/expected/libmount/tabdiff-move                |  1 -
> > + tests/expected/libmount/tabdiff-remount             |  1 -
> > + tests/expected/libmount/tabdiff-umount              |  1 -
> > + tests/expected/libmount/tabfiles-parse-mountinfo    | 11 -----------
> > + tests/expected/libmount/tabfiles-py-parse-mountinfo | 11 -----------
> > + tests/ts/findmnt/files/mountinfo                    |  1 -
> > + tests/ts/findmnt/files/mountinfo-nonroot            |  1 -
> > + tests/ts/libmount/files/mountinfo                   |  1 -
> > + 16 files changed, 4 insertions(+), 44 deletions(-)
> > +
> > +diff --git a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c
> > +index 917779ab6d..4407f9c9c7 100644
> > +--- a/libmount/src/tab_parse.c
> > ++++ b/libmount/src/tab_parse.c
> > +@@ -225,11 +225,6 @@ static int mnt_parse_mountinfo_line(struct
> libmnt_fs *fs, const char *s)
> > +               goto fail;
> > +       }
> > +
> > +-      /* remove "\040(deleted)" suffix */
> > +-      p = (char *) endswith(fs->target, PATH_DELETED_SUFFIX);
> > +-      if (p && *p)
> > +-              *p = '\0';
> > +-
> > +       s = skip_separator(s);
> > +
> > +       /* (6) vfs options (fs-independent) */
> > +diff --git a/tests/expected/findmnt/filter-options
> b/tests/expected/findmnt/filter-options
> > +index 2606bce76b..97b0ead0ad 100644
> > +--- a/tests/expected/findmnt/filter-options
> > ++++ b/tests/expected/findmnt/filter-options
> > +@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE
>               OPTIONS
> > + /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon
> rw,nosuid,nodev,relatime,user_id=500,group_id=500
> > + /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs
> rw,relatime
> > + /mnt/sounds                  //foo.home/bar/  cifs
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-/mnt/foo                     /fooooo          bar
>  rw,relatime
> > + rc=0
> > +diff --git a/tests/expected/findmnt/filter-options-nameval-neg
> b/tests/expected/findmnt/filter-options-nameval-neg
> > +index 5471d65af1..f0467ef755 100644
> > +--- a/tests/expected/findmnt/filter-options-nameval-neg
> > ++++ b/tests/expected/findmnt/filter-options-nameval-neg
> > +@@ -29,6 +29,5 @@ TARGET                         SOURCE
> FSTYPE                OPTIO
> > + |-/home/kzak                   /dev/mapper/kzak-home ext4
>     rw,noatime,barrier=1,data=ordered
> > + | `-/home/kzak/.gvfs           gvfs-fuse-daemon
> fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
> > + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs
>     rw,relatime
> > +-|-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-`-/mnt/foo                     /fooooo               bar
>      rw,relatime
> > ++`-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > + rc=0
> > +diff --git a/tests/expected/findmnt/filter-types-neg
> b/tests/expected/findmnt/filter-types-neg
> > +index 2606bce76b..97b0ead0ad 100644
> > +--- a/tests/expected/findmnt/filter-types-neg
> > ++++ b/tests/expected/findmnt/filter-types-neg
> > +@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE
>               OPTIONS
> > + /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon
> rw,nosuid,nodev,relatime,user_id=500,group_id=500
> > + /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs
> rw,relatime
> > + /mnt/sounds                  //foo.home/bar/  cifs
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-/mnt/foo                     /fooooo          bar
>  rw,relatime
> > + rc=0
> > +diff --git a/tests/expected/findmnt/outputs-default
> b/tests/expected/findmnt/outputs-default
> > +index 59495797bd..01599355ec 100644
> > +--- a/tests/expected/findmnt/outputs-default
> > ++++ b/tests/expected/findmnt/outputs-default
> > +@@ -30,6 +30,5 @@ TARGET                         SOURCE
> FSTYPE                OPTIO
> > + |-/home/kzak                   /dev/mapper/kzak-home ext4
>     rw,noatime,barrier=1,data=ordered
> > + | `-/home/kzak/.gvfs           gvfs-fuse-daemon
> fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
> > + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs
>     rw,relatime
> > +-|-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-`-/mnt/foo                     /fooooo               bar
>      rw,relatime
> > ++`-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > + rc=0
> > +diff --git a/tests/expected/findmnt/outputs-force-tree
> b/tests/expected/findmnt/outputs-force-tree
> > +index 59495797bd..01599355ec 100644
> > +--- a/tests/expected/findmnt/outputs-force-tree
> > ++++ b/tests/expected/findmnt/outputs-force-tree
> > +@@ -30,6 +30,5 @@ TARGET                         SOURCE
> FSTYPE                OPTIO
> > + |-/home/kzak                   /dev/mapper/kzak-home ext4
>     rw,noatime,barrier=1,data=ordered
> > + | `-/home/kzak/.gvfs           gvfs-fuse-daemon
> fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
> > + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs
>     rw,relatime
> > +-|-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-`-/mnt/foo                     /fooooo               bar
>      rw,relatime
> > ++`-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > + rc=0
> > +diff --git a/tests/expected/findmnt/outputs-kernel
> b/tests/expected/findmnt/outputs-kernel
> > +index 59495797bd..01599355ec 100644
> > +--- a/tests/expected/findmnt/outputs-kernel
> > ++++ b/tests/expected/findmnt/outputs-kernel
> > +@@ -30,6 +30,5 @@ TARGET                         SOURCE
> FSTYPE                OPTIO
> > + |-/home/kzak                   /dev/mapper/kzak-home ext4
>     rw,noatime,barrier=1,data=ordered
> > + | `-/home/kzak/.gvfs           gvfs-fuse-daemon
> fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
> > + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs
>     rw,relatime
> > +-|-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-`-/mnt/foo                     /fooooo               bar
>      rw,relatime
> > ++`-/mnt/sounds                  //foo.home/bar/       cifs
>
> rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > + rc=0
> > +diff --git a/tests/expected/libmount/tabdiff-mount
> b/tests/expected/libmount/tabdiff-mount
> > +index 420aeacd5e..3c18f8dc4f 100644
> > +--- a/tests/expected/libmount/tabdiff-mount
> > ++++ b/tests/expected/libmount/tabdiff-mount
> > +@@ -1,3 +1,2 @@
> > + /dev/mapper/kzak-home on /home/kzak: MOUNTED
> > +-/fooooo on /mnt/foo: MOUNTED
> > + tmpfs on /mnt/test/foo
> > bar: MOUNTED
>
> This patch fails to apply due to the above line wrap error (and
> several more like it below)
>
> Perhaps your mailer?
>
> Steve
>
> > +diff --git a/tests/expected/libmount/tabdiff-move
> b/tests/expected/libmount/tabdiff-move
> > +index 24f9bc791b..95820d93ef 100644
> > +--- a/tests/expected/libmount/tabdiff-move
> > ++++ b/tests/expected/libmount/tabdiff-move
> > +@@ -1,3 +1,2 @@
> > + //foo.home/bar/ on /mnt/music: MOVED to /mnt/music
> > +-/fooooo on /mnt/foo: UMOUNTED
> > + tmpfs on /mnt/test/foo
> > bar: UMOUNTED
> > +diff --git a/tests/expected/libmount/tabdiff-remount
> b/tests/expected/libmount/tabdiff-remount
> > +index 82ebeab390..876bfd9539 100644
> > +--- a/tests/expected/libmount/tabdiff-remount
> > ++++ b/tests/expected/libmount/tabdiff-remount
> > +@@ -1,4 +1,3 @@
> > + /dev/mapper/kzak-home on /home/kzak: REMOUNTED from
> 'rw,noatime,barrier=1,data=ordered' to 'ro,noatime,barrier=1,data=ordered'
> > + //foo.home/bar/ on /mnt/sounds: REMOUNTED from
> 'rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344'
> to
> 'ro,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344'
> > +-/fooooo on /mnt/foo: UMOUNTED
> > + tmpfs on /mnt/test/foo
> > bar: UMOUNTED
> > +diff --git a/tests/expected/libmount/tabdiff-umount
> b/tests/expected/libmount/tabdiff-umount
> > +index a3e0fe48a1..c7be725b92 100644
> > +--- a/tests/expected/libmount/tabdiff-umount
> > ++++ b/tests/expected/libmount/tabdiff-umount
> > +@@ -1,3 +1,2 @@
> > + /dev/mapper/kzak-home on /home/kzak: UMOUNTED
> > +-/fooooo on /mnt/foo: UMOUNTED
> > + tmpfs on /mnt/test/foo
> > bar: UMOUNTED
> > +diff --git a/tests/expected/libmount/tabfiles-parse-mountinfo
> b/tests/expected/libmount/tabfiles-parse-mountinfo
> > +index 47eb770061..d5ba5248e4 100644
> > +--- a/tests/expected/libmount/tabfiles-parse-mountinfo
> > ++++ b/tests/expected/libmount/tabfiles-parse-mountinfo
> > +@@ -351,17 +351,6 @@ id:     47
> > + parent: 20
> > + devno:  0:38
> > + ------ fs:
> > +-source: /fooooo
> > +-target: /mnt/foo
> > +-fstype: bar
> > +-optstr: rw,relatime
> > +-VFS-optstr: rw,relatime
> > +-FS-opstr: rw
> > +-root:   /
> > +-id:     48
> > +-parent: 20
> > +-devno:  0:39
> > +------- fs:
> > + source: tmpfs
> > + target: /mnt/test/foo
> > bar
> > + fstype: tmpfs
> > +diff --git a/tests/expected/libmount/tabfiles-py-parse-mountinfo
> b/tests/expected/libmount/tabfiles-py-parse-mountinfo
> > +index 47eb770061..d5ba5248e4 100644
> > +--- a/tests/expected/libmount/tabfiles-py-parse-mountinfo
> > ++++ b/tests/expected/libmount/tabfiles-py-parse-mountinfo
> > +@@ -351,17 +351,6 @@ id:     47
> > + parent: 20
> > + devno:  0:38
> > + ------ fs:
> > +-source: /fooooo
> > +-target: /mnt/foo
> > +-fstype: bar
> > +-optstr: rw,relatime
> > +-VFS-optstr: rw,relatime
> > +-FS-opstr: rw
> > +-root:   /
> > +-id:     48
> > +-parent: 20
> > +-devno:  0:39
> > +------- fs:
> > + source: tmpfs
> > + target: /mnt/test/foo
> > bar
> > + fstype: tmpfs
> > +diff --git a/tests/ts/findmnt/files/mountinfo
> b/tests/ts/findmnt/files/mountinfo
> > +index 475ea1a337..ff1e664a84 100644
> > +--- a/tests/ts/findmnt/files/mountinfo
> > ++++ b/tests/ts/findmnt/files/mountinfo
> > +@@ -30,4 +30,3 @@
> > + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime -
> fuse.gvfs-fuse-daemon gvfs-fuse-daemon rw,user_id=500,group_id=500
> > + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
> > + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/
> rw,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
> > +diff --git a/tests/ts/findmnt/files/mountinfo-nonroot
> b/tests/ts/findmnt/files/mountinfo-nonroot
> > +index e15b467016..87b421d2ef 100644
> > +--- a/tests/ts/findmnt/files/mountinfo-nonroot
> > ++++ b/tests/ts/findmnt/files/mountinfo-nonroot
> > +@@ -29,4 +29,3 @@
> > + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime -
> fuse.gvfs-fuse-daemon gvfs-fuse-daemon rw,user_id=500,group_id=500
> > + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
> > + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/
> rw,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
> > +diff --git a/tests/ts/libmount/files/mountinfo
> b/tests/ts/libmount/files/mountinfo
> > +index c063071833..2b01740481 100644
> > +--- a/tests/ts/libmount/files/mountinfo
> > ++++ b/tests/ts/libmount/files/mountinfo
> > +@@ -30,5 +30,4 @@
> > + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime -
> fuse.gvfs-fuse-daemon gvfs-fuse-daemon rw,user_id=500,group_id=500
> > + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
> > + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/
> rw,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
> > +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
> > + 49 20 0:56 / /mnt/test/foo
> > bar rw,relatime shared:323 - tmpfs tmpfs rw
> > diff --git
> a/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
> b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
> > new file mode 100644
> > index 0000000000..5d5a370821
> > --- /dev/null
> > +++
> b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
> > @@ -0,0 +1,270 @@
> > +From 84825b161ba5d18da4142893b9789b3fc71284d9 Mon Sep 17 00:00:00 2001
> > +From: Karel Zak <kzak@redhat.com>
> > +Date: Tue, 22 Jun 2021 14:20:42 +0200
> > +Subject: [PATCH] include/strutils: cleanup strto..() functions
> > +
> > +* add ul_strtos64() and ul_strtou64()
> > +* add simple test
> > +
> > +Addresses: https://github.com/karelzak/util-linux/issues/1358
> > +Signed-off-by: Karel Zak <kzak@redhat.com>
> > +
> > +Upstream-Backport: [
> https://github.com/util-linux/util-linux/commit/84825b161ba5d18da4142893b9789b3fc71284d9
> ]
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +---
> > + include/strutils.h |   3 +
> > + lib/strutils.c     | 174 ++++++++++++++++++++++++++-------------------
> > + 2 files changed, 105 insertions(+), 72 deletions(-)
> > +
> > +diff --git a/include/strutils.h b/include/strutils.h
> > +index e75a2f0e17..389e849905 100644
> > +--- a/include/strutils.h
> > ++++ b/include/strutils.h
> > +@@ -19,6 +19,9 @@ extern int parse_size(const char *str, uintmax_t
> *res, int *power);
> > + extern int strtosize(const char *str, uintmax_t *res);
> > + extern uintmax_t strtosize_or_err(const char *str, const char
> *errmesg);
> > +
> > ++extern int ul_strtos64(const char *str, int64_t *num, int base);
> > ++extern int ul_strtou64(const char *str, uint64_t *num, int base);
> > ++
> > + extern int16_t strtos16_or_err(const char *str, const char *errmesg);
> > + extern uint16_t strtou16_or_err(const char *str, const char *errmesg);
> > + extern uint16_t strtox16_or_err(const char *str, const char *errmesg);
> > +diff --git a/lib/strutils.c b/lib/strutils.c
> > +index ee2c835495..d9976dca70 100644
> > +--- a/lib/strutils.c
> > ++++ b/lib/strutils.c
> > +@@ -319,39 +319,80 @@ char *strndup(const char *s, size_t n)
> > + }
> > + #endif
> > +
> > +-static uint32_t _strtou32_or_err(const char *str, const char *errmesg,
> int base);
> > +-static uint64_t _strtou64_or_err(const char *str, const char *errmesg,
> int base);
> > ++/*
> > ++ * convert strings to numbers; returns <0 on error, and 0 on success
> > ++ */
> > ++int ul_strtos64(const char *str, int64_t *num, int base)
> > ++{
> > ++      char *end = NULL;
> > +
> > +-int16_t strtos16_or_err(const char *str, const char *errmesg)
> > ++      errno = 0;
> > ++      if (str == NULL || *str == '\0')
> > ++              return -EINVAL;
> > ++      *num = (int64_t) strtoimax(str, &end, base);
> > ++
> > ++      if (errno || str == end || (end && *end))
> > ++              return -EINVAL;
> > ++      return 0;
> > ++}
> > ++
> > ++int ul_strtou64(const char *str, uint64_t *num, int base)
> > + {
> > +-      int32_t num = strtos32_or_err(str, errmesg);
> > ++      char *end = NULL;
> > +
> > +-      if (num < INT16_MIN || num > INT16_MAX) {
> > +-              errno = ERANGE;
> > +-              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > +-      }
> > +-      return num;
> > ++      errno = 0;
> > ++      if (str == NULL || *str == '\0')
> > ++              return -EINVAL;
> > ++      *num = (uint64_t) strtoumax(str, &end, base);
> > ++
> > ++      if (errno || str == end || (end && *end))
> > ++              return -EINVAL;
> > ++      return 0;
> > + }
> > +
> > +-static uint16_t _strtou16_or_err(const char *str, const char *errmesg,
> int base)
> > ++/*
> > ++ * Covert strings to numbers and print message on error.
> > ++ *
> > ++ * Note that hex functions (strtox..()) returns unsigned numbers, if
> you need
> > ++ * something else then use ul_strtos64(s, &n, 16).
> > ++ */
> > ++int64_t strtos64_or_err(const char *str, const char *errmesg)
> > + {
> > +-      uint32_t num = _strtou32_or_err(str, errmesg, base);
> > ++      int64_t num = 0;
> > +
> > +-      if (num > UINT16_MAX) {
> > +-              errno = ERANGE;
> > +-              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++      if (ul_strtos64(str, &num, 10) != 0) {
> > ++              if (errno == ERANGE)
> > ++                      err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++
> > ++              errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > +       }
> > +       return num;
> > + }
> > +
> > +-uint16_t strtou16_or_err(const char *str, const char *errmesg)
> > ++uint64_t strtou64_or_err(const char *str, const char *errmesg)
> > + {
> > +-      return _strtou16_or_err(str, errmesg, 10);
> > ++      uint64_t num = 0;
> > ++
> > ++      if (ul_strtou64(str, &num, 10)) {
> > ++              if (errno == ERANGE)
> > ++                      err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++
> > ++              errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++      }
> > ++      return num;
> > + }
> > +
> > +-uint16_t strtox16_or_err(const char *str, const char *errmesg)
> > ++uint64_t strtox64_or_err(const char *str, const char *errmesg)
> > + {
> > +-      return _strtou16_or_err(str, errmesg, 16);
> > ++      uint64_t num = 0;
> > ++
> > ++      if (ul_strtou64(str, &num, 16)) {
> > ++              if (errno == ERANGE)
> > ++                      err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++
> > ++              errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++      }
> > ++      return num;
> > + }
> > +
> > + int32_t strtos32_or_err(const char *str, const char *errmesg)
> > +@@ -365,9 +406,9 @@ int32_t strtos32_or_err(const char *str, const char
> *errmesg)
> > +       return num;
> > + }
> > +
> > +-static uint32_t _strtou32_or_err(const char *str, const char *errmesg,
> int base)
> > ++uint32_t strtou32_or_err(const char *str, const char *errmesg)
> > + {
> > +-      uint64_t num = _strtou64_or_err(str, errmesg, base);
> > ++      uint64_t num = strtou64_or_err(str, errmesg);
> > +
> > +       if (num > UINT32_MAX) {
> > +               errno = ERANGE;
> > +@@ -376,66 +417,48 @@ static uint32_t _strtou32_or_err(const char *str,
> const char *errmesg, int base)
> > +       return num;
> > + }
> > +
> > +-uint32_t strtou32_or_err(const char *str, const char *errmesg)
> > +-{
> > +-      return _strtou32_or_err(str, errmesg, 10);
> > +-}
> > +-
> > + uint32_t strtox32_or_err(const char *str, const char *errmesg)
> > + {
> > +-      return _strtou32_or_err(str, errmesg, 16);
> > ++      uint64_t num = strtox64_or_err(str, errmesg);
> > ++
> > ++      if (num > UINT32_MAX) {
> > ++              errno = ERANGE;
> > ++              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++      }
> > ++      return num;
> > + }
> > +
> > +-int64_t strtos64_or_err(const char *str, const char *errmesg)
> > ++int16_t strtos16_or_err(const char *str, const char *errmesg)
> > + {
> > +-      int64_t num;
> > +-      char *end = NULL;
> > +-
> > +-      errno = 0;
> > +-      if (str == NULL || *str == '\0')
> > +-              goto err;
> > +-      num = strtoimax(str, &end, 10);
> > +-
> > +-      if (errno || str == end || (end && *end))
> > +-              goto err;
> > ++      int64_t num = strtos64_or_err(str, errmesg);
> > +
> > +-      return num;
> > +-err:
> > +-      if (errno == ERANGE)
> > ++      if (num < INT16_MIN || num > INT16_MAX) {
> > ++              errno = ERANGE;
> > +               err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > +-
> > +-      errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++      }
> > ++      return num;
> > + }
> > +
> > +-static uint64_t _strtou64_or_err(const char *str, const char *errmesg,
> int base)
> > ++uint16_t strtou16_or_err(const char *str, const char *errmesg)
> > + {
> > +-      uintmax_t num;
> > +-      char *end = NULL;
> > +-
> > +-      errno = 0;
> > +-      if (str == NULL || *str == '\0')
> > +-              goto err;
> > +-      num = strtoumax(str, &end, base);
> > +-
> > +-      if (errno || str == end || (end && *end))
> > +-              goto err;
> > ++      uint64_t num = strtou64_or_err(str, errmesg);
> > +
> > +-      return num;
> > +-err:
> > +-      if (errno == ERANGE)
> > ++      if (num > UINT16_MAX) {
> > ++              errno = ERANGE;
> > +               err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > +-
> > +-      errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++      }
> > ++      return num;
> > + }
> > +
> > +-uint64_t strtou64_or_err(const char *str, const char *errmesg)
> > ++uint16_t strtox16_or_err(const char *str, const char *errmesg)
> > + {
> > +-      return _strtou64_or_err(str, errmesg, 10);
> > +-}
> > ++      uint64_t num = strtox64_or_err(str, errmesg);
> > +
> > +-uint64_t strtox64_or_err(const char *str, const char *errmesg)
> > +-{
> > +-      return _strtou64_or_err(str, errmesg, 16);
> > ++      if (num > UINT16_MAX) {
> > ++              errno = ERANGE;
> > ++              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> > ++      }
> > ++      return num;
> > + }
> > +
> > + double strtod_or_err(const char *str, const char *errmesg)
> > +@@ -1051,15 +1051,25 @@ static int test_strutils_cmp_paths(int a
> > +
> > + int main(int argc, char *argv[])
> > + {
> > +-      if (argc == 3 && strcmp(argv[1], "--size") == 0)
> > ++      if (argc == 3 && strcmp(argv[1], "--size") == 0) {
> > +               return test_strutils_sizes(argc - 1, argv + 1);
> > +
> > +-      else if (argc == 4 && strcmp(argv[1], "--cmp-paths") == 0)
> > ++      } else if (argc == 4 && strcmp(argv[1], "--cmp-paths") == 0) {
> > +               return test_strutils_cmp_paths(argc - 1, argv + 1);
> > +
> > ++      } else if (argc == 3 && strcmp(argv[1], "--str2num") == 0) {
> > ++              uint64_t n;
> > ++
> > ++              if (ul_strtou64(argv[2], &n, 10) == 0) {
> > ++                      printf("'%s' --> %ju\n", argv[2], (uintmax_t) n);
> > ++                      return EXIT_SUCCESS;
> > ++              }
> > ++      }
> > ++
> > +       else {
> > +               fprintf(stderr, "usage: %1$s --size <number>[suffix]\n"
> > +-                              "       %1$s --cmp-paths <path>
> <path>\n",
> > ++                              "       %1$s --cmp-paths <path> <path>\n"
> > ++                              "       %1$s --num2num <str>\n",
> > +                               argv[0]);
> > +               exit(EXIT_FAILURE);
> > +       }
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
> b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
> > index 731f0618eb..96d5eca518 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
> > @@ -12,6 +12,9 @@ SRC_URI += "file://configure-sbindir.patch \
> >
> file://0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch \
> >              file://0001-include-cleanup-pidfd-inckudes.patch \
> >              file://CVE-2021-37600.patch \
> > +            file://include-strutils-cleanup-strto-functions.patch \
> > +            file://CVE-2021-3995.patch \
> > +            file://CVE-2021-3996.patch \
> >  "
> >  SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
> >  SRC_URI[sha256sum] =
> "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161079):
> https://lists.openembedded.org/g/openembedded-core/message/161079
> > Mute This Topic: https://lists.openembedded.org/mt/88744485/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000a31ec405d6a72813
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Steve,<div dir=3D"auto"><br></div><div dir=3D"auto">I =
have also faced this problem during the patch test. Actually, this is due t=
o the code itself has next line character between &#39;foo&#39; and &#39;ba=
r&#39;.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This is maybe be=
cause of the below change</div><div dir=3D"auto"><a href=3D"https://github.=
com/util-linux/util-linux/commit/5b13d6a1c905e1e425e6b7ca340a410c580f0f75">=
https://github.com/util-linux/util-linux/commit/5b13d6a1c905e1e425e6b7ca340=
a410c580f0f75</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Then I=
 have manually added &#39;^M&#39; character as line break between &#39;foo&=
#39; and &#39;bar&#39; and it worked.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Do you know anything else to avoid these errors?</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Ranji=
tsinh</div><div dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"au=
to"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 28 Jan, 2022, 8:44 pm Ste=
ve Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Jan 28, 2022 at =
3:46 AM Ranjitsinh Rathod<br>
&lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">ranjitsinhrathod1991@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.c=
om" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a>&gt;=
<br>
&gt;<br>
&gt; Add patches to fix CVE-2021-3995 and CVE-2021-3996<br>
&gt; Also, add support include-strutils-cleanup-strto-functions.patch to<br=
>
&gt; solve compilation error where `ul_strtou64` function not found which i=
s<br>
&gt; used in CVE-2021-3995.patch<br>
&gt;<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rath=
od@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.co=
m</a>&gt;<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinhratho=
d1991@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@=
gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../util-linux/util-linux/CVE-2021-3995.patch | 139 +++++++++<br=
>
&gt;=C2=A0 .../util-linux/util-linux/CVE-2021-3996.patch | 226 ++++++++++++=
+++<br>
&gt;=C2=A0 ...ude-strutils-cleanup-strto-functions.patch | 270 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../util-linux/<a href=3D"http://util-linux_2.35.1.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">util-linux_2.35.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 4 files changed, 638 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2=
021-3995.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2=
021-3996.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/util-linux/util-linux/inclu=
de-strutils-cleanup-strto-functions.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.pat=
ch b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1dcb66ad1d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch<br>
&gt; @@ -0,0 +1,139 @@<br>
&gt; +From f3db9bd609494099f0c1b95231c5dfe383346929 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 24 Nov 2021 13:53:25 +0100<br>
&gt; +Subject: [PATCH] libmount: fix UID check for FUSE umount [CVE-2021-39=
95]<br>
&gt; +<br>
&gt; +Improper UID check allows an unprivileged user to unmount FUSE<br>
&gt; +filesystems of users with similar UID.<br>
&gt; +<br>
&gt; +Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2021-3995<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/util-linux/u=
til-linux/commit/f3db9bd609494099f0c1b95231c5dfe383346929" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://github.com/util-linux/util-linux/co=
mmit/f3db9bd609494099f0c1b95231c5dfe383346929</a>]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.c=
om</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + include/strutils.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
&gt; + libmount/src/context_umount.c | 14 +++---------<br>
&gt; + libmount/src/mountP.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
&gt; + libmount/src/optstr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 ++++++++=
+++++++++++++++++++++++++++<br>
&gt; + 4 files changed, 47 insertions(+), 12 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/include/strutils.h b/include/strutils.h<br>
&gt; +index 6e95707ea9..a84d29594d 100644<br>
&gt; +--- a/include/strutils.h<br>
&gt; ++++ b/include/strutils.h<br>
&gt; +@@ -91,8 +91,8 @@ static inline char *mem2strcpy(char *dest, const vo=
id *src, size_t n, size_t nma<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n + 1 &gt; nmax)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D nmax - 1=
;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 memset(dest, &#39;\0&#39;, nmax);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(dest, src, n);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dest[nmax-1] =3D &#39;\0&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return dest;<br>
&gt; + }<br>
&gt; +<br>
&gt; +diff --git a/libmount/src/context_umount.c b/libmount/src/context_umo=
unt.c<br>
&gt; +index 173637a15a..8773c65ffa 100644<br>
&gt; +--- a/libmount/src/context_umount.c<br>
&gt; ++++ b/libmount/src/context_umount.c<br>
&gt; +@@ -393,10 +393,7 @@ static int is_fuse_usermount(struct libmnt_conte=
xt *cxt, int *errsv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct libmnt_ns *ns_old;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *type =3D mnt_fs_get_fstype(cxt=
-&gt;fs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *optstr;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 char *user_id =3D NULL;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 size_t sz;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 uid_t uid;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 char uidstr[sizeof(stringify_value(ULONG_MAX))]=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uid_t uid, entry_uid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*errsv =3D 0;<br>
&gt; +<br>
&gt; +@@ -413,11 +410,7 @@ static int is_fuse_usermount(struct libmnt_conte=
xt *cxt, int *errsv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0optstr =3D mnt_fs_get_fs_options(cxt-&gt;f=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!optstr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (mnt_optstr_get_option(optstr, &quot;user_id=
&quot;, &amp;user_id, &amp;sz) !=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (sz =3D=3D 0 || user_id =3D=3D NULL)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (mnt_optstr_get_uid(optstr, &quot;user_id&qu=
ot;, &amp;entry_uid) !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* get current user */<br>
&gt; +@@ -434,8 +427,7 @@ static int is_fuse_usermount(struct libmnt_contex=
t *cxt, int *errsv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 snprintf(uidstr, sizeof(uidstr), &quot;%lu&quot=
;, (unsigned long) uid);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return strncmp(user_id, uidstr, sz) =3D=3D 0;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return uid =3D=3D entry_uid;<br>
&gt; + }<br>
&gt; +<br>
&gt; + /*<br>
&gt; +diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h<br>
&gt; +index d43a835418..22442ec55e 100644<br>
&gt; +--- a/libmount/src/mountP.h<br>
&gt; ++++ b/libmount/src/mountP.h<br>
&gt; +@@ -400,6 +400,7 @@ extern const struct libmnt_optmap *mnt_optmap_get=
_entry(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct libmnt_optmap **mapent);<br>
&gt; +<br>
&gt; + /* optstr.c */<br>
&gt; ++extern int mnt_optstr_get_uid(const char *optstr, const char *name, =
uid_t *uid);<br>
&gt; + extern int mnt_optstr_remove_option_at(char **optstr, char *begin, c=
har *end);<br>
&gt; + extern int mnt_optstr_fix_gid(char **optstr, char *value, size_t val=
sz, char **next);<br>
&gt; + extern int mnt_optstr_fix_uid(char **optstr, char *value, size_t val=
sz, char **next);<br>
&gt; +diff --git a/libmount/src/optstr.c b/libmount/src/optstr.c<br>
&gt; +index 921b9318e7..16800f571c 100644<br>
&gt; +--- a/libmount/src/optstr.c<br>
&gt; ++++ b/libmount/src/optstr.c<br>
&gt; +@@ -1090,6 +1090,48 @@ int mnt_optstr_fix_user(char **optstr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/*<br>
&gt; ++ * Converts value from @optstr addressed by @name to uid.<br>
&gt; ++ *<br>
&gt; ++ * Returns: 0 on success, 1 if not found, &lt;0 on error<br>
&gt; ++ */<br>
&gt; ++int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t *=
uid)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *value =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size_t valsz =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char buf[sizeof(stringify_value(UINT64_MAX))];<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int rc;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t num;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert(optstr);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert(name);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert(uid);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rc =3D mnt_optstr_get_option(optstr, name, &amp=
;value, &amp;valsz);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (rc !=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (valsz &gt; sizeof(buf) - 1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -ERANGE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mem2strcpy(buf, value, valsz, sizeof(buf));<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rc =3D ul_strtou64(buf, &amp;num, 10);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (rc !=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (num &gt; ULONG_MAX || (uid_t) num !=3D num)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -ERANGE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *uid =3D (uid_t) num;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++fail:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 DBG(UTILS, ul_debug(&quot;failed to convert &#3=
9;%s&#39;=3D to number [rc=3D%d]&quot;, name, rc));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return rc;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +=C2=A0 * mnt_match_options:<br>
&gt; +=C2=A0 * @optstr: options string<br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.pat=
ch b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1610b5a0fe<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch<br>
&gt; @@ -0,0 +1,226 @@<br>
&gt; +From 018a10907fa9885093f6d87401556932c2d8bd2b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +Date: Tue, 4 Jan 2022 10:54:20 +0100<br>
&gt; +Subject: [PATCH] libmount: fix (deleted) suffix issue [CVE-2021-3996]=
<br>
&gt; +<br>
&gt; +This issue is related to parsing the /proc/self/mountinfo file allows=
 an<br>
&gt; +unprivileged user to unmount other user&#39;s filesystems that are ei=
ther<br>
&gt; +world-writable themselves or mounted in a world-writable directory.<b=
r>
&gt; +<br>
&gt; +The support for &quot;(deleted)&quot; is no more necessary as the Lin=
ux kernel does<br>
&gt; +not use it in /proc/self/mountinfo and /proc/self/mount files anymore=
.<br>
&gt; +<br>
&gt; +Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2021-3996<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/util-linux/u=
til-linux/commit/018a10907fa9885093f6d87401556932c2d8bd2b" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://github.com/util-linux/util-linux/co=
mmit/018a10907fa9885093f6d87401556932c2d8bd2b</a>]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.c=
om</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + libmount/src/tab_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 -----<br>
&gt; + tests/expected/findmnt/filter-options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt; + tests/expected/findmnt/filter-options-nameval-neg=C2=A0 =C2=A0|=C2=
=A0 3 +--<br>
&gt; + tests/expected/findmnt/filter-types-neg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt; + tests/expected/findmnt/outputs-default=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br>
&gt; + tests/expected/findmnt/outputs-force-tree=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
&gt; + tests/expected/findmnt/outputs-kernel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
&gt; + tests/expected/libmount/tabdiff-mount=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt; + tests/expected/libmount/tabdiff-move=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; + tests/expected/libmount/tabdiff-remount=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt; + tests/expected/libmount/tabdiff-umount=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; + tests/expected/libmount/tabfiles-parse-mountinfo=C2=A0 =C2=A0 | 11 -=
----------<br>
&gt; + tests/expected/libmount/tabfiles-py-parse-mountinfo | 11 -----------=
<br>
&gt; + tests/ts/findmnt/files/mountinfo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; + tests/ts/findmnt/files/mountinfo-nonroot=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; + tests/ts/libmount/files/mountinfo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt; + 16 files changed, 4 insertions(+), 44 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c<br>
&gt; +index 917779ab6d..4407f9c9c7 100644<br>
&gt; +--- a/libmount/src/tab_parse.c<br>
&gt; ++++ b/libmount/src/tab_parse.c<br>
&gt; +@@ -225,11 +225,6 @@ static int mnt_parse_mountinfo_line(struct libmn=
t_fs *fs, const char *s)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 /* remove &quot;\040(deleted)&quot; suffix */<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 p =3D (char *) endswith(fs-&gt;target, PATH_DEL=
ETED_SUFFIX);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (p &amp;&amp; *p)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p =3D &#39;\0&#39;=
;<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D skip_separator(s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* (6) vfs options (fs-independent) */<br>
&gt; +diff --git a/tests/expected/findmnt/filter-options b/tests/expected/f=
indmnt/filter-options<br>
&gt; +index 2606bce76b..97b0ead0ad 100644<br>
&gt; +--- a/tests/expected/findmnt/filter-options<br>
&gt; ++++ b/tests/expected/findmnt/filter-options<br>
&gt; +@@ -28,5 +28,4 @@ TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0FSTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT=
IONS<br>
&gt; + /home/kzak/.gvfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gvfs=
-fuse-daemon fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=3D500,g=
roup_id=3D500<br>
&gt; + /var/lib/nfs/rpc_pipefs=C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rpc_pipefs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 rw,relatime<br>
&gt; + /mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 //foo.home/bar/=C2=A0 cifs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domai=
n=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posi=
xpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-/mnt/foo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/fooooo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bar=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rw,relatime<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/filter-options-nameval-neg b/test=
s/expected/findmnt/filter-options-nameval-neg<br>
&gt; +index 5471d65af1..f0467ef755 100644<br>
&gt; +--- a/tests/expected/findmnt/filter-options-nameval-neg<br>
&gt; ++++ b/tests/expected/findmnt/filter-options-nameval-neg<br>
&gt; +@@ -29,6 +29,5 @@ TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FSTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 OPTIO<br>
&gt; + |-/home/kzak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/dev/mapper/kzak-home ext4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gvfs-fu=
se-daemon=C2=A0 =C2=A0 =C2=A0 fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs=C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpc_pipefs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rw,relatime<br>
&gt; +-|-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/fooooo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rw,relatime<br>
&gt; ++`-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/filter-types-neg b/tests/expected=
/findmnt/filter-types-neg<br>
&gt; +index 2606bce76b..97b0ead0ad 100644<br>
&gt; +--- a/tests/expected/findmnt/filter-types-neg<br>
&gt; ++++ b/tests/expected/findmnt/filter-types-neg<br>
&gt; +@@ -28,5 +28,4 @@ TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0FSTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT=
IONS<br>
&gt; + /home/kzak/.gvfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gvfs=
-fuse-daemon fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=3D500,g=
roup_id=3D500<br>
&gt; + /var/lib/nfs/rpc_pipefs=C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rpc_pipefs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 rw,relatime<br>
&gt; + /mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 //foo.home/bar/=C2=A0 cifs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domai=
n=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posi=
xpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-/mnt/foo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/fooooo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bar=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rw,relatime<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/outputs-default b/tests/expected/=
findmnt/outputs-default<br>
&gt; +index 59495797bd..01599355ec 100644<br>
&gt; +--- a/tests/expected/findmnt/outputs-default<br>
&gt; ++++ b/tests/expected/findmnt/outputs-default<br>
&gt; +@@ -30,6 +30,5 @@ TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FSTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 OPTIO<br>
&gt; + |-/home/kzak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/dev/mapper/kzak-home ext4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gvfs-fu=
se-daemon=C2=A0 =C2=A0 =C2=A0 fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs=C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpc_pipefs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rw,relatime<br>
&gt; +-|-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/fooooo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rw,relatime<br>
&gt; ++`-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/outputs-force-tree b/tests/expect=
ed/findmnt/outputs-force-tree<br>
&gt; +index 59495797bd..01599355ec 100644<br>
&gt; +--- a/tests/expected/findmnt/outputs-force-tree<br>
&gt; ++++ b/tests/expected/findmnt/outputs-force-tree<br>
&gt; +@@ -30,6 +30,5 @@ TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FSTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 OPTIO<br>
&gt; + |-/home/kzak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/dev/mapper/kzak-home ext4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gvfs-fu=
se-daemon=C2=A0 =C2=A0 =C2=A0 fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs=C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpc_pipefs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rw,relatime<br>
&gt; +-|-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/fooooo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rw,relatime<br>
&gt; ++`-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/outputs-kernel b/tests/expected/f=
indmnt/outputs-kernel<br>
&gt; +index 59495797bd..01599355ec 100644<br>
&gt; +--- a/tests/expected/findmnt/outputs-kernel<br>
&gt; ++++ b/tests/expected/findmnt/outputs-kernel<br>
&gt; +@@ -30,6 +30,5 @@ TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FSTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 OPTIO<br>
&gt; + |-/home/kzak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/dev/mapper/kzak-home ext4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gvfs-fu=
se-daemon=C2=A0 =C2=A0 =C2=A0 fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs=C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpc_pipefs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rw,relatime<br>
&gt; +-|-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/fooooo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rw,relatime<br>
&gt; ++`-/mnt/sounds=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 //foo.home/bar/=C2=A0 =C2=A0 =C2=A0 =C2=A0cifs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-mount b/tests/expected/l=
ibmount/tabdiff-mount<br>
&gt; +index 420aeacd5e..3c18f8dc4f 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-mount<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-mount<br>
&gt; +@@ -1,3 +1,2 @@<br>
&gt; + /dev/mapper/kzak-home on /home/kzak: MOUNTED<br>
&gt; +-/fooooo on /mnt/foo: MOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: MOUNTED<br>
<br>
This patch fails to apply due to the above line wrap error (and<br>
several more like it below)<br>
<br>
Perhaps your mailer?<br>
<br>
Steve<br>
<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-move b/tests/expected/li=
bmount/tabdiff-move<br>
&gt; +index 24f9bc791b..95820d93ef 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-move<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-move<br>
&gt; +@@ -1,3 +1,2 @@<br>
&gt; + //foo.home/bar/ on /mnt/music: MOVED to /mnt/music<br>
&gt; +-/fooooo on /mnt/foo: UMOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: UMOUNTED<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-remount b/tests/expected=
/libmount/tabdiff-remount<br>
&gt; +index 82ebeab390..876bfd9539 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-remount<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-remount<br>
&gt; +@@ -1,4 +1,3 @@<br>
&gt; + /dev/mapper/kzak-home on /home/kzak: REMOUNTED from &#39;rw,noatime,=
barrier=3D1,data=3Dordered&#39; to &#39;ro,noatime,barrier=3D1,data=3Dorder=
ed&#39;<br>
&gt; + //foo.home/bar/ on /mnt/sounds: REMOUNTED from &#39;rw,relatime,unc=
=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=
=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384=
,wsize=3D57344&#39; to &#39;ro,relatime,unc=3D\\foo.home\bar,username=3Dkza=
k,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111=
.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344&#39;<br>
&gt; +-/fooooo on /mnt/foo: UMOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: UMOUNTED<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-umount b/tests/expected/=
libmount/tabdiff-umount<br>
&gt; +index a3e0fe48a1..c7be725b92 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-umount<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-umount<br>
&gt; +@@ -1,3 +1,2 @@<br>
&gt; + /dev/mapper/kzak-home on /home/kzak: UMOUNTED<br>
&gt; +-/fooooo on /mnt/foo: UMOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: UMOUNTED<br>
&gt; +diff --git a/tests/expected/libmount/tabfiles-parse-mountinfo b/tests=
/expected/libmount/tabfiles-parse-mountinfo<br>
&gt; +index 47eb770061..d5ba5248e4 100644<br>
&gt; +--- a/tests/expected/libmount/tabfiles-parse-mountinfo<br>
&gt; ++++ b/tests/expected/libmount/tabfiles-parse-mountinfo<br>
&gt; +@@ -351,17 +351,6 @@ id:=C2=A0 =C2=A0 =C2=A047<br>
&gt; + parent: 20<br>
&gt; + devno:=C2=A0 0:38<br>
&gt; + ------ fs:<br>
&gt; +-source: /fooooo<br>
&gt; +-target: /mnt/foo<br>
&gt; +-fstype: bar<br>
&gt; +-optstr: rw,relatime<br>
&gt; +-VFS-optstr: rw,relatime<br>
&gt; +-FS-opstr: rw<br>
&gt; +-root:=C2=A0 =C2=A0/<br>
&gt; +-id:=C2=A0 =C2=A0 =C2=A048<br>
&gt; +-parent: 20<br>
&gt; +-devno:=C2=A0 0:39<br>
&gt; +------- fs:<br>
&gt; + source: tmpfs<br>
&gt; + target: /mnt/test/foo<br>
&gt; bar<br>
&gt; + fstype: tmpfs<br>
&gt; +diff --git a/tests/expected/libmount/tabfiles-py-parse-mountinfo b/te=
sts/expected/libmount/tabfiles-py-parse-mountinfo<br>
&gt; +index 47eb770061..d5ba5248e4 100644<br>
&gt; +--- a/tests/expected/libmount/tabfiles-py-parse-mountinfo<br>
&gt; ++++ b/tests/expected/libmount/tabfiles-py-parse-mountinfo<br>
&gt; +@@ -351,17 +351,6 @@ id:=C2=A0 =C2=A0 =C2=A047<br>
&gt; + parent: 20<br>
&gt; + devno:=C2=A0 0:38<br>
&gt; + ------ fs:<br>
&gt; +-source: /fooooo<br>
&gt; +-target: /mnt/foo<br>
&gt; +-fstype: bar<br>
&gt; +-optstr: rw,relatime<br>
&gt; +-VFS-optstr: rw,relatime<br>
&gt; +-FS-opstr: rw<br>
&gt; +-root:=C2=A0 =C2=A0/<br>
&gt; +-id:=C2=A0 =C2=A0 =C2=A048<br>
&gt; +-parent: 20<br>
&gt; +-devno:=C2=A0 0:39<br>
&gt; +------- fs:<br>
&gt; + source: tmpfs<br>
&gt; + target: /mnt/test/foo<br>
&gt; bar<br>
&gt; + fstype: tmpfs<br>
&gt; +diff --git a/tests/ts/findmnt/files/mountinfo b/tests/ts/findmnt/file=
s/mountinfo<br>
&gt; +index 475ea1a337..ff1e664a84 100644<br>
&gt; +--- a/tests/ts/findmnt/files/mountinfo<br>
&gt; ++++ b/tests/ts/findmnt/files/mountinfo<br>
&gt; +@@ -30,4 +30,3 @@<br>
&gt; + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-f=
use-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500<br>
&gt; + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc=
 rw<br>
&gt; + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=
=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=
=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384=
,wsize=3D57344<br>
&gt; +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw<br>
&gt; +diff --git a/tests/ts/findmnt/files/mountinfo-nonroot b/tests/ts/find=
mnt/files/mountinfo-nonroot<br>
&gt; +index e15b467016..87b421d2ef 100644<br>
&gt; +--- a/tests/ts/findmnt/files/mountinfo-nonroot<br>
&gt; ++++ b/tests/ts/findmnt/files/mountinfo-nonroot<br>
&gt; +@@ -29,4 +29,3 @@<br>
&gt; + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-f=
use-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500<br>
&gt; + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc=
 rw<br>
&gt; + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=
=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=
=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384=
,wsize=3D57344<br>
&gt; +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw<br>
&gt; +diff --git a/tests/ts/libmount/files/mountinfo b/tests/ts/libmount/fi=
les/mountinfo<br>
&gt; +index c063071833..2b01740481 100644<br>
&gt; +--- a/tests/ts/libmount/files/mountinfo<br>
&gt; ++++ b/tests/ts/libmount/files/mountinfo<br>
&gt; +@@ -30,5 +30,4 @@<br>
&gt; + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-f=
use-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500<br>
&gt; + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc=
 rw<br>
&gt; + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=
=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=
=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384=
,wsize=3D57344<br>
&gt; +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw<br>
&gt; + 49 20 0:56 / /mnt/test/foo<br>
&gt; bar rw,relatime shared:323 - tmpfs tmpfs rw<br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux/include-strutils-=
cleanup-strto-functions.patch b/meta/recipes-core/util-linux/util-linux/inc=
lude-strutils-cleanup-strto-functions.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5d5a370821<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup=
-strto-functions.patch<br>
&gt; @@ -0,0 +1,270 @@<br>
&gt; +From 84825b161ba5d18da4142893b9789b3fc71284d9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +Date: Tue, 22 Jun 2021 14:20:42 +0200<br>
&gt; +Subject: [PATCH] include/strutils: cleanup strto..() functions<br>
&gt; +<br>
&gt; +* add ul_strtos64() and ul_strtou64()<br>
&gt; +* add simple test<br>
&gt; +<br>
&gt; +Addresses: <a href=3D"https://github.com/karelzak/util-linux/issues/1=
358" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/kar=
elzak/util-linux/issues/1358</a><br>
&gt; +Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Backport: [<a href=3D"https://github.com/util-linux/util-lin=
ux/commit/84825b161ba5d18da4142893b9789b3fc71284d9" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://github.com/util-linux/util-linux/commit/84=
825b161ba5d18da4142893b9789b3fc71284d9</a>]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.c=
om</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + include/strutils.h |=C2=A0 =C2=A03 +<br>
&gt; + lib/strutils.c=C2=A0 =C2=A0 =C2=A0| 174 ++++++++++++++++++++++++++--=
-----------------<br>
&gt; + 2 files changed, 105 insertions(+), 72 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/include/strutils.h b/include/strutils.h<br>
&gt; +index e75a2f0e17..389e849905 100644<br>
&gt; +--- a/include/strutils.h<br>
&gt; ++++ b/include/strutils.h<br>
&gt; +@@ -19,6 +19,9 @@ extern int parse_size(const char *str, uintmax_t *r=
es, int *power);<br>
&gt; + extern int strtosize(const char *str, uintmax_t *res);<br>
&gt; + extern uintmax_t strtosize_or_err(const char *str, const char *errme=
sg);<br>
&gt; +<br>
&gt; ++extern int ul_strtos64(const char *str, int64_t *num, int base);<br>
&gt; ++extern int ul_strtou64(const char *str, uint64_t *num, int base);<br=
>
&gt; ++<br>
&gt; + extern int16_t strtos16_or_err(const char *str, const char *errmesg)=
;<br>
&gt; + extern uint16_t strtou16_or_err(const char *str, const char *errmesg=
);<br>
&gt; + extern uint16_t strtox16_or_err(const char *str, const char *errmesg=
);<br>
&gt; +diff --git a/lib/strutils.c b/lib/strutils.c<br>
&gt; +index ee2c835495..d9976dca70 100644<br>
&gt; +--- a/lib/strutils.c<br>
&gt; ++++ b/lib/strutils.c<br>
&gt; +@@ -319,39 +319,80 @@ char *strndup(const char *s, size_t n)<br>
&gt; + }<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +-static uint32_t _strtou32_or_err(const char *str, const char *errmes=
g, int base);<br>
&gt; +-static uint64_t _strtou64_or_err(const char *str, const char *errmes=
g, int base);<br>
&gt; ++/*<br>
&gt; ++ * convert strings to numbers; returns &lt;0 on error, and 0 on succ=
ess<br>
&gt; ++ */<br>
&gt; ++int ul_strtos64(const char *str, int64_t *num, int base)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *end =3D NULL;<br>
&gt; +<br>
&gt; +-int16_t strtos16_or_err(const char *str, const char *errmesg)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL || *str =3D=3D &#39;\0&#39;=
)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *num =3D (int64_t) strtoimax(str, &amp;end, bas=
e);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int ul_strtou64(const char *str, uint64_t *num, int base)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 int32_t num =3D strtos32_or_err(str, errmesg);<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *end =3D NULL;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (num &lt; INT16_MIN || num &gt; INT16_MAX) {=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ERANGE;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err(STRTOXX_EXIT_CO=
DE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL || *str =3D=3D &#39;\0&#39;=
)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *num =3D (uint64_t) strtoumax(str, &amp;end, ba=
se);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static uint16_t _strtou16_or_err(const char *str, const char *errmes=
g, int base)<br>
&gt; ++/*<br>
&gt; ++ * Covert strings to numbers and print message on error.<br>
&gt; ++ *<br>
&gt; ++ * Note that hex functions (strtox..()) returns unsigned numbers, if=
 you need<br>
&gt; ++ * something else then use ul_strtos64(s, &amp;n, 16).<br>
&gt; ++ */<br>
&gt; ++int64_t strtos64_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 uint32_t num =3D _strtou32_or_err(str, errmesg,=
 base);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int64_t num =3D 0;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (num &gt; UINT16_MAX) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ERANGE;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err(STRTOXX_EXIT_CO=
DE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ul_strtos64(str, &amp;num, 10) !=3D 0) {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ER=
ANGE)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 err(STRTOXX_EXIT_CODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, st=
r);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errx(STRTOXX_EXIT_C=
ODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint16_t strtou16_or_err(const char *str, const char *errmesg)<br>
&gt; ++uint64_t strtou64_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return _strtou16_or_err(str, errmesg, 10);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t num =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ul_strtou64(str, &amp;num, 10)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ER=
ANGE)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 err(STRTOXX_EXIT_CODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, st=
r);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errx(STRTOXX_EXIT_C=
ODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint16_t strtox16_or_err(const char *str, const char *errmesg)<br>
&gt; ++uint64_t strtox64_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return _strtou16_or_err(str, errmesg, 16);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t num =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ul_strtou64(str, &amp;num, 16)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ER=
ANGE)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 err(STRTOXX_EXIT_CODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, st=
r);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errx(STRTOXX_EXIT_C=
ODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; + int32_t strtos32_or_err(const char *str, const char *errmesg)<br>
&gt; +@@ -365,9 +406,9 @@ int32_t strtos32_or_err(const char *str, const ch=
ar *errmesg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static uint32_t _strtou32_or_err(const char *str, const char *errmes=
g, int base)<br>
&gt; ++uint32_t strtou32_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 uint64_t num =3D _strtou64_or_err(str, errmesg,=
 base);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t num =3D strtou64_or_err(str, errmesg);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num &gt; UINT32_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ERAN=
GE;<br>
&gt; +@@ -376,66 +417,48 @@ static uint32_t _strtou32_or_err(const char *st=
r, const char *errmesg, int base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint32_t strtou32_or_err(const char *str, const char *errmesg)<br>
&gt; +-{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return _strtou32_or_err(str, errmesg, 10);<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + uint32_t strtox32_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return _strtou32_or_err(str, errmesg, 16);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t num =3D strtox64_or_err(str, errmesg);=
<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (num &gt; UINT32_MAX) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ERANGE;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err(STRTOXX_EXIT_CO=
DE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-int64_t strtos64_or_err(const char *str, const char *errmesg)<br>
&gt; ++int16_t strtos16_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 int64_t num;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 char *end =3D NULL;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL || *str =3D=3D &#39;\0&#39;=
)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 num =3D strtoimax(str, &amp;end, 10);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int64_t num =3D strtos64_or_err(str, errmesg);<=
br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; +-err:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ERANGE)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (num &lt; INT16_MIN || num &gt; INT16_MAX) {=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ERANGE;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err(STRTOXX_EX=
IT_CODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 errx(STRTOXX_EXIT_CODE, &quot;%s: &#39;%s&#39;&=
quot;, errmesg, str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static uint64_t _strtou64_or_err(const char *str, const char *errmes=
g, int base)<br>
&gt; ++uint16_t strtou16_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 uintmax_t num;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 char *end =3D NULL;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL || *str =3D=3D &#39;\0&#39;=
)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 num =3D strtoumax(str, &amp;end, base);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t num =3D strtou64_or_err(str, errmesg);=
<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; +-err:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ERANGE)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (num &gt; UINT16_MAX) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ERANGE;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err(STRTOXX_EX=
IT_CODE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 errx(STRTOXX_EXIT_CODE, &quot;%s: &#39;%s&#39;&=
quot;, errmesg, str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint64_t strtou64_or_err(const char *str, const char *errmesg)<br>
&gt; ++uint16_t strtox16_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return _strtou64_or_err(str, errmesg, 10);<br>
&gt; +-}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t num =3D strtox64_or_err(str, errmesg);=
<br>
&gt; +<br>
&gt; +-uint64_t strtox64_or_err(const char *str, const char *errmesg)<br>
&gt; +-{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return _strtou64_or_err(str, errmesg, 16);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (num &gt; UINT16_MAX) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ERANGE;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err(STRTOXX_EXIT_CO=
DE, &quot;%s: &#39;%s&#39;&quot;, errmesg, str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; + double strtod_or_err(const char *str, const char *errmesg)<br>
&gt; +@@ -1051,15 +1051,25 @@ static int test_strutils_cmp_paths(int a<br>
&gt; +<br>
&gt; + int main(int argc, char *argv[])<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (argc =3D=3D 3 &amp;&amp; strcmp(argv[1], &q=
uot;--size&quot;) =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (argc =3D=3D 3 &amp;&amp; strcmp(argv[1], &q=
uot;--size&quot;) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return test_st=
rutils_sizes(argc - 1, argv + 1);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 else if (argc =3D=3D 4 &amp;&amp; strcmp(argv[1=
], &quot;--cmp-paths&quot;) =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else if (argc =3D=3D 4 &amp;&amp; strcmp(argv=
[1], &quot;--cmp-paths&quot;) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return test_st=
rutils_cmp_paths(argc - 1, argv + 1);<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else if (argc =3D=3D 3 &amp;&amp; strcmp(argv=
[1], &quot;--str2num&quot;) =3D=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t n;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ul_strtou64(arg=
v[2], &amp;n, 10) =3D=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printf(&quot;&#39;%s&#39; --&gt; %ju\n&quot;, argv[2], (uintmax_=
t) n);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return EXIT_SUCCESS;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr=
, &quot;usage: %1$s --size &lt;number&gt;[suffix]\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0%1$=
s --cmp-paths &lt;path&gt; &lt;path&gt;\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0%1$=
s --cmp-paths &lt;path&gt; &lt;path&gt;\n&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0%1$=
s --num2num &lt;str&gt;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAIL=
URE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/meta/recipes-core/util-linux/<a href=3D"http://util-linux=
_2.35.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">util-linux_2.35=
.1.bb</a> b/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.35.=
1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">util-linux_2.35.1.bb<=
/a><br>
&gt; index 731f0618eb..96d5eca518 100644<br>
&gt; --- a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.35.1=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">util-linux_2.35.1.bb</=
a><br>
&gt; +++ b/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.35.1=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">util-linux_2.35.1.bb</=
a><br>
&gt; @@ -12,6 +12,9 @@ SRC_URI +=3D &quot;file://configure-sbindir.patch \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-kill-inclu=
de-sys-types.h-before-checking-SYS_pidfd_s.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-include-cl=
eanup-pidfd-inckudes.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2021-37600.=
patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://include-strutils-cle=
anup-strto-functions.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2021-3995.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2021-3996.patch =
\<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;7f64882f631225f0295ca05080cee1bf&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;d9de3edd287366cd908e77677514b9387b2=
2bc7b88f45b83e1922c3597f1d7f9&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#161079): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/161079" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1610=
79</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88744485=
/3620601" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/88744485/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sako=
man.com" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000a31ec405d6a72813--

