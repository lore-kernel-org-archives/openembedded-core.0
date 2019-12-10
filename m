Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6427DC1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:38:20 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id z17so7058156uac.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 03:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fwSBJiaMcXLlazDZ6X57W0qT+n+UJR2RJPiUjMgNjlk=;
	b=LBc5Yem27aMpd00sfIy5eZv5jVJgAlUv/ml1JdnQLXI3f4RTy5OijQqJ4BEDTa2D4U
	pKHbwT9VXW15oCp2Hhlm7mQb6StKMo6q7bcMrLRMFYzZkRKYMOCMKCfDabnw+MyWF7Bb
	HWyJ3DObX9gBp6Vk/DlESoE0vbyFQ6A9ur3rqX4IZBD5BpWAsPDYkuW/zxH2dN/OQ8yh
	5BN0LJ8t0H/UO/ngrdSS4QleuuZVYgTe0FfmTSH5wooyBpBJX5Y7t4bsXFjmZHrtGno0
	J8RqTsj/OixHQgrw37xvUCjPEzoA1KRJaS6vMszXqSl/LrdjHkK2KdFwcTD2CB/JwG91
	hG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fwSBJiaMcXLlazDZ6X57W0qT+n+UJR2RJPiUjMgNjlk=;
	b=okvoSJaj3nKwlTgz5xwldbP/JyL9rEu1B4kLj3gsVcH36oMY/jWr4LKLfAlJ7c9ect
	X09R3Kj0Xr6tKYeyUE1YFutgIwLbtUx+q/fSsyti73d6xZ4weIY62TS3BXVi9lg29vR5
	bFGlizdinBylp39yOilZjeljwEpRxHgYX8rcQX/D1R1eIIpr0KFum2h/hxInijRyzZye
	SU6J0M8AUAtLorWR6UIBRB2Vue7qJdrEyQlJIBjqn2AKK6lpfoq2mlDLhRxK59iS6Cuh
	V0o2C4r+TowPA3JrL8/OWpYN3cnOPj11QHseJCOVZTcy/Bq4UDpaoGL98P0hejUSMvOy
	Qzgg==
X-Gm-Message-State: APjAAAWr6C6nX3Cx/sZx+tyEIrfIjWqtLSvd4U4keZeQVhJeLXLSuyaY
	wTCkNa4ZiMDjPQle+L8pxFbdIrU3gS2vCRuo5LQ=
X-Google-Smtp-Source: APXvYqzbcAY26p8ouQujQ2QqrOVMqctqsnQ3cqGIGrhZ5QgCHEu8al0YXt2pZteH6KfH4WXhYnG0TkWz/ydKAkpYHWU=
X-Received: by 2002:a9f:3fcc:: with SMTP id m12mr29123473uaj.89.1575977900773; 
	Tue, 10 Dec 2019 03:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-14-alex.kanavin@gmail.com>
	<CAO5Uq5Qt+cuYcv1f==GPMfRco73jbxc8T9e=4PSN6OiU-pD87Q@mail.gmail.com>
In-Reply-To: <CAO5Uq5Qt+cuYcv1f==GPMfRco73jbxc8T9e=4PSN6OiU-pD87Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Dec 2019 12:38:09 +0100
Message-ID: <CANNYZj_G86a5B0bGoG-ox7afRgMbH1vx3fk7gF-PFDjSiee7eQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/24] shadow: update 4.6 -> 4.8
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
X-List-Received-Date: Tue, 10 Dec 2019 11:38:21 -0000
Content-Type: multipart/alternative; boundary="000000000000f31768059957f201"

--000000000000f31768059957f201
Content-Type: text/plain; charset="UTF-8"

Right, I have now dropped it.

Alex

