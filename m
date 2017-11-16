Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3A422605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 16:09:39 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id b5so569740itc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 08:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SerQaCSyuuK1stGoq9af7xUjUCXoR6cmPTGi4Hx1QRc=;
	b=DhVeLXg2HsnMYWxrJOa0GYc1LUXDlCd3p7/j0N+OLoqpUepdG58gLH2To4ghDxp5jx
	bvqaJ785JzGU3ihUPU1bIdwLzPqv8QqT1ItGJpF/jJGWnqCnZeDu0m1HuvAFSIWQ25bm
	I1VVqX9No5idtrGHk2fJGOUsnd2NCwUtu8GaHHyfISYSMwmkLtEj5ApN8KzmWkqlc1iO
	1gJenlH2piOSDraDuXQR6o6Es6wRTaSqCpAnKvXGDypY8r8rk7DM3pSqEQQpHnSL3Lds
	SVibbATtlibgocEnN+7wp/X4VYFP3xDPcejakYwd4FKo1dkhS6fOZ3p+PcAd6+5Hdtux
	Vgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SerQaCSyuuK1stGoq9af7xUjUCXoR6cmPTGi4Hx1QRc=;
	b=MUqQ5y5YWB++7BDnDK2DVVlkJtq8QPRWRHSihPitBxQGU3J+VW1McQOzHQdfUgY1lG
	aA8t2FAgwqke1uzu3++m5prRKVroZI9l9EGgodsZA31OtyUmiaK8BIXl1wMDCnErXVr2
	AlMI5h9JWGqPPp/TZRA3IoPnkAeStTZHN5uGCWzaQ3ZL1cW8i1I5ZJeSF8dRebSqJ7YI
	NNU0VPoKzZYPFnCeACu3oX5z7/twG5y8szDhOgJDPYLeZCecVRaj2QHOqc0fc215d/YB
	QZ3karR4I0BeL5r9d5I52rpaeXp4sj/AlFzH34XFqKLAhrH5bOppcNR/q/SUXBiliNE1
	/0pQ==
X-Gm-Message-State: AJaThX4RmsPl0EG9dBl78M8iE+FwJV/Btz/457Iz65SJRYMqXXTYDsWe
	SO0AOxF8DwBYOIxY3HsyoZN5XqfR5w5+r8yJLPh8iw==
X-Google-Smtp-Source: AGs4zMb8rSumkOIiJ3UvaZfmaKw089UOyP+DSWjji2Fm3+xxaV3FbAIgMyU+1plqm6FmAW96kjepmut1U9plUt+QmPI=
X-Received: by 10.36.172.31 with SMTP id s31mr2921823ite.124.1510848580803;
	Thu, 16 Nov 2017 08:09:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 08:09:20 -0800 (PST)
In-Reply-To: <1510315228-24186-5-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
	<1510315228-24186-5-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Nov 2017 16:09:20 +0000
Message-ID: <CAJTo0LYRgX7EcL5vb234NV2pkDneHYACCyEySvYei6dCahWG9w@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] screen: upgrade to 4.6.2
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
X-List-Received-Date: Thu, 16 Nov 2017 16:09:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c1fc0f8f7fae9055e1bd8ae"

--94eb2c1fc0f8f7fae9055e1bd8ae
Content-Type: text/plain; charset="UTF-8"

Breaks under MIPS, see
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12353.

Ross

On 10 November 2017 at 12:00, Maxin B. John <maxin.john@intel.com> wrote:

