Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BA8EB64DA
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 01:21:21 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.29725.1688174472937161979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 18:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=USAg4A5N;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a36b309524so1939792b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 18:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688174472; x=1690766472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRsgy3Y+Ln6dfj5bVKup0FstLK4zcc6ptVmL0KwXSKo=;
        b=USAg4A5NjEE5+YNLVTaTwy2wLHOXvYwYtNX6d8EAviEmqJiV0oA036fEu7COHMkojo
         jWktIC025XrgIbnGVYNpNEoNtLiM7Ff8wa1icOzCP4YFCkqIrQXGFKPAOnr6wR0Yg049
         o54zaAccN9iKdQD8JbDqO8C5Cw1ivmGfn5cpndgSheSjqQvbHljCagSIb9Ij4cj4V7fH
         lLa8kJTBrh7WDx1hLvLJc9CHGs8tFt2gXzroRjCFhUWHVFTn/skHSbBU8HhW4RxB3Y+o
         DxR5NX05SGI/y7kZ05gHVJrP+axCStvmu7m7wwcMsX4ADIvqtiZl6InU7FK8+BD6Nvfy
         9hBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688174472; x=1690766472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRsgy3Y+Ln6dfj5bVKup0FstLK4zcc6ptVmL0KwXSKo=;
        b=aiH8gsI0fBisDDbIwzLv4hkaBb7wX/ujKoNYv7K1YTd4z2uptaVDSivc2i/QXgaMe3
         ICt8PrffqT5G4+j8P+Q7s1N5Lo9cdySENDLrE/MLf1PNw9JOCvAEWoPYOT0xw9AE4YWT
         xtp++8warg35CBVgg9NLx6uVNEB12/NPrwMdpG/rn8azCiQMVGGHQwDi+RCpP3ipcFD0
         QMb/5Fq1XKbRmRiDxLpJ+b9OD6VOmLVBUMDGvfTVCIuPNgQZ85aeICBBn0DH42KkTw5S
         TErfKXp1yjJ4HDQ6VnpGzdnQXqcdt/Plj6SEoQaKOnc/GrC8lZIjH8b1OU01yrSJxkTQ
         m4Mg==
X-Gm-Message-State: AC+VfDzZpwSMGiiXTi+TGX1XiWr6MQX8tHpDnwBL6JF3ZbJ3a3h4pS/h
	pIC4ZdYLn9KkVYzk4JoMTiefGoVOpgs9LF2FRhw=
X-Google-Smtp-Source: ACHHUZ7rygH7XGWFAx2GD+fNYQ4QaYg+sjTu6wqn3UlMcdURiIPV5dsCCxqiT6kqxe9ErXTvgtLnxcXOkGfDiMHtVO0=
X-Received: by 2002:aca:190a:0:b0:3a1:df16:2eed with SMTP id
 l10-20020aca190a000000b003a1df162eedmr4487014oii.30.1688174471945; Fri, 30
 Jun 2023 18:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230625212241.915739-1-alex@linutronix.de> <20230625212241.915739-12-alex@linutronix.de>
In-Reply-To: <20230625212241.915739-12-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Jun 2023 18:20:45 -0700
Message-ID: <CAMKF1srWuy+VzBAKZXVNwo19vy3svP-b=YWMz0w1W+xtxevDWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/21] libpam: update 1.5.2 -> 1.5.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 01:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183706

fails on musl/arm64
https://errors.yoctoproject.org/Errors/Details/711268/

