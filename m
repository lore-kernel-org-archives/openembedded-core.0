Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web11.10504.1599647496731433510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 03:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BEfd6u+O;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id y194so1046181vsc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N72XuiLFz52qXjLXb3neVKd4yxY7/Nux8NnXAfKsi3A=;
        b=BEfd6u+OvdjoBzrBiuTGcKWtqycxH52JPEUaU+cW5OfnbDCnRYffByFKwPm8cQD+kK
         KVh9S/azSS98+V7I62myjCYKu4hEJnM4fPzuk8uA/WhPsTQ1VO7JTgHOAie4F0Px9mnF
         rtkLfcCW8i3lV4C5lu6pO7KPg4mS1s/Kus8D94cCM67pCSqvNGhTJsbwQeG7UgeaeU7E
         k73TMTScVJ5l6GMZCNuSwscDlLbBiJs3fTDmISYGUrGwpExzr5mxPgkPXKboe0Ttni7M
         VxMHHlXWAIcc4n27oiqDJqU1apOvyrJb5RYvneLxBle8xFK59zyfy85RbwmRQIISEkKy
         uGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N72XuiLFz52qXjLXb3neVKd4yxY7/Nux8NnXAfKsi3A=;
        b=JQvtCKFbCZZTUBi7L5DPsm1DTkBsYyiCABtsPXpTfgs71aXYysqS9T6tnkUSxvbzSc
         /2cJlgysttNSlhqUU0mAsrVa+5B/Jdfd4y0LfM4qJU1hEFDM9hqsfrkGl4rsp7cTiysh
         MxjOjvVfEs/5H59tsmBS9srSNRDIz1hw7kDuMurvaV/CjN5qKC0IiPl8PYHClEwGTJ2s
         wHhjfM2lYU+p9yvtUFrYhJxQ58FpnsSsDeqnBFDDQYB1+bL4zWnjMhc4+6hkyYPUT7uJ
         5lcuv6NxEABEUMAD0EpIcpzeN+yM7VB+f++fU9aiiuenxs9XRumx4y2WHtEMs6aGIgzx
         o0cQ==
X-Gm-Message-State: AOAM531MWbxL48sG7WBqkCxysRkf6U6lzIJ94lVotbXcZAXWPA72nKO7
	2ngxUZRbJ079jrjXBJ90/Fr+HdIEBBmLe8df27U=
X-Google-Smtp-Source: ABdhPJwpX8+sMaQIsNNFJpIw9Ng4F7YyThR0dwmk6sDCICn316I6qki+obOw62/qSpBetD8Y7lToiP7NzVdx2/Zpw3A=
X-Received: by 2002:a67:6bc6:: with SMTP id g189mr176945vsc.18.1599647495685;
 Wed, 09 Sep 2020 03:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <1599618116-55708-1-git-send-email-denis@denix.org>
In-Reply-To: <1599618116-55708-1-git-send-email-denis@denix.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 9 Sep 2020 12:31:24 +0200
Message-ID: <CANNYZj-QS5WTCR+eyBj1OO9245K71jB2A38B401mOjrOkw0pQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] weston: upgrade 8.0.0 -> 9.0.0
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="000000000000bf0dde05aedef4f6"

--000000000000bf0dde05aedef4f6
Content-Type: text/plain; charset="UTF-8"

Thanks - I think with this release weston-info is now moved to its own repo
and renamed wayland-info?
Can you make a recipe for it?

https://gitlab.freedesktop.org/wayland/wayland-utils

Alex