On Tue, 10 Dec 2019 at 05:57, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Thu, Dec 5, 2019 at 3:46 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Drop two backports.
> >
> > Refactor 0001-useradd.c-create-parent-directories-when-necessary.patch
> > to make the changes less invasive (and easier to rebase).
> >
>
> Is that change even needed any more?
>
>
> https://github.com/shadow-maint/shadow/commit/b3b6d9d77c1d18b98670b97157777bb74092cd69
>
> Looks like it ought to be doing the same thing.
>
> > Rebase the rest of the paches.
> >
> > Add a patch to remove the check for validity of login shells
> > which does not work in our environment.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...01-Disable-use-of-syslog-for-sysroot.patch |  18 ++-
> >  ...eck-for-validity-of-shell-executable.patch |  29 +++++
> >  ...chg-shadow-field-reproducible-re.-71.patch |  89 --------------
> >  ...ure.ac-fix-configure-error-with-dash.patch |  36 ------
> >  ...te-parent-directories-when-necessary.patch | 116 ------------------
> >  ...-for-setting-password-in-clear-text.patch} | 101 +++++++--------
> >  ...te-parent-directories-when-necessary.patch |  63 ++++++++++
> >  ...nexpected-open-failure-in-chroot-env.patch |  15 ++-
> >  .../files/shadow-relaxed-usernames.patch      |  51 +++++---
> >  meta/recipes-extended/shadow/shadow.inc       |  11 +-
> >  .../shadow/{shadow_4.6.bb => shadow_4.8.bb}   |   0
> >  11 files changed, 196 insertions(+), 333 deletions(-)
> >  create mode 100644
> meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
> >  delete mode 100644
> meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
> >  delete mode 100644
> meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
> >  delete mode 100644
> meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
> >  rename
> meta/recipes-extended/shadow/files/{allow-for-setting-password-in-clear-text.patch
> => 0002-Allow-for-setting-password-in-clear-text.patch} (81%)
> >  create mode 100644
> meta/recipes-extended/shadow/files/0004-useradd.c-create-parent-directories-when-necessary.patch
> >  rename meta/recipes-extended/shadow/{shadow_4.6.bb => shadow_4.8.bb}
> (100%)
> >
> > diff --git
> a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> > index aac2d42b12a..ab317b9aa03 100644
> > ---
> a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> > +++
> b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> > @@ -1,4 +1,4 @@
> > -From 8cf3454d567f77233023be49a39a33e9f0836f89 Mon Sep 17 00:00:00 2001
> > +From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 2001
> >  From: Scott Garman <scott.a.garman@intel.com>
> >  Date: Thu, 14 Apr 2016 12:28:57 +0200
> >  Subject: [PATCH] Disable use of syslog for sysroot
> > @@ -12,6 +12,7 @@ Upstream-Status: Inappropriate [disable feature]
> >  Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> >  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +
> >  ---
> >   src/groupadd.c  | 3 +++
> >   src/groupdel.c  | 3 +++
> > @@ -23,7 +24,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >   7 files changed, 21 insertions(+)
> >
> >  diff --git a/src/groupadd.c b/src/groupadd.c
> > -index 63e1c48..a596c49 100644
> > +index 2dd8eec..e9c4bb7 100644
> >  --- a/src/groupadd.c
> >  +++ b/src/groupadd.c
> >  @@ -34,6 +34,9 @@
> > @@ -37,7 +38,7 @@ index 63e1c48..a596c49 100644
> >   #include <fcntl.h>
> >   #include <getopt.h>
> >  diff --git a/src/groupdel.c b/src/groupdel.c
> > -index 70bed01..ababd81 100644
> > +index f941a84..5a70056 100644
> >  --- a/src/groupdel.c
> >  +++ b/src/groupdel.c
> >  @@ -34,6 +34,9 @@
> > @@ -65,7 +66,7 @@ index fc91c8b..2842514 100644
> >   #include <getopt.h>
> >   #include <grp.h>
> >  diff --git a/src/groupmod.c b/src/groupmod.c
> > -index 72daf2c..8965f9d 100644
> > +index 1dca5fc..bc14438 100644
> >  --- a/src/groupmod.c
> >  +++ b/src/groupmod.c
> >  @@ -34,6 +34,9 @@
> > @@ -79,7 +80,7 @@ index 72daf2c..8965f9d 100644
> >   #include <fcntl.h>
> >   #include <getopt.h>
> >  diff --git a/src/useradd.c b/src/useradd.c
> > -index 3aaf45c..1ab9174 100644
> > +index 4af0f7c..1b7bf06 100644
> >  --- a/src/useradd.c
> >  +++ b/src/useradd.c
> >  @@ -34,6 +34,9 @@
> > @@ -93,7 +94,7 @@ index 3aaf45c..1ab9174 100644
> >   #include <ctype.h>
> >   #include <errno.h>
> >  diff --git a/src/userdel.c b/src/userdel.c
> > -index c8de1d3..24d3ea9 100644
> > +index cc951e5..153e0be 100644
> >  --- a/src/userdel.c
> >  +++ b/src/userdel.c
> >  @@ -34,6 +34,9 @@
> > @@ -107,7 +108,7 @@ index c8de1d3..24d3ea9 100644
> >   #include <errno.h>
> >   #include <fcntl.h>
> >  diff --git a/src/usermod.c b/src/usermod.c
> > -index ccfbb99..24fb60d 100644
> > +index 05b9871..21c6da9 100644
> >  --- a/src/usermod.c
> >  +++ b/src/usermod.c
> >  @@ -34,6 +34,9 @@
> > @@ -120,6 +121,3 @@ index ccfbb99..24fb60d 100644
> >   #include <assert.h>
> >   #include <ctype.h>
> >   #include <errno.h>
> > ---
> > -2.11.0
> > -
> > diff --git
> a/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
> b/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
> > new file mode 100644
> > index 00000000000..2d15ff0673a
> > --- /dev/null
> > +++
> b/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
> > @@ -0,0 +1,29 @@
> > +From 0d0aded7307a9f4ee0d299951512acd18b3e029e Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Wed, 4 Dec 2019 19:28:48 +0100
> > +Subject: [PATCH] Do not check for validity of shell executable.
> > +
> > +This kind of check fails when building a rootfs.
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + src/useradd.c | 5 +----
> > + 1 file changed, 1 insertion(+), 4 deletions(-)
> > +
> > +diff --git a/src/useradd.c b/src/useradd.c
> > +index 4af0f7c..898fe02 100644
> > +--- a/src/useradd.c
> > ++++ b/src/useradd.c
> > +@@ -1328,10 +1328,7 @@ static void process_flags (int argc, char **argv)
> > +                               if (   ( !VALID (optarg) )
> > +                                   || (   ('\0' != optarg[0])
> > +                                       && ('/'  != optarg[0])
> > +-                                      && ('*'  != optarg[0]) )
> > +-                                  || (stat(optarg, &st) != 0)
> > +-                                  || (S_ISDIR(st.st_mode))
> > +-                                  || (access(optarg, X_OK) != 0)) {
> > ++                                      && ('*'  != optarg[0]) )) {
> > +                                       fprintf (stderr,
> > +                                                _("%s: invalid shell
> '%s'\n"),
> > +                                                Prog, optarg);
> > diff --git
> a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
> b/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
> > deleted file mode 100644
> > index de0ba3ebb42..00000000000
> > ---
> a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
> > +++ /dev/null
> > @@ -1,89 +0,0 @@
> > -From fe34a2a0e44bc80ff213bfd185046a5f10c94997 Mon Sep 17 00:00:00 2001
> > -From: Chris Lamb <chris@chris-lamb.co.uk>
> > -Date: Wed, 2 Jan 2019 18:06:16 +0000
> > -Subject: [PATCH 1/2] Make the sp_lstchg shadow field reproducible (re.
> #71)
> > -
> > -From <https://github.com/shadow-maint/shadow/pull/71>:
> > -
> > -```
> > -The third field in the /etc/shadow file (sp_lstchg) contains the date of
> > -the last password change expressed as the number of days since Jan 1,
> 1970.
> > -As this is a relative time, creating a user today will result in:
> > -
> > -username:17238:0:99999:7:::
> > -whilst creating the same user tomorrow will result in:
> > -
> > -username:17239:0:99999:7:::
> > -This has an impact for the Reproducible Builds[0] project where we aim
> to
> > -be independent of as many elements the build environment as possible,
> > -including the current date.
> > -
> > -This patch changes the behaviour to use the SOURCE_DATE_EPOCH[1]
> > -environment variable (instead of Jan 1, 1970) if valid.
> > -```
> > -
> > -This updated PR adds some missing calls to gettime (). This was
> originally
> > -filed by Johannes Schauer in Debian as #917773 [2].
> > -
> > -[0] https://reproducible-builds.org/
> > -[1] https://reproducible-builds.org/specs/source-date-epoch/
> > -[2] https://bugs.debian.org/917773
> > -
> > -Upstream-Status: Backport
> > -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ----
> > - libmisc/pwd2spwd.c | 3 +--
> > - src/pwck.c         | 2 +-
> > - src/pwconv.c       | 2 +-
> > - 3 files changed, 3 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/libmisc/pwd2spwd.c b/libmisc/pwd2spwd.c
> > -index c1b9b29ac873..6799dd50d490 100644
> > ---- a/libmisc/pwd2spwd.c
> > -+++ b/libmisc/pwd2spwd.c
> > -@@ -40,7 +40,6 @@
> > - #include "prototypes.h"
> > - #include "defines.h"
> > - #include <pwd.h>
> > --extern time_t time (time_t *);
> > -
> > - /*
> > -  * pwd_to_spwd - create entries for new spwd structure
> > -@@ -66,7 +65,7 @@ struct spwd *pwd_to_spwd (const struct passwd *pw)
> > -                */
> > -               sp.sp_min = 0;
> > -               sp.sp_max = (10000L * DAY) / SCALE;
> > --              sp.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
> > -+              sp.sp_lstchg = (long) gettime () / SCALE;
> > -               if (0 == sp.sp_lstchg) {
> > -                       /* Better disable aging than requiring a password
> > -                        * change */
> > -diff --git a/src/pwck.c b/src/pwck.c
> > -index 0ffb711efb13..f70071b12500 100644
> > ---- a/src/pwck.c
> > -+++ b/src/pwck.c
> > -@@ -609,7 +609,7 @@ static void check_pw_file (int *errors, bool
> *changed)
> > -                                       sp.sp_inact  = -1;
> > -                                       sp.sp_expire = -1;
> > -                                       sp.sp_flag   =
> SHADOW_SP_FLAG_UNSET;
> > --                                      sp.sp_lstchg = (long) time
> ((time_t *) 0) / SCALE;
> > -+                                      sp.sp_lstchg = (long) gettime ()
> / SCALE;
> > -                                       if (0 == sp.sp_lstchg) {
> > -                                               /* Better disable aging
> than
> > -                                                * requiring a password
> change
> > -diff --git a/src/pwconv.c b/src/pwconv.c
> > -index 9c69fa131d8e..f932f266c59c 100644
> > ---- a/src/pwconv.c
> > -+++ b/src/pwconv.c
> > -@@ -267,7 +267,7 @@ int main (int argc, char **argv)
> > -                       spent.sp_flag   = SHADOW_SP_FLAG_UNSET;
> > -               }
> > -               spent.sp_pwdp = pw->pw_passwd;
> > --              spent.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
> > -+              spent.sp_lstchg = (long) gettime () / SCALE;
> > -               if (0 == spent.sp_lstchg) {
> > -                       /* Better disable aging than requiring a password
> > -                        * change */
> > ---
> > -2.17.1
> > -
> > diff --git
> a/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
> b/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
> > deleted file mode 100644
> > index a74cbb0c0e7..00000000000
> > ---
> a/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 3c52a84ff8775590e7e9da9c0d4408c23494305e Mon Sep 17 00:00:00 2001
> > -From: Yi Zhao <yi.zhao@windriver.com>
> > -Date: Mon, 17 Jun 2019 15:36:34 +0800
> > -Subject: [PATCH] configure.ac: fix configure error with dash
> > -
> > -A configure error occurs when /bin/sh -> dash:
> > -  checking for is_selinux_enabled in -lselinux... yes
> > -  checking for semanage_connect in -lsemanage... yes
> > -  configure: 16322: test: yesyes: unexpected operator
> > -
> > -Use "=" instead of "==" since dash doesn't support this operator.
> > -
> > -Upstream-Status: Backport
> > -[
> https://github.com/shadow-maint/shadow/commit/3c52a84ff8775590e7e9da9c0d4408c23494305e
> ]
> > -
> > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ----
> > - configure.ac | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 6762556..1907afb 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -500,7 +500,7 @@ if test "$with_selinux" != "no"; then
> > -                       AC_MSG_ERROR([libsemanage not found])
> > -               fi
> > -
> > --              if test "$selinux_lib$semanage_lib" == "yesyes" ; then
> > -+              if test "$selinux_lib$semanage_lib" = "yesyes" ; then
> > -                       AC_DEFINE(WITH_SELINUX, 1,
> > -                                 [Build shadow with SELinux support])
> > -                       LIBSELINUX="-lselinux"
> > ---
> > -2.7.4
> > -
> > diff --git
> a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
> b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
> > deleted file mode 100644
> > index faa6f68ebe2..00000000000
> > ---
> a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
> > +++ /dev/null
> > @@ -1,116 +0,0 @@
> > -Subject: [PATCH] useradd.c: create parent directories when necessary
> > -
> > -Upstream-Status: Inappropriate [OE specific]
> > -
> > -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ----
> > - src/useradd.c | 80
> +++++++++++++++++++++++++++++++++++++++--------------------
> > - 1 file changed, 53 insertions(+), 27 deletions(-)
> > -
> > -diff --git a/src/useradd.c b/src/useradd.c
> > -index 00a3c30..9ecbb58 100644
> > ---- a/src/useradd.c
> > -+++ b/src/useradd.c
> > -@@ -2021,6 +2021,35 @@ static void usr_update (void)
> > - }
> > -
> > - /*
> > -+ * mkdir_p - create directories, including parent directories when
> needed
> > -+ *
> > -+ * similar to `mkdir -p'
> > -+ */
> > -+void mkdir_p(const char *path) {
> > -+      int len = strlen(path);
> > -+      char newdir[len + 1];
> > -+      mode_t mode = 0755;
> > -+      int i = 0;
> > -+
> > -+      if (path[i] == '\0') {
> > -+              return;
> > -+      }
> > -+
> > -+      /* skip the leading '/' */
> > -+      i++;
> > -+
> > -+      while(path[i] != '\0') {
> > -+              if (path[i] == '/') {
> > -+                      strncpy(newdir, path, i);
> > -+                      newdir[i] = '\0';
> > -+                      mkdir(newdir, mode);
> > -+              }
> > -+              i++;
> > -+      }
> > -+      mkdir(path, mode);
> > -+}
> > -+
> > -+/*
> > -  * create_home - create the user's home directory
> > -  *
> > -  *    create_home() creates the user's home directory if it does not
> > -@@ -2038,39 +2067,36 @@ static void create_home (void)
> > -                       fail_exit (E_HOMEDIR);
> > -               }
> > - #endif
> > --              /* XXX - create missing parent directories.  --marekm */
> > --              if (mkdir (prefix_user_home, 0) != 0) {
> > --                      fprintf (stderr,
> > --                               _("%s: cannot create directory %s\n"),
> > --                               Prog, prefix_user_home);
> > -+              mkdir_p(user_home);
> > -+      }
> > -+      if (access (prefix_user_home, F_OK) != 0) {
> > - #ifdef WITH_AUDIT
> > --                      audit_logger (AUDIT_ADD_USER, Prog,
> > --                                    "adding home directory",
> > --                                    user_name, (unsigned int) user_id,
> > --                                    SHADOW_AUDIT_FAILURE);
> > -+              audit_logger (AUDIT_ADD_USER, Prog,
> > -+                            "adding home directory",
> > -+                            user_name, (unsigned int) user_id,
> > -+                            SHADOW_AUDIT_FAILURE);
> > - #endif
> > --                      fail_exit (E_HOMEDIR);
> > --              }
> > --              (void) chown (prefix_user_home, user_id, user_gid);
> > --              chmod (prefix_user_home,
> > --                     0777 & ~getdef_num ("UMASK",
> GETDEF_DEFAULT_UMASK));
> > --              home_added = true;
> > -+              fail_exit (E_HOMEDIR);
> > -+      }
> > -+      (void) chown (prefix_user_home, user_id, user_gid);
> > -+      chmod (prefix_user_home,
> > -+             0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
> > -+      home_added = true;
> > - #ifdef WITH_AUDIT
> > --              audit_logger (AUDIT_ADD_USER, Prog,
> > --                            "adding home directory",
> > --                            user_name, (unsigned int) user_id,
> > --                            SHADOW_AUDIT_SUCCESS);
> > -+      audit_logger (AUDIT_ADD_USER, Prog,
> > -+                    "adding home directory",
> > -+                    user_name, (unsigned int) user_id,
> > -+                    SHADOW_AUDIT_SUCCESS);
> > - #endif
> > - #ifdef WITH_SELINUX
> > --              /* Reset SELinux to create files with default contexts */
> > --              if (reset_selinux_file_context () != 0) {
> > --                      fprintf (stderr,
> > --                               _("%s: cannot reset SELinux file
> creation context\n"),
> > --                               Prog);
> > --                      fail_exit (E_HOMEDIR);
> > --              }
> > --#endif
> > -+      /* Reset SELinux to create files with default contexts */
> > -+      if (reset_selinux_file_context () != 0) {
> > -+              fprintf (stderr,
> > -+                       _("%s: cannot reset SELinux file creation
> context\n"),
> > -+                       Prog);
> > -+              fail_exit (E_HOMEDIR);
> > -       }
> > -+#endif
> > - }
> > -
> > - /*
> > ---
> > -2.11.0
> > -
> > diff --git
> a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
> b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
> > similarity index 81%
> > rename from
> meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
> > rename to
> meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
> > index fa7eb07aa51..c6332e4f766 100644
> > ---
> a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
> > +++
> b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
> > @@ -1,8 +1,12 @@
> > +From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Sat, 16 Nov 2013 15:27:47 +0800
> >  Subject: [PATCH] Allow for setting password in clear text
> >
> >  Upstream-Status: Inappropriate [OE specific]
> >
> >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +
> >  ---
> >   src/Makefile.am |  8 ++++----
> >   src/groupadd.c  | 20 +++++++++++++++-----
> > @@ -12,39 +16,39 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >   5 files changed, 64 insertions(+), 25 deletions(-)
> >
> >  diff --git a/src/Makefile.am b/src/Makefile.am
> > -index 3c98a8d..b8093d5 100644
> > +index f31fd7a..4a317a3 100644
> >  --- a/src/Makefile.am
> >  +++ b/src/Makefile.am
> > -@@ -93,10 +93,10 @@ chgpasswd_LDADD = $(LDADD) $(LIBPAM_SUID)
> $(LIBSELINUX) $(LIBCRYPT)
> > - chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT_NOPAM)
> $(LIBSKEY) $(LIBMD)
> > - chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT)
> > - gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
> > --groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> > -+groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBCRYPT)
> > - groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> > - groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX)
> > --groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> > -+groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBCRYPT)
> > - grpck_LDADD    = $(LDADD) $(LIBSELINUX)
> > - grpconv_LDADD  = $(LDADD) $(LIBSELINUX)
> > - grpunconv_LDADD = $(LDADD) $(LIBSELINUX)
> > -@@ -117,9 +117,9 @@ su_SOURCES     = \
> > +@@ -103,10 +103,10 @@ chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBAUDIT)
> $(LIBSELINUX) $(LIBCRYPT_NOPAM)
> > + chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBCRYPT) $(LIBECONF)
> > + expiry_LDADD = $(LDADD) $(LIBECONF)
> > + gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
> $(LIBECONF)
> > +-groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBECONF)
> > ++groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBECONF) $(LIBCRYPT)
> > + groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBECONF)
> > + groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBECONF)
> > +-groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBECONF)
> > ++groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBECONF) $(LIBCRYPT)
> > + grpck_LDADD    = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> > + grpconv_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> > + grpunconv_LDADD = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> > +@@ -127,9 +127,9 @@ su_SOURCES     = \
> >         suauth.c
> > - su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM)
> $(LIBSKEY) $(LIBMD)
> > - sulogin_LDADD  = $(LDADD) $(LIBCRYPT)
> > --useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)
> > -+useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)
> > - userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE)
> > --usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)
> > -+usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)
> > - vipw_LDADD     = $(LDADD) $(LIBSELINUX)
> > + su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM)
> $(LIBSKEY) $(LIBMD) $(LIBECONF)
> > + sulogin_LDADD  = $(LDADD) $(LIBCRYPT) $(LIBECONF)
> > +-useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
> > ++useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
> > + userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBECONF)
> > +-usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
> > ++usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
> > + vipw_LDADD     = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> >
> >   install-am: all-am
> >  diff --git a/src/groupadd.c b/src/groupadd.c
> > -index b57006c..63e1c48 100644
> > +index e9c4bb7..d572c00 100644
> >  --- a/src/groupadd.c
> >  +++ b/src/groupadd.c
> > -@@ -123,9 +123,10 @@ static /*@noreturn@*/void usage (int status)
> > +@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)
> >         (void) fputs (_("  -o, --non-unique              allow to create
> groups with duplicate\n"
> >                         "                                (non-unique)
> GID\n"), usageout);
> >         (void) fputs (_("  -p, --password PASSWORD       use this
> encrypted password for the new group\n"), usageout);
> > @@ -56,7 +60,7 @@ index b57006c..63e1c48 100644
> >         (void) fputs ("\n", usageout);
> >         exit (status);
> >   }
> > -@@ -387,13 +388,14 @@ static void process_flags (int argc, char **argv)
> > +@@ -391,13 +392,14 @@ static void process_flags (int argc, char **argv)
> >                 {"key",        required_argument, NULL, 'K'},
> >                 {"non-unique", no_argument,       NULL, 'o'},
> >                 {"password",   required_argument, NULL, 'p'},
> > @@ -73,7 +77,7 @@ index b57006c..63e1c48 100644
> >                                  long_options, NULL)) != -1) {
> >                 switch (c) {
> >                 case 'f':
> > -@@ -445,12 +447,20 @@ static void process_flags (int argc, char **argv)
> > +@@ -449,12 +451,20 @@ static void process_flags (int argc, char **argv)
> >                         pflg = true;
> >                         group_passwd = optarg;
> >                         break;
> > @@ -95,7 +99,7 @@ index b57006c..63e1c48 100644
> >                         break;
> >                 default:
> >                         usage (E_USAGE);
> > -@@ -584,7 +594,7 @@ int main (int argc, char **argv)
> > +@@ -588,7 +598,7 @@ int main (int argc, char **argv)
> >         (void) textdomain (PACKAGE);
> >
> >         process_root_flag ("-R", argc, argv);
> > @@ -105,10 +109,10 @@ index b57006c..63e1c48 100644
> >         OPENLOG ("groupadd");
> >   #ifdef WITH_AUDIT
> >  diff --git a/src/groupmod.c b/src/groupmod.c
> > -index b293b98..72daf2c 100644
> > +index bc14438..25ccb44 100644
> >  --- a/src/groupmod.c
> >  +++ b/src/groupmod.c
> > -@@ -134,8 +134,9 @@ static void usage (int status)
> > +@@ -138,8 +138,9 @@ static void usage (int status)
> >         (void) fputs (_("  -o, --non-unique              allow to use a
> duplicate (non-unique) GID\n"), usageout);
> >         (void) fputs (_("  -p, --password PASSWORD       change the
> password to this (encrypted)\n"
> >                         "                                PASSWORD\n"),
> usageout);
> > @@ -119,7 +123,7 @@ index b293b98..72daf2c 100644
> >         (void) fputs ("\n", usageout);
> >         exit (status);
> >   }
> > -@@ -383,11 +384,12 @@ static void process_flags (int argc, char **argv)
> > +@@ -387,11 +388,12 @@ static void process_flags (int argc, char **argv)
> >                 {"new-name",   required_argument, NULL, 'n'},
> >                 {"non-unique", no_argument,       NULL, 'o'},
> >                 {"password",   required_argument, NULL, 'p'},
> > @@ -134,7 +138,7 @@ index b293b98..72daf2c 100644
> >                                  long_options, NULL)) != -1) {
> >                 switch (c) {
> >                 case 'g':
> > -@@ -414,9 +416,17 @@ static void process_flags (int argc, char **argv)
> > +@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv)
> >                         group_passwd = optarg;
> >                         pflg = true;
> >                         break;
> > @@ -153,7 +157,7 @@ index b293b98..72daf2c 100644
> >                         break;
> >                 default:
> >                         usage (E_USAGE);
> > -@@ -757,7 +767,7 @@ int main (int argc, char **argv)
> > +@@ -761,7 +771,7 @@ int main (int argc, char **argv)
> >         (void) textdomain (PACKAGE);
> >
> >         process_root_flag ("-R", argc, argv);
> > @@ -163,10 +167,10 @@ index b293b98..72daf2c 100644
> >         OPENLOG ("groupmod");
> >   #ifdef WITH_AUDIT
> >  diff --git a/src/useradd.c b/src/useradd.c
> > -index c74e491..7214e72 100644
> > +index 1b7bf06..44f09e2 100644
> >  --- a/src/useradd.c
> >  +++ b/src/useradd.c
> > -@@ -829,9 +829,10 @@ static void usage (int status)
> > +@@ -853,9 +853,10 @@ static void usage (int status)
> >         (void) fputs (_("  -o, --non-unique              allow to create
> users with duplicate\n"
> >                         "                                (non-unique)
> UID\n"), usageout);
> >         (void) fputs (_("  -p, --password PASSWORD       encrypted
> password of the new account\n"), usageout);
> > @@ -178,7 +182,7 @@ index c74e491..7214e72 100644
> >         (void) fputs (_("  -s, --shell SHELL             login shell of
> the new account\n"), usageout);
> >         (void) fputs (_("  -u, --uid UID                 user ID of the
> new account\n"), usageout);
> >         (void) fputs (_("  -U, --user-group              create a group
> with the same name as the user\n"), usageout);
> > -@@ -1104,9 +1105,10 @@ static void process_flags (int argc, char **argv)
> > +@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **argv)
> >                         {"no-user-group",  no_argument,       NULL, 'N'},
> >                         {"non-unique",     no_argument,       NULL, 'o'},
> >                         {"password",       required_argument, NULL, 'p'},
> > @@ -190,7 +194,7 @@ index c74e491..7214e72 100644
> >                         {"shell",          required_argument, NULL, 's'},
> >                         {"uid",            required_argument, NULL, 'u'},
> >                         {"user-group",     no_argument,       NULL, 'U'},
> > -@@ -1117,9 +1119,9 @@ static void process_flags (int argc, char **argv)
> > +@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **argv)
> >                 };
> >                 while ((c = getopt_long (argc, argv,
> >   #ifdef WITH_SELINUX
> > @@ -202,7 +206,7 @@ index c74e491..7214e72 100644
> >   #endif                                /* !WITH_SELINUX */
> >                                          long_options, NULL)) != -1) {
> >                         switch (c) {
> > -@@ -1285,12 +1287,19 @@ static void process_flags (int argc, char
> **argv)
> > +@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char
> **argv)
> >                                 }
> >                                 user_pass = optarg;
> >                                 break;
> > @@ -223,7 +227,7 @@ index c74e491..7214e72 100644
> >                                 break;
> >                         case 's':
> >                                 if (   ( !VALID (optarg) )
> > -@@ -2148,7 +2157,7 @@ int main (int argc, char **argv)
> > +@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)
> >
> >         process_root_flag ("-R", argc, argv);
> >
> > @@ -233,10 +237,10 @@ index c74e491..7214e72 100644
> >         OPENLOG ("useradd");
> >   #ifdef WITH_AUDIT
> >  diff --git a/src/usermod.c b/src/usermod.c
> > -index e571426..ccfbb99 100644
> > +index 21c6da9..cffdb3e 100644
> >  --- a/src/usermod.c
> >  +++ b/src/usermod.c
> > -@@ -424,8 +424,9 @@ static /*@noreturn@*/void usage (int status)
> > +@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)
> >                         "                                new location
> (use only with -d)\n"), usageout);
> >         (void) fputs (_("  -o, --non-unique              allow using
> duplicate (non-unique) UID\n"), usageout);
> >         (void) fputs (_("  -p, --password PASSWORD       use encrypted
> password for the new password\n"), usageout);
> > @@ -247,7 +251,7 @@ index e571426..ccfbb99 100644
> >         (void) fputs (_("  -s, --shell SHELL             new login shell
> for the user account\n"), usageout);
> >         (void) fputs (_("  -u, --uid UID                 new UID for the
> user account\n"), usageout);
> >         (void) fputs (_("  -U, --unlock                  unlock the user
> account\n"), usageout);
> > -@@ -1002,8 +1003,9 @@ static void process_flags (int argc, char **argv)
> > +@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **argv)
> >                         {"move-home",    no_argument,       NULL, 'm'},
> >                         {"non-unique",   no_argument,       NULL, 'o'},
> >                         {"password",     required_argument, NULL, 'p'},
> > @@ -258,16 +262,16 @@ index e571426..ccfbb99 100644
> >                         {"shell",        required_argument, NULL, 's'},
> >                         {"uid",          required_argument, NULL, 'u'},
> >                         {"unlock",       no_argument,       NULL, 'U'},
> > -@@ -1019,7 +1021,7 @@ static void process_flags (int argc, char **argv)
> > +@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **argv)
> >                         {NULL, 0, NULL, '\0'}
> >                 };
> >                 while ((c = getopt_long (argc, argv,
> > --                                       "ac:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
> > -+
>  "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
> > +-
>  "abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
> > ++
>  "abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
> >   #ifdef ENABLE_SUBIDS
> >                                          "v:w:V:W:"
> >   #endif                                /* ENABLE_SUBIDS */
> > -@@ -1119,9 +1121,17 @@ static void process_flags (int argc, char **argv)
> > +@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **argv)
> >                                 user_pass = optarg;
> >                                 pflg = true;
> >                                 break;
> > @@ -286,7 +290,7 @@ index e571426..ccfbb99 100644
> >                                 break;
> >                         case 's':
> >                                 if (!VALID (optarg)) {
> > -@@ -2098,7 +2108,7 @@ int main (int argc, char **argv)
> > +@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)
> >         (void) textdomain (PACKAGE);
> >
> >         process_root_flag ("-R", argc, argv);
> > @@ -295,6 +299,3 @@ index e571426..ccfbb99 100644
> >
> >         OPENLOG ("usermod");
> >   #ifdef WITH_AUDIT
> > ---
> > -2.11.0
> > -
> > diff --git
> a/meta/recipes-extended/shadow/files/0004-useradd.c-create-parent-directories-when-necessary.patch
> b/meta/recipes-extended/shadow/files/0004-useradd.c-create-parent-directories-when-necessary.patch
> > new file mode 100644
> > index 00000000000..77357027764
> > --- /dev/null
> > +++
> b/meta/recipes-extended/shadow/files/0004-useradd.c-create-parent-directories-when-necessary.patch
> > @@ -0,0 +1,63 @@
> > +From b406a7f4c3d6472885b75320ea63f140e021ff03 Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Thu, 17 Jul 2014 15:53:34 +0800
> > +Subject: [PATCH] useradd.c: create parent directories when necessary
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +
> > +---
> > + src/useradd.c | 32 +++++++++++++++++++++++++++++++-
> > + 1 file changed, 31 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/useradd.c b/src/useradd.c
> > +index 44f09e2..fec0986 100644
> > +--- a/src/useradd.c
> > ++++ b/src/useradd.c
> > +@@ -2065,6 +2065,36 @@ static void usr_update (void)
> > +       }
> > + }
> > +
> > ++/*
> > ++ * mkdir_p - create directories, including parent directories when
> needed
> > ++ *
> > ++ * similar to `mkdir -p'
> > ++ */
> > ++int mkdir_p(const char *path) {
> > ++      int len = strlen(path);
> > ++      char newdir[len + 1];
> > ++      mode_t mode = 0755;
> > ++      int i = 0;
> > ++
> > ++      if (path[i] == '\0') {
> > ++              return 0;
> > ++      }
> > ++
> > ++      /* skip the leading '/' */
> > ++      i++;
> > ++
> > ++      while(path[i] != '\0') {
> > ++              if (path[i] == '/') {
> > ++                      strncpy(newdir, path, i);
> > ++                      newdir[i] = '\0';
> > ++                      mkdir(newdir, mode);
> > ++              }
> > ++              i++;
> > ++      }
> > ++      mkdir(path, mode);
> > ++        return 0;
> > ++}
> > ++
> > + /*
> > +  * create_home - create the user's home directory
> > +  *
> > +@@ -2137,7 +2167,7 @@ static void create_home (void)
> > +                               }
> > +                               else
> > + #endif
> > +-                              if (mkdir (path, 0) != 0) {
> > ++                              if ((mkdir_p (path) == 0) && (access
> (prefix_user_home, F_OK) != 0)) {
> > +                       fprintf (stderr,
> > +                                                       _("%s: cannot
> create directory %s\n"),
> > +                                                       Prog, path);
> > diff --git
> a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> > index 4fa3d184edf..98252163692 100644
> > ---
> a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> > +++
> b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> > @@ -1,3 +1,8 @@
> > +From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Thu, 17 Jul 2014 15:53:34 +0800
> > +Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
> > +
> >  Upstream-Status: Inappropriate [OE specific]
> >
> >  commonio.c: fix unexpected open failure in chroot environment
> > @@ -10,15 +15,16 @@ Note that this patch doesn't change the logic in the
> code, it just expands
> >  the codes.
> >
> >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +
> >  ---
> > - lib/commonio.c |   16 ++++++++++++----
> > + lib/commonio.c | 16 ++++++++++++----
> >   1 file changed, 12 insertions(+), 4 deletions(-)
> >
> >  diff --git a/lib/commonio.c b/lib/commonio.c
> > -index cc536bf..51cafd9 100644
> > +index 16fa7e7..d6bc297 100644
> >  --- a/lib/commonio.c
> >  +++ b/lib/commonio.c
> > -@@ -613,10 +613,18 @@ int commonio_open (struct commonio_db *db, int
> mode)
> > +@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int
> mode)
> >         db->cursor = NULL;
> >         db->changed = false;
> >
> > @@ -41,6 +47,3 @@ index cc536bf..51cafd9 100644
> >         db->fp = NULL;
> >         if (fd >= 0) {
> >   #ifdef WITH_TCB
> > ---
> > -1.7.9.5
> > -
> > diff --git
> a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
> b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
> > index 1af04d5fe89..cc833362e9a 100644
> > --- a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
> > +++ b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
> > @@ -1,26 +1,37 @@
> > +From ca472d6866e545aaa70a70020e3226f236a8aafc Mon Sep 17 00:00:00 2001
> > +From: Shan Hai <shan.hai@windriver.com>
> > +Date: Tue, 13 Sep 2016 13:45:46 +0800
> > +Subject: [PATCH] shadow: use relaxed usernames
> >
> >  The groupadd from shadow does not allow upper case group names, the
> >  same is true for the upstream shadow. But distributions like
> >  Debian/Ubuntu/CentOS has their own way to cope with this problem,
> >  this patch is picked up from CentOS release 7.0 to relax the usernames
> >  restrictions to allow the upper case group names, and the relaxation is
> > -POSIX compliant because POSIX indicate that usernames are composed of
> > +POSIX compliant because POSIX indicate that usernames are composed of
> >  characters from the portable filename character set [A-Za-z0-9._-].
> >
> >  Upstream-Status: Pending
> >
> > -Signed-off-by: Shan Hai <shan.hai@windriver.com>
> > +Signed-off-by: Shan Hai <shan.hai@windriver.com>
> >
> > -diff -urpN a/libmisc/chkname.c b/libmisc/chkname.c
> > -index 5089112..f40a0da 100644
> > +---
> > + libmisc/chkname.c  | 30 ++++++++++++++++++------------
> > + man/groupadd.8.xml |  6 ------
> > + man/useradd.8.xml  |  8 +-------
> > + 3 files changed, 19 insertions(+), 25 deletions(-)
> > +
> > +diff --git a/libmisc/chkname.c b/libmisc/chkname.c
> > +index 90f185c..65762b4 100644
> >  --- a/libmisc/chkname.c
> >  +++ b/libmisc/chkname.c
> > -@@ -49,21 +49,28 @@
> > - static bool is_valid_name (const char *name)
> > - {
> > +@@ -55,22 +55,28 @@ static bool is_valid_name (const char *name)
> > +       }
> > +
> >         /*
> >  -       * User/group names must match [a-z_][a-z0-9_-]*[$]
> >  -       */
> > +-
> >  -      if (('\0' == *name) ||
> >  -          !((('a' <= *name) && ('z' >= *name)) || ('_' == *name))) {
> >  +         * User/group names must match gnu e-regex:
> > @@ -55,28 +66,28 @@ index 5089112..f40a0da 100644
> >                         return false;
> >                 }
> >         }
> > -diff -urpN a/man/groupadd.8.xml b/man/groupadd.8.xml
> > -index 230fd0c..94f7807 100644
> > +diff --git a/man/groupadd.8.xml b/man/groupadd.8.xml
> > +index 1e58f09..d804b61 100644
> >  --- a/man/groupadd.8.xml
> >  +++ b/man/groupadd.8.xml
> > -@@ -222,12 +222,6 @@
> > +@@ -272,12 +272,6 @@
> > +
> >      <refsect1 id='caveats'>
> >        <title>CAVEATS</title>
> > -      <para>
> > +-     <para>
> >  -       Groupnames must start with a lower case letter or an underscore,
> >  -       followed by lower case letters, digits, underscores, or dashes.
> >  -       They can end with a dollar sign.
> >  -       In regular expression terms: [a-z_][a-z0-9_-]*[$]?
> >  -     </para>
> > --     <para>
> > +      <para>
> >          Groupnames may only be up to &GROUP_NAME_MAX_LENGTH; characters
> long.
> >        </para>
> > -      <para>
> > -diff -urpN a/man/useradd.8.xml b/man/useradd.8.xml
> > -index 5dec989..fe623b9 100644
> > +diff --git a/man/useradd.8.xml b/man/useradd.8.xml
> > +index a16d730..c0bd777 100644
> >  --- a/man/useradd.8.xml
> >  +++ b/man/useradd.8.xml
> > -@@ -336,7 +336,7 @@
> > +@@ -366,7 +366,7 @@
> >         </term>
> >         <listitem>
> >           <para>
> > @@ -85,16 +96,16 @@ index 5dec989..fe623b9 100644
> >             wide setting from <filename>/etc/login.defs</filename>
> >             (<option>CREATE_HOME</option>) is set to
> >             <replaceable>yes</replaceable>.
> > -@@ -607,12 +607,6 @@
> > +@@ -660,12 +660,6 @@
> > +       the user account creation request.
> >       </para>
> >
> > -     <para>
> > +-    <para>
> >  -      Usernames must start with a lower case letter or an underscore,
> >  -      followed by lower case letters, digits, underscores, or dashes.
> >  -      They can end with a dollar sign.
> >  -      In regular expression terms: [a-z_][a-z0-9_-]*[$]?
> >  -    </para>
> > --    <para>
> > +     <para>
> >         Usernames may only be up to 32 characters long.
> >       </para>
> > -   </refsect1>
> > diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> > index 770c239e96d..d07b507532f 100644
> > --- a/meta/recipes-extended/shadow/shadow.inc
> > +++ b/meta/recipes-extended/shadow/shadow.inc
> > @@ -11,8 +11,6 @@ DEPENDS = "virtual/crypt"
> >  UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
> >  SRC_URI = "
> https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz
> \
> >             file://shadow-4.1.3-dots-in-usernames.patch \
> > -
>  file://0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch  \
> > -           file://0001-configure.ac-fix-configure-error-with-dash.patch
> \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'pam',
> '${PAM_SRC_URI}', '', d)} \
> >             file://shadow-relaxed-usernames.patch \
> >             "
> > @@ -24,16 +22,17 @@ SRC_URI_append_class-target = " \
> >
> >  SRC_URI_append_class-native = " \
> >             file://0001-Disable-use-of-syslog-for-sysroot.patch \
> > -           file://allow-for-setting-password-in-clear-text.patch \
> > +           file://0002-Allow-for-setting-password-in-clear-text.patch \
> >
>  file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
> > -
>  file://0001-useradd.c-create-parent-directories-when-necessary.patch \
> > +
>  file://0004-useradd.c-create-parent-directories-when-necessary.patch \
> > +
>  file://0001-Do-not-check-for-validity-of-shell-executable.patch \
> >             "
> >  SRC_URI_append_class-nativesdk = " \
> >             file://0001-Disable-use-of-syslog-for-sysroot.patch \
> >             "
> >
> > -SRC_URI[md5sum] = "36feb15665338ae3de414f2a88e434db"
> > -SRC_URI[sha256sum] =
> "4668f99bd087399c4a586084dc3b046b75f560720d83e92fd23bf7a89dda4d31"
> > +SRC_URI[md5sum] = "017ac773ba370bc28e157cee30dad71a"
> > +SRC_URI[sha256sum] =
> "82016d65317555fc8ce9e669eb187984d8d4b1f8ecda0769f4bc5412aed326e4"
> >
> >  # Additional Policy files for PAM
> >  PAM_SRC_URI = "file://pam.d/chfn \
> > diff --git a/meta/recipes-extended/shadow/shadow_4.6.bb
> b/meta/recipes-extended/shadow/shadow_4.8.bb
> > similarity index 100%
> > rename from meta/recipes-extended/shadow/shadow_4.6.bb
> > rename to meta/recipes-extended/shadow/shadow_4.8.bb
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Alex Kiernan
>

--000000000000f31768059957f201
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I have now dropped it.</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 10 Dec 2019 at 05:57, Alex Kiernan &lt;<a href=3D"m=
ailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Dec 5, 2019 at =
3:46 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop two backports.<br>
&gt;<br>
&gt; Refactor 0001-useradd.c-create-parent-directories-when-necessary.patch=
<br>
&gt; to make the changes less invasive (and easier to rebase).<br>
&gt;<br>
<br>
Is that change even needed any more?<br>
<br>
<a href=3D"https://github.com/shadow-maint/shadow/commit/b3b6d9d77c1d18b986=
70b97157777bb74092cd69" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/shadow-maint/shadow/commit/b3b6d9d77c1d18b98670b97157777bb74092cd69</a=
><br>
<br>
Looks like it ought to be doing the same thing.<br>
<br>
&gt; Rebase the rest of the paches.<br>
&gt;<br>
&gt; Add a patch to remove the check for validity of login shells<br>
&gt; which does not work in our environment.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...01-Disable-use-of-syslog-for-sysroot.patch |=C2=A0 18 ++-<br>
&gt;=C2=A0 ...eck-for-validity-of-shell-executable.patch |=C2=A0 29 +++++<b=
r>
&gt;=C2=A0 ...chg-shadow-field-reproducible-re.-71.patch |=C2=A0 89 -------=
-------<br>
&gt;=C2=A0 ...ure.ac-fix-configure-error-with-dash.patch |=C2=A0 36 ------<=
br>
&gt;=C2=A0 ...te-parent-directories-when-necessary.patch | 116 ------------=
------<br>
&gt;=C2=A0 ...-for-setting-password-in-clear-text.patch} | 101 +++++++-----=
---<br>
&gt;=C2=A0 ...te-parent-directories-when-necessary.patch |=C2=A0 63 +++++++=
+++<br>
&gt;=C2=A0 ...nexpected-open-failure-in-chroot-env.patch |=C2=A0 15 ++-<br>
&gt;=C2=A0 .../files/shadow-relaxed-usernames.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 51 +++++---<br>
&gt;=C2=A0 meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 .../shadow/{<a href=3D"http://shadow_4.6.bb" rel=3D"noreferrer" =
target=3D"_blank">shadow_4.6.bb</a> =3D&gt; <a href=3D"http://shadow_4.8.bb=
" rel=3D"noreferrer" target=3D"_blank">shadow_4.8.bb</a>}=C2=A0 =C2=A0|=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 11 files changed, 196 insertions(+), 333 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/shadow/files/0001-Do-no=
t-check-for-validity-of-shell-executable.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/shadow/files/0001-Make-=
the-sp_lstchg-shadow-field-reproducible-re.-71.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/shadow/files/0001-confi=
gure.ac-fix-configure-error-with-dash.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/shadow/files/0001-usera=
dd.c-create-parent-directories-when-necessary.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/shadow/files/{allow-for-setting-pas=
sword-in-clear-text.patch =3D&gt; 0002-Allow-for-setting-password-in-clear-=
text.patch} (81%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/shadow/files/0004-usera=
dd.c-create-parent-directories-when-necessary.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/shadow/{<a href=3D"http://shadow_4.=
6.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.6.bb</a> =3D&gt; <a hre=
f=3D"http://shadow_4.8.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.8.=
bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-sy=
slog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-us=
e-of-syslog-for-sysroot.patch<br>
&gt; index aac2d42b12a..ab317b9aa03 100644<br>
&gt; --- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-fo=
r-sysroot.patch<br>
&gt; +++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-fo=
r-sysroot.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 8cf3454d567f77233023be49a39a33e9f0836f89 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.co=
m" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 14 Apr 2016 12:28:57 +0200<br>
&gt;=C2=A0 Subject: [PATCH] Disable use of syslog for sysroot<br>
&gt; @@ -12,6 +12,7 @@ Upstream-Status: Inappropriate [disable feature]<br>
&gt;=C2=A0 Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman=
@intel.com" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kj=
ellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<=
br>
&gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.c=
om" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/groupadd.c=C2=A0 | 3 +++<br>
&gt;=C2=A0 =C2=A0src/groupdel.c=C2=A0 | 3 +++<br>
&gt; @@ -23,7 +24,7 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen=
@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A07 files changed, 21 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/src/groupadd.c b/src/groupadd.c<br>
&gt; -index 63e1c48..a596c49 100644<br>
&gt; +index 2dd8eec..e9c4bb7 100644<br>
&gt;=C2=A0 --- a/src/groupadd.c<br>
&gt;=C2=A0 +++ b/src/groupadd.c<br>
&gt;=C2=A0 @@ -34,6 +34,9 @@<br>
&gt; @@ -37,7 +38,7 @@ index 63e1c48..a596c49 100644<br>
&gt;=C2=A0 =C2=A0#include &lt;fcntl.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;getopt.h&gt;<br>
&gt;=C2=A0 diff --git a/src/groupdel.c b/src/groupdel.c<br>
&gt; -index 70bed01..ababd81 100644<br>
&gt; +index f941a84..5a70056 100644<br>
&gt;=C2=A0 --- a/src/groupdel.c<br>
&gt;=C2=A0 +++ b/src/groupdel.c<br>
&gt;=C2=A0 @@ -34,6 +34,9 @@<br>
&gt; @@ -65,7 +66,7 @@ index fc91c8b..2842514 100644<br>
&gt;=C2=A0 =C2=A0#include &lt;getopt.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;grp.h&gt;<br>
&gt;=C2=A0 diff --git a/src/groupmod.c b/src/groupmod.c<br>
&gt; -index 72daf2c..8965f9d 100644<br>
&gt; +index 1dca5fc..bc14438 100644<br>
&gt;=C2=A0 --- a/src/groupmod.c<br>
&gt;=C2=A0 +++ b/src/groupmod.c<br>
&gt;=C2=A0 @@ -34,6 +34,9 @@<br>
&gt; @@ -79,7 +80,7 @@ index 72daf2c..8965f9d 100644<br>
&gt;=C2=A0 =C2=A0#include &lt;fcntl.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;getopt.h&gt;<br>
&gt;=C2=A0 diff --git a/src/useradd.c b/src/useradd.c<br>
&gt; -index 3aaf45c..1ab9174 100644<br>
&gt; +index 4af0f7c..1b7bf06 100644<br>
&gt;=C2=A0 --- a/src/useradd.c<br>
&gt;=C2=A0 +++ b/src/useradd.c<br>
&gt;=C2=A0 @@ -34,6 +34,9 @@<br>
&gt; @@ -93,7 +94,7 @@ index 3aaf45c..1ab9174 100644<br>
&gt;=C2=A0 =C2=A0#include &lt;ctype.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;errno.h&gt;<br>
&gt;=C2=A0 diff --git a/src/userdel.c b/src/userdel.c<br>
&gt; -index c8de1d3..24d3ea9 100644<br>
&gt; +index cc951e5..153e0be 100644<br>
&gt;=C2=A0 --- a/src/userdel.c<br>
&gt;=C2=A0 +++ b/src/userdel.c<br>
&gt;=C2=A0 @@ -34,6 +34,9 @@<br>
&gt; @@ -107,7 +108,7 @@ index c8de1d3..24d3ea9 100644<br>
&gt;=C2=A0 =C2=A0#include &lt;errno.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;fcntl.h&gt;<br>
&gt;=C2=A0 diff --git a/src/usermod.c b/src/usermod.c<br>
&gt; -index ccfbb99..24fb60d 100644<br>
&gt; +index 05b9871..21c6da9 100644<br>
&gt;=C2=A0 --- a/src/usermod.c<br>
&gt;=C2=A0 +++ b/src/usermod.c<br>
&gt;=C2=A0 @@ -34,6 +34,9 @@<br>
&gt; @@ -120,6 +121,3 @@ index ccfbb99..24fb60d 100644<br>
&gt;=C2=A0 =C2=A0#include &lt;assert.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;ctype.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;errno.h&gt;<br>
&gt; ---<br>
&gt; -2.11.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/0001-Do-not-check-for-=
validity-of-shell-executable.patch b/meta/recipes-extended/shadow/files/000=
1-Do-not-check-for-validity-of-shell-executable.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..2d15ff0673a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validit=
y-of-shell-executable.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +From 0d0aded7307a9f4ee0d299951512acd18b3e029e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 4 Dec 2019 19:28:48 +0100<br>
&gt; +Subject: [PATCH] Do not check for validity of shell executable.<br>
&gt; +<br>
&gt; +This kind of check fails when building a rootfs.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/useradd.c | 5 +----<br>
&gt; + 1 file changed, 1 insertion(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/useradd.c b/src/useradd.c<br>
&gt; +index 4af0f7c..898fe02 100644<br>
&gt; +--- a/src/useradd.c<br>
&gt; ++++ b/src/useradd.c<br>
&gt; +@@ -1328,10 +1328,7 @@ static void process_flags (int argc, char **ar=
gv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=C2=A0 =C2=A0( !VALID (optarg=
) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (=C2=A0 =C2=A0(&=
#39;\0&#39; !=3D optarg[0])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
&amp; (&#39;/&#39;=C2=A0 !=3D optarg[0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&am=
p; (&#39;*&#39;=C2=A0 !=3D optarg[0]) )<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (stat(optarg, &amp;=
st) !=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (S_ISDIR(st.st_mode=
))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (access(optarg, X_O=
K) !=3D 0)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&am=
p; (&#39;*&#39;=C2=A0 !=3D optarg[0]) )) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprin=
tf (stderr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _(&quot;%s: invalid shell &#39;%s&#39;\n&quot;),<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Prog, optarg);<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstch=
g-shadow-field-reproducible-re.-71.patch b/meta/recipes-extended/shadow/fil=
es/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch<br>
&gt; deleted file mode 100644<br>
&gt; index de0ba3ebb42..00000000000<br>
&gt; --- a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shado=
w-field-reproducible-re.-71.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,89 +0,0 @@<br>
&gt; -From fe34a2a0e44bc80ff213bfd185046a5f10c94997 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Chris Lamb &lt;<a href=3D"mailto:chris@chris-lamb.co.uk" target=
=3D"_blank">chris@chris-lamb.co.uk</a>&gt;<br>
&gt; -Date: Wed, 2 Jan 2019 18:06:16 +0000<br>
&gt; -Subject: [PATCH 1/2] Make the sp_lstchg shadow field reproducible (re=
. #71)<br>
&gt; -<br>
&gt; -From &lt;<a href=3D"https://github.com/shadow-maint/shadow/pull/71" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/shadow-maint/shadow/=
pull/71</a>&gt;:<br>
&gt; -<br>
&gt; -```<br>
&gt; -The third field in the /etc/shadow file (sp_lstchg) contains the date=
 of<br>
&gt; -the last password change expressed as the number of days since Jan 1,=
 1970.<br>
&gt; -As this is a relative time, creating a user today will result in:<br>
&gt; -<br>
&gt; -username:17238:0:99999:7:::<br>
&gt; -whilst creating the same user tomorrow will result in:<br>
&gt; -<br>
&gt; -username:17239:0:99999:7:::<br>
&gt; -This has an impact for the Reproducible Builds[0] project where we ai=
m to<br>
&gt; -be independent of as many elements the build environment as possible,=
<br>
&gt; -including the current date.<br>
&gt; -<br>
&gt; -This patch changes the behaviour to use the SOURCE_DATE_EPOCH[1]<br>
&gt; -environment variable (instead of Jan 1, 1970) if valid.<br>
&gt; -```<br>
&gt; -<br>
&gt; -This updated PR adds some missing calls to gettime (). This was origi=
nally<br>
&gt; -filed by Johannes Schauer in Debian as #917773 [2].<br>
&gt; -<br>
&gt; -[0] <a href=3D"https://reproducible-builds.org/" rel=3D"noreferrer" t=
arget=3D"_blank">https://reproducible-builds.org/</a><br>
&gt; -[1] <a href=3D"https://reproducible-builds.org/specs/source-date-epoc=
h/" rel=3D"noreferrer" target=3D"_blank">https://reproducible-builds.org/sp=
ecs/source-date-epoch/</a><br>
&gt; -[2] <a href=3D"https://bugs.debian.org/917773" rel=3D"noreferrer" tar=
get=3D"_blank">https://bugs.debian.org/917773</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.=
com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - libmisc/pwd2spwd.c | 3 +--<br>
&gt; - src/pwck.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; - src/pwconv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; - 3 files changed, 3 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/libmisc/pwd2spwd.c b/libmisc/pwd2spwd.c<br>
&gt; -index c1b9b29ac873..6799dd50d490 100644<br>
&gt; ---- a/libmisc/pwd2spwd.c<br>
&gt; -+++ b/libmisc/pwd2spwd.c<br>
&gt; -@@ -40,7 +40,6 @@<br>
&gt; - #include &quot;prototypes.h&quot;<br>
&gt; - #include &quot;defines.h&quot;<br>
&gt; - #include &lt;pwd.h&gt;<br>
&gt; --extern time_t time (time_t *);<br>
&gt; -<br>
&gt; - /*<br>
&gt; -=C2=A0 * pwd_to_spwd - create entries for new spwd structure<br>
&gt; -@@ -66,7 +65,7 @@ struct spwd *pwd_to_spwd (const struct passwd *pw)<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sp_min =3D =
0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sp_max =3D =
(10000L * DAY) / SCALE;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp.sp_lstchg =3D (l=
ong) time ((time_t *) 0) / SCALE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp.sp_lstchg =3D (l=
ong) gettime () / SCALE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (0 =3D=3D s=
p.sp_lstchg) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* Better disable aging than requiring a password<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 * change */<br>
&gt; -diff --git a/src/pwck.c b/src/pwck.c<br>
&gt; -index 0ffb711efb13..f70071b12500 100644<br>
&gt; ---- a/src/pwck.c<br>
&gt; -+++ b/src/pwck.c<br>
&gt; -@@ -609,7 +609,7 @@ static void check_pw_file (int *errors, bool *cha=
nged)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sp=
_inact=C2=A0 =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sp=
_expire =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sp=
_flag=C2=A0 =C2=A0=3D SHADOW_SP_FLAG_UNSET;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp.sp_ls=
tchg =3D (long) time ((time_t *) 0) / SCALE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp.sp_ls=
tchg =3D (long) gettime () / SCALE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (0=
 =3D=3D sp.sp_lstchg) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Better disable aging than<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 * requiring a password change<br>
&gt; -diff --git a/src/pwconv.c b/src/pwconv.c<br>
&gt; -index 9c69fa131d8e..f932f266c59c 100644<br>
&gt; ---- a/src/pwconv.c<br>
&gt; -+++ b/src/pwconv.c<br>
&gt; -@@ -267,7 +267,7 @@ int main (int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spent.sp_flag=C2=A0 =C2=A0=3D SHADOW_SP_FLAG_UNSET;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spent.sp_pwdp =
=3D pw-&gt;pw_passwd;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spent.sp_lstchg =3D=
 (long) time ((time_t *) 0) / SCALE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spent.sp_lstchg =3D=
 (long) gettime () / SCALE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (0 =3D=3D s=
pent.sp_lstchg) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* Better disable aging than requiring a password<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 * change */<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/0001-configure.ac-fix-=
configure-error-with-dash.patch b/meta/recipes-extended/shadow/files/0001-c=
onfigure.ac-fix-configure-error-with-dash.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a74cbb0c0e7..00000000000<br>
&gt; --- a/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configu=
re-error-with-dash.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,36 +0,0 @@<br>
&gt; -From 3c52a84ff8775590e7e9da9c0d4408c23494305e Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"=
_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; -Date: Mon, 17 Jun 2019 15:36:34 +0800<br>
&gt; -Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>: fix configure error with dash<br>
&gt; -<br>
&gt; -A configure error occurs when /bin/sh -&gt; dash:<br>
&gt; -=C2=A0 checking for is_selinux_enabled in -lselinux... yes<br>
&gt; -=C2=A0 checking for semanage_connect in -lsemanage... yes<br>
&gt; -=C2=A0 configure: 16322: test: yesyes: unexpected operator<br>
&gt; -<br>
&gt; -Use &quot;=3D&quot; instead of &quot;=3D=3D&quot; since dash doesn&#3=
9;t support this operator.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/shadow-maint/shadow/commit/3c52a84ff87=
75590e7e9da9c0d4408c23494305e" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/shadow-maint/shadow/commit/3c52a84ff8775590e7e9da9c0d4408c23494=
305e</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 6762556..1907afb 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -500,7 +500,7 @@ if test &quot;$with_selinux&quot; !=3D &quot;no&q=
uot;; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AC_MSG_ERROR([libsemanage not found])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$seli=
nux_lib$semanage_lib&quot; =3D=3D &quot;yesyes&quot; ; then<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$seli=
nux_lib$semanage_lib&quot; =3D &quot;yesyes&quot; ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AC_DEFINE(WITH_SELINUX, 1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Build shadow with SELinux=
 support])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0LIBSELINUX=3D&quot;-lselinux&quot;<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/0001-useradd.c-create-=
parent-directories-when-necessary.patch b/meta/recipes-extended/shadow/file=
s/0001-useradd.c-create-parent-directories-when-necessary.patch<br>
&gt; deleted file mode 100644<br>
&gt; index faa6f68ebe2..00000000000<br>
&gt; --- a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-=
directories-when-necessary.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,116 +0,0 @@<br>
&gt; -Subject: [PATCH] useradd.c: create parent directories when necessary<=
br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [OE specific]<br>
&gt; -<br>
&gt; -Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/useradd.c | 80 +++++++++++++++++++++++++++++++++++++++----------=
----------<br>
&gt; - 1 file changed, 53 insertions(+), 27 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/useradd.c b/src/useradd.c<br>
&gt; -index 00a3c30..9ecbb58 100644<br>
&gt; ---- a/src/useradd.c<br>
&gt; -+++ b/src/useradd.c<br>
&gt; -@@ -2021,6 +2021,35 @@ static void usr_update (void)<br>
&gt; - }<br>
&gt; -<br>
&gt; - /*<br>
&gt; -+ * mkdir_p - create directories, including parent directories when n=
eeded<br>
&gt; -+ *<br>
&gt; -+ * similar to `mkdir -p&#39;<br>
&gt; -+ */<br>
&gt; -+void mkdir_p(const char *path) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 int len =3D strlen(path);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 char newdir[len + 1];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mode_t mode =3D 0755;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (path[i] =3D=3D &#39;\0&#39;) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* skip the leading &#39;/&#39; */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 while(path[i] !=3D &#39;\0&#39;) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (path[i] =3D=3D =
&#39;/&#39;) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 strncpy(newdir, path, i);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 newdir[i] =3D &#39;\0&#39;;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mkdir(newdir, mode);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mkdir(path, mode);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -=C2=A0 * create_home - create the user&#39;s home directory<br>
&gt; -=C2=A0 *<br>
&gt; -=C2=A0 *=C2=A0 =C2=A0 create_home() creates the user&#39;s home direc=
tory if it does not<br>
&gt; -@@ -2038,39 +2067,36 @@ static void create_home (void)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0fail_exit (E_HOMEDIR);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - #endif<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XXX - create mis=
sing parent directories.=C2=A0 --marekm */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mkdir (prefix_u=
ser_home, 0) !=3D 0) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf (stderr,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;%s: cannot create dire=
ctory %s\n&quot;),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prog, prefix_user_home);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_p(user_home);=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (access (prefix_user_home, F_OK) !=3D 0) {<b=
r>
&gt; - #ifdef WITH_AUDIT<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 audit_logger (AUDIT_ADD_USER, Prog,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;adding ho=
me directory&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_name, (uns=
igned int) user_id,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHADOW_AUDIT_FA=
ILURE);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audit_logger (AUDIT=
_ADD_USER, Prog,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;adding home directory&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_name, (unsigned int) user_id,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHADOW_AUDIT_FAILURE);<br>
&gt; - #endif<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fail_exit (E_HOMEDIR);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) chown (prefi=
x_user_home, user_id, user_gid);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod (prefix_user_=
home,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00777 &amp; ~getdef_num (&quot;UMASK&quot;, GETDEF_DEFAULT_UMASK))=
;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 home_added =3D true=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_exit (E_HOMEDI=
R);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 (void) chown (prefix_user_home, user_id, user_g=
id);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 chmod (prefix_user_home,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00777 &amp; ~getdef_n=
um (&quot;UMASK&quot;, GETDEF_DEFAULT_UMASK));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 home_added =3D true;<br>
&gt; - #ifdef WITH_AUDIT<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audit_logger (AUDIT=
_ADD_USER, Prog,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;adding home directory&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_name, (unsigned int) user_id,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHADOW_AUDIT_SUCCESS);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 audit_logger (AUDIT_ADD_USER, Prog,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;adding home directory&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 user_name, (unsigned int) user_id,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SHADOW_AUDIT_SUCCESS);<br>
&gt; - #endif<br>
&gt; - #ifdef WITH_SELINUX<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reset SELinux to=
 create files with default contexts */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reset_selinux_f=
ile_context () !=3D 0) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf (stderr,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;%s: cannot reset SELin=
ux file creation context\n&quot;),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prog);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fail_exit (E_HOMEDIR);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --#endif<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* Reset SELinux to create files with default c=
ontexts */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (reset_selinux_file_context () !=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_(&quot;%s: cannot reset SELinux file creation context\n&q=
uot;),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Prog);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_exit (E_HOMEDI=
R);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+#endif<br>
&gt; - }<br>
&gt; -<br>
&gt; - /*<br>
&gt; ---<br>
&gt; -2.11.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/allow-for-setting-pass=
word-in-clear-text.patch b/meta/recipes-extended/shadow/files/0002-Allow-fo=
r-setting-password-in-clear-text.patch<br>
&gt; similarity index 81%<br>
&gt; rename from meta/recipes-extended/shadow/files/allow-for-setting-passw=
ord-in-clear-text.patch<br>
&gt; rename to meta/recipes-extended/shadow/files/0002-Allow-for-setting-pa=
ssword-in-clear-text.patch<br>
&gt; index fa7eb07aa51..c6332e4f766 100644<br>
&gt; --- a/meta/recipes-extended/shadow/files/allow-for-setting-password-in=
-clear-text.patch<br>
&gt; +++ b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-passwo=
rd-in-clear-text.patch<br>
&gt; @@ -1,8 +1,12 @@<br>
&gt; +From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +Date: Sat, 16 Nov 2013 15:27:47 +0800<br>
&gt;=C2=A0 Subject: [PATCH] Allow for setting password in clear text<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.c=
om" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/Makefile.am |=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0src/groupadd.c=C2=A0 | 20 +++++++++++++++-----<br>
&gt; @@ -12,39 +16,39 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Ch=
en@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A05 files changed, 64 insertions(+), 25 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/src/Makefile.am b/src/Makefile.am<br>
&gt; -index 3c98a8d..b8093d5 100644<br>
&gt; +index f31fd7a..4a317a3 100644<br>
&gt;=C2=A0 --- a/src/Makefile.am<br>
&gt;=C2=A0 +++ b/src/Makefile.am<br>
&gt; -@@ -93,10 +93,10 @@ chgpasswd_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIB=
SELINUX) $(LIBCRYPT)<br>
&gt; - chsh_LDADD=C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(LIBPAM) $(LIBSELINUX) $=
(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)<br>
&gt; - chpasswd_LDADD =3D $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT)<br>
&gt; - gpasswd_LDADD=C2=A0 =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYP=
T)<br>
&gt; --groupadd_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
<br>
&gt; -+groupadd_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBCRYPT)<br>
&gt; - groupdel_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
<br>
&gt; - groupmems_LDADD =3D $(LDADD) $(LIBPAM) $(LIBSELINUX)<br>
&gt; --groupmod_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
<br>
&gt; -+groupmod_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBCRYPT)<br>
&gt; - grpck_LDADD=C2=A0 =C2=A0 =3D $(LDADD) $(LIBSELINUX)<br>
&gt; - grpconv_LDADD=C2=A0 =3D $(LDADD) $(LIBSELINUX)<br>
&gt; - grpunconv_LDADD =3D $(LDADD) $(LIBSELINUX)<br>
&gt; -@@ -117,9 +117,9 @@ su_SOURCES=C2=A0 =C2=A0 =C2=A0=3D \<br>
&gt; +@@ -103,10 +103,10 @@ chsh_LDADD=C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(LI=
BPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT_NOPAM)<br>
&gt; + chpasswd_LDADD =3D $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LI=
BCRYPT) $(LIBECONF)<br>
&gt; + expiry_LDADD =3D $(LDADD) $(LIBECONF)<br>
&gt; + gpasswd_LDADD=C2=A0 =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYP=
T) $(LIBECONF)<br>
&gt; +-groupadd_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBECONF)<br>
&gt; ++groupadd_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBECONF) $(LIBCRYPT)<br>
&gt; + groupdel_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBECONF)<br>
&gt; + groupmems_LDADD =3D $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBECONF)<br>
&gt; +-groupmod_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBECONF)<br>
&gt; ++groupmod_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBECONF) $(LIBCRYPT)<br>
&gt; + grpck_LDADD=C2=A0 =C2=A0 =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LI=
BECONF)<br>
&gt; + grpconv_LDADD=C2=A0 =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECON=
F)<br>
&gt; + grpunconv_LDADD =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)<b=
r>
&gt; +@@ -127,9 +127,9 @@ su_SOURCES=C2=A0 =C2=A0 =C2=A0=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suauth.c<br>
&gt; - su_LDADD=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(LIBPAM) $(LIBAUDIT=
) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)<br>
&gt; - sulogin_LDADD=C2=A0 =3D $(LDADD) $(LIBCRYPT)<br>
&gt; --useradd_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)<br>
&gt; -+useradd_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)<br>
&gt; - userdel_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE)<br>
&gt; --usermod_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)<br>
&gt; -+usermod_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)<br>
&gt; - vipw_LDADD=C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(LIBSELINUX)<br>
&gt; + su_LDADD=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(LIBPAM) $(LIBAUDIT=
) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD) $(LIBECONF)<br>
&gt; + sulogin_LDADD=C2=A0 =3D $(LDADD) $(LIBCRYPT) $(LIBECONF)<br>
&gt; +-useradd_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)<br>
&gt; ++useradd_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)<br>
&gt; + userdel_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBECONF)<br>
&gt; +-usermod_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)<br>
&gt; ++usermod_LDADD=C2=A0 =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSEL=
INUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)<br>
&gt; + vipw_LDADD=C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX)=
 $(LIBECONF)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0install-am: all-am<br>
&gt;=C2=A0 diff --git a/src/groupadd.c b/src/groupadd.c<br>
&gt; -index b57006c..63e1c48 100644<br>
&gt; +index e9c4bb7..d572c00 100644<br>
&gt;=C2=A0 --- a/src/groupadd.c<br>
&gt;=C2=A0 +++ b/src/groupadd.c<br>
&gt; -@@ -123,9 +123,10 @@ static /*@noreturn@*/void usage (int status)<br>
&gt; +@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -o, --no=
n-unique=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow to create gr=
oups with duplicate\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (non-unique)=
 GID\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -p, --pa=
ssword PASSWORD=C2=A0 =C2=A0 =C2=A0 =C2=A0use this encrypted password for t=
he new group\n&quot;), usageout);<br>
&gt; @@ -56,7 +60,7 @@ index b57006c..63e1c48 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (&quot;\n&quot;, usageou=
t);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit (status);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -@@ -387,13 +388,14 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt; +@@ -391,13 +392,14 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;ke=
y&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 required_argument, NULL, &#39;K&#39;},<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;no=
n-unique&quot;, no_argument,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;o&#39;},<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;pa=
ssword&quot;,=C2=A0 =C2=A0required_argument, NULL, &#39;p&#39;},<br>
&gt; @@ -73,7 +77,7 @@ index b57006c..63e1c48 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long_options, NULL)) !=3D =
-1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (c=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39=
;f&#39;:<br>
&gt; -@@ -445,12 +447,20 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt; +@@ -449,12 +451,20 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pflg =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0group_passwd =3D optarg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -95,7 +99,7 @@ index b57006c..63e1c48 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0usage (E_USAGE);<br>
&gt; -@@ -584,7 +594,7 @@ int main (int argc, char **argv)<br>
&gt; +@@ -588,7 +598,7 @@ int main (int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) textdomain (PACKAGE);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process_root_flag (&quot;-R&quot;, ar=
gc, argv);<br>
&gt; @@ -105,10 +109,10 @@ index b57006c..63e1c48 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENLOG (&quot;groupadd&quot;);<br>
&gt;=C2=A0 =C2=A0#ifdef WITH_AUDIT<br>
&gt;=C2=A0 diff --git a/src/groupmod.c b/src/groupmod.c<br>
&gt; -index b293b98..72daf2c 100644<br>
&gt; +index bc14438..25ccb44 100644<br>
&gt;=C2=A0 --- a/src/groupmod.c<br>
&gt;=C2=A0 +++ b/src/groupmod.c<br>
&gt; -@@ -134,8 +134,9 @@ static void usage (int status)<br>
&gt; +@@ -138,8 +138,9 @@ static void usage (int status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -o, --no=
n-unique=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow to use a dup=
licate (non-unique) GID\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -p, --pa=
ssword PASSWORD=C2=A0 =C2=A0 =C2=A0 =C2=A0change the password to this (encr=
ypted)\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PASSWORD\n&q=
uot;), usageout);<br>
&gt; @@ -119,7 +123,7 @@ index b293b98..72daf2c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (&quot;\n&quot;, usageou=
t);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit (status);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -@@ -383,11 +384,12 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt; +@@ -387,11 +388,12 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;ne=
w-name&quot;,=C2=A0 =C2=A0required_argument, NULL, &#39;n&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;no=
n-unique&quot;, no_argument,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;o&#39;},<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;pa=
ssword&quot;,=C2=A0 =C2=A0required_argument, NULL, &#39;p&#39;},<br>
&gt; @@ -134,7 +138,7 @@ index b293b98..72daf2c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long_options, NULL)) !=3D =
-1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (c=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39=
;g&#39;:<br>
&gt; -@@ -414,9 +416,17 @@ static void process_flags (int argc, char **argv=
)<br>
&gt; +@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0group_passwd =3D optarg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pflg =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -153,7 +157,7 @@ index b293b98..72daf2c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0usage (E_USAGE);<br>
&gt; -@@ -757,7 +767,7 @@ int main (int argc, char **argv)<br>
&gt; +@@ -761,7 +771,7 @@ int main (int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) textdomain (PACKAGE);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process_root_flag (&quot;-R&quot;, ar=
gc, argv);<br>
&gt; @@ -163,10 +167,10 @@ index b293b98..72daf2c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENLOG (&quot;groupmod&quot;);<br>
&gt;=C2=A0 =C2=A0#ifdef WITH_AUDIT<br>
&gt;=C2=A0 diff --git a/src/useradd.c b/src/useradd.c<br>
&gt; -index c74e491..7214e72 100644<br>
&gt; +index 1b7bf06..44f09e2 100644<br>
&gt;=C2=A0 --- a/src/useradd.c<br>
&gt;=C2=A0 +++ b/src/useradd.c<br>
&gt; -@@ -829,9 +829,10 @@ static void usage (int status)<br>
&gt; +@@ -853,9 +853,10 @@ static void usage (int status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -o, --no=
n-unique=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow to create us=
ers with duplicate\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (non-unique)=
 UID\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -p, --pa=
ssword PASSWORD=C2=A0 =C2=A0 =C2=A0 =C2=A0encrypted password of the new acc=
ount\n&quot;), usageout);<br>
&gt; @@ -178,7 +182,7 @@ index c74e491..7214e72 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -s, --sh=
ell SHELL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0login shell of the=
 new account\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -u, --ui=
d UID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user ID =
of the new account\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -U, --us=
er-group=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create a group wit=
h the same name as the user\n&quot;), usageout);<br>
&gt; -@@ -1104,9 +1105,10 @@ static void process_flags (int argc, char **ar=
gv)<br>
&gt; +@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **ar=
gv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;no-user-group&quot;,=C2=A0 no_argument,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0NULL, &#39;N&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;non-unique&quot;,=C2=A0 =C2=A0 =C2=A0no_argument=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;o&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;password&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0requir=
ed_argument, NULL, &#39;p&#39;},<br>
&gt; @@ -190,7 +194,7 @@ index c74e491..7214e72 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;shell&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
equired_argument, NULL, &#39;s&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;uid&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required_argument, NULL, &#39;u&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;user-group&quot;,=C2=A0 =C2=A0 =C2=A0no_argument=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;U&#39;},<br>
&gt; -@@ -1117,9 +1119,9 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt; +@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ((c=
 =3D getopt_long (argc, argv,<br>
&gt;=C2=A0 =C2=A0#ifdef WITH_SELINUX<br>
&gt; @@ -202,7 +206,7 @@ index c74e491..7214e72 100644<br>
&gt;=C2=A0 =C2=A0#endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* !WITH_SELINU=
X */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 long_options, NULL)) !=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0switch (c) {<br>
&gt; -@@ -1285,12 +1287,19 @@ static void process_flags (int argc, char **a=
rgv)<br>
&gt; +@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char **a=
rgv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user_pass =3D optarg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -223,7 +227,7 @@ index c74e491..7214e72 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case &#39;s&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=C2=A0 =C2=A0( !VALID (=
optarg) )<br>
&gt; -@@ -2148,7 +2157,7 @@ int main (int argc, char **argv)<br>
&gt; +@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process_root_flag (&quot;-R&quot;, ar=
gc, argv);<br>
&gt;<br>
&gt; @@ -233,10 +237,10 @@ index c74e491..7214e72 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENLOG (&quot;useradd&quot;);<br>
&gt;=C2=A0 =C2=A0#ifdef WITH_AUDIT<br>
&gt;=C2=A0 diff --git a/src/usermod.c b/src/usermod.c<br>
&gt; -index e571426..ccfbb99 100644<br>
&gt; +index 21c6da9..cffdb3e 100644<br>
&gt;=C2=A0 --- a/src/usermod.c<br>
&gt;=C2=A0 +++ b/src/usermod.c<br>
&gt; -@@ -424,8 +424,9 @@ static /*@noreturn@*/void usage (int status)<br>
&gt; +@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new location=
 (use only with -d)\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -o, --no=
n-unique=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow using duplic=
ate (non-unique) UID\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -p, --pa=
ssword PASSWORD=C2=A0 =C2=A0 =C2=A0 =C2=A0use encrypted password for the ne=
w password\n&quot;), usageout);<br>
&gt; @@ -247,7 +251,7 @@ index e571426..ccfbb99 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -s, --sh=
ell SHELL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new login shell fo=
r the user account\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -u, --ui=
d UID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new UID =
for the user account\n&quot;), usageout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fputs (_(&quot;=C2=A0 -U, --un=
lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock t=
he user account\n&quot;), usageout);<br>
&gt; -@@ -1002,8 +1003,9 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt; +@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;move-home&quot;,=C2=A0 =C2=A0 no_argument,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0NULL, &#39;m&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;non-unique&quot;,=C2=A0 =C2=A0no_argument,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0NULL, &#39;o&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;password&quot;,=C2=A0 =C2=A0 =C2=A0required_argu=
ment, NULL, &#39;p&#39;},<br>
&gt; @@ -258,16 +262,16 @@ index e571426..ccfbb99 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;shell&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 required=
_argument, NULL, &#39;s&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;uid&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req=
uired_argument, NULL, &#39;u&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{&quot;unlock&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0no_argum=
ent,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;U&#39;},<br>
&gt; -@@ -1019,7 +1021,7 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt; +@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **arg=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{NULL, 0, NULL, &#39;\0&#39;}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ((c=
 =3D getopt_long (argc, argv,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;ac:d:e:f:g:G:hl:Lmop:R:s:u:UP:&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;ac:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:&quot;<br>
&gt;=C2=A0 =C2=A0#ifdef ENABLE_SUBIDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;v:w:V:W:&quot;<br>
&gt;=C2=A0 =C2=A0#endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ENABLE_SUBID=
S */<br>
&gt; -@@ -1119,9 +1121,17 @@ static void process_flags (int argc, char **ar=
gv)<br>
&gt; +@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **ar=
gv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user_pass =3D optarg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pflg =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -286,7 +290,7 @@ index e571426..ccfbb99 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case &#39;s&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!VALID (optarg)) {<br>
&gt; -@@ -2098,7 +2108,7 @@ int main (int argc, char **argv)<br>
&gt; +@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) textdomain (PACKAGE);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process_root_flag (&quot;-R&quot;, ar=
gc, argv);<br>
&gt; @@ -295,6 +299,3 @@ index e571426..ccfbb99 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENLOG (&quot;usermod&quot;);<br>
&gt;=C2=A0 =C2=A0#ifdef WITH_AUDIT<br>
&gt; ---<br>
&gt; -2.11.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/0004-useradd.c-create-=
parent-directories-when-necessary.patch b/meta/recipes-extended/shadow/file=
s/0004-useradd.c-create-parent-directories-when-necessary.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..77357027764<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/shadow/files/0004-useradd.c-create-parent-=
directories-when-necessary.patch<br>
&gt; @@ -0,0 +1,63 @@<br>
&gt; +From b406a7f4c3d6472885b75320ea63f140e021ff03 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +Date: Thu, 17 Jul 2014 15:53:34 +0800<br>
&gt; +Subject: [PATCH] useradd.c: create parent directories when necessary<=
br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + src/useradd.c | 32 +++++++++++++++++++++++++++++++-<br>
&gt; + 1 file changed, 31 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/useradd.c b/src/useradd.c<br>
&gt; +index 44f09e2..fec0986 100644<br>
&gt; +--- a/src/useradd.c<br>
&gt; ++++ b/src/useradd.c<br>
&gt; +@@ -2065,6 +2065,36 @@ static void usr_update (void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/*<br>
&gt; ++ * mkdir_p - create directories, including parent directories when n=
eeded<br>
&gt; ++ *<br>
&gt; ++ * similar to `mkdir -p&#39;<br>
&gt; ++ */<br>
&gt; ++int mkdir_p(const char *path) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int len =3D strlen(path);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char newdir[len + 1];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mode_t mode =3D 0755;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (path[i] =3D=3D &#39;\0&#39;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* skip the leading &#39;/&#39; */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 while(path[i] !=3D &#39;\0&#39;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (path[i] =3D=3D =
&#39;/&#39;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 strncpy(newdir, path, i);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 newdir[i] =3D &#39;\0&#39;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mkdir(newdir, mode);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir(path, mode);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +=C2=A0 * create_home - create the user&#39;s home directory<br>
&gt; +=C2=A0 *<br>
&gt; +@@ -2137,7 +2167,7 @@ static void create_home (void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; + #endif<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mkdir (path, 0) !=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((mkdir_p (path) =3D=3D 0) &amp;&=
amp; (access (prefix_user_home, F_OK) !=3D 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0fprintf (stderr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;%s: cannot crea=
te directory %s\n&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prog, path);<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpec=
ted-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/c=
ommonio.c-fix-unexpected-open-failure-in-chroot-env.patch<br>
&gt; index 4fa3d184edf..98252163692 100644<br>
&gt; --- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-ope=
n-failure-in-chroot-env.patch<br>
&gt; +++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-ope=
n-failure-in-chroot-env.patch<br>
&gt; @@ -1,3 +1,8 @@<br>
&gt; +From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +Date: Thu, 17 Jul 2014 15:53:34 +0800<br>
&gt; +Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env=
<br>
&gt; +<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;<br>
&gt;=C2=A0 commonio.c: fix unexpected open failure in chroot environment<br=
>
&gt; @@ -10,15 +15,16 @@ Note that this patch doesn&#39;t change the logic =
in the code, it just expands<br>
&gt;=C2=A0 the codes.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.c=
om" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt; - lib/commonio.c |=C2=A0 =C2=A016 ++++++++++++----<br>
&gt; + lib/commonio.c | 16 ++++++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/lib/commonio.c b/lib/commonio.c<br>
&gt; -index cc536bf..51cafd9 100644<br>
&gt; +index 16fa7e7..d6bc297 100644<br>
&gt;=C2=A0 --- a/lib/commonio.c<br>
&gt;=C2=A0 +++ b/lib/commonio.c<br>
&gt; -@@ -613,10 +613,18 @@ int commonio_open (struct commonio_db *db, int =
mode)<br>
&gt; +@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int =
mode)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0db-&gt;cursor =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0db-&gt;changed =3D false;<br>
&gt;<br>
&gt; @@ -41,6 +47,3 @@ index cc536bf..51cafd9 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0db-&gt;fp =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) {<br>
&gt;=C2=A0 =C2=A0#ifdef WITH_TCB<br>
&gt; ---<br>
&gt; -1.7.9.5<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/shadow/files/shadow-relaxed-usernam=
es.patch b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patc=
h<br>
&gt; index 1af04d5fe89..cc833362e9a 100644<br>
&gt; --- a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patc=
h<br>
&gt; +++ b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patc=
h<br>
&gt; @@ -1,26 +1,37 @@<br>
&gt; +From ca472d6866e545aaa70a70020e3226f236a8aafc Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Shan Hai &lt;<a href=3D"mailto:shan.hai@windriver.com" target=
=3D"_blank">shan.hai@windriver.com</a>&gt;<br>
&gt; +Date: Tue, 13 Sep 2016 13:45:46 +0800<br>
&gt; +Subject: [PATCH] shadow: use relaxed usernames<br>
&gt;<br>
&gt;=C2=A0 The groupadd from shadow does not allow upper case group names, =
the<br>
&gt;=C2=A0 same is true for the upstream shadow. But distributions like<br>
&gt;=C2=A0 Debian/Ubuntu/CentOS has their own way to cope with this problem=
,<br>
&gt;=C2=A0 this patch is picked up from CentOS release 7.0 to relax the use=
rnames<br>
&gt;=C2=A0 restrictions to allow the upper case group names, and the relaxa=
tion is<br>
&gt; -POSIX compliant because POSIX indicate that usernames are composed of=
<br>
&gt; +POSIX compliant because POSIX indicate that usernames are composed of=
<br>
&gt;=C2=A0 characters from the portable filename character set [A-Za-z0-9._=
-].<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;<br>
&gt; -Signed-off-by: Shan Hai &lt;<a href=3D"mailto:shan.hai@windriver.com"=
 target=3D"_blank">shan.hai@windriver.com</a>&gt;<br>
&gt; +Signed-off-by: Shan Hai &lt;<a href=3D"mailto:shan.hai@windriver.com"=
 target=3D"_blank">shan.hai@windriver.com</a>&gt;<br>
&gt;<br>
&gt; -diff -urpN a/libmisc/chkname.c b/libmisc/chkname.c<br>
&gt; -index 5089112..f40a0da 100644<br>
&gt; +---<br>
&gt; + libmisc/chkname.c=C2=A0 | 30 ++++++++++++++++++------------<br>
&gt; + man/groupadd.8.xml |=C2=A0 6 ------<br>
&gt; + man/useradd.8.xml=C2=A0 |=C2=A0 8 +-------<br>
&gt; + 3 files changed, 19 insertions(+), 25 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libmisc/chkname.c b/libmisc/chkname.c<br>
&gt; +index 90f185c..65762b4 100644<br>
&gt;=C2=A0 --- a/libmisc/chkname.c<br>
&gt;=C2=A0 +++ b/libmisc/chkname.c<br>
&gt; -@@ -49,21 +49,28 @@<br>
&gt; - static bool is_valid_name (const char *name)<br>
&gt; - {<br>
&gt; +@@ -55,22 +55,28 @@ static bool is_valid_name (const char *name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0* User/group names must match [a-z_]=
[a-z0-9_-]*[$]<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +-<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 if ((&#39;\0&#39; =3D=3D *name) ||<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(((&#39;a&#39; &lt;=3D *nam=
e) &amp;&amp; (&#39;z&#39; &gt;=3D *name)) || (&#39;_&#39; =3D=3D *name))) =
{<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* User/group names must match=
 gnu e-regex:<br>
&gt; @@ -55,28 +66,28 @@ index 5089112..f40a0da 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -diff -urpN a/man/groupadd.8.xml b/man/groupadd.8.xml<br>
&gt; -index 230fd0c..94f7807 100644<br>
&gt; +diff --git a/man/groupadd.8.xml b/man/groupadd.8.xml<br>
&gt; +index 1e58f09..d804b61 100644<br>
&gt;=C2=A0 --- a/man/groupadd.8.xml<br>
&gt;=C2=A0 +++ b/man/groupadd.8.xml<br>
&gt; -@@ -222,12 +222,6 @@<br>
&gt; +@@ -272,12 +272,6 @@<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &lt;refsect1 id=3D&#39;caveats&#39;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;title&gt;CAVEATS&lt;/title&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0Groupnames must start with a lower c=
ase letter or an underscore,<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0followed by lower case letters, digi=
ts, underscores, or dashes.<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0They can end with a dollar sign.<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0In regular expression terms: [a-z_][=
a-z0-9_-]*[$]?<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Groupnames may only be up to &amp;GR=
OUP_NAME_MAX_LENGTH; characters long.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
&gt; -diff -urpN a/man/useradd.8.xml b/man/useradd.8.xml<br>
&gt; -index 5dec989..fe623b9 100644<br>
&gt; +diff --git a/man/useradd.8.xml b/man/useradd.8.xml<br>
&gt; +index a16d730..c0bd777 100644<br>
&gt;=C2=A0 --- a/man/useradd.8.xml<br>
&gt;=C2=A0 +++ b/man/useradd.8.xml<br>
&gt; -@@ -336,7 +336,7 @@<br>
&gt; +@@ -366,7 +366,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/term&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;listitem&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
&gt; @@ -85,16 +96,16 @@ index 5dec989..fe623b9 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wide setting from &lt;f=
ilename&gt;/etc/login.defs&lt;/filename&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&lt;option&gt;CREATE_H=
OME&lt;/option&gt;) is set to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;replaceable&gt;yes&=
lt;/replaceable&gt;.<br>
&gt; -@@ -607,12 +607,6 @@<br>
&gt; +@@ -660,12 +660,6 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0the user account creation request.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
&gt; +-=C2=A0 =C2=A0 &lt;para&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 Usernames must start with a lower case let=
ter or an underscore,<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 followed by lower case letters, digits, un=
derscores, or dashes.<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 They can end with a dollar sign.<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 In regular expression terms: [a-z_][a-z0-9=
_-]*[$]?<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 &lt;/para&gt;<br>
&gt; --=C2=A0 =C2=A0 &lt;para&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Usernames may only be up to 32 charac=
ters long.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
&gt; -=C2=A0 =C2=A0&lt;/refsect1&gt;<br>
&gt; diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-ex=
tended/shadow/shadow.inc<br>
&gt; index 770c239e96d..d07b507532f 100644<br>
&gt; --- a/meta/recipes-extended/shadow/shadow.inc<br>
&gt; +++ b/meta/recipes-extended/shadow/shadow.inc<br>
&gt; @@ -11,8 +11,6 @@ DEPENDS =3D &quot;virtual/crypt&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/shado=
w-maint/shadow/releases" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/shadow-maint/shadow/releases</a>&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://github.com/shadow-maint/sha=
dow/releases/download/$%7BPV%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/shadow-maint/shadow/releases/download/${PV}/=
${BP}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shadow-4.1.3-dot=
s-in-usernames.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Make-the-sp_lstc=
hg-shadow-field-reproducible-re.-71.patch=C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-fix=
-configure-error-with-dash.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#=
39;PACKAGECONFIG&#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;,=
 d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shadow-relaxed-u=
sernames.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; @@ -24,16 +22,17 @@ SRC_URI_append_class-target =3D &quot; \<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_class-native =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Disable-use=
-of-syslog-for-sysroot.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://allow-for-setting-pas=
sword-in-clear-text.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Allow-for-settin=
g-password-in-clear-text.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://commonio.c-fix-u=
nexpected-open-failure-in-chroot-env.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-useradd.c-create=
-parent-directories-when-necessary.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-useradd.c-create=
-parent-directories-when-necessary.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-check-for=
-validity-of-shell-executable.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI_append_class-nativesdk =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Disable-use=
-of-syslog-for-sysroot.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;36feb15665338ae3de414f2a88e434db&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;4668f99bd087399c4a586084dc3b046b75f56072=
0d83e92fd23bf7a89dda4d31&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;017ac773ba370bc28e157cee30dad71a&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;82016d65317555fc8ce9e669eb187984d8d4b1f8=
ecda0769f4bc5412aed326e4&quot;<br>
&gt;<br>
&gt;=C2=A0 # Additional Policy files for PAM<br>
&gt;=C2=A0 PAM_SRC_URI =3D &quot;file://pam.d/chfn \<br>
&gt; diff --git a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.6=
.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.6.bb</a> b/meta/recipes-=
extended/shadow/<a href=3D"http://shadow_4.8.bb" rel=3D"noreferrer" target=
=3D"_blank">shadow_4.8.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-extended/shadow/<a href=3D"http://shadow_4.6.=
bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.6.bb</a><br>
&gt; rename to meta/recipes-extended/shadow/<a href=3D"http://shadow_4.8.bb=
" rel=3D"noreferrer" target=3D"_blank">shadow_4.8.bb</a><br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>

--000000000000f31768059957f201--
