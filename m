Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C93D2E031
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:31:39 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.4831.1729675898177202388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WniPKvr2;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539eb97f26aso7490207e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675896; x=1730280696; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEi916a51Y2Sg1QuEZosW4VC20hf5DTo1V0rPV4zZzs=;
        b=WniPKvr25wUppcFqUrsIXdYoX8MKhSq/MYRK0waA8uTiiyAxXKln3t7zt5V0PsaxXV
         Z424kwn5KsBNXcNmJj6f8ik9nw1BdNTlKtQQrEE3OAb0w9mvF9h6N0CGEXhAW0xNmIf2
         zDdQIWSJvLIwmpK0Eqqk40x8ICORX28hDMxnBrYuV/t47FRq4PlGqfv8vfcZtkoksKhx
         Tyb1OaNEyuzaL7cZTozMAFybxP5yr7XOx6FyiXbNDymZuLwRpiB0msBu2vznRAQUUAT4
         QNLagffAB0mdlmqkHU9Sx9G1Szy387ekkZcR5jNvNH8nkpn0ZVQge8nZvFFUSRL+yzre
         jFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675896; x=1730280696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEi916a51Y2Sg1QuEZosW4VC20hf5DTo1V0rPV4zZzs=;
        b=gTBZlZqrFmy5fpc397DpfDJx5KxJnxJYi62ylLtxY6+HMGehdvUGW55ckUvFDz/PBP
         LZotdZHuEpHOC+poVc0kQ/DlIi6wIVz8JWuETNy5IC6cJPHmQ5b95ouNLzxqoMUkqonQ
         CgeHokYKFekeBZRIoP+rH4eWRCKtMjkotPqtsjujF2TpBo4qrW/fWyncyqZ5FPEeQQ2p
         CK1VSVyuBNex5WkNsENL5bvX3PhD9Br+BEcVFo0QQgfsIRB4pujRSODrdyIKyy+mbEOM
         OPoI4hjSqBeRfbvkWfLuPBhyLvB7ElpZZ0FMuL3KPs9Whwh2i0eDFf4KZuFgbLZBjSmo
         AxCA==
X-Gm-Message-State: AOJu0YzsugEdz2qPiM3i5ad5+diCBEUXcAUuyBGw6J4cM8YrKF23fILL
	8s4PcaK5zzmrPHbm5soNU9FXKU4br9QwYdHgCQZnj/wZ6sYf3hQM952v3M4wcQOW/NNNR7jAVVA
	fuHkAEhUBU4WuYweIpZuqQfoeVEg=
X-Google-Smtp-Source: AGHT+IG3J8cRFOyYaIylt5HC+c/eE1hibXkl/4KSetpwgoqloB8y4zI9mLfZ2zu5sw4TLi+QYE9jvoqM3bUP57LEuK4=
X-Received: by 2002:a05:6512:398c:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-53b1a36c455mr856680e87.39.1729675895867; Wed, 23 Oct 2024
 02:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241023084340.823184-1-liu.ming50@gmail.com>
In-Reply-To: <20241023084340.823184-1-liu.ming50@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Oct 2024 11:31:23 +0200
Message-ID: <CANNYZj_ki8R87DrGDuYTsdLJx3SaDqknJ85wt+xz54-uAO6HtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] screen: uprev to 5.0.0
To: liu.ming50@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 09:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206190

