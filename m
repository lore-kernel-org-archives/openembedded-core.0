Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABF7607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 13:43:37 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id e66so16073473iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BjCImf6aGwJRXRJI+zG71109F44TdGl5oXtHl/V+NvM=;
	b=eQlwQ3icJiqdZUHATAN4z53eZF3CN8ZcuTM1SuUjFOsY8iRAuimMIBC7F1DLtTKS8v
	RJqba4Aduc82kVgxLvqOja4XQf285ROKKESIKL9sx46CqgPTG2rmLTk1z9SxMiZMEA0+
	TKakDbRD4KWvywplHnr0vSi7WKlmKcl5zs35mbbJlUIWo4ymIwA5IVJasP71ACJjZ9uD
	B8jt5GAdrkAPnTeyTWpZKT1LPaWKNJkTh6qzFt5xtXeYp9zIqYt6y+wrJhcmIK2L7uZc
	v5HXel+EbQsaimqV2OnGvMRCaaZ9UVksIpS9gfzSiUNDkGHfkBEWL46EXDH6Mrwy/1hI
	qnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BjCImf6aGwJRXRJI+zG71109F44TdGl5oXtHl/V+NvM=;
	b=e52kGTgBU1/VLFnrFT6nbzvuzLOV+AO+On8awtqIua+EGYYmohy5QGL0JXGGH0lTyY
	Y0vmGPpirGOzDpql9/35APv7BIrwXLtm8FtLM/RcH0oJWVSksWCiU0lEYuYFD9K5j4tX
	DXYuy73z5YeVPVAOfxNINMNAMhQY/k79oTiwsgNQudgrCYnVRMuTj5j3MXVkdl0hdzlr
	WNbmNU/6dFpj0Oi4iiV0WpWAZf+DUjQteZhLbIHz4OsKLzE0MdVXy13igR36+ugtJcSW
	Pbswc5dXBNKZ4THJjBcxzlUSLI0BAg8t/6cQLr8Be+xJ5szx/M1qUBLnj/nCCpbhoqVV
	yUJQ==
X-Gm-Message-State: AA6/9RmieaVdIJPpsdMx4ptqThwcjXGK3FrovK3hjeYYAse7fd7OEFtaD9TBMhvKLBuOAuQ3NvOAAlYDUi7gLI00
X-Received: by 10.107.53.206 with SMTP id k75mr27658461ioo.195.1474983818528; 
	Tue, 27 Sep 2016 06:43:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 27 Sep 2016 06:43:18 -0700 (PDT)
In-Reply-To: <1474536792-7645-1-git-send-email-zhe.he@windriver.com>
References: <1474536792-7645-1-git-send-email-zhe.he@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Sep 2016 14:43:18 +0100
Message-ID: <CAJTo0LbSCHE53q6HVTVscw9J+ck_qmarOpJirfzan-jH0jqYgA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Remove bashisms
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
X-List-Received-Date: Tue, 27 Sep 2016 13:43:39 -0000
Content-Type: multipart/alternative; boundary=001a114495048da3aa053d7d6e3b

--001a114495048da3aa053d7d6e3b
Content-Type: text/plain; charset=UTF-8

If I apply this and then re-build guile I get this error:

ERROR: guile-2.0.12-r0 do_populate_sysroot: The recipe guile is trying to
install files into a shared area when those files already exist. Those
files and their manifest location are:

 /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/bin/crossscripts/guile-config
 Matched in b''

Ross

On 22 September 2016 at 10:33, <zhe.he@windriver.com> wrote:

> From: "Tim K. Chan" <nirvanatk@gmail.com>
>
> Signed-off-by: Tim K. Chan <nirvanatk@gmail.com>
> [
> Adjust context
> Use Peter Kjellerstedt's simpler guile_cross_config
> ]
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/classes/systemd.bbclass                       |  4 +--
>  meta/classes/update-rc.d.bbclass                   |  6 ++--
>  .../resolvconf/resolvconf_1.79.bb                  |  2 +-
>  meta/recipes-core/glibc/glibc-package.inc          |  2 +-
>  meta/recipes-devtools/guile/guile_2.0.12.bb        | 37
> ++++++++++++----------
>  meta/recipes-devtools/rpm/rpm_5.4.16.bb            | 13 ++++++--
>  6 files changed, 39 insertions(+), 25 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index db7873f..7370489 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -28,7 +28,7 @@ if [ -n "$D" ]; then
>      OPTS="--root=$D"
>  fi
>
> -if type systemctl >/dev/null 2>/dev/null; then
> +if command -p systemctl >/dev/null 2>/dev/null; then
>         systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>
>         if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> @@ -44,7 +44,7 @@ if [ -n "$D" ]; then
>      OPTS="--root=$D"
>  fi
>
> -if type systemctl >/dev/null 2>/dev/null; then
> +if command -p systemctl >/dev/null 2>/dev/null; then
>         if [ -z "$D" ]; then
>                 systemctl stop ${SYSTEMD_SERVICE}
>         fi
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.
> bbclass
> index 82b8024..dee80c8 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -15,7 +15,7 @@ updatercd_preinst() {
>  if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
>         ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>  fi
> -if type update-rc.d >/dev/null 2>/dev/null; then
> +if command -p update-rc.d >/dev/null 2>/dev/null; then
>         if [ -n "$D" ]; then
>                 OPT="-f -r $D"
>         else
> @@ -26,7 +26,7 @@ fi
>  }
>
>  updatercd_postinst() {
> -if type update-rc.d >/dev/null 2>/dev/null; then
> +if command -p update-rc.d >/dev/null 2>/dev/null; then
>         if [ -n "$D" ]; then
>                 OPT="-r $D"
>         else
> @@ -43,7 +43,7 @@ fi
>  }
>
>  updatercd_postrm() {
> -if type update-rc.d >/dev/null 2>/dev/null; then
> +if command -p update-rc.d >/dev/null 2>/dev/null; then
>         if [ -n "$D" ]; then
>                 OPT="-f -r $D"
>         else
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
> b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
> index 8550177..e415445 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
> @@ -56,7 +56,7 @@ do_install () {
>
>  pkg_postinst_${PN} () {
>         if [ -z "$D" ]; then
> -               if command -v systemd-tmpfiles >/dev/null; then
> +               if command -p systemd-tmpfiles >/dev/null; then
>                         systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/
> resolvconf.conf
>                 elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ];
> then
>                         ${sysconfdir}/init.d/populate-volatile.sh update
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index 6df8b9e..557f32a 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -206,7 +206,7 @@ glibc_package_preprocess () {
>
>  pkg_postinst_nscd () {
>         if [ -z "$D" ]; then
> -               if command -v systemd-tmpfiles >/dev/null; then
> +               if command -p systemd-tmpfiles >/dev/null; then
>                         systemd-tmpfiles --create
> ${sysconfdir}/tmpfiles.d/nscd.conf
>                 elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ];
> then
>                         ${sysconfdir}/init.d/populate-volatile.sh update
> diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb
> b/meta/recipes-devtools/guile/guile_2.0.12.bb
> index d2fe511..a466d65 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.12.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.12.bb
> @@ -87,22 +87,27 @@ SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
>
>  guile_cross_config() {
>         # this is only for target recipe
> -       if [ "${PN}" = "guile" ]
> -       then
> -               # Create guile-config returning target values instead of
> native values
> -               install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
> -               echo '#!'`which ${BUILD_SYS}-guile`$'
> \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
> -                       > ${B}/guile-config.cross
> -               sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
> -                       -e 's:",[ \t]*": . ":' \
> -                       -e 's:" *}, *\\:"):' \
> -                       -e 's:^.*cachedir.*$::' \
> -                       -e '/^  (/p' \
> -                       < ${B}/libguile/libpath.h >>
> ${B}/guile-config.cross
> -               echo '))' >> ${B}/guile-config.cross
> -               cat ${B}/meta/guile-config >> ${B}/guile-config.cross
> -               install ${B}/guile-config.cross
> ${STAGING_BINDIR_CROSS}/guile-config
> -       fi
> +       [ "${PN}" = "${BPN}" ] || return 0
> +
> +       vars=$(sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
> +                     -e 's:",[ \t]*": . ":' \
> +                     -e 's:" *}, *\\:"):' \
> +                     -e 's:^.*cachedir.*$::' \
> +                     -e '/^  (/p' \
> +              < ${B}/libguile/libpath.h)
> +
> +       # Create guile-config returning target values instead of native
> values
> +       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +       cat <<EOF >${B}/guile-config.cross
> +#!$(which ${BUILD_SYS}-guile) \\
> +--no-auto-compile -e main -s
> +!#
> +(define %guile-build-info '(
> +$vars
> +))
> +EOF
> +       cat ${B}/meta/guile-config >> ${B}/guile-config.cross
> +       install ${B}/guile-config.cross ${SYSROOT_DESTDIR}${bindir_
> crossscripts}/guile-config
>  }
>
>  # Guile needs the compiled files to be newer than the source, and it won't
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> index 84adef6..be3b942 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> @@ -554,13 +554,22 @@ do_install_append() {
>         install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh
> ${D}/${libdir}/rpm/perfile_rpmdeps.sh
>
>         # Remove unpackaged files (based on list in rpm.spec)
> -       rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,
> rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}
> +       rm -f ${D}/${libdir}/rpm/Specfile.pm
> +       rm -f ${D}/${libdir}/rpm/cpanflute
> +       rm -f ${D}/${libdir}/rpm/cpanflute2
> +       rm -f ${D}/${libdir}/rpm/rpmdiff
> +       rm -f ${D}/${libdir}/rpm/rpmdiff.cgi
> +       rm -f ${D}/${libdir}/rpm/sql.prov
> +       rm -f ${D}/${libdir}/rpm/sql.req
> +       rm -f ${D}/${libdir}/rpm/tcl.req
> +       rm -f ${D}/${libdir}/rpm/trpm
>
>         rm -f ${D}/${mandir}/man8/rpmcache.8*
>         rm -f ${D}/${mandir}/man8/rpmgraph.8*
>         rm -f ${D}/${mandir}/*/man8/rpmcache.8*
>         rm -f ${D}/${mandir}/*/man8/rpmgraph.8*
> -       rm -rf ${D}/${mandir}/{fr,ko}
> +       rm -rf ${D}/${mandir}/fr
> +       rm -rf ${D}/${mandir}/ko
>
>         rm -f ${D}/${includedir}/popt.h
>         rm -f ${D}/${libdir}/libpopt.*
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114495048da3aa053d7d6e3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If I apply this and then re-build guile I get this error:<=
div><br></div><div><div>ERROR: guile-2.0.12-r0 do_populate_sysroot: The rec=
ipe guile is trying to install files into a shared area when those files al=
ready exist. Those files and their manifest location are:</div><div>=C2=A0 =
=C2=A0/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/bin/crossscr=
ipts/guile-config</div><div>=C2=A0Matched in b&#39;&#39;</div></div><div><b=
r></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 22 September 2016 at 10:33,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: &quot;Tim K. Cha=
n&quot; &lt;<a href=3D"mailto:nirvanatk@gmail.com">nirvanatk@gmail.com</a>&=
gt;<br>
<br>
Signed-off-by: Tim K. Chan &lt;<a href=3D"mailto:nirvanatk@gmail.com">nirva=
natk@gmail.com</a>&gt;<br>
[<br>
Adjust context<br>
Use Peter Kjellerstedt&#39;s simpler guile_cross_config<br>
]<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/systemd.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +--<br>
=C2=A0meta/classes/update-rc.d.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
=C2=A0.../resolvconf/<a href=3D"http://resolvconf_1.79.bb" rel=3D"noreferre=
r" target=3D"_blank">resolvconf_1.<wbr>79.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/glibc/glibc-<wbr>package.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/guile/<a href=3D"http://guile_2.0.12.bb" rel=3D=
"noreferrer" target=3D"_blank">gu<wbr>ile_2.0.12.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 37 ++++++++++++----------<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_<wbr>5.4.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 13 ++++++--<br>
=C2=A06 files changed, 39 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass<br=
>
index db7873f..7370489 100644<br>
--- a/meta/classes/systemd.bbclass<br>
+++ b/meta/classes/systemd.bbclass<br>
@@ -28,7 +28,7 @@ if [ -n &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0OPTS=3D&quot;--root=3D$D&quot;<br>
=C2=A0fi<br>
<br>
-if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+if command -p systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEM=
D_SERVICE}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; -a &quot;${SYSTEMD_AUTO_=
ENABLE}&quot; =3D &quot;enable&quot; ]; then<br>
@@ -44,7 +44,7 @@ if [ -n &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0OPTS=3D&quot;--root=3D$D&quot;<br>
=C2=A0fi<br>
<br>
-if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+if command -p systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl stop ${SY=
STEMD_SERVICE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
diff --git a/meta/classes/update-rc.d.<wbr>bbclass b/meta/classes/update-rc=
.d.<wbr>bbclass<br>
index 82b8024..dee80c8 100644<br>
--- a/meta/classes/update-rc.d.<wbr>bbclass<br>
+++ b/meta/classes/update-rc.d.<wbr>bbclass<br>
@@ -15,7 +15,7 @@ updatercd_preinst() {<br>
=C2=A0if [ -z &quot;$D&quot; -a -f &quot;${INIT_D_DIR}/${INITSCRIPT_<wbr>NA=
ME}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${INIT_D_DIR}/${INITSCRIPT_<wbr>NAME} stop<br>
=C2=A0fi<br>
-if type update-rc.d &gt;/dev/null 2&gt;/dev/null; then<br>
+if command -p update-rc.d &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT=3D&quot;-f -r $=
D&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
@@ -26,7 +26,7 @@ fi<br>
=C2=A0}<br>
<br>
=C2=A0updatercd_postinst() {<br>
-if type update-rc.d &gt;/dev/null 2&gt;/dev/null; then<br>
+if command -p update-rc.d &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT=3D&quot;-r $D&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
@@ -43,7 +43,7 @@ fi<br>
=C2=A0}<br>
<br>
=C2=A0updatercd_postrm() {<br>
-if type update-rc.d &gt;/dev/null 2&gt;/dev/null; then<br>
+if command -p update-rc.d &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT=3D&quot;-f -r $=
D&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
diff --git a/meta/recipes-connectivity/<wbr>resolvconf/<a href=3D"http://re=
solvconf_1.79.bb" rel=3D"noreferrer" target=3D"_blank">resolvconf_1.79.bb</=
a> b/meta/recipes-connectivity/<wbr>resolvconf/<a href=3D"http://resolvconf=
_1.79.bb" rel=3D"noreferrer" target=3D"_blank">resolvconf_1.79.bb</a><br>
index 8550177..e415445 100644<br>
--- a/meta/recipes-connectivity/<wbr>resolvconf/<a href=3D"http://resolvcon=
f_1.79.bb" rel=3D"noreferrer" target=3D"_blank">resolvconf_1.79.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>resolvconf/<a href=3D"http://resolvcon=
f_1.79.bb" rel=3D"noreferrer" target=3D"_blank">resolvconf_1.79.bb</a><br>
@@ -56,7 +56,7 @@ do_install () {<br>
<br>
=C2=A0pkg_postinst_${PN} () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if command -v syste=
md-tmpfiles &gt;/dev/null; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if command -p syste=
md-tmpfiles &gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/<wbr>resolvco=
nf.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -e ${sysconf=
dir}/init.d/populate-<wbr>volatile.sh ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${sysconfdir}/init.d/populate-<wbr>volatile.sh update<br>
diff --git a/meta/recipes-core/glibc/<wbr>glibc-package.inc b/meta/recipes-=
core/glibc/<wbr>glibc-package.inc<br>
index 6df8b9e..557f32a 100644<br>
--- a/meta/recipes-core/glibc/<wbr>glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/<wbr>glibc-package.inc<br>
@@ -206,7 +206,7 @@ glibc_package_preprocess () {<br>
<br>
=C2=A0pkg_postinst_nscd () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if command -v syste=
md-tmpfiles &gt;/dev/null; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if command -p syste=
md-tmpfiles &gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nscd.<wbr>con=
f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -e ${sysconf=
dir}/init.d/populate-<wbr>volatile.sh ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${sysconfdir}/init.d/populate-<wbr>volatile.sh update<br>
diff --git a/meta/recipes-devtools/guile/<a href=3D"http://guile_2.0.12.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>guile_2.0.12.bb</a> b/meta/recip=
es-devtools/guile/<a href=3D"http://guile_2.0.12.bb" rel=3D"noreferrer" tar=
get=3D"_blank"><wbr>guile_2.0.12.bb</a><br>
index d2fe511..a466d65 100644<br>
--- a/meta/recipes-devtools/guile/<a href=3D"http://guile_2.0.12.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>guile_2.0.12.bb</a><br>
+++ b/meta/recipes-devtools/guile/<a href=3D"http://guile_2.0.12.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>guile_2.0.12.bb</a><br>
@@ -87,22 +87,27 @@ SYSROOT_PREPROCESS_FUNCS =3D &quot;guile_cross_config&q=
uot;<br>
<br>
=C2=A0guile_cross_config() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this is only for target recipe<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${PN}&quot; =3D &quot;guile&quot; ]<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create guile-conf=
ig returning target values instead of native values<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${SYSROO=
T_DESTDIR}${STAGING_<wbr>BINDIR_CROSS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;#!&#39;`w=
hich ${BUILD_SYS}-guile`$&#39; \\\n--no-auto-compile -e main -s\n!#\n(defin=
e %guile-build-info &#39;\&#39;\( \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&gt; ${B}/guile-config.cross<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -n -e &#39;s:^[=
 \t]*{[ \t]*&quot;:=C2=A0 (:&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;s:&quot;,[ \t]*&quot;: . &quot;:&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;s:&quot; *}, *\\:&quot;):&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;s:^.*cachedir.*$::&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;/^=C2=A0 (/p&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&lt; ${B}/libguile/libpath.h &gt;&gt; ${B}/guile-config.cross<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;))&#39; &=
gt;&gt; ${B}/guile-config.cross<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${B}/meta/guile=
-config &gt;&gt; ${B}/guile-config.cross<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/guile-=
config.cross ${STAGING_BINDIR_CROSS}/guile-<wbr>config<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${PN}&quot; =3D &quot;${BPN}&quot; ] ||=
 return 0<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vars=3D$(sed -n -e &#39;s:^[ \t]*{[ \t]*&quot;:=
=C2=A0 (:&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-e &#39;s:&quot;,[ \t]*&quot;: . &quot;:&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-e &#39;s:&quot; *}, *\\:&quot;):&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-e &#39;s:^.*cachedir.*$::&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-e &#39;/^=C2=A0 (/p&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt; ${B}/libguile/libpat=
h.h)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create guile-config returning target values i=
nstead of native values<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${SYSROOT_DESTDIR}${bindir_<wbr>cros=
sscripts}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;EOF &gt;${B}/guile-config.cross<br>
+#!$(which ${BUILD_SYS}-guile) \\<br>
+--no-auto-compile -e main -s<br>
+!#<br>
+(define %guile-build-info &#39;(<br>
+$vars<br>
+))<br>
+EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${B}/meta/guile-config &gt;&gt; ${B}/guile-=
config.cross<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/guile-config.cross ${SYSROOT_DESTD=
IR}${bindir_<wbr>crossscripts}/guile-config<br>
=C2=A0}<br>
<br>
=C2=A0# Guile needs the compiled files to be newer than the source, and it =
won&#39;t<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">rp<wbr>m_5.4.16.bb</a> b/meta/recipes-dev=
tools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"noreferrer" target=3D"_bl=
ank">rp<wbr>m_5.4.16.bb</a><br>
index 84adef6..be3b942 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">rp<wbr>m_5.4.16.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">rp<wbr>m_5.4.16.bb</a><br>
@@ -554,13 +554,22 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh $=
{D}/${libdir}/rpm/perfile_<wbr>rpmdeps.sh<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove unpackaged files (based on list in rpm=
.spec)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/{Specfile.<wbr>pm,cpan=
flute,cpanflute2,<wbr>rpmdiff,rpmdiff.cgi,sql.prov,<wbr>sql.req,tcl.req,trp=
m}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/Specfile.pm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/cpanflute<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/cpanflute2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/rpmdiff<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/rpmdiff.cgi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/sql.prov<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/sql.req<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/tcl.req<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/trpm<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${mandir}/man8/rpmcache.<wbr>8*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${mandir}/man8/rpmgraph.<wbr>8*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${mandir}/*/man8/<wbr>rpmcache.8*<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${mandir}/*/man8/<wbr>rpmgraph.8*<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/${mandir}/{fr,ko}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/${mandir}/fr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/${mandir}/ko<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${includedir}/popt.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${libdir}/libpopt.*<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
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

--001a114495048da3aa053d7d6e3b--
