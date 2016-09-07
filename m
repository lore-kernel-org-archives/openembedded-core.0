Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC3E776B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 12:14:20 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id g62so9336514lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2016 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3+DnAaTAki+7rn2YDMMqA5fHuKq2tysm/+Mr/AGp69Q=;
	b=LX4c50c8jQkUQ1zEuau7nffqZSKicMa2Aw48wFBR3XKprWXEBqFoaThzT5AYLeC+MO
	U5LTy9kmOOcXHd9bRjEn4hvL2GUKVPW5/FtDiD2RSqssEVULVp9Qdg6cXZksHm1P0w7n
	p5rU6mAo6Qfz3pndwDoENVqXEkaW8anZ+ixCkQC10k/BiCmpkc94GB4v3KVAswZKZtOi
	1ozoiZH72WY++p3jwH4FNCZXK5m996kELuvmgRmpSh5f4oLGHuVuB77YDGLI9sO0y/+k
	G295Bw6ZWpF5IuxuhSSKVkUx/ggx0J2XmuwFxyQWkLPzuLSFlkTSfxWffTay6ic+gQu5
	jL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3+DnAaTAki+7rn2YDMMqA5fHuKq2tysm/+Mr/AGp69Q=;
	b=Vyn83Sa0hWhKLTQSzrCWvbENpa7FJK+AsDIYcdZp3Tc1g8F3f3Ly8D02y6Sb5g9CUl
	sl9Pu9dWzsJnL9/cL68eETgD+fMIQjn2ISrIwpRKDYe4hWvR7oqYtzW9h54xB5UtO++3
	Jt258GNJvc+FyNEEX2/RH+mRqW5LFsjdCVszJgWTvn8axh+XpzYvfleDQFmQVeoFJKuJ
	XahRKIbLAE6smcaQt928kblvtukW+YBsYJx12MDzKvuFzd1IM96CMVPljgeYkuNOx6v0
	1uFQo75mA2liO1TnXw8lV7NhM5ABgkJmjg0lD67kMBVxLisGa//Aql+23ZEAWTMw5ApV
	zD0w==
X-Gm-Message-State: AE9vXwNx3Pjkt2cLRRRK/d2+3JEbQhz0vMTyDt18uxbfDkja50kwK/xaUyd5t/06CX4RM0998m3Zp+cJETRU7A==
X-Received: by 10.25.162.17 with SMTP id l17mr11666039lfe.125.1473250460350;
	Wed, 07 Sep 2016 05:14:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.85.200 with HTTP; Wed, 7 Sep 2016 05:14:19 -0700 (PDT)
In-Reply-To: <4e703d64c6d15986135603c94ad9730b7f6d66c7.1473240119.git.Qi.Chen@windriver.com>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<4e703d64c6d15986135603c94ad9730b7f6d66c7.1473240119.git.Qi.Chen@windriver.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Wed, 7 Sep 2016 14:14:19 +0200
Message-ID: <CAEGpDuav43RX6WbQS5OVtDO6oRry-ybyMNt5iG8t1qMDriQ2gA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] systemd.bbclass: add support to manage user services
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
X-List-Received-Date: Wed, 07 Sep 2016 12:14:22 -0000
Content-Type: multipart/alternative; boundary=001a114110c45af441053be9da37

--001a114110c45af441053be9da37
Content-Type: text/plain; charset=UTF-8

2016-09-07 11:22 GMT+02:00 Chen Qi <Qi.Chen@windriver.com>:

> Add new variable SYSTEMD_USER_SERVICE and SYSTEM_USER_AUTO_ENABLE
> to manage user services. Their usage is like SYSTEMD_SERVICE and
> SYSTEMD_AUTO_ENABLE.
>
> [YOCTO #7800]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/systemd.bbclass | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index db7873f..78cec97 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -7,6 +7,7 @@ SYSTEMD_PACKAGES_class-nativesdk ?= ""
>
>  # Whether to enable or disable the services on installation.
>  SYSTEMD_AUTO_ENABLE ??= "enable"
> +SYSTEMD_USER_AUTO_ENABLE ??= "enable"
>
>  # This class will be included in any recipe that supports systemd init
> scripts,
>  # even if systemd is not in DISTRO_FEATURES.  As such don't make any
> changes
> @@ -30,10 +31,14 @@ fi
>
>  if type systemctl >/dev/null 2>/dev/null; then
>         systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> +       systemctl $OPTS --global ${SYSTEMD_USER_AUTO_ENABLE}
> ${SYSTEMD_USER_SERVICE}
>

I'm not sure having these 2 systemctl being executed together everytime is
a good idea. What if a recipe has a user service and no system service? We
are calling the first one with an empty system service? Or we are may be
enabling a systemd system service which should not be enabled according to
the recipe? I have the feeling this kind of cases are not being catch in
here and other pkg scripts in this commit.

It is far from perfect, but in case you didn't, you may want to have a look
at my initial/previous commit to try to fix the issue:
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg42187.html


>
>         if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>                 systemctl restart ${SYSTEMD_SERVICE}
>         fi
> +       if [ -z "$D" -a "${SYSTEMD_USER_AUTO_ENABLE}" = "enable" ]; then
> +               systemctl --global restart ${SYSTEMD_USER_SERVICE}
> +       fi
>  fi
>  }
>
> @@ -47,9 +52,11 @@ fi
>  if type systemctl >/dev/null 2>/dev/null; then
>         if [ -z "$D" ]; then
>                 systemctl stop ${SYSTEMD_SERVICE}
> +               systemctl --global stop ${SYSTEMD_USER_SERVICE}
>