> 4.6.1 -> 4.6.2
>
> Removed backported patches:
>         1. 0001-fix-for-multijob-build.patch
>         2. 0002-comm.h-now-depends-on-term.h.patch
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../screen/0001-fix-for-multijob-build.patch       | 58
> ----------------------
>  .../screen/0002-comm.h-now-depends-on-term.h.patch | 33 ------------
>  .../screen/{screen_4.6.1.bb => screen_4.6.2.bb}    |  6 +--
>  3 files changed, 2 insertions(+), 95 deletions(-)
>  delete mode 100644 meta/recipes-extended/screen/
> screen/0001-fix-for-multijob-build.patch
>  delete mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-
> depends-on-term.h.patch
>  rename meta/recipes-extended/screen/{screen_4.6.1.bb => screen_4.6.2.bb}
> (88%)
>
> diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
> b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
> deleted file mode 100644
> index fbdb0eb..0000000
> --- a/meta/recipes-extended/screen/screen/0001-fix-for-
> multijob-build.patch
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
> -Backport patch to fix parallel build failure and update context to make
> patch
> -coulde be applied.
> -
> -http://git.savannah.gnu.org/cgit/screen.git/commit?id=c0de6dd
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
> -@@ -298,7 +298,7 @@ search.o: layout.h viewport.h canvas.h search.c
> config.h screen.h os.h osdef.h a
> -  comm.h layer.h term.h image.h display.h window.h mark.h extern.h
> - tty.o: layout.h viewport.h canvas.h tty.c config.h screen.h os.h osdef.h
> ansi.h acls.h comm.h \
> -  layer.h term.h image.h display.h window.h extern.h
> --term.o: layout.h viewport.h canvas.h term.c term.h
> -+term.o: layout.h viewport.h canvas.h term.c term.h comm.h
> - window.o: layout.h viewport.h canvas.h window.c config.h screen.h os.h
> osdef.h ansi.h acls.h \
> -  comm.h layer.h term.h image.h display.h window.h extern.h logfile.h
> - utmp.o: layout.h viewport.h canvas.h utmp.c config.h screen.h os.h
> osdef.h ansi.h acls.h \
> -@@ -324,7 +324,7 @@ canvas.o: layout.h viewport.h canvas.h canvas.c
> config.h screen.h os.h osdef.h a
> -  comm.h layer.h term.h image.h display.h window.h extern.h \
> -  braille.h
> - comm.o: layout.h viewport.h canvas.h comm.c config.h acls.h comm.h
> --kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h
> -+kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h comm.h
> - acls.o: layout.h viewport.h canvas.h acls.c config.h screen.h os.h
> osdef.h ansi.h acls.h comm.h \
> -  layer.h term.h image.h display.h window.h extern.h
> - braille.o: layout.h viewport.h canvas.h braille.c config.h screen.h os.h
> osdef.h ansi.h acls.h \
> -@@ -350,7 +350,7 @@ layout.o: layout.h viewport.h canvas.h layout.c
> config.h screen.h os.h osdef.h a
> - viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h
> os.h osdef.h ansi.h acls.h \
> -  comm.h layer.h term.h image.h display.h window.h extern.h \
> -  braille.h
> --list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
> --list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
> -+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
> comm.h
> -+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
> comm.h
> - list_window.o: list_generic.h list_window.c window.h layer.h screen.h
> osdef.h comm.h
> -
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
> b/meta/recipes-extended/screen/screen/0002-comm.h-now-
> depends-on-term.h.patch
> deleted file mode 100644
> index b5d71cc..0000000
> --- a/meta/recipes-extended/screen/screen/0002-comm.h-now-
> depends-on-term.h.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upstream-Status: Backport
> -
> -Backport from:
> -
> -http://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c
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
> -diff --git a/src/Makefile.in b/src/Makefile.in
> -index e791e79..d4f7c0b 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -113,7 +113,7 @@ term.h: term.c term.sh
> -
> - kmapdef.c: term.h
> -
> --comm.h: comm.c comm.sh config.h
> -+comm.h: comm.c comm.sh config.h term.h
> -       AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh
> $(srcdir)/comm.sh
> -
> - docs:
> ---
> -2.4.1
> -
> diff --git a/meta/recipes-extended/screen/screen_4.6.1.bb
> b/meta/recipes-extended/screen/screen_4.6.2.bb
> similarity index 88%
> rename from meta/recipes-extended/screen/screen_4.6.1.bb
> rename to meta/recipes-extended/screen/screen_4.6.2.bb
> index bcd83a2..f54113f 100644
> --- a/meta/recipes-extended/screen/screen_4.6.1.bb
> +++ b/meta/recipes-extended/screen/screen_4.6.2.bb
> @@ -21,13 +21,11 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
>             file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
> \
>             file://Skip-host-file-system-checks-when-cross-compiling.patch
> \
>             file://Avoid-mis-identifying-systems-as-SVR4.patch \
> -           file://0002-comm.h-now-depends-on-term.h.patch \
> -           file://0001-fix-for-multijob-build.patch \
>             file://0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
> \
>            "
>
> -SRC_URI[md5sum] = "132c893aabfaf2020074790215c8cacd"
> -SRC_URI[sha256sum] = "aba9af66cb626155d6abce4703f45c
> ce0e30a5114a368bd6387c966cbbbb7c64"
> +SRC_URI[md5sum] = "a0f529d3333b128dfaa324d978ba73a8"
> +SRC_URI[sha256sum] = "1b6922520e6a0ce5e28768d620b0f6
> 40a6631397f95ccb043b70b91bb503fa3a"
>
>  inherit autotools texinfo
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1fc0f8f7fae9055e1bd8ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaks under MIPS, see=C2=A0<a href=3D"https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D12353">https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D12353</a>.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 10 November 2017 at 12:0=
0, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.c=
om" target=3D"_blank">maxin.john@intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">4.6.1 -&gt; 4.6.2<br>
<br>
Removed backported patches:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. 0001-fix-for-multijob-build.<wbr>patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. 0002-comm.h-now-depends-on-<wbr>term.h.patch=
<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0.../screen/0001-fix-for-<wbr>multijob-build.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 58 ----------------------<br>
=C2=A0.../screen/0002-comm.h-now-<wbr>depends-on-term.h.patch | 33 --------=
----<br>
=C2=A0.../screen/{<a href=3D"http://screen_4.6.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">screen_4.6.1.bb</a> =3D&gt; <a href=3D"http://screen_4.6.2.b=
b" rel=3D"noreferrer" target=3D"_blank">screen_4.6.2.bb</a>}=C2=A0 =C2=A0 |=
=C2=A0 6 +--<br>
=C2=A03 files changed, 2 insertions(+), 95 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/screen/<wbr>screen/0001-fix-=
for-multijob-<wbr>build.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/screen/<wbr>screen/0002-comm=
.h-now-<wbr>depends-on-term.h.patch<br>
=C2=A0rename meta/recipes-extended/screen/{<a href=3D"http://screen_4.6.1.b=
b" rel=3D"noreferrer" target=3D"_blank"><wbr>screen_4.6.1.bb</a> =3D&gt; <a=
 href=3D"http://screen_4.6.2.bb" rel=3D"noreferrer" target=3D"_blank">scree=
n_4.6.2.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-extended/<wbr>screen/screen/0001-fix-for-<wbr>mul=
tijob-build.patch b/meta/recipes-extended/<wbr>screen/screen/0001-fix-for-<=
wbr>multijob-build.patch<br>
deleted file mode 100644<br>
index fbdb0eb..0000000<br>
--- a/meta/recipes-extended/<wbr>screen/screen/0001-fix-for-<wbr>multijob-b=
uild.patch<br>
+++ /dev/null<br>
@@ -1,58 +0,0 @@<br>
-From 79ad2885e26631077dd6b8aebe17ae<wbr>95b38133a6 Mon Sep 17 00:00:00 200=
1<br>
-From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.com">jacki=
e.huang@windriver.com</a>&gt;<br>
-Date: Tue, 26 Jul 2016 14:23:59 +0800<br>
-Subject: [PATCH] fix for multijob build<br>
-<br>
-make sure that comm.sh script generates comm.h header before doing<br>
-anything else<br>
-<br>
-Signed-off-by: Amadeusz Sawiski &lt;<a href=3D"mailto:amade@asmblr.net">am=
ade@asmblr.net</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Backport patch to fix parallel build failure and update context to make pa=
tch<br>
-coulde be applied.<br>
-<br>
-<a href=3D"http://git.savannah.gnu.org/cgit/screen.git/commit?id=3Dc0de6dd=
" rel=3D"noreferrer" target=3D"_blank">http://git.savannah.gnu.org/<wbr>cgi=
t/screen.git/commit?id=3D<wbr>c0de6dd</a><br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
-Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.c=
om">jackie.huang@windriver.com</a>&gt;<br>
----<br>
- Makefile.in | 8 ++++----<br>
- 1 file changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/Makefile.in b/Makefile.in<br>
-index aca7da3..3607711 100644<br>
---- a/Makefile.in<br>
-+++ b/Makefile.in<br>
-@@ -298,7 +298,7 @@ search.o: layout.h viewport.h canvas.h search.c config=
.h screen.h os.h osdef.h a<br>
-=C2=A0 comm.h layer.h term.h image.h display.h window.h mark.h extern.h<br=
>
- tty.o: layout.h viewport.h canvas.h tty.c config.h screen.h os.h osdef.h =
ansi.h acls.h comm.h \<br>
-=C2=A0 layer.h term.h image.h display.h window.h extern.h<br>
--term.o: layout.h viewport.h canvas.h term.c term.h<br>
-+term.o: layout.h viewport.h canvas.h term.c term.h comm.h<br>
- window.o: layout.h viewport.h canvas.h window.c config.h screen.h os.h os=
def.h ansi.h acls.h \<br>
-=C2=A0 comm.h layer.h term.h image.h display.h window.h extern.h logfile.h=
<br>
- utmp.o: layout.h viewport.h canvas.h utmp.c config.h screen.h os.h osdef.=
h ansi.h acls.h \<br>
-@@ -324,7 +324,7 @@ canvas.o: layout.h viewport.h canvas.h canvas.c config=
.h screen.h os.h osdef.h a<br>
-=C2=A0 comm.h layer.h term.h image.h display.h window.h extern.h \<br>
-=C2=A0 braille.h<br>
- comm.o: layout.h viewport.h canvas.h comm.c config.h acls.h comm.h<br>
--kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h<br>
-+kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h comm.h<br>
- acls.o: layout.h viewport.h canvas.h acls.c config.h screen.h os.h osdef.=
h ansi.h acls.h comm.h \<br>
-=C2=A0 layer.h term.h image.h display.h window.h extern.h<br>
- braille.o: layout.h viewport.h canvas.h braille.c config.h screen.h os.h =
osdef.h ansi.h acls.h \<br>
-@@ -350,7 +350,7 @@ layout.o: layout.h viewport.h canvas.h layout.c config=
.h screen.h os.h osdef.h a<br>
- viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h os.=
h osdef.h ansi.h acls.h \<br>
-=C2=A0 comm.h layer.h term.h image.h display.h window.h extern.h \<br>
-=C2=A0 braille.h<br>
--list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h<br=
>
--list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h<br=
>
-+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h co=
mm.h<br>
-+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h co=
mm.h<br>
- list_window.o: list_generic.h list_window.c window.h layer.h screen.h osd=
ef.h comm.h<br>
-<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-extended/<wbr>screen/screen/0002-comm.h-now-<wbr>=
depends-on-term.h.patch b/meta/recipes-extended/<wbr>screen/screen/0002-com=
m.h-now-<wbr>depends-on-term.h.patch<br>
deleted file mode 100644<br>
index b5d71cc..0000000<br>
--- a/meta/recipes-extended/<wbr>screen/screen/0002-comm.h-now-<wbr>depends=
-on-term.h.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Backport from:<br>
-<br>
-<a href=3D"http://git.savannah.gnu.org/cgit/screen.git/commit/?id=3D39c5f1=
c" rel=3D"noreferrer" target=3D"_blank">http://git.savannah.gnu.org/<wbr>cg=
it/screen.git/commit/?id=3D<wbr>39c5f1c</a><br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
-From 39c5f1c76f1fcef4b5958bf828a63f<wbr>53426b6984 Mon Sep 17 00:00:00 200=
1<br>
-From: Mike Gerwitz &lt;<a href=3D"mailto:mike@mikegerwitz.com">mike@mikege=
rwitz.com</a>&gt;<br>
-Date: Tue, 24 Dec 2013 22:16:31 -0500<br>
-Subject: [PATCH] comm.h now depends on term.h<br>
-<br>
----<br>
- src/Makefile.in | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/Makefile.in b/src/Makefile.in<br>
-index e791e79..d4f7c0b 100644<br>
---- a/Makefile.in<br>
-+++ b/Makefile.in<br>
-@@ -113,7 +113,7 @@ term.h: term.c term.sh<br>
-<br>
- kmapdef.c: term.h<br>
-<br>
--comm.h: comm.c comm.sh config.h<br>
-+comm.h: comm.c comm.sh config.h term.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AWK=3D$(AWK) CC=3D&quot;$(CC) $(CFLAGS)&quot; s=
rcdir=3D${srcdir} sh $(srcdir)/comm.sh<br>
-<br>
- docs:<br>
---<br>
-2.4.1<br>
-<br>
diff --git a/meta/recipes-extended/<wbr>screen/<a href=3D"http://screen_4.6=
.1.bb" rel=3D"noreferrer" target=3D"_blank">screen_4.6.1.bb</a> b/meta/reci=
pes-extended/<wbr>screen/<a href=3D"http://screen_4.6.2.bb" rel=3D"noreferr=
er" target=3D"_blank">screen_4.6.2.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-extended/screen/<a href=3D"http://screen_4.6.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">s<wbr>creen_4.6.1.bb</a><br>
rename to meta/recipes-extended/screen/<a href=3D"http://screen_4.6.2.bb" r=
el=3D"noreferrer" target=3D"_blank">s<wbr>creen_4.6.2.bb</a><br>
index bcd83a2..f54113f 100644<br>
--- a/meta/recipes-extended/<wbr>screen/<a href=3D"http://screen_4.6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">screen_4.6.1.bb</a><br>
+++ b/meta/recipes-extended/<wbr>screen/<a href=3D"http://screen_4.6.2.bb" =
rel=3D"noreferrer" target=3D"_blank">screen_4.6.2.bb</a><br>
@@ -21,13 +21,11 @@ SRC_URI =3D &quot;${GNU_MIRROR}/screen/screen-$<wbr>{PV=
}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Provide-cross-compile-<wbr=
>alternatives-for-AC_TRY_RUN.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Skip-host-file-system-<wbr=
>checks-when-cross-compiling.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Avoid-mis-identifying-<wbr=
>systems-as-SVR4.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-comm.h-now-<wbr>depen=
ds-on-term.h.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-for-multijob-<wbr=
>build.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.ac-fix-<wbr=
>configure-failed-while-build-<wbr>dir-ha.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>132c893aabfaf2020074790215c8ca<wbr>cd&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>aba9af66cb626155d6abce4703f45c<wbr>ce0e3=
0a5114a368bd6387c966cbbbb<wbr>7c64&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>a0f529d3333b128dfaa324d978ba73<wbr>a8&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>1b6922520e6a0ce5e28768d620b0f6<wbr>40a66=
31397f95ccb043b70b91bb503<wbr>fa3a&quot;<br>
<br>
=C2=A0inherit autotools texinfo<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.4.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c1fc0f8f7fae9055e1bd8ae--