Changes in LIC_FILES_CHKSUM should be explained via License-Update: tag.
(not sure why patchtest didn't tell this yet)

Alex

On Wed, 23 Oct 2024 at 10:43, Ming Liu via lists.openembedded.org
<liu.ming50=3Dgmail.com@lists.openembedded.org> wrote:
>
> Drop deprecated patches.
>
> Inherit autotools-brokensep instead of autotools, there are some
> generated headers in ${B} that referring to ${S}.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  ...0001-Remove-more-compatibility-stuff.patch | 31 ----------
>  .../screen/0001-fix-for-multijob-build.patch  | 58 -------------------
>  .../0002-comm.h-now-depends-on-term.h.patch   | 30 ----------
>  .../{screen_4.9.1.bb =3D> screen_5.0.0.bb}      | 11 ++--
>  4 files changed, 4 insertions(+), 126 deletions(-)
>  delete mode 100644 meta/recipes-extended/screen/screen/0001-Remove-more-=
compatibility-stuff.patch
>  delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-mult=
ijob-build.patch
>  delete mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-d=
epends-on-term.h.patch
>  rename meta/recipes-extended/screen/{screen_4.9.1.bb =3D> screen_5.0.0.b=
b} (79%)
>
> diff --git a/meta/recipes-extended/screen/screen/0001-Remove-more-compati=
bility-stuff.patch b/meta/recipes-extended/screen/screen/0001-Remove-more-c=
ompatibility-stuff.patch
> deleted file mode 100644
> index 1413724d07..0000000000
> --- a/meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-=
stuff.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -This fixes
> -../screen-4.6.2/pty.c: In function 'OpenPTY':
> -../screen-4.6.2/pty.c:328:7: warning: implicit declaration of function '=
openpty'; did you mean 'openat'? [-Wimplicit-function-declaration]
> -   if (openpty(&f, &s, TtyName, NULL, NULL) !=3D 0)
> -       ^~~~~~~
> -
> -Signed-off-by: Amadeusz S=C5=82awi=C5=84ski <amade@asmblr.net>
> -Signed-off-by: Adrian Bunk <bunk@stusta.de>
> -Upstream-Status: Backport
> -
> ----
> - pty.c | 6 +-----
> - 1 file changed, 1 insertion(+), 5 deletions(-)
> -
> -diff --git a/pty.c b/pty.c
> -index 1c0660e..502338f 100644
> ---- a/pty.c
> -+++ b/pty.c
> -@@ -47,11 +47,7 @@
> - # include <sys/ttold.h>
> - #endif
> -
> --#ifdef ISC
> --# include <sys/tty.h>
> --# include <sys/sioctl.h>
> --# include <sys/pty.h>
> --#endif
> -+#include <pty.h>
> -
> - #ifdef sgi
> - # include <sys/sysmacros.h>
> diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-bu=
ild.patch b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build=
.patch
> deleted file mode 100644
> index fbdb0eb478..0000000000
> --- a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.pat=
ch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 79ad2885e26631077dd6b8aebe17ae95b38133a6 Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Tue, 26 Jul 2016 14:23:59 +0800
> -Subject: [PATCH] fix for multijob build
> -
> -make sure that comm.sh script generates comm.h header before doing
> -anything else
> -
> -Signed-off-by: Amadeusz Sawiski <amade@asmblr.net>
> -
> -Upstream-Status: Backport
> -
> -Backport patch to fix parallel build failure and update context to make =
patch
> -coulde be applied.
> -
> -http://git.savannah.gnu.org/cgit/screen.git/commit?id=3Dc0de6dd
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - Makefile.in | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index aca7da3..3607711 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -298,7 +298,7 @@ search.o: layout.h viewport.h canvas.h search.c conf=
ig.h screen.h os.h osdef.h a
> -  comm.h layer.h term.h image.h display.h window.h mark.h extern.h
> - tty.o: layout.h viewport.h canvas.h tty.c config.h screen.h os.h osdef.=
h ansi.h acls.h comm.h \
> -  layer.h term.h image.h display.h window.h extern.h
> --term.o: layout.h viewport.h canvas.h term.c term.h
> -+term.o: layout.h viewport.h canvas.h term.c term.h comm.h
> - window.o: layout.h viewport.h canvas.h window.c config.h screen.h os.h =
osdef.h ansi.h acls.h \
> -  comm.h layer.h term.h image.h display.h window.h extern.h logfile.h
> - utmp.o: layout.h viewport.h canvas.h utmp.c config.h screen.h os.h osde=
f.h ansi.h acls.h \
> -@@ -324,7 +324,7 @@ canvas.o: layout.h viewport.h canvas.h canvas.c conf=
ig.h screen.h os.h osdef.h a
> -  comm.h layer.h term.h image.h display.h window.h extern.h \
> -  braille.h
> - comm.o: layout.h viewport.h canvas.h comm.c config.h acls.h comm.h
> --kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h
> -+kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h comm.h
> - acls.o: layout.h viewport.h canvas.h acls.c config.h screen.h os.h osde=
f.h ansi.h acls.h comm.h \
> -  layer.h term.h image.h display.h window.h extern.h
> - braille.o: layout.h viewport.h canvas.h braille.c config.h screen.h os.=
h osdef.h ansi.h acls.h \
> -@@ -350,7 +350,7 @@ layout.o: layout.h viewport.h canvas.h layout.c conf=
ig.h screen.h os.h osdef.h a
> - viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h o=
s.h osdef.h ansi.h acls.h \
> -  comm.h layer.h term.h image.h display.h window.h extern.h \
> -  braille.h
> --list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
> --list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
> -+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h =
comm.h
> -+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h =
comm.h
> - list_window.o: list_generic.h list_window.c window.h layer.h screen.h o=
sdef.h comm.h
> -
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-=
on-term.h.patch b/meta/recipes-extended/screen/screen/0002-comm.h-now-depen=
ds-on-term.h.patch
> deleted file mode 100644
> index a01dc24751..0000000000
> --- a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term=
.h.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Upstream-Status: Backport
> -
> -Backport from:
> -
> -http://git.savannah.gnu.org/cgit/screen.git/commit/?id=3D39c5f1c
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 39c5f1c76f1fcef4b5958bf828a63f53426b6984 Mon Sep 17 00:00:00 2001
> -From: Mike Gerwitz <mike@mikegerwitz.com>
> -Date: Tue, 24 Dec 2013 22:16:31 -0500
> -Subject: [PATCH] comm.h now depends on term.h
> -
> ----
> - src/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: screen-4.6.1/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- screen-4.6.1.orig/Makefile.in
> -+++ screen-4.6.1/Makefile.in
> -@@ -133,7 +133,7 @@ kmapdef.c: term.h
> - tty.c:        tty.sh
> -       sh $(srcdir)/tty.sh tty.c
> -
> --comm.h: comm.c comm.sh config.h
> -+comm.h: comm.c comm.sh config.h term.h
> -       AWK=3D$(AWK) CC=3D"$(CC) $(CFLAGS)" srcdir=3D${srcdir} sh $(srcdi=
r)/comm.sh
> -
> - osdef.h: osdef.sh config.h osdef.h.in
> diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-=
extended/screen/screen_5.0.0.bb
> similarity index 79%
> rename from meta/recipes-extended/screen/screen_4.9.1.bb
> rename to meta/recipes-extended/screen/screen_5.0.0.bb
> index 57d1481049..fec5663fc2 100644
> --- a/meta/recipes-extended/screen/screen_4.9.1.bb
> +++ b/meta/recipes-extended/screen/screen_5.0.0.bb
> @@ -8,7 +8,7 @@ BUGTRACKER =3D "https://savannah.gnu.org/bugs/?func=3Dadd=
item&group=3Dscreen"
>  SECTION =3D "console/utils"
>
>  LICENSE =3D "GPL-3.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e \
>                      file://screen.h;endline=3D26;md5=3Db8dc717c9a3dba842=
ae6c44ca0f73f52 \
>                      "
>
> @@ -18,19 +18,16 @@ RDEPENDS:${PN} =3D "base-files"
>
>  SRC_URI =3D "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen=
.pam', '', d)} \
> -           file://0002-comm.h-now-depends-on-term.h.patch \
> -           file://0001-fix-for-multijob-build.patch \
> -           file://0001-Remove-more-compatibility-stuff.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa=
7aa4766c7405ac69"
> +SRC_URI[sha256sum] =3D "f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2f=
d3425976aed94971"
>
> -inherit autotools texinfo
> +inherit autotools-brokensep texinfo
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[utempter] =3D "ac_cv_header_utempter_h=3Dyes,ac_cv_header_=
utempter_h=3Dno,libutempter,"
>
> -EXTRA_OECONF =3D "--with-pty-mode=3D0620 --with-pty-group=3D5 --with-sys=
-screenrc=3D${sysconfdir}/screenrc \
> +EXTRA_OECONF =3D "--with-pty-mode=3D0620 --with-pty-group=3D5 --with-sys=
tem_screenrc=3D${sysconfdir}/screenrc \
>                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-=
pam', '--disable-pam', d)}"
>
>  do_install:append () {
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206185): https://lists.openembedded.org/g/openembedde=
d-core/message/206185
> Mute This Topic: https://lists.openembedded.org/mt/109167182/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