On Wed, 9 Sep 2020 at 04:22, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> Weston 9.0.0 is released! This release cycle has been pretty quiet,
> with just a few new features:
>
> - A new kiosk shell allows to display regular desktop apps in an
>   always-fullscreen mode
> - Improved testing infrastructure: the test harness has been
>   redesigned, DRM tests are now supported, DRM and OpenGL tests are now
>   enabled in our CI
> - DRM panel orientation property support
>
> As always, a number of bug fixes are included as well.
>
> https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html
>
> Add a patch to fix building of tests/weston-test-fixture-compositor.c on
> musl.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - patch tests/weston-test-fixture-compositor.c for musl
>
>  ...de-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch | 47
> ++++++++++++++++++++++
>  ...ch-Provide-a-default-version-that-doesn-t.patch | 27 +++++++------
>  .../wayland/{weston_8.0.0.bb => weston_9.0.0.bb}   |  4 +-
>  3 files changed, 63 insertions(+), 15 deletions(-)
>  create mode 100644
> meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
>  rename meta/recipes-graphics/wayland/{weston_8.0.0.bb => weston_9.0.0.bb}
> (97%)
>
> diff --git
> a/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
> b/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
> new file mode 100644
> index 0000000..6fe86ff
> --- /dev/null
> +++
> b/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
> @@ -0,0 +1,47 @@
> +From 58760e09eed662a72da939ff4802d605489cff8e Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Tue, 8 Sep 2020 19:37:42 -0400
> +Subject: [PATCH] tests: include fcntl.h for open(), O_RDWR, O_CLOEXEC and
> + O_CREAT
> +
> +musl libc (unlike glibc) requires explicitly incuding fcntl.h to define
> open(),
> +O_RDWR, O_CLOEXEC and O_CREAT. Otherwise the build fails with the errors:
> +
> +| ../weston-9.0.0/tests/weston-test-fixture-compositor.c: In function
> 'wait_for_lock':
> +| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:7: warning:
> implicit declaration of function 'open'; did you mean 'popen'?
> [-Wimplicit-function-declaration]
> +|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
> +|       |       ^~~~
> +|       |       popen
> +| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error:
> 'O_RDWR' undeclared (first use in this function)
> +|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
> +|       |                       ^~~~~~
> +| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note:
> each undeclared identifier is reported only once for each function it
> appears in
> +| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error:
> 'O_CLOEXEC' undeclared (first use in this function)
> +|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
> +|       |                                ^~~~~~~~~
> +| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error:
> 'O_CREAT' undeclared (first use in this function)
> +|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
> +|       |                                            ^~~~~~~
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/493/diffs?commit_id=b10c0e843dcb8148bbe869bb15261955b94ac98c
> ]
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + tests/weston-test-fixture-compositor.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/weston-test-fixture-compositor.c
> b/tests/weston-test-fixture-compositor.c
> +index 0c9855f..e0e32c9 100644
> +--- a/tests/weston-test-fixture-compositor.c
> ++++ b/tests/weston-test-fixture-compositor.c
> +@@ -31,6 +31,7 @@
> + #include <unistd.h>
> + #include <sys/file.h>
> + #include <errno.h>
> ++#include <fcntl.h>
> +
> + #include "shared/helpers.h"
> + #include "weston-test-fixture-compositor.h"
> +--
> +2.7.4
> +
> diff --git
> a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> index 62b864c..3279a72 100644
> ---
> a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> +++
> b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> @@ -1,7 +1,8 @@
> -From 5f2d71998eb77068cbaee2d468cbb296a42d5739 Mon Sep 17 00:00:00 2001
> +From a1548c742bf2dedbb47282d8a00407b60bbab669 Mon Sep 17 00:00:00 2001
>  From: Tom Hochstein <tom.hochstein@nxp.com>
>  Date: Wed, 22 Feb 2017 15:53:30 +0200
>  Subject: [PATCH] weston-launch: Provide a default version that doesn't
> require
> +
>   PAM
>
>  weston-launch requires PAM for starting weston as a non-root user.
> @@ -57,7 +58,7 @@ index 08d23ec..cb9fd3f 100644
>                 install: true
>         )
>  diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
> -index 8a711b4..54c567a 100644
> +index 521cb2c..2d42d33 100644
>  --- a/libweston/weston-launch.c
>  +++ b/libweston/weston-launch.c
>  @@ -51,7 +51,9 @@
> @@ -97,7 +98,7 @@ index 8a711b4..54c567a 100644
>
>   static int
>   setup_launcher_socket(struct weston_launch *wl)
> -@@ -431,6 +437,7 @@ quit(struct weston_launch *wl, int status)
> +@@ -466,6 +472,7 @@ quit(struct weston_launch *wl, int status)
>         close(wl->signalfd);
>         close(wl->sock[0]);
>
> @@ -105,15 +106,15 @@ index 8a711b4..54c567a 100644
>         if (wl->new_user) {
>                 err = pam_close_session(wl->ph, 0);
>                 if (err)
> -@@ -438,6 +445,7 @@ quit(struct weston_launch *wl, int status)
> +@@ -473,6 +480,7 @@ quit(struct weston_launch *wl, int status)
>                                 err, pam_strerror(wl->ph, err));
>                 pam_end(wl->ph, err);
>         }
>  +#endif
>
> -       if (ioctl(wl->tty, KDSKBMUTE, 0) &&
> -           ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
> -@@ -666,6 +674,7 @@ setup_session(struct weston_launch *wl, char
> **child_argv)
> +       /*
> +        * Get a fresh handle to the tty as the previous one is in
> +@@ -710,6 +718,7 @@ setup_session(struct weston_launch *wl, char
> **child_argv)
>         setenv("HOME", wl->pw->pw_dir, 1);
>         setenv("SHELL", wl->pw->pw_shell, 1);
>
> @@ -121,7 +122,7 @@ index 8a711b4..54c567a 100644
>         env = pam_getenvlist(wl->ph);
>         if (env) {
>                 for (i = 0; env[i]; ++i) {
> -@@ -674,6 +683,7 @@ setup_session(struct weston_launch *wl, char
> **child_argv)
> +@@ -718,6 +727,7 @@ setup_session(struct weston_launch *wl, char
> **child_argv)
>                 }
>                 free(env);
>         }
> @@ -129,7 +130,7 @@ index 8a711b4..54c567a 100644
>
>         /*
>          * We open a new session, so it makes sense
> -@@ -745,8 +755,10 @@ static void
> +@@ -789,8 +799,10 @@ static void
>   help(const char *name)
>   {
>         fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n",
> name);
> @@ -140,7 +141,7 @@ index 8a711b4..54c567a 100644
>         fprintf(stderr, "  -t, --tty       Start session on alternative
> tty,\n"
>                         "                  e.g. -t /dev/tty4, requires -u
> option.\n");
>         fprintf(stderr, "  -v, --verbose   Be verbose\n");
> -@@ -760,7 +772,9 @@ main(int argc, char *argv[])
> +@@ -804,7 +816,9 @@ main(int argc, char *argv[])
>         int i, c;
>         char *tty = NULL;
>         struct option opts[] = {
> @@ -150,7 +151,7 @@ index 8a711b4..54c567a 100644
>                 { "tty",     required_argument, NULL, 't' },
>                 { "verbose", no_argument,       NULL, 'v' },
>                 { "help",    no_argument,       NULL, 'h' },
> -@@ -772,11 +786,16 @@ main(int argc, char *argv[])
> +@@ -816,11 +830,16 @@ main(int argc, char *argv[])
>         while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
>                 switch (c) {
>                 case 'u':
> @@ -167,7 +168,7 @@ index 8a711b4..54c567a 100644
>                         break;
>                 case 't':
>                         tty = optarg;
> -@@ -828,8 +847,10 @@ main(int argc, char *argv[])
> +@@ -872,8 +891,10 @@ main(int argc, char *argv[])
>         if (setup_tty(&wl, tty) < 0)
>                 exit(EXIT_FAILURE);
>
> @@ -179,7 +180,7 @@ index 8a711b4..54c567a 100644
>         if (setup_launcher_socket(&wl) < 0)
>                 exit(EXIT_FAILURE);
>  diff --git a/meson_options.txt b/meson_options.txt
> -index c862ecc..73ef2c3 100644
> +index 239bd2d..99e4ec3 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -73,6 +73,13 @@ option(
> diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb
> b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> similarity index 97%
> rename from meta/recipes-graphics/wayland/weston_8.0.0.bb
> rename to meta/recipes-graphics/wayland/weston_9.0.0.bb
> index 8fef864..2c526e3 100644
> --- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> @@ -10,9 +10,9 @@ SRC_URI = "
> https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://weston.desktop \
>             file://xwayland.weston-start \
>
> file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
> +
>  file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch \
>  "
> -SRC_URI[md5sum] = "53e4810d852df0601d01fd986a5b22b3"
> -SRC_URI[sha256sum] =
> "7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848"
> +SRC_URI[sha256sum] =
> "5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbdebe83e1f83aa098fe"
>
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>
> --
> 2.7.4
>
> 
>

--000000000000bf0dde05aedef4f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks - I think with this release weston-info is now=
 moved to its own repo and renamed wayland-info?</div><div>Can you make a r=
ecipe for it?</div><div><br></div><div><a href=3D"https://gitlab.freedeskto=
p.org/wayland/wayland-utils">https://gitlab.freedesktop.org/wayland/wayland=
-utils</a></div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 9 Sep 2020 at 04:=
22, Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_bla=
nk">denys@ti.com</a>&gt;<br>
<br>
Weston 9.0.0 is released! This release cycle has been pretty quiet,<br>
with just a few new features:<br>
<br>
- A new kiosk shell allows to display regular desktop apps in an<br>
=C2=A0 always-fullscreen mode<br>
- Improved testing infrastructure: the test harness has been<br>
=C2=A0 redesigned, DRM tests are now supported, DRM and OpenGL tests are n=
ow<br>
=C2=A0 enabled in our CI<br>
- DRM panel orientation property support<br>
<br>
As always, a number of bug fixes are included as well.<br>
<a href=3D"https://lists.freedesktop.org/archives/wayland-devel/2020-Septe=
mber/041595.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freede=
sktop.org/archives/wayland-devel/2020-September/041595.html</a><br>
<br>
Add a patch to fix building of tests/weston-test-fixture-compositor.c on m=
usl.<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;<br>
---<br>
v2 - patch tests/weston-test-fixture-compositor.c for musl<br>
<br>
=C2=A0...de-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch | 47 ++++++++++++=
++++++++++<br>
=C2=A0...ch-Provide-a-default-version-that-doesn-t.patch | 27 +++++++-----=
-<br>
=C2=A0.../wayland/{<a href=3D"http://weston_8.0.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">weston_8.0.0.bb</a> =3D&gt; <a href=3D"http://weston_9.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">weston_9.0.0.bb</a>}=C2=A0 =C2=A0=
|=C2=A0 4 +-<br>
=C2=A03 files changed, 63 insertions(+), 15 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/weston/0001-tests-i=
nclude-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch<br>
=C2=A0rename meta/recipes-graphics/wayland/{<a href=3D"http://weston_8.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">weston_8.0.0.bb</a> =3D&gt; <a hr=
ef=3D"http://weston_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_9=
.0.0.bb</a>} (97%)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl=
.h-for-open-O_RDWR-O_CLOEXEC-and-.patch b/meta/recipes-graphics/wayland/wes=
ton/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch<br>
new file mode 100644<br>
index 0000000..6fe86ff<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-=
open-O_RDWR-O_CLOEXEC-and-.patch<br>
@@ -0,0 +1,47 @@<br>
+From 58760e09eed662a72da939ff4802d605489cff8e Mon Sep 17 00:00:00 2001<br=
>
+From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_bl=
ank">denys@ti.com</a>&gt;<br>
+Date: Tue, 8 Sep 2020 19:37:42 -0400<br>
+Subject: [PATCH] tests: include fcntl.h for open(), O_RDWR, O_CLOEXEC and=
<br>
+ O_CREAT<br>
+<br>
+musl libc (unlike glibc) requires explicitly incuding fcntl.h to define o=
pen(),<br>
+O_RDWR, O_CLOEXEC and O_CREAT. Otherwise the build fails with the errors:=
<br>
+<br>
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c: In function &#3=
9;wait_for_lock&#39;:<br>
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:7: warning: =
implicit declaration of function &#39;open&#39;; did you mean &#39;popen&#3=
9;? [-Wimplicit-function-declaration]<br>
+|=C2=A0 =C2=A0135 |=C2=A0 fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_C=
REAT, 00700);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0popen<br>
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error: &=
#39;O_RDWR&#39; undeclared (first use in this function)<br>
+|=C2=A0 =C2=A0135 |=C2=A0 fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_C=
REAT, 00700);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note: ea=
ch undeclared identifier is reported only once for each function it appears=
 in<br>
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error: &=
#39;O_CLOEXEC&#39; undeclared (first use in this function)<br>
+|=C2=A0 =C2=A0135 |=C2=A0 fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_C=
REAT, 00700);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~=
~~~~~<br>
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error: &=
#39;O_CREAT&#39; undeclared (first use in this function)<br>
+|=C2=A0 =C2=A0135 |=C2=A0 fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_C=
REAT, 00700);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/way=
land/weston/-/merge_requests/493/diffs?commit_id=3Db10c0e843dcb8148bbe869bb=
15261955b94ac98c" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freed=
esktop.org/wayland/weston/-/merge_requests/493/diffs?commit_id=3Db10c0e843d=
cb8148bbe869bb15261955b94ac98c</a>]<br>
+<br>
+Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targ=
et=3D"_blank">denys@ti.com</a>&gt;<br>
+---<br>
+ tests/weston-test-fixture-compositor.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/tests/weston-test-fixture-compositor.c b/tests/weston-test-f=
ixture-compositor.c<br>
+index 0c9855f..e0e32c9 100644<br>
+--- a/tests/weston-test-fixture-compositor.c<br>
++++ b/tests/weston-test-fixture-compositor.c<br>
+@@ -31,6 +31,7 @@<br>
+ #include &lt;unistd.h&gt;<br>
+ #include &lt;sys/file.h&gt;<br>
+ #include &lt;errno.h&gt;<br>
++#include &lt;fcntl.h&gt;<br>
+ <br>
+ #include &quot;shared/helpers.h&quot;<br>
+ #include &quot;weston-test-fixture-compositor.h&quot;<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provi=
de-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/wes=
ton/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch<br>
index 62b864c..3279a72 100644<br>
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-de=
fault-version-that-doesn-t.patch<br>
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-de=
fault-version-that-doesn-t.patch<br>
@@ -1,7 +1,8 @@<br>
-From 5f2d71998eb77068cbaee2d468cbb296a42d5739 Mon Sep 17 00:00:00 2001<br=
>
+From a1548c742bf2dedbb47282d8a00407b60bbab669 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com" tar=
get=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0Date: Wed, 22 Feb 2017 15:53:30 +0200<br>
=C2=A0Subject: [PATCH] weston-launch: Provide a default version that doesn=
&#39;t require<br>
+<br>
=C2=A0 PAM<br>
<br>
=C2=A0weston-launch requires PAM for starting weston as a non-root user.<b=
r>
@@ -57,7 +58,7 @@ index 08d23ec..cb9fd3f 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c<b=
r>
-index 8a711b4..54c567a 100644<br>
+index 521cb2c..2d42d33 100644<br>
=C2=A0--- a/libweston/weston-launch.c<br>
=C2=A0+++ b/libweston/weston-launch.c<br>
=C2=A0@@ -51,7 +51,9 @@<br>
@@ -97,7 +98,7 @@ index 8a711b4..54c567a 100644<br>
<br>
=C2=A0 static int<br>
=C2=A0 setup_launcher_socket(struct weston_launch *wl)<br>
-@@ -431,6 +437,7 @@ quit(struct weston_launch *wl, int status)<br>
+@@ -466,6 +472,7 @@ quit(struct weston_launch *wl, int status)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(wl-&gt;signalfd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(wl-&gt;sock[0]);<br>
<br>
@@ -105,15 +106,15 @@ index 8a711b4..54c567a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wl-&gt;new_user) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D pam_close_=
session(wl-&gt;ph, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
-@@ -438,6 +445,7 @@ quit(struct weston_launch *wl, int status)<br>
+@@ -473,6 +480,7 @@ quit(struct weston_launch *wl, int status)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err, pam_strerror(wl-&gt;ph, err));=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pam_end(wl-&gt;ph,=
 err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+#endif<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl(wl-&gt;tty, KDSKBMUTE, 0) &amp;&amp;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(wl-&gt;tty, KDSKBMODE, wl-=
&gt;kb_mode))<br>
-@@ -666,6 +674,7 @@ setup_session(struct weston_launch *wl, char **child_=
argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Get a fresh handle to the tty as the previo=
us one is in<br>
+@@ -710,6 +718,7 @@ setup_session(struct weston_launch *wl, char **child_=
argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv(&quot;HOME&quot;, wl-&gt;pw-&gt;pw_dir,=
 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv(&quot;SHELL&quot;, wl-&gt;pw-&gt;pw_she=
ll, 1);<br>
<br>
@@ -121,7 +122,7 @@ index 8a711b4..54c567a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D pam_getenvlist(wl-&gt;ph);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; env[=
i]; ++i) {<br>
-@@ -674,6 +683,7 @@ setup_session(struct weston_launch *wl, char **child_=
argv)<br>
+@@ -718,6 +727,7 @@ setup_session(struct weston_launch *wl, char **child_=
argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(env);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -129,7 +130,7 @@ index 8a711b4..54c567a 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We open a new session, so it makes sen=
se<br>
-@@ -745,8 +755,10 @@ static void<br>
+@@ -789,8 +799,10 @@ static void<br>
=C2=A0 help(const char *name)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Usage: %s [args...] [-- =
[weston args..]]\n&quot;, name);<br>
@@ -140,7 +141,7 @@ index 8a711b4..54c567a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 -t, --tty=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Start session on alternative tty,\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 e.g. -t /dev/tty4, requires -u option.\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 -v, --verbose=C2=
=A0 =C2=A0Be verbose\n&quot;);<br>
-@@ -760,7 +772,9 @@ main(int argc, char *argv[])<br>
+@@ -804,7 +816,9 @@ main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, c;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *tty =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct option opts[] =3D {<br>
@@ -150,7 +151,7 @@ index 8a711b4..54c567a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;tty&quot;,=
=
=C2=A0 =C2=A0 =C2=A0required_argument, NULL, &#39;t&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;verbose&qu=
ot;, no_argument,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;v&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;help&quot;=
,=C2=A0 =C2=A0 no_argument,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;h&#39; },<=
br>
-@@ -772,11 +786,16 @@ main(int argc, char *argv[])<br>
+@@ -816,11 +830,16 @@ main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((c =3D getopt_long(argc, argv, &quot;u:=
t:vh&quot;, opts, &amp;i)) !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (c) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;u&#39;:<=
br>
@@ -167,7 +168,7 @@ index 8a711b4..54c567a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;t&#39;:<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tty =3D optarg;<br>
-@@ -828,8 +847,10 @@ main(int argc, char *argv[])<br>
+@@ -872,8 +891,10 @@ main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setup_tty(&amp;wl, tty) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE)=
;<br>
<br>
@@ -179,7 +180,7 @@ index 8a711b4..54c567a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setup_launcher_socket(&amp;wl) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE)=
;<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index c862ecc..73ef2c3 100644<br>
+index 239bd2d..99e4ec3 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
=C2=A0@@ -73,6 +73,13 @@ option(<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston_8.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">weston_8.0.0.bb</a> b/meta/recipes=
-graphics/wayland/<a href=3D"http://weston_9.0.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">weston_9.0.0.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-graphics/wayland/<a href=3D"http://weston_8.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">weston_8.0.0.bb</a><br>
rename to meta/recipes-graphics/wayland/<a href=3D"http://weston_9.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_9.0.0.bb</a><br>
index 8fef864..2c526e3 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://weston_8.0.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">weston_8.0.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston_9.0.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">weston_9.0.0.bb</a><br>
@@ -10,9 +10,9 @@ SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop=
.org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bl=
ank">https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://weston.desktop \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://xwayland.weston-start \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-weston-launch-Provid=
e-a-default-version-that-doesn-t.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-include-fcntl.=
h-for-open-O_RDWR-O_CLOEXEC-and-.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;53e4810d852df0601d01fd986a5b22b3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51=
161927afa4329c027848&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbda=
bbdebe83e1f83aa098fe&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://wayland.freedesktop.=
org/releases.html" rel=3D"noreferrer" target=3D"_blank">https://wayland.fre=
edesktop.org/releases.html</a>&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div>

--000000000000bf0dde05aedef4f6--