I think this is not gonna work, you cannot call --global with stop afair.
I'm not sure which is the good solution for this though, but you should
ideally go through all systemd user sessions and call "systemctl --user
stop". No idea if that's actually easily feasible.


>         fi
>
>         systemctl $OPTS disable ${SYSTEMD_SERVICE}
> +       systemctl $OPTS --global disable ${SYSTEMD_USER_SERVICE}
>  fi
>  }
>
> @@ -139,12 +146,14 @@ python systemd_populate_packages() {
>      def systemd_check_services():
>          searchpaths = [oe.path.join(d.getVar("sysconfdir", True),
> "systemd", "system"),]
>          searchpaths.append(d.getVar("systemd_system_unitdir", True))
> +        searchpaths.append(oe.path.join(d.getVar("sysconfdir", True),
> "systemd", "user"))
> +        searchpaths.append(d.getVar("systemd_user_unitdir", True))
>          systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
>
>          keys = 'Also'
>          # scan for all in SYSTEMD_SERVICE[]
>          for pkg_systemd in systemd_packages.split():
> -            for service in get_package_var(d, 'SYSTEMD_SERVICE',
> pkg_systemd).split():
> +            for service in (get_package_var(d, 'SYSTEMD_SERVICE',
> pkg_systemd) + get_package_var(d, 'SYSTEMD_USER_SERVICE',
> pkg_systemd)).split():
>                  path_found = ''
>
>                  # Deal with adding, for example, 'ifplugd@eth0.service'
> from
> @@ -165,14 +174,14 @@ python systemd_populate_packages() {
>                  if path_found != '':
>                      systemd_add_files_and_parse(pkg_systemd, path_found,
> service, keys)
>                  else:
> -                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s value
> %s does not exist" % \
> -                        (pkg_systemd, service))
> +                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s or
> SYSTEMD_USER_SERVICE_%s value %s does not exist" % \
> +                        (pkg_systemd, pkg_systemd, service))
>
>      # Run all modifications once when creating package
>      if os.path.exists(d.getVar("D", True)):
>          for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
>              systemd_check_package(pkg)
> -            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
> +            if d.getVar('SYSTEMD_SERVICE_' + pkg, True) or
> d.getVar('SYSTEMD_USER_SERVICE_' + pkg, True):
>                  systemd_generate_package_scripts(pkg)
>          systemd_check_services()
>  }
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114110c45af441053be9da37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
2016-09-07 11:22 GMT+02:00 Chen Qi <span dir=3D"ltr">&lt;<a target=3D"_blan=
k" href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;</spa=
n>:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">Add new variable S=
YSTEMD_USER_SERVICE and SYSTEM_USER_AUTO_ENABLE<br>
to manage user services. Their usage is like SYSTEMD_SERVICE and<br>
SYSTEMD_AUTO_ENABLE.<br>
<br>
[YOCTO #7800]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/systemd.bbclass | 17 +++++++++++++----<br>
=C2=A01 file changed, 13 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass<br=
>
index db7873f..78cec97 100644<br>
--- a/meta/classes/systemd.bbclass<br>
+++ b/meta/classes/systemd.bbclass<br>
@@ -7,6 +7,7 @@ SYSTEMD_PACKAGES_class-<wbr>nativesdk ?=3D &quot;&quot;<br>
<br>
=C2=A0# Whether to enable or disable the services on installation.<br>
=C2=A0SYSTEMD_AUTO_ENABLE ??=3D &quot;enable&quot;<br>
+SYSTEMD_USER_AUTO_ENABLE ??=3D &quot;enable&quot;<br>
<br>
=C2=A0# This class will be included in any recipe that supports systemd ini=
t scripts,<br>
=C2=A0# even if systemd is not in DISTRO_FEATURES.=C2=A0 As such don&#39;t =
make any changes<br>
@@ -30,10 +31,14 @@ fi<br>
<br>
=C2=A0if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEM=
D_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS --global ${SYSTEMD_USER_AUTO_EN=
ABLE} ${SYSTEMD_USER_SERVICE}=C2=A0<br></blockquote><div><br></div><div>I&#=
39;m not sure having these 2 systemctl being executed together everytime is=
 a good idea. What if a recipe has a user service and no system service? We=
 are calling the first one with an empty system service? Or we are may be e=
nabling a systemd system service which should not be enabled according to t=
he recipe? I have the feeling this kind of cases are not being catch in her=
e and other pkg scripts in this commit.<br><br></div><div>It is far from pe=
rfect, but in case you didn&#39;t, you may want to have a look at my initia=
l/previous commit to try to fix the issue: <a href=3D"https://www.mail-arch=
ive.com/openembedded-devel@lists.openembedded.org/msg42187.html">https://ww=
w.mail-archive.com/openembedded-devel@lists.openembedded.org/msg42187.html<=
/a><br></div><div>=C2=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_qu=
ote">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; -a &quot;${SYSTEMD_AUTO_=
ENABLE}&quot; =3D &quot;enable&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl restart $=
{SYSTEMD_SERVICE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$D&quot; -a &quot;${SYSTEMD_USER_=
AUTO_ENABLE}&quot; =3D &quot;enable&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl --global =
restart ${SYSTEMD_USER_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
=C2=A0}<br>
<br>
@@ -47,9 +52,11 @@ fi<br>
=C2=A0if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl stop ${SY=
STEMD_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl --global =
stop ${SYSTEMD_USER_SERVICE}<br></blockquote><div><br></div><div>I think th=
is is not gonna work, you cannot call --global with stop afair. I&#39;m not=
 sure which is the good solution for this though, but you should ideally go=
 through all systemd user sessions and call &quot;systemctl --user stop&quo=
t;. No idea if that&#39;s actually easily feasible.<br></div><div>=C2=A0</d=
iv><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(=
204,204,204);padding-left:1ex" class=3D"gmail_quote">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl $OPTS disable ${SYSTEMD_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS --global disable ${SYSTEMD_USER=
_SERVICE}<br>
=C2=A0fi<br>
=C2=A0}<br>
<br>
@@ -139,12 +146,14 @@ python systemd_populate_packages() {<br>
=C2=A0 =C2=A0 =C2=A0def systemd_check_services():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0searchpaths =3D [oe.path.join(d.getVar(&q=
uot;<wbr>sysconfdir&quot;, True), &quot;systemd&quot;, &quot;system&quot;),=
]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0searchpaths.append(d.getVar(&quot;<wbr>sy=
stemd_system_unitdir&quot;, True))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(oe.path.<wbr>join(d.getVar(=
&quot;sysconfdir&quot;, True), &quot;systemd&quot;, &quot;user&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(d.getVar(&quot;<wbr>systemd=
_user_unitdir&quot;, True))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_packages =3D d.getVar(&#39;SYSTEM=
D_PACKAGES&#39;, True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0keys =3D &#39;Also&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# scan for all in SYSTEMD_SERVICE[]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg_systemd in systemd_packages.split=
():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for service in get_package_var(d=
, &#39;SYSTEMD_SERVICE&#39;, pkg_systemd).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for service in (get_package_var(=
d, &#39;SYSTEMD_SERVICE&#39;, pkg_systemd) + get_package_var(d, &#39;SYSTEM=
D_USER_SERVICE&#39;, pkg_systemd)).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path_found =
=3D &#39;&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Deal with a=
dding, for example, &#39;ifplugd@eth0.service&#39; from<br>
@@ -165,14 +174,14 @@ python systemd_populate_packages() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if path_found=
 !=3D &#39;&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0systemd_add_files_and_parse(<wbr>pkg_systemd, path_found, service, keys)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e bb.build.FuncFailed(&quot;SYSTEMD_<wbr>SERVICE_%s value %s does not exist=
&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (pkg_systemd, service))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e bb.build.FuncFailed(&quot;SYSTEMD_<wbr>SERVICE_%s or SYSTEMD_USER_SERVICE=
_%s value %s does not exist&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (pkg_systemd, pkg_systemd, service))<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Run all modifications once when creating package<br>
=C2=A0 =C2=A0 =C2=A0if os.path.exists(d.getVar(&quot;D&quot;, True)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in d.getVar(&#39;SYSTEMD_PACKAGES=
&#39;, True).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_check_package(pkg)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;SYSTEMD_SERVICE=
_&#39; + pkg, True):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;SYSTEMD_SERVICE=
_&#39; + pkg, True) or d.getVar(&#39;SYSTEMD_USER_<wbr>SERVICE_&#39; + pkg,=
 True):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_gener=
ate_package_<wbr>scripts(pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_check_services()<br>
=C2=A0}<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a target=3D"_blank" rel=3D"noreferrer" href=3D"http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114110c45af441053be9da37--
