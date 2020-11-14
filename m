Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.3781.1605343616718146692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 00:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=njX0r8Ua;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id f20so17300082ejz.4
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 00:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y9vmpDF+vPJxbbwZQiF9v+YQWWeEl1/6ykmOSpdlAeI=;
        b=njX0r8UaNHo0cwpXyzERZLnbNSsBlG+ztuapQRcmu7PIvC1aL/S/6vVrLTmY5NI0z4
         PFNppiihkNdzzOpXsWVJeJluGg/bjoWmsBgxBXHzDqVomx06w0D37I2b0urUKYtEbONy
         4PHas1nDdWtCJ9geYLhF52ASian0XU36/O5F10oj7Ly2X8w5WKjzd7zwoVe1kU85L2dA
         PpLuWyEQxPDZrBecR5wS15b2yi9WDunrz4fI2lFzcdu4elOrmkQB6QzKCVgzNyI1j4Vb
         m8mWA1gqYJs1v06fWcxy8JnKjvIhDgPZMCLG8D9o29OMC6L44P7zvA2ZwAYIlj7tFPfY
         oXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y9vmpDF+vPJxbbwZQiF9v+YQWWeEl1/6ykmOSpdlAeI=;
        b=bOcREnD4u3kMxkLDiaT9MRvJrAJipLIyQMGt8IxWF+cL70PH0980V9iD7GCdZNORBo
         VBDSXTgMNR7VgCYq+vpmbMv0hIx/N9itBYyRBab6alNyQEOu8kvtm1pFqwljxeEHEtVw
         UsqsKR2MEUmgocOtuXECuput4WEVRSKGgg0icbzEEUX68a7cSc8tYvbqw1sZMa5VWUpB
         eaoOTGLbB8zqlNSMphzr0BADJgnHnSw3YYfddeTs4eI11ipFZW4z0DC+3CtbMV/J0WTp
         TnZSQWBocFTGcKDEJoPrh4PE9hdA4M9VyluZ2GrPUVpysyGAT6hZUu5IpN3FCHGe0/rF
         6A5g==
X-Gm-Message-State: AOAM532e+8ZkqJNeATGFWcTp+WPd7rDN+vCE3KeyAmZUYSVtswoRHZ4f
	N0wFy8g///TWXxIPHCMoQdPLglL/dV2UuTFXVLE=
X-Google-Smtp-Source: ABdhPJxBkXNO8VEdDaQwBWGe9LeyfuSXdKPV6RghIKr3zEmTRF+3js32XbckMtDoG7Ur8KfMsJ4DbziD+rm1DasjxNk=
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr5789719ejw.94.1605343615054;
 Sat, 14 Nov 2020 00:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20201109083133.16503-1-alex.kanavin@gmail.com> <20201109083133.16503-8-alex.kanavin@gmail.com>
In-Reply-To: <20201109083133.16503-8-alex.kanavin@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 14 Nov 2020 09:46:43 +0100
Message-ID: <CA+chaQdco334CL3Yzvf_d05DiY7=ksSDe1WxMGW08mHTsYKyfg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 08/12] weston-init: correctly start under systemd
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eaf78305b40d2fc8"

--000000000000eaf78305b40d2fc8
Content-Type: text/plain; charset="UTF-8"

weston rdepends on weston-init, so it needs
${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam',
'', d)} as well now, will send patch shortly.