On Sun, Jun 25, 2023 at 2:23=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...rely-on-all-filesystems-providing-a-.patch | 108 ---------
>  ...-xtests.sh-check-whether-files-exist.patch |  65 ------
>  .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ------------------
>  .../pam/{libpam_1.5.2.bb =3D> libpam_1.5.3.bb}  |   5 +-
>  4 files changed, 1 insertion(+), 382 deletions(-)
>  delete mode 100644 meta/recipes-extended/pam/libpam/0001-pam_motd-do-not=
-rely-on-all-filesystems-providing-a-.patch
>  delete mode 100644 meta/recipes-extended/pam/libpam/0001-run-xtests.sh-c=
heck-whether-files-exist.patch
>  delete mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.=
patch
>  rename meta/recipes-extended/pam/{libpam_1.5.2.bb =3D> libpam_1.5.3.bb} =
(95%)
>
> diff --git a/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-o=
n-all-filesystems-providing-a-.patch b/meta/recipes-extended/pam/libpam/000=
1-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
> deleted file mode 100644
> index 94dcb04f0aa..00000000000
> --- a/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-f=
ilesystems-providing-a-.patch
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -From 42404548721c653317c911c83d885e2fc7fbca70 Mon Sep 17 00:00:00 2001
> -From: Per Jessen <per@jessen.ch>
> -Date: Fri, 22 Apr 2022 18:15:36 +0200
> -Subject: [PATCH] pam_motd: do not rely on all filesystems providing a fi=
letype
> -
> -When using scandir() to look for MOTD files to display, we wrongly
> -relied on all filesystems providing a filetype.  This is a fix to divert
> -to lstat() when we have no filetype.  To maintain MT safety, it isn't
> -possible to use lstat() in the scandir() filter function, so all of the
> -filtering has been moved to an additional loop after scanning all the
> -motd dirs.
> -Also, remove superfluous alphasort from scandir(), we are doing
> -a qsort() later.
> -
> -Resolves: https://github.com/linux-pam/linux-pam/issues/455
> -
> -Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/42404548721c653317c911c83d885e2fc7fbca70]
> -
> -Signed-off-by: Per Jessen <per@jessen.ch>
> -Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ----
> - modules/pam_motd/pam_motd.c | 49 ++++++++++++++++++++++++++++++-------
> - 1 file changed, 40 insertions(+), 9 deletions(-)
> -
> -diff --git a/modules/pam_motd/pam_motd.c b/modules/pam_motd/pam_motd.c
> -index 6ac8cba2..5ca486e4 100644
> ---- a/modules/pam_motd/pam_motd.c
> -+++ b/modules/pam_motd/pam_motd.c
> -@@ -166,11 +166,6 @@ static int compare_strings(const void *a, const voi=
d *b)
> -     }
> - }
> -
> --static int filter_dirents(const struct dirent *d)
> --{
> --    return (d->d_type =3D=3D DT_REG || d->d_type =3D=3D DT_LNK);
> --}
> --
> - static void try_to_display_directories_with_overrides(pam_handle_t *pam=
h,
> -       char **motd_dir_path_split, unsigned int num_motd_dirs, int repor=
t_missing)
> - {
> -@@ -199,8 +194,7 @@ static void try_to_display_directories_with_override=
s(pam_handle_t *pamh,
> -
> -     for (i =3D 0; i < num_motd_dirs; i++) {
> -       int rv;
> --      rv =3D scandir(motd_dir_path_split[i], &(dirscans[i]),
> --              filter_dirents, alphasort);
> -+      rv =3D scandir(motd_dir_path_split[i], &(dirscans[i]), NULL, NULL=
);
> -       if (rv < 0) {
> -           if (errno !=3D ENOENT || report_missing) {
> -               pam_syslog(pamh, LOG_ERR, "error scanning directory %s: %=
m",
> -@@ -215,6 +209,41 @@ static void try_to_display_directories_with_overrid=
es(pam_handle_t *pamh,
> -     if (dirscans_size_total =3D=3D 0)
> -         goto out;
> -
> -+    /* filter out unwanted names, directories, and complement data with=
 lstat() */
> -+    for (i =3D 0; i < num_motd_dirs; i++) {
> -+      struct dirent **d =3D dirscans[i];
> -+      for (unsigned int j =3D 0; j < dirscans_sizes[i]; j++) {
> -+          int rc;
> -+          char *fullpath;
> -+          struct stat s;
> -+
> -+          switch(d[j]->d_type) {    /* the filetype determines how to p=
roceed */
> -+          case DT_REG:              /* regular files and     */
> -+          case DT_LNK:              /* symlinks              */
> -+              continue;             /* are good.             */
> -+          case DT_UNKNOWN:   /* for file systems that do not provide */
> -+                             /* a filetype, we use lstat()           */
> -+              if (join_dir_strings(&fullpath, motd_dir_path_split[i],
> -+                                   d[j]->d_name) <=3D 0)
> -+                  break;
> -+              rc =3D lstat(fullpath, &s);
> -+              _pam_drop(fullpath);  /* free the memory alloc'ed by join=
_dir_strings */
> -+              if (rc !=3D 0)          /* if the lstat() somehow failed =
*/
> -+                  break;
> -+
> -+              if (S_ISREG(s.st_mode) ||          /* regular files and  =
*/
> -+                  S_ISLNK(s.st_mode)) continue;  /* symlinks are good  =
*/
> -+              break;
> -+          case DT_DIR:          /* We don't want directories     */
> -+          default:              /* nor anything else             */
> -+              break;
> -+          }
> -+          _pam_drop(d[j]);  /* free memory                   */
> -+          d[j] =3D NULL;      /* indicate this one was dropped */
> -+          dirscans_size_total--;
> -+      }
> -+    }
> -+
> -     /* Allocate space for all file names found in the directories, incl=
uding duplicates. */
> -     if ((dirnames_all =3D calloc(dirscans_size_total, sizeof(*dirnames_=
all))) =3D=3D NULL) {
> -       pam_syslog(pamh, LOG_CRIT, "failed to allocate dirname array");
> -@@ -225,8 +254,10 @@ static void try_to_display_directories_with_overrid=
es(pam_handle_t *pamh,
> -       unsigned int j;
> -
> -       for (j =3D 0; j < dirscans_sizes[i]; j++) {
> --          dirnames_all[i_dirnames] =3D dirscans[i][j]->d_name;
> --          i_dirnames++;
> -+          if (NULL !=3D dirscans[i][j]) {
> -+              dirnames_all[i_dirnames] =3D dirscans[i][j]->d_name;
> -+              i_dirnames++;
> -+          }
> -       }
> -     }
> -
> ---
> -2.39.0
> -
> diff --git a/meta/recipes-extended/pam/libpam/0001-run-xtests.sh-check-wh=
ether-files-exist.patch b/meta/recipes-extended/pam/libpam/0001-run-xtests.=
sh-check-whether-files-exist.patch
> deleted file mode 100644
> index 40040a873a6..00000000000
> --- a/meta/recipes-extended/pam/libpam/0001-run-xtests.sh-check-whether-f=
iles-exist.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From e8e8ccfd57e0274b431bc5717bf37c488285b07b Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Wed, 27 Oct 2021 10:30:46 +0800
> -Subject: [PATCH] run-xtests.sh: check whether files exist
> -
> -Fixes:
> - # ./run-xtests.sh . tst-pam_access1
> - mv: cannot stat '/etc/security/opasswd': No such file or directory
> - PASS: tst-pam_access1
> - mv: cannot stat '/etc/security/opasswd-pam-xtests': No such file or dir=
ectory
> - =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - 1 tests passed
> - 0 tests not run
> - =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/e8e8ccfd57e0274b431bc5717bf37c488285b07b]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - xtests/run-xtests.sh | 20 +++++++++++++-------
> - 1 file changed, 13 insertions(+), 7 deletions(-)
> -
> -diff --git a/xtests/run-xtests.sh b/xtests/run-xtests.sh
> -index 14f585d9..ff9a4dc1 100755
> ---- a/xtests/run-xtests.sh
> -+++ b/xtests/run-xtests.sh
> -@@ -18,10 +18,12 @@ all=3D0
> -
> - mkdir -p /etc/security
> - for config in access.conf group.conf time.conf limits.conf ; do
> --      cp /etc/security/$config /etc/security/$config-pam-xtests
> -+      [ -f "/etc/security/$config" ] &&
> -+              mv /etc/security/$config /etc/security/$config-pam-xtests
> -       install -m 644 "${SRCDIR}"/$config /etc/security/$config
> - done
> --mv /etc/security/opasswd /etc/security/opasswd-pam-xtests
> -+[ -f /etc/security/opasswd ] &&
> -+      mv /etc/security/opasswd /etc/security/opasswd-pam-xtests
> -
> - for testname in $XTESTS ; do
> -         for cfg in "${SRCDIR}"/$testname*.pamd ; do
> -@@ -47,11 +49,15 @@ for testname in $XTESTS ; do
> -         all=3D`expr $all + 1`
> -         rm -f /etc/pam.d/$testname*
> - done
> --mv /etc/security/access.conf-pam-xtests /etc/security/access.conf
> --mv /etc/security/group.conf-pam-xtests /etc/security/group.conf
> --mv /etc/security/time.conf-pam-xtests /etc/security/time.conf
> --mv /etc/security/limits.conf-pam-xtests /etc/security/limits.conf
> --mv /etc/security/opasswd-pam-xtests /etc/security/opasswd
> -+
> -+for config in access.conf group.conf time.conf limits.conf opasswd ; do
> -+      if [ -f "/etc/security/$config-pam-xtests" ]; then
> -+              mv /etc/security/$config-pam-xtests /etc/security/$config
> -+      else
> -+              rm -f /etc/security/$config
> -+      fi
> -+done
> -+
> - if test "$failed" -ne 0; then
> -         echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
"
> -         echo "$failed of $all tests failed"
> ---
> -2.32.0
> -
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch b=
/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> deleted file mode 100644
> index e7bf03f9f7b..00000000000
> --- a/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> +++ /dev/null
> @@ -1,205 +0,0 @@
> -From 23393bef92c1e768eda329813d7af55481c6ca9f Mon Sep 17 00:00:00 2001
> -From: Thorsten Kukuk <kukuk@suse.com>
> -Date: Thu, 24 Feb 2022 10:37:32 +0100
> -Subject: [PATCH 2/2] pam_access: handle hostnames in access.conf
> -
> -According to the manual page, the following entry is valid but does not
> -work:
> --:root:ALL EXCEPT localhost
> -
> -See https://bugzilla.suse.com/show_bug.cgi?id=3D1019866
> -
> -Patched is based on PR#226 from Josef Moellers
> -
> -Upstream-Status: Backport
> -CVE: CVE-2022-28321
> -
> -Reference to upstream patch:
> -[https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813=
d7af55481c6ca9f]
> -
> -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ----
> - modules/pam_access/pam_access.c | 95 ++++++++++++++++++++++++++-------
> - 1 file changed, 76 insertions(+), 19 deletions(-)
> -
> -diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_ac=
cess.c
> -index 277192b..bca424f 100644
> ---- a/modules/pam_access/pam_access.c
> -+++ b/modules/pam_access/pam_access.c
> -@@ -637,7 +637,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct =
login_info *item)
> -       if ((str_len =3D strlen(string)) > tok_len
> -         && strcasecmp(tok, string + str_len - tok_len) =3D=3D 0)
> -       return YES;
> --    } else if (tok[tok_len - 1] =3D=3D '.') {
> -+    } else if (tok[tok_len - 1] =3D=3D '.') {       /* internet network=
 numbers (end with ".") */
> -       struct addrinfo hint;
> -
> -       memset (&hint, '\0', sizeof (hint));
> -@@ -678,7 +678,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct =
login_info *item)
> -       return NO;
> -     }
> -
> --    /* Assume network/netmask with an IP of a host.  */
> -+    /* Assume network/netmask, IP address or hostname.  */
> -     return network_netmask_match(pamh, tok, string, item);
> - }
> -
> -@@ -696,7 +696,7 @@ string_match (pam_handle_t *pamh, const char *tok, c=
onst char *string,
> -     /*
> -      * If the token has the magic value "ALL" the match always succeeds=
.
> -      * Otherwise, return YES if the token fully matches the string.
> --       * "NONE" token matches NULL string.
> -+     * "NONE" token matches NULL string.
> -      */
> -
> -     if (strcasecmp(tok, "ALL") =3D=3D 0) {                /* all: alway=
s matches */
> -@@ -714,7 +714,8 @@ string_match (pam_handle_t *pamh, const char *tok, c=
onst char *string,
> -
> - /* network_netmask_match - match a string against one token
> -  * where string is a hostname or ip (v4,v6) address and tok
> -- * represents either a single ip (v4,v6) address or a network/netmask
> -+ * represents either a hostname, a single ip (v4,v6) address
> -+ * or a network/netmask
> -  */
> - static int
> - network_netmask_match (pam_handle_t *pamh,
> -@@ -723,10 +724,12 @@ network_netmask_match (pam_handle_t *pamh,
> -     char *netmask_ptr;
> -     char netmask_string[MAXHOSTNAMELEN + 1];
> -     int addr_type;
> -+    struct addrinfo *ai =3D NULL;
> -
> -     if (item->debug)
> --    pam_syslog (pamh, LOG_DEBUG,
> -+      pam_syslog (pamh, LOG_DEBUG,
> -               "network_netmask_match: tok=3D%s, item=3D%s", tok, string=
);
> -+
> -     /* OK, check if tok is of type addr/mask */
> -     if ((netmask_ptr =3D strchr(tok, '/')) !=3D NULL)
> -       {
> -@@ -760,54 +763,108 @@ network_netmask_match (pam_handle_t *pamh,
> -           netmask_ptr =3D number_to_netmask(netmask, addr_type,
> -               netmask_string, MAXHOSTNAMELEN);
> -         }
> --      }
> -+
> -+        /*
> -+         * Construct an addrinfo list from the IP address.
> -+         * This should not fail as the input is a correct IP address...
> -+         */
> -+      if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
> -+        {
> -+          return NO;
> -+        }
> -+      }
> -     else
> --      /* NO, then check if it is only an addr */
> --      if (isipaddr(tok, NULL, NULL) !=3D YES)
> -+      {
> -+        /*
> -+       * It is either an IP address or a hostname.
> -+       * Let getaddrinfo sort everything out
> -+       */
> -+      if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
> -         {
> -+          pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", t=
ok);
> -+
> -           return NO;
> -         }
> -+      netmask_ptr =3D NULL;
> -+      }
> -
> -     if (isipaddr(string, NULL, NULL) !=3D YES)
> -       {
> --      /* Assume network/netmask with a name of a host.  */
> -       struct addrinfo hint;
> -
> -+      /* Assume network/netmask with a name of a host.  */
> -       memset (&hint, '\0', sizeof (hint));
> -       hint.ai_flags =3D AI_CANONNAME;
> -       hint.ai_family =3D AF_UNSPEC;
> -
> -       if (item->gai_rv !=3D 0)
> -+        {
> -+          freeaddrinfo(ai);
> -           return NO;
> -+        }
> -       else if (!item->res &&
> -               (item->gai_rv =3D getaddrinfo (string, NULL, &hint, &item=
->res)) !=3D 0)
> -+        {
> -+          freeaddrinfo(ai);
> -           return NO;
> -+        }
> -         else
> -         {
> -           struct addrinfo *runp =3D item->res;
> -+          struct addrinfo *runp1;
> -
> -           while (runp !=3D NULL)
> -             {
> -               char buf[INET6_ADDRSTRLEN];
> -
> --              DIAG_PUSH_IGNORE_CAST_ALIGN;
> --              inet_ntop (runp->ai_family,
> --                      runp->ai_family =3D=3D AF_INET
> --                      ? (void *) &((struct sockaddr_in *) runp->ai_addr=
)->sin_addr
> --                      : (void *) &((struct sockaddr_in6 *) runp->ai_add=
r)->sin6_addr,
> --                      buf, sizeof (buf));
> --              DIAG_POP_IGNORE_CAST_ALIGN;
> -+              if (getnameinfo (runp->ai_addr, runp->ai_addrlen, buf, si=
zeof (buf), NULL, 0, NI_NUMERICHOST) !=3D 0)
> -+                {
> -+                  freeaddrinfo(ai);
> -+                  return NO;
> -+                }
> -
> --              if (are_addresses_equal(buf, tok, netmask_ptr))
> -+              for (runp1 =3D ai; runp1 !=3D NULL; runp1 =3D runp1->ai_n=
ext)
> -                 {
> --                  return YES;
> -+                    char buf1[INET6_ADDRSTRLEN];
> -+
> -+                    if (runp->ai_family !=3D runp1->ai_family)
> -+                      continue;
> -+
> -+                    if (getnameinfo (runp1->ai_addr, runp1->ai_addrlen,=
 buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST) !=3D 0)
> -+                    {
> -+                      freeaddrinfo(ai);
> -+                      return NO;
> -+                    }
> -+
> -+                    if (are_addresses_equal (buf, buf1, netmask_ptr))
> -+                      {
> -+                        freeaddrinfo(ai);
> -+                        return YES;
> -+                      }
> -                 }
> -               runp =3D runp->ai_next;
> -             }
> -         }
> -       }
> -     else
> --      return (are_addresses_equal(string, tok, netmask_ptr));
> -+      {
> -+       struct addrinfo *runp1;
> -+
> -+       for (runp1 =3D ai; runp1 !=3D NULL; runp1 =3D runp1->ai_next)
> -+         {
> -+           char buf1[INET6_ADDRSTRLEN];
> -+
> -+           (void) getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1,=
 sizeof (buf1), NULL, 0, NI_NUMERICHOST);
> -+
> -+           if (are_addresses_equal(string, buf1, netmask_ptr))
> -+             {
> -+               freeaddrinfo(ai);
> -+               return YES;
> -+             }
> -+         }
> -+      }
> -+
> -+  freeaddrinfo(ai);
> -
> -   return NO;
> - }
> ---
> -2.37.3
> -
> diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-ext=
ended/pam/libpam_1.5.3.bb
> similarity index 95%
> rename from meta/recipes-extended/pam/libpam_1.5.2.bb
> rename to meta/recipes-extended/pam/libpam_1.5.3.bb
> index bec47ab8360..c8f1e164593 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
> @@ -21,14 +21,11 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux=
-PAM-${PV}.tar.xz \
>             file://pam.d/common-session-noninteractive \
>             file://pam.d/other \
>             file://libpam-xtests.patch \
> -           file://0001-run-xtests.sh-check-whether-files-exist.patch \
>             file://run-ptest \
>             file://pam-volatiles.conf \
> -           file://CVE-2022-28321-0002.patch \
> -           file://0001-pam_motd-do-not-rely-on-all-filesystems-providing=
-a-.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "e4ec7131a91da44512574268f493c6d8ca105c87091691b8=
e9b56ca685d4f94d"
> +SRC_URI[sha256sum] =3D "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd7=
73b3c54b0a818283"
>
>  DEPENDS =3D "bison-native flex-native cracklib libxml2-native virtual/cr=
ypt"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183387): https://lists.openembedded.org/g/openembedde=
d-core/message/183387
> Mute This Topic: https://lists.openembedded.org/mt/99776694/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

