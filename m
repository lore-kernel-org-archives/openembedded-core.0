Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4F52860124
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 14:47:47 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id w5so180636854oib.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lLdS23RdBEc7psjY84I2Zn6refj3nLD7vITN7BTg9KI=;
	b=fkAdmGL8Go7IH/qA7v+BjNVTNo6oso6Pe9b7ufFcZ+eU/9FFOtoLMuwzrqRsRarht3
	pM1TzrsZiEVfmdk++Ll5xwpNIaZ0wDi0MzLK3W0k8B7saywSoPVpPwqXM22vGmJgU2NK
	tB3cLD8cfJ8YeEc1LpOChKO8qi3E+oajtH7cLIsfcwGlUH5r+aFsjnPMeo24MoJy1DAN
	AFMI4cHrTPOYPjKYXJw/OWHMDZzMNVB5jCFFfWeYkvY3AN2pmqUsu/LuyL6TA5ppKv+X
	Ncl4TNn3oJ9lBhMfunJ9XJYwOMe4NLIDdqIENvDKJQif8c368I4mtd7aX8ThQBKjy0h6
	DXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lLdS23RdBEc7psjY84I2Zn6refj3nLD7vITN7BTg9KI=;
	b=AEC4P33wHcHfm174bxpjSK+phKmZR4CV2grYcS40mkDnLT7qvICe975seAXX5NhEZI
	SN1jMIGufGl48ttU1K1Tom6n91uV2NRiHNuFBGFCHSnKTcY/vpCftP21/DDBTtkc8i5J
	VrjiGW74x3UyBMNMFLqdWqVpylgJQBybncU704wuOXQyOBYcyiSlNz7SkdBEfwflR33g
	/XCjr4clzl8yaGIrrx+BUs3ytN9u5ViXg4NruvRAc2OEwTy23Pl4CtL7HDeiAwXSoDgY
	5FkCcrG/9ket+ZOAKJoDnzbrpG/u155y1Yq4h3qPPGa6nAf2b0467dcesXxdzMmONCw3
	rPkg==
X-Gm-Message-State: ALyK8tJu/vx7SaXAFGr7A7P3kx223ExoaVvzy26iD5Kk+VS2pq/JTpcHoZUUWx2vgGW7VFwV2FYGxLosRYpcRkni
X-Received: by 10.157.40.150 with SMTP id s22mr11179892ota.62.1465915668222;
	Tue, 14 Jun 2016 07:47:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Tue, 14 Jun 2016 07:47:18 -0700 (PDT)
In-Reply-To: <e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
	<e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 14 Jun 2016 17:47:18 +0300
Message-ID: <CAHiDW_GNHmQYQaWbd6KMGmYaL6A=d2npR4965zhH2Br3v7Z68w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 10/30] vte: Upgrade to 0.44.1
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
X-List-Received-Date: Tue, 14 Jun 2016 14:47:49 -0000
Content-Type: multipart/alternative; boundary=001a11c17060acea6c05353e160a

--001a11c17060acea6c05353e160a
Content-Type: text/plain; charset=UTF-8

On 14 June 2016 at 11:14, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> * License change LGPL 2.0 -> LGPL 2.1+
> * vte-termcap is no more
> * API break: current version seems to be parallel installable
>   with old one, but I did not opt for that.
> * Add patch to avoid stack protection by default
> * Add SECURITY_NO_PIE_CFLAGS exception until linking failure with
>   libc_nonshared.a is resolved (undefined reference to
>   __init_array_start)
>

Just found out Khem has worked around a similar problem with libtool-cross
already: I've modified this patch so that SECURITY_NO_PIE_CFLAGS is no
longer used, but instead libtool-cross is used:

+# libtool adds "-nostdlib" when g++ is used. This breaks PIE builds.
+# Use libtool-cross (which has a hack to prevent that) instead.
+EXTRA_OEMAKE_class-target =
"LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"

 - Jussi




> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/conf/distro/include/security_flags.inc        |   2 +
>  .../vte/vte-0.28.2/cve-2012-2738.patch             | 136
> ---------------------
>  .../vte/vte-0.28.2/obsolete_automake_macros.patch  |  14 ---
>  meta/recipes-support/vte/vte.inc                   |  15 ---
>  ...-Don-t-enable-stack-protection-by-default.patch |  29 +++++
>  meta/recipes-support/vte/vte_0.28.2.bb             |  16 ---
>  meta/recipes-support/vte/vte_0.44.1.bb             |  24 ++++
>  7 files changed, 55 insertions(+), 181 deletions(-)
>  delete mode 100644 meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
>  delete mode 100644
> meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
>  delete mode 100644 meta/recipes-support/vte/vte.inc
>  create mode 100644
> meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
>  delete mode 100644 meta/recipes-support/vte/vte_0.28.2.bb
>  create mode 100644 meta/recipes-support/vte/vte_0.44.1.bb
>
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index ea1d4e5..0df65e0 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -95,6 +95,8 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
>
> +SECURITY_CFLAGS_pn-vte = "${SECURITY_NO_PIE_CFLAGS}"
> +
>  # Recipes which fail to compile when elevating -Wformat-security to an
> error
>  SECURITY_STRINGFORMAT_pn-busybox = ""
>  SECURITY_STRINGFORMAT_pn-console-tools = ""
> diff --git a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
> b/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
> deleted file mode 100644
> index 9b99803..0000000
> --- a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
> +++ /dev/null
> @@ -1,136 +0,0 @@
> -Upstream-Status: Backport
> -CVE: CVE-2012-2738
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001
> -From: Christian Persch <chpe@gnome.org>
> -Date: Sat, 19 May 2012 19:36:09 +0200
> -Subject: [PATCH 1/2] emulation: Limit integer arguments to 65535
> -
> -To guard against malicious sequences containing excessively big numbers,
> -limit all parsed numbers to 16 bit range. Doing this here in the parsing
> -routine is a catch-all guard; this doesn't preclude enforcing
> -more stringent limits in the handlers themselves.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=676090
> ----
> - src/table.c  | 2 +-
> - src/vteseq.c | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/table.c b/src/table.c
> -index 140e8c8..85cf631 100644
> ---- a/src/table.c
> -+++ b/src/table.c
> -@@ -550,7 +550,7 @@ _vte_table_extract_numbers(GValueArray **array,
> -               if (G_UNLIKELY (*array == NULL)) {
> -                       *array = g_value_array_new(1);
> -               }
> --              g_value_set_long(&value, total);
> -+              g_value_set_long(&value, CLAMP (total, 0, G_MAXUSHORT));
> -               g_value_array_append(*array, &value);
> -       } while (i++ < arginfo->length);
> -       g_value_unset(&value);
> -diff --git a/src/vteseq.c b/src/vteseq.c
> -index 7ef4c8c..10991db 100644
> ---- a/src/vteseq.c
> -+++ b/src/vteseq.c
> -@@ -557,7 +557,7 @@ vte_sequence_handler_multiple(VteTerminal *terminal,
> -                               GValueArray *params,
> -                               VteTerminalSequenceHandler handler)
> - {
> --        vte_sequence_handler_multiple_limited(terminal, params, handler,
> G_MAXLONG);
> -+        vte_sequence_handler_multiple_limited(terminal, params, handler,
> G_MAXUSHORT);
> - }
> -
> - static void
> ---
> -2.4.9 (Apple Git-60)
> -
> -
> -From cf1ad453a8def873c49cf6d88162593402f32bb2 Mon Sep 17 00:00:00 2001
> -From: Christian Persch <chpe@gnome.org>
> -Date: Sat, 19 May 2012 20:04:12 +0200
> -Subject: [PATCH 2/2] emulation: Limit repetitions
> -
> -Don't allow malicious sequences to cause excessive repetitions.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=676090
> ----
> - src/vteseq.c | 25 ++++++++++++++++++-------
> - 1 file changed, 18 insertions(+), 7 deletions(-)
> -
> -diff --git a/src/vteseq.c b/src/vteseq.c
> -index 10991db..209522f 100644
> ---- a/src/vteseq.c
> -+++ b/src/vteseq.c
> -@@ -1392,7 +1392,7 @@ vte_sequence_handler_dc (VteTerminal *terminal,
> GValueArray *params)
> - static void
> - vte_sequence_handler_DC (VteTerminal *terminal, GValueArray *params)
> - {
> --      vte_sequence_handler_multiple(terminal, params,
> vte_sequence_handler_dc);
> -+      vte_sequence_handler_multiple_r(terminal, params,
> vte_sequence_handler_dc);
> - }
> -
> - /* Delete a line at the current cursor position. */
> -@@ -1785,7 +1785,7 @@ vte_sequence_handler_reverse_index (VteTerminal
> *terminal, GValueArray *params)
> - static void
> - vte_sequence_handler_RI (VteTerminal *terminal, GValueArray *params)
> - {
> --      vte_sequence_handler_multiple(terminal, params,
> vte_sequence_handler_nd);
> -+      vte_sequence_handler_multiple_r(terminal, params,
> vte_sequence_handler_nd);
> - }
> -
> - /* Save cursor (position). */
> -@@ -2777,8 +2777,7 @@ vte_sequence_handler_insert_lines (VteTerminal
> *terminal, GValueArray *params)
> - {
> -       GValue *value;
> -       VteScreen *screen;
> --      long param, end, row;
> --      int i;
> -+      long param, end, row, i, limit;
> -       screen = terminal->pvt->screen;
> -       /* The default is one. */
> -       param = 1;
> -@@ -2796,7 +2795,13 @@ vte_sequence_handler_insert_lines (VteTerminal
> *terminal, GValueArray *params)
> -       } else {
> -               end = screen->insert_delta + terminal->row_count - 1;
> -       }
> --      /* Insert the new lines at the cursor. */
> -+
> -+      /* Only allow to insert as many lines as there are between this row
> -+         * and the end of the scrolling region. See bug #676090.
> -+         */
> -+        limit = end - row + 1;
> -+        param = MIN (param, limit);
> -+
> -       for (i = 0; i < param; i++) {
> -               /* Clear a line off the end of the region and add one to
> the
> -                * top of the region. */
> -@@ -2817,8 +2822,7 @@ vte_sequence_handler_delete_lines (VteTerminal
> *terminal, GValueArray *params)
> - {
> -       GValue *value;
> -       VteScreen *screen;
> --      long param, end, row;
> --      int i;
> -+      long param, end, row, i, limit;
> -
> -       screen = terminal->pvt->screen;
> -       /* The default is one. */
> -@@ -2837,6 +2841,13 @@ vte_sequence_handler_delete_lines (VteTerminal
> *terminal, GValueArray *params)
> -       } else {
> -               end = screen->insert_delta + terminal->row_count - 1;
> -       }
> -+
> -+        /* Only allow to delete as many lines as there are between this
> row
> -+         * and the end of the scrolling region. See bug #676090.
> -+         */
> -+        limit = end - row + 1;
> -+        param = MIN (param, limit);
> -+
> -       /* Clear them from below the current cursor. */
> -       for (i = 0; i < param; i++) {
> -               /* Insert a line at the end of the region and remove one
> from
> ---
> -2.4.9 (Apple Git-60)
> -
> diff --git
> a/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
> b/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
> deleted file mode 100644
> index 6763d37..0000000
> --- a/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Upstream-Status: Submitted [
> https://bugzilla.gnome.org/show_bug.cgi?id=691545]
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd vte-0.28.2/gnome-pty-helper/configure.in
> vte-0.28.2/gnome-pty-helper/configure.in
> ---- vte-0.28.2/gnome-pty-helper/configure.in   2010-07-15
> 20:08:44.000000000 +0300
> -+++ vte-0.28.2/gnome-pty-helper/configure.in   2013-01-11
> 14:50:34.971027440 +0200
> -@@ -8,7 +8,6 @@
> - AC_ISC_POSIX
> - AC_PROG_CC
> - AC_STDC_HEADERS
> --AM_PROG_CC_STDC
> -
> - if test -z "$enable_maintainer_mode"; then
> -   enable_maintainer_mode=yes
> diff --git a/meta/recipes-support/vte/vte.inc
> b/meta/recipes-support/vte/vte.inc
> deleted file mode 100644
> index 8565cc2..0000000
> --- a/meta/recipes-support/vte/vte.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Virtual terminal emulator GTK+ widget library"
> -BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
> -LICENSE = "LGPLv2.0"
> -DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
> -RDEPENDS_libvte = "vte-termcap"
> -
> -inherit gnome gtk-doc distro_features_check upstream-version-is-even
> gobject-introspection
> -ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> -
> -EXTRA_OECONF = "--disable-python"
> -
> -PACKAGES =+ "libvte vte-termcap"
> -FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
> -FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
> -
> diff --git
> a/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
> b/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
> new file mode 100644
> index 0000000..fcfc559
> --- /dev/null
> +++
> b/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
> @@ -0,0 +1,29 @@
> +From b0a579d83e355545b64742c997fe8b1d58bf4207 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 13 Jun 2016 11:05:00 +0300
> +Subject: [PATCH] Don't enable stack-protection by default
> +
> +These are set by security_flags.inc.
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 068d072..d580f84 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -138,8 +138,6 @@ m4_define([compiler_flags_common],[ dnl
> +   -fno-common dnl
> +   -fdiagnostics-show-option dnl
> +   -fno-strict-aliasing dnl
> +-  -fstack-protector dnl
> +-  -fstack-protector-strong dnl
> +   -fno-semantic-interposition dnl
> +   -Wno-deprecated-declarations dnl
> + ])
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-support/vte/vte_0.28.2.bb
> b/meta/recipes-support/vte/vte_0.28.2.bb
> deleted file mode 100644
> index 74087ca..0000000
> --- a/meta/recipes-support/vte/vte_0.28.2.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require vte.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> -
> -PR = "r6"
> -
> -SRC_URI += "file://obsolete_automake_macros.patch \
> -            file://cve-2012-2738.patch \
> -           "
> -
> -CFLAGS += "-D_GNU_SOURCE"
> -
> -SRC_URI[archive.md5sum] = "497f26e457308649e6ece32b3bb142ff"
> -SRC_URI[archive.sha256sum] =
> "86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae"
> -
> -RECIPE_NO_UPDATE_REASON = "matchbox-terminal needs to be ported over to
> new vte first"
> diff --git a/meta/recipes-support/vte/vte_0.44.1.bb
> b/meta/recipes-support/vte/vte_0.44.1.bb
> new file mode 100644
> index 0000000..f42a9aa
> --- /dev/null
> +++ b/meta/recipes-support/vte/vte_0.44.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Virtual terminal emulator GTK+ widget library"
> +BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
> +LICENSE = "LGPLv2.1+"
> +DEPENDS = "glib-2.0 gtk+3 intltool-native"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +inherit gnomebase gtk-doc distro_features_check upstream-version-is-even
> vala gobject-introspection
> +
> +SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch"
> +SRC_URI[archive.md5sum] = "20916d97a5902657e54307cc2757beee"
> +SRC_URI[archive.sha256sum] =
> "712dd548339f600fd7e221d12b2670a13a4361b2cd23ba0e057e76cc19fe5d4e"
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +
> +PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
> +
> +CFLAGS += "-D_GNU_SOURCE"
> +
> +# Enable vala only if gobject-introspection is enabled
> +EXTRA_OECONF = "--enable-vala=auto"
> +
> +PACKAGES =+ "libvte"
> +FILES_libvte = "${libdir}/*.so.*"
> --
> 2.1.4
>
>

--001a11c17060acea6c05353e160a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
4 June 2016 at 11:14, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">* License change LGPL 2.0 -&gt; LGPL =
2.1+<br>
* vte-termcap is no more<br>
* API break: current version seems to be parallel installable<br>
=C2=A0 with old one, but I did not opt for that.<br>
* Add patch to avoid stack protection by default<br>
* Add SECURITY_NO_PIE_CFLAGS exception until linking failure with<br>
=C2=A0 libc_nonshared.a is resolved (undefined reference to<br>
=C2=A0 __init_array_start)<br></blockquote><div><br></div><div>Just found o=
ut Khem has worked around a similar problem with libtool-cross already: I&#=
39;ve modified this patch so that=C2=A0SECURITY_NO_PIE_CFLAGS is no longer =
used, but instead libtool-cross is used:</div><div><br></div><div><div>+# l=
ibtool adds &quot;-nostdlib&quot; when g++ is used. This breaks PIE builds.=
</div><div>+# Use libtool-cross (which has a hack to prevent that) instead.=
</div><div>+EXTRA_OEMAKE_class-target =3D &quot;LIBTOOL=3D${STAGING_BINDIR_=
CROSS}/${HOST_SYS}-libtool&quot;</div><div><br></div></div><div>=C2=A0- Jus=
si</div><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/security_flags.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../vte/vte-0.28.2/cve-2012-2738.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 136 ---------------------<br>
=C2=A0.../vte/vte-0.28.2/obsolete_automake_macros.patch=C2=A0 |=C2=A0 14 --=
-<br>
=C2=A0meta/recipes-support/vte/vte.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 ---<br>
=C2=A0...-Don-t-enable-stack-protection-by-default.patch |=C2=A0 29 +++++<b=
r>
=C2=A0meta/recipes-support/vte/<a href=3D"http://vte_0.28.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.28.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 16 ---<br>
=C2=A0meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 24 ++++<br>
=C2=A07 files changed, 55 insertions(+), 181 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.=
patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vte/vte-0.28.2/obsolete_autom=
ake_macros.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vte/vte.inc<br>
=C2=A0create mode 100644 meta/recipes-support/vte/vte/0001-Don-t-enable-sta=
ck-protection-by-default.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vte/<a href=3D"http://vte_0.2=
8.2.bb" rel=3D"noreferrer" target=3D"_blank">vte_0.28.2.bb</a><br>
=C2=A0create mode 100644 meta/recipes-support/vte/<a href=3D"http://vte_0.4=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">vte_0.44.1.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro=
/include/security_flags.inc<br>
index ea1d4e5..0df65e0 100644<br>
--- a/meta/conf/distro/include/security_flags.inc<br>
+++ b/meta/conf/distro/include/security_flags.inc<br>
@@ -95,6 +95,8 @@ SECURITY_CFLAGS_pn-zlib =3D &quot;${SECURITY_NO_PIE_CFLAG=
S}&quot;<br>
=C2=A0SECURITY_CFLAGS_pn-ltp =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;<br>
=C2=A0SECURITY_CFLAGS_pn-pulseaudio =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quo=
t;<br>
<br>
+SECURITY_CFLAGS_pn-vte =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;<br>
+<br>
=C2=A0# Recipes which fail to compile when elevating -Wformat-security to a=
n error<br>
=C2=A0SECURITY_STRINGFORMAT_pn-busybox =3D &quot;&quot;<br>
=C2=A0SECURITY_STRINGFORMAT_pn-console-tools =3D &quot;&quot;<br>
diff --git a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch b/meta=
/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch<br>
deleted file mode 100644<br>
index 9b99803..0000000<br>
--- a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch<br>
+++ /dev/null<br>
@@ -1,136 +0,0 @@<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2012-2738<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
-<br>
-From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001<br>
-From: Christian Persch &lt;<a href=3D"mailto:chpe@gnome.org">chpe@gnome.or=
g</a>&gt;<br>
-Date: Sat, 19 May 2012 19:36:09 +0200<br>
-Subject: [PATCH 1/2] emulation: Limit integer arguments to 65535<br>
-<br>
-To guard against malicious sequences containing excessively big numbers,<b=
r>
-limit all parsed numbers to 16 bit range. Doing this here in the parsing<b=
r>
-routine is a catch-all guard; this doesn&#39;t preclude enforcing<br>
-more stringent limits in the handlers themselves.<br>
-<br>
-<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D676090" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D676=
090</a><br>
----<br>
- src/table.c=C2=A0 | 2 +-<br>
- src/vteseq.c | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/table.c b/src/table.c<br>
-index 140e8c8..85cf631 100644<br>
---- a/src/table.c<br>
-+++ b/src/table.c<br>
-@@ -550,7 +550,7 @@ _vte_table_extract_numbers(GValueArray **array,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (G_UNLIKELY (*ar=
ray =3D=3D NULL)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*array =3D g_value_array_new(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_value_set_long(&amp;va=
lue, total);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_value_set_long(&amp;va=
lue, CLAMP (total, 0, G_MAXUSHORT));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_value_array_appen=
d(*array, &amp;value);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (i++ &lt; arginfo-&gt;length);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0g_value_unset(&amp;value);<br>
-diff --git a/src/vteseq.c b/src/vteseq.c<br>
-index 7ef4c8c..10991db 100644<br>
---- a/src/vteseq.c<br>
-+++ b/src/vteseq.c<br>
-@@ -557,7 +557,7 @@ vte_sequence_handler_multiple(VteTerminal *terminal,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GValueArray *params,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VteTerminalSequenceHandler handler)<b=
r>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 vte_sequence_handler_multiple_limited(termina=
l, params, handler, G_MAXLONG);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vte_sequence_handler_multiple_limited(termina=
l, params, handler, G_MAXUSHORT);<br>
- }<br>
-<br>
- static void<br>
---<br>
-2.4.9 (Apple Git-60)<br>
-<br>
-<br>
-From cf1ad453a8def873c49cf6d88162593402f32bb2 Mon Sep 17 00:00:00 2001<br>
-From: Christian Persch &lt;<a href=3D"mailto:chpe@gnome.org">chpe@gnome.or=
g</a>&gt;<br>
-Date: Sat, 19 May 2012 20:04:12 +0200<br>
-Subject: [PATCH 2/2] emulation: Limit repetitions<br>
-<br>
-Don&#39;t allow malicious sequences to cause excessive repetitions.<br>
-<br>
-<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D676090" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D676=
090</a><br>
----<br>
- src/vteseq.c | 25 ++++++++++++++++++-------<br>
- 1 file changed, 18 insertions(+), 7 deletions(-)<br>
-<br>
-diff --git a/src/vteseq.c b/src/vteseq.c<br>
-index 10991db..209522f 100644<br>
---- a/src/vteseq.c<br>
-+++ b/src/vteseq.c<br>
-@@ -1392,7 +1392,7 @@ vte_sequence_handler_dc (VteTerminal *terminal, GVal=
ueArray *params)<br>
- static void<br>
- vte_sequence_handler_DC (VteTerminal *terminal, GValueArray *params)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 vte_sequence_handler_multiple(terminal, params, vte_=
sequence_handler_dc);<br>
-+=C2=A0 =C2=A0 =C2=A0 vte_sequence_handler_multiple_r(terminal, params, vt=
e_sequence_handler_dc);<br>
- }<br>
-<br>
- /* Delete a line at the current cursor position. */<br>
-@@ -1785,7 +1785,7 @@ vte_sequence_handler_reverse_index (VteTerminal *ter=
minal, GValueArray *params)<br>
- static void<br>
- vte_sequence_handler_RI (VteTerminal *terminal, GValueArray *params)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 vte_sequence_handler_multiple(terminal, params, vte_=
sequence_handler_nd);<br>
-+=C2=A0 =C2=A0 =C2=A0 vte_sequence_handler_multiple_r(terminal, params, vt=
e_sequence_handler_nd);<br>
- }<br>
-<br>
- /* Save cursor (position). */<br>
-@@ -2777,8 +2777,7 @@ vte_sequence_handler_insert_lines (VteTerminal *term=
inal, GValueArray *params)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GValue *value;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0VteScreen *screen;<br>
--=C2=A0 =C2=A0 =C2=A0 long param, end, row;<br>
--=C2=A0 =C2=A0 =C2=A0 int i;<br>
-+=C2=A0 =C2=A0 =C2=A0 long param, end, row, i, limit;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0screen =3D terminal-&gt;pvt-&gt;screen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The default is one. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0param =3D 1;<br>
-@@ -2796,7 +2795,13 @@ vte_sequence_handler_insert_lines (VteTerminal *ter=
minal, GValueArray *params)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D screen-&gt;=
insert_delta + terminal-&gt;row_count - 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 /* Insert the new lines at the cursor. */<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Only allow to insert as many lines as there are b=
etween this row<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and the end of the scrolling region. =
See bug #676090.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D end - row + 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 param =3D MIN (param, limit);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; param; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear a line off=
 the end of the region and add one to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * top of the regio=
n. */<br>
-@@ -2817,8 +2822,7 @@ vte_sequence_handler_delete_lines (VteTerminal *term=
inal, GValueArray *params)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GValue *value;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0VteScreen *screen;<br>
--=C2=A0 =C2=A0 =C2=A0 long param, end, row;<br>
--=C2=A0 =C2=A0 =C2=A0 int i;<br>
-+=C2=A0 =C2=A0 =C2=A0 long param, end, row, i, limit;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0screen =3D terminal-&gt;pvt-&gt;screen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The default is one. */<br>
-@@ -2837,6 +2841,13 @@ vte_sequence_handler_delete_lines (VteTerminal *ter=
minal, GValueArray *params)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D screen-&gt;=
insert_delta + terminal-&gt;row_count - 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only allow to delete as many lines as ther=
e are between this row<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and the end of the scrolling region. =
See bug #676090.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D end - row + 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 param =3D MIN (param, limit);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear them from below the current cursor. */=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; param; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert a line at=
 the end of the region and remove one from<br>
---<br>
-2.4.9 (Apple Git-60)<br>
-<br>
diff --git a/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.p=
atch b/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch<b=
r>
deleted file mode 100644<br>
index 6763d37..0000000<br>
--- a/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch<br=
>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-Upstream-Status: Submitted [<a href=3D"https://bugzilla.gnome.org/show_bug=
.cgi?id=3D691545" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gno=
me.org/show_bug.cgi?id=3D691545</a>]<br>
-<br>
-Signed-off-by: Marko Lindqvist &lt;<a href=3D"mailto:cazfi74@gmail.com">ca=
zfi74@gmail.com</a>&gt;<br>
-diff -Nurd vte-0.28.2/gnome-pty-helper/<a href=3D"http://configure.in" rel=
=3D"noreferrer" target=3D"_blank">configure.in</a> vte-0.28.2/gnome-pty-hel=
per/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">co=
nfigure.in</a><br>
---- vte-0.28.2/gnome-pty-helper/<a href=3D"http://configure.in" rel=3D"nor=
eferrer" target=3D"_blank">configure.in</a>=C2=A0 =C2=A02010-07-15 20:08:44=
.000000000 +0300<br>
-+++ vte-0.28.2/gnome-pty-helper/<a href=3D"http://configure.in" rel=3D"nor=
eferrer" target=3D"_blank">configure.in</a>=C2=A0 =C2=A02013-01-11 14:50:34=
.971027440 +0200<br>
-@@ -8,7 +8,6 @@<br>
- AC_ISC_POSIX<br>
- AC_PROG_CC<br>
- AC_STDC_HEADERS<br>
--AM_PROG_CC_STDC<br>
-<br>
- if test -z &quot;$enable_maintainer_mode&quot;; then<br>
-=C2=A0 =C2=A0enable_maintainer_mode=3Dyes<br>
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vt=
e.inc<br>
deleted file mode 100644<br>
index 8565cc2..0000000<br>
--- a/meta/recipes-support/vte/vte.inc<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-SUMMARY =3D &quot;Virtual terminal emulator GTK+ widget library&quot;<br>
-BUGTRACKER =3D &quot;<a href=3D"https://bugzilla.gnome.org/buglist.cgi?pro=
duct=3Dvte" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.org=
/buglist.cgi?product=3Dvte</a>&quot;<br>
-LICENSE =3D &quot;LGPLv2.0&quot;<br>
-DEPENDS =3D &quot; glib-2.0 gtk+ intltool-native ncurses&quot;<br>
-RDEPENDS_libvte =3D &quot;vte-termcap&quot;<br>
-<br>
-inherit gnome gtk-doc distro_features_check upstream-version-is-even gobje=
ct-introspection<br>
-ANY_OF_DISTRO_FEATURES =3D &quot;${GTK2DISTROFEATURES}&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-python&quot;<br>
-<br>
-PACKAGES =3D+ &quot;libvte vte-termcap&quot;<br>
-FILES_libvte =3D &quot;${libdir}/*.so.* ${libexecdir}/gnome-pty-helper&quo=
t;<br>
-FILES_vte-termcap =3D &quot;${datadir}/vte/termcap-0.0&quot;<br>
-<br>
diff --git a/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protectio=
n-by-default.patch b/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-p=
rotection-by-default.patch<br>
new file mode 100644<br>
index 0000000..fcfc559<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-de=
fault.patch<br>
@@ -0,0 +1,29 @@<br>
+From b0a579d83e355545b64742c997fe8b1d58bf4207 Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Mon, 13 Jun 2016 11:05:00 +0300<br>
+Subject: [PATCH] Don&#39;t enable stack-protection by default<br>
+<br>
+These are set by security_flags.inc.<br>
+<br>
+Upstream-Status: Inappropriate [configuration]<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 --<br>
+ 1 file changed, 2 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 068d072..d580f84 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -138,8 +138,6 @@ m4_define([compiler_flags_common],[ dnl<br>
+=C2=A0 =C2=A0-fno-common dnl<br>
+=C2=A0 =C2=A0-fdiagnostics-show-option dnl<br>
+=C2=A0 =C2=A0-fno-strict-aliasing dnl<br>
+-=C2=A0 -fstack-protector dnl<br>
+-=C2=A0 -fstack-protector-strong dnl<br>
+=C2=A0 =C2=A0-fno-semantic-interposition dnl<br>
+=C2=A0 =C2=A0-Wno-deprecated-declarations dnl<br>
+ ])<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-support/vte/<a href=3D"http://vte_0.28.2.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.28.2.bb</a> b/meta/recipes-support/=
vte/<a href=3D"http://vte_0.28.2.bb" rel=3D"noreferrer" target=3D"_blank">v=
te_0.28.2.bb</a><br>
deleted file mode 100644<br>
index 74087ca..0000000<br>
--- a/meta/recipes-support/vte/<a href=3D"http://vte_0.28.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.28.2.bb</a><br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-require vte.inc<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3bf50002aefd002f49e7bb8540=
63f7e7&quot;<br>
-<br>
-PR =3D &quot;r6&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://obsolete_automake_macros.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cve-2012-2738.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-CFLAGS +=3D &quot;-D_GNU_SOURCE&quot;<br>
-<br>
-SRC_URI[archive.md5sum] =3D &quot;497f26e457308649e6ece32b3bb142ff&quot;<b=
r>
-SRC_URI[archive.sha256sum] =3D &quot;86cf0b81aa023fa93ed415653d51c96767f20=
b2d7334c893caba71e42654b0ae&quot;<br>
-<br>
-RECIPE_NO_UPDATE_REASON =3D &quot;matchbox-terminal needs to be ported ove=
r to new vte first&quot;<br>
diff --git a/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.44.1.bb</a> b/meta/recipes-support/=
vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"noreferrer" target=3D"_blank">v=
te_0.44.1.bb</a><br>
new file mode 100644<br>
index 0000000..f42a9aa<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a><br>
@@ -0,0 +1,24 @@<br>
+SUMMARY =3D &quot;Virtual terminal emulator GTK+ widget library&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://bugzilla.gnome.org/buglist.cgi?pro=
duct=3Dvte" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.org=
/buglist.cgi?product=3Dvte</a>&quot;<br>
+LICENSE =3D &quot;LGPLv2.1+&quot;<br>
+DEPENDS =3D &quot;glib-2.0 gtk+3 intltool-native&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<br>
+<br>
+inherit gnomebase gtk-doc distro_features_check upstream-version-is-even v=
ala gobject-introspection<br>
+<br>
+SRC_URI +=3D &quot;file://0001-Don-t-enable-stack-protection-by-default.pa=
tch&quot;<br>
+SRC_URI[archive.md5sum] =3D &quot;20916d97a5902657e54307cc2757beee&quot;<b=
r>
+SRC_URI[archive.sha256sum] =3D &quot;712dd548339f600fd7e221d12b2670a13a436=
1b2cd23ba0e057e76cc19fe5d4e&quot;<br>
+<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+<br>
+PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls,--without-gnutls,gnutls&quot=
;<br>
+<br>
+CFLAGS +=3D &quot;-D_GNU_SOURCE&quot;<br>
+<br>
+# Enable vala only if gobject-introspection is enabled<br>
+EXTRA_OECONF =3D &quot;--enable-vala=3Dauto&quot;<br>
+<br>
+PACKAGES =3D+ &quot;libvte&quot;<br>
+FILES_libvte =3D &quot;${libdir}/*.so.*&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c17060acea6c05353e160a--