ERROR: Nothing RPROVIDES 'weston-init' (but
openembedded-core/meta/recipes-graphics/wayland/weston_9.0.0.bb
RDEPENDS on or otherwise requires it)
weston-init was skipped: missing required distro feature 'pam' (not in
DISTRO_FEATURES)
NOTE: Runtime target 'weston-init' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-init']
ERROR: Nothing RPROVIDES 'weston-dev' (but
openembedded-core/meta/recipes-graphics/wayland/weston_9.0.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'weston-dev'
NOTE: Runtime target 'weston-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-dev']
ERROR: Nothing RPROVIDES 'weston' (but
openembedded-core/meta/recipes-graphics/wayland/weston_9.0.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'weston'
NOTE: Runtime target 'weston' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston']


On Mon, Nov 9, 2020 at 9:32 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Several issues are addressed:
> 1. weston requires pam when starting under systemd
> 2. systemd was attempting to launch weston twice (from
> sysvinit script and from systemd unit file) which caused confusion
> and errors.
> 3. runtime test should stop/start weston via systemd only if systemd
> actually controls system startup, not merely when systemd is present.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/weston.py        | 4 ++--
>  meta/recipes-graphics/wayland/weston-init.bb | 9 +++++++--
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/weston.py
> b/meta/lib/oeqa/runtime/cases/weston.py
> index 36b4f9e375..d3fbf8ba92 100644
> --- a/meta/lib/oeqa/runtime/cases/weston.py
> +++ b/meta/lib/oeqa/runtime/cases/weston.py
> @@ -34,7 +34,7 @@ class WestonTest(OERuntimeTestCase):
>          return 'export XDG_RUNTIME_DIR=/run/user/0; export
> WAYLAND_DISPLAY=wayland-0; %s' % cmd
>
>      def run_weston_init(self):
> -        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
> +        if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
>              self.target.run('systemd-run --collect
> --unit=weston-ptest.service --uid=0 -p PAMName=login -p TTYPath=/dev/tty6
> -E XDG_RUNTIME_DIR=/tmp -E WAYLAND_DISPLAY=wayland-0 /usr/bin/weston
> --socket=wayland-1 --log=%s' % self.weston_log_file)
>          else:
>              self.target.run(self.get_weston_command('openvt -- weston
> --socket=wayland-1 --log=%s' % self.weston_log_file))
> @@ -66,7 +66,7 @@ class WestonTest(OERuntimeTestCase):
>          new_wl_processes, try_cnt =
> self.get_new_wayland_processes(existing_wl_processes)
>          existing_and_new_weston_processes =
> self.get_processes_of('weston', 'existing and new')
>          new_weston_processes = [x for x in
> existing_and_new_weston_processes if x not in existing_weston_processes]
> -        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
> +        if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
>              self.target.run('systemctl stop weston-ptest.service')
>          else:
>              for w in new_weston_processes:
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb
> b/meta/recipes-graphics/wayland/weston-init.bb
> index b7a99be646..4b2a6ca983 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -26,7 +26,9 @@ DEFAULTBACKEND_qemux86 = "drm"
>  DEFAULTBACKEND_qemux86-64 = "drm"
>
>  do_install() {
> -       install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> +        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> +               install -Dm755 ${WORKDIR}/init
> ${D}/${sysconfdir}/init.d/weston
> +        fi
>         install -D -p -m0644 ${WORKDIR}/weston.ini
> ${D}${sysconfdir}/xdg/weston/weston.ini
>         install -Dm644 ${WORKDIR}/weston.env
> ${D}${sysconfdir}/default/weston
>
> @@ -55,10 +57,13 @@ do_install() {
>         fi
>  }
>
> +INHIBIT_UPDATERCD_BBCLASS =
> "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1',
> '', d)}"
> +
>  inherit update-rc.d features_check systemd
>
>  # rdepends on weston which depends on virtual/egl
> -REQUIRED_DISTRO_FEATURES = "opengl"
> +# requires pam enabled if started via systemd
> +REQUIRED_DISTRO_FEATURES = "opengl
> ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam',
> '', d)}"
>
>  RDEPENDS_${PN} = "weston kbd"
>
> --
> 2.29.1
>
>
> 
>
>

--000000000000eaf78305b40d2fc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">weston rdepends on weston-init, so it needs ${@oe.utils.co=
nditional(&#39;VIRTUAL-RUNTIME_init_manager&#39;, &#39;systemd&#39;, &#39;<=
span class=3D"gmail-il">pam</span>&#39;, &#39;&#39;, d)} as well now, will =
send patch shortly.<div><br></div><div><pre class=3D"gmail-console-output" =
style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;margin-bott=
om:0px;color:rgb(51,51,51)">ERROR: Nothing RPROVIDES &#39;weston-init&#39; =
(but openembedded-core/meta/recipes-graphics/wayland/<a href=3D"http://west=
on_9.0.0.bb">weston_9.0.0.bb</a> RDEPENDS on or otherwise requires it)
weston-init was skipped: missing required distro feature &#39;pam&#39; (no=
t in DISTRO_FEATURES)
NOTE: Runtime target &#39;weston-init&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;weston-init&#39;]
ERROR: Nothing RPROVIDES &#39;weston-dev&#39; (but openembedded-core/meta/=
recipes-graphics/wayland/<a href=3D"http://weston_9.0.0.bb">weston_9.0.0.bb=
</a> RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for &#39;weston-dev&#39;
NOTE: Runtime target &#39;weston-dev&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;weston-dev&#39;]
ERROR: Nothing RPROVIDES &#39;weston&#39; (but openembedded-core/meta/reci=
pes-graphics/wayland/<a href=3D"http://weston_9.0.0.bb">weston_9.0.0.bb</a>=
 RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for &#39;weston&#39;
NOTE: Runtime target &#39;weston&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;weston&#39;]</pre></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Nov 9, 2020 at 9:32 AM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Several issues are addressed:<br=
>
1. weston requires pam when starting under systemd<br>
2. systemd was attempting to launch weston twice (from<br>
sysvinit script and from systemd unit file) which caused confusion<br>
and errors.<br>
3. runtime test should stop/start weston via systemd only if systemd<br>
actually controls system startup, not merely when systemd is present.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/cases/weston.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
 ++--<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb" rel=
=3D"noreferrer" target=3D"_blank">weston-init.bb</a> | 9 +++++++--<br>
=C2=A02 files changed, 9 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime=
/cases/weston.py<br>
index 36b4f9e375..d3fbf8ba92 100644<br>
--- a/meta/lib/oeqa/runtime/cases/weston.py<br>
+++ b/meta/lib/oeqa/runtime/cases/weston.py<br>
@@ -34,7 +34,7 @@ class WestonTest(OERuntimeTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;export XDG_RUNTIME_DIR=3D/ru=
n/user/0; export WAYLAND_DISPLAY=3Dwayland-0; %s&#39; % cmd<br>
<br>
=C2=A0 =C2=A0 =C2=A0def run_weston_init(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;systemd&#39; in <a href=3D"http://sel=
f.tc.td" rel=3D"noreferrer" target=3D"_blank">self.tc.td</a>[&#39;DISTRO_FE=
ATURES&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;systemd&#39; in <a href=3D"http://sel=
f.tc.td" rel=3D"noreferrer" target=3D"_blank">self.tc.td</a>[&#39;VIRTUAL-R=
UNTIME_init_manager&#39;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target.run(&#39;syste=
md-run --collect --unit=3Dweston-ptest.service --uid=3D0 -p PAMName=3Dlogin=
 -p TTYPath=3D/dev/tty6 -E XDG_RUNTIME_DIR=3D/tmp -E WAYLAND_DISPLAY=3Dwayl=
and-0 /usr/bin/weston --socket=3Dwayland-1 --log=3D%s&#39; % self.weston_lo=
g_file)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target.run(self.get_w=
eston_command(&#39;openvt -- weston --socket=3Dwayland-1 --log=3D%s&#39; % =
self.weston_log_file))<br>
@@ -66,7 +66,7 @@ class WestonTest(OERuntimeTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_wl_processes, try_cnt =3D self.get_n=
ew_wayland_processes(existing_wl_processes)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0existing_and_new_weston_processes =3D se=
lf.get_processes_of(&#39;weston&#39;, &#39;existing and new&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_weston_processes =3D [x for x in exi=
sting_and_new_weston_processes if x not in existing_weston_processes]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;systemd&#39; in <a href=3D"http://sel=
f.tc.td" rel=3D"noreferrer" target=3D"_blank">self.tc.td</a>[&#39;DISTRO_FE=
ATURES&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;systemd&#39; in <a href=3D"http://sel=
f.tc.td" rel=3D"noreferrer" target=3D"_blank">self.tc.td</a>[&#39;VIRTUAL-R=
UNTIME_init_manager&#39;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target.run(&#39;syste=
mctl stop weston-ptest.service&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for w in new_weston_proces=
ses:<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston-init.b=
b" rel=3D"noreferrer" target=3D"_blank">weston-init.bb</a> b/meta/recipes-g=
raphics/wayland/<a href=3D"http://weston-init.bb" rel=3D"noreferrer" target=
=
=3D"_blank">weston-init.bb</a><br>
index b7a99be646..4b2a6ca983 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb" rel=
=3D"noreferrer" target=3D"_blank">weston-init.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb" rel=
=3D"noreferrer" target=3D"_blank">weston-init.bb</a><br>
@@ -26,7 +26,9 @@ DEFAULTBACKEND_qemux86 =3D &quot;drm&quot;<br>
=C2=A0DEFAULTBACKEND_qemux86-64 =3D &quot;drm&quot;<br>
<br>
=C2=A0do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm755 ${WORKDIR}/init ${D}/${sysconfd=
ir}/init.d/weston<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${VIRTUAL-RUNTIME_init_manager}&qu=
ot; !=3D &quot;systemd&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm755 ${W=
ORKDIR}/init ${D}/${sysconfdir}/init.d/weston<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -p -m0644 ${WORKDIR}/weston.ini ${D=
}${sysconfdir}/xdg/weston/weston.ini<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm644 ${WORKDIR}/weston.env ${D}${sys=
confdir}/default/weston<br>
<br>
@@ -55,10 +57,13 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
+INHIBIT_UPDATERCD_BBCLASS =3D &quot;${@oe.utils.conditional(&#39;VIRTUAL-=
RUNTIME_init_manager&#39;, &#39;systemd&#39;, &#39;1&#39;, &#39;&#39;, d)}&=
quot;<br>
+<br>
=C2=A0inherit update-rc.d features_check systemd<br>
<br>
=C2=A0# rdepends on weston which depends on virtual/egl<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+# requires pam enabled if started via systemd<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl ${@oe.utils.conditional(&#39;VI=
RTUAL-RUNTIME_init_manager&#39;, &#39;systemd&#39;, &#39;pam&#39;, &#39;&#3=
9;, d)}&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;weston kbd&quot;<br>
<br>
-- <br>
2.29.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000eaf78305b40d2fc8--
