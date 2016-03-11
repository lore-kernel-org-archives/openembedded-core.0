Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 465D4734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:16:11 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id fz5so112568964obc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 05:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=58TkOXtd/h27gQr9G5xfkz2ipXRhuWsdOhf0S64cW1c=;
	b=YcSHyXEt6HIpX0RcmRlt0TA+QSpfflZ0G0J3Q2YDkwx8ZqL7q6tLOddR54piSYzfjP
	6BVHyh8zTBh8MkBaj92bq3Jn9O+hL1rTIa4cSDv30LeT0JYmNmeu32tWN1dd1TUbhLDe
	8tJTZcKhbQb660AfgoE0ROuDqY7b17IMsyi8MINni1mSGz5hM9g94dze0IIYafaXSY6C
	xbipq4UwrcTslqWm1Exm/Y6vRD1yr6S2Zj4r3tFJ/DYtsqgVcoaOmihew8ljEJ5ErK8K
	sGwS3hb2e0K2Qzwjasctz4JN566IGYbQ+rIz7ZrvNgdUuusbGXby/9uH9kL3FnnLx5jl
	dJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=58TkOXtd/h27gQr9G5xfkz2ipXRhuWsdOhf0S64cW1c=;
	b=N+z9ZwodHF61NIb9sah6Bnu3c42oaRnO+Lg4pDTctulzo0Hi4nfQ12kOe7g+BqDPT5
	NCndlxVFsIu8iTE/yfworVS1xlD+WWqUlqY33OInEBUgs7wUO+06x9oMNUjTwhX0tUmP
	KHi0Qu5GM8mUurRu5Fy5IS5YtU7LbMMS2ZQkdaQ2K3UokJluGGHwyNypn/eIGHNfU0io
	0abXcRvgUhkrV8LCQL5+s1wfh20n8w0dB7epKuUr6Dmf2UILe/Iz3HVOS+GT4Z0dx4OE
	xzdKgJq9quSAnavoys60GVL3e2672EQgjBl9nJandMVjsX3q21VD0/OpAIY1YSO0viPR
	33Sg==
X-Gm-Message-State: AD7BkJIh/w03veLmlG65Fjjo7OGxFr60Ox42IMGs9zZgekLJWDK0SYvjIyE0J5/y20cdq08RNZXHMZqMIXq6Pye4
X-Received: by 10.182.24.170 with SMTP id v10mr5769120obf.55.1457702171813;
	Fri, 11 Mar 2016 05:16:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.45.215 with HTTP; Fri, 11 Mar 2016 05:15:42 -0800 (PST)
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 11 Mar 2016 15:15:42 +0200
Message-ID: <CAHiDW_FaDuNfjB9HP-t=nwHv4oyVrPotyq4iPTKh15HmiG8GUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 00/12] Sato desktop upgrade (Gtk3 etc.)
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
X-List-Received-Date: Fri, 11 Mar 2016 13:16:12 -0000
Content-Type: multipart/alternative; boundary=001a11c304ba23f17a052dc5bc46

--001a11c304ba23f17a052dc5bc46
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 15:12, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

>   matchbox-theme-sato: Upgrade to JKU
>

As I was already asked about it: the commit message title is just a keyword
for me so I remember to modify them to whatever the upstream versions end
up as in the final patchset.

Jussi


>   matchbox-desktop: Ugrade to JKU
>   matchbox-panel-2: Upgrade to JKU
>   matchbox-session-sato: Update session startup
>   sato-screenshot: Upgrade to JKU
>   settings-daemon: Upgrade to JKU
>   gtk-sato-engine: Remove as unused
>   matchbox-wm: Upgrade to JKU
>   connman-gnome: Upgrade to JKU
>   matchbox-panel-2: Depend on dbus-glib-native for binding-tool
>
>  .../connman-gnome-fix-dbus-interface-name.patch    | 187
> ---------------------
>  .../connman-gnome/images/connman-signal-01.png     | Bin 490 -> 0 bytes
>  .../connman-gnome/images/connman-signal-02.png     | Bin 496 -> 0 bytes
>  .../connman-gnome/images/connman-signal-03.png     | Bin 492 -> 0 bytes
>  .../connman-gnome/images/connman-signal-04.png     | Bin 470 -> 0 bytes
>  .../connman-gnome/images/connman-signal-05.png     | Bin 419 -> 0 bytes
>  .../connman/connman-gnome_0.7.bb                   |  12 +-
>  .../gnome/gnome-themes-standard_3.18.0.bb          |  37 ++++
>  .../matchbox-wm/matchbox-wm_git.bb                 |   4 +-
>  meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |  25 ---
>  .../gtk-engines/gtk-sato-engine_git.bb             |  14 --
>  .../matchbox-desktop/matchbox-desktop_git.bb       |   7 +-
>  .../matchbox-panel-2/files/silence-warnings.patch  |  64 -------
>  .../matchbox-panel-2/matchbox-panel-2_git.bb       |  12 +-
>  .../matchbox-sato/matchbox-session-sato/session    |   9 +-
>  .../matchbox-sato/matchbox-session-sato_0.1.bb     |   4 +-
>  .../matchbox-theme-sato/matchbox-theme-sato_0.1.bb |   8 -
>  .../matchbox-theme-sato/matchbox-theme-sato_git.bb |   8 +-
>  .../packagegroups/packagegroup-core-x11-sato.bb    |   6 +-
>  .../sato-screenshot/sato-screenshot_git.bb         |   6 +-
>  .../files/dso_linking_change_build_fix.patch       |  31 ----
>  .../settings-daemon/settings-daemon_git.bb         |   8 +-
>  22 files changed, 65 insertions(+), 377 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
>  delete mode 100644
> meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png
>  delete mode 100644
> meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png
>  delete mode 100644
> meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png
>  delete mode 100644
> meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png
>  delete mode 100644
> meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png
>  create mode 100644 meta/recipes-gnome/gnome/
> gnome-themes-standard_3.18.0.bb
>  delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
>  delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
>  delete mode 100644
> meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch
>  delete mode 100644 meta/recipes-sato/matchbox-theme-sato/
> matchbox-theme-sato_0.1.bb
>  delete mode 100644
> meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
>
> --
> 2.1.4
>
>

--001a11c304ba23f17a052dc5bc46
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 March 2016 at 15:12, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mail=
to:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 matchbox-theme-=
sato: Upgrade to JKU<br>
</blockquote><div><br></div><div>As I was already asked about it: the commi=
t message title is just a keyword for me so I remember to modify them to wh=
atever the upstream versions end up as in the final patchset.</div><div><br=
></div><div>Jussi</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=
=A0 matchbox-desktop: Ugrade to JKU<br>
=C2=A0 matchbox-panel-2: Upgrade to JKU<br>
=C2=A0 matchbox-session-sato: Update session startup<br>
=C2=A0 sato-screenshot: Upgrade to JKU<br>
=C2=A0 settings-daemon: Upgrade to JKU<br>
=C2=A0 gtk-sato-engine: Remove as unused<br>
=C2=A0 matchbox-wm: Upgrade to JKU<br>
=C2=A0 connman-gnome: Upgrade to JKU<br>
=C2=A0 matchbox-panel-2: Depend on dbus-glib-native for binding-tool<br>
<br>
=C2=A0.../connman-gnome-fix-dbus-interface-name.patch=C2=A0 =C2=A0 | 187 --=
-------------------<br>
=C2=A0.../connman-gnome/images/connman-signal-01.png=C2=A0 =C2=A0 =C2=A0| B=
in 490 -&gt; 0 bytes<br>
=C2=A0.../connman-gnome/images/connman-signal-02.png=C2=A0 =C2=A0 =C2=A0| B=
in 496 -&gt; 0 bytes<br>
=C2=A0.../connman-gnome/images/connman-signal-03.png=C2=A0 =C2=A0 =C2=A0| B=
in 492 -&gt; 0 bytes<br>
=C2=A0.../connman-gnome/images/connman-signal-04.png=C2=A0 =C2=A0 =C2=A0| B=
in 470 -&gt; 0 bytes<br>
=C2=A0.../connman-gnome/images/connman-signal-05.png=C2=A0 =C2=A0 =C2=A0| B=
in 419 -&gt; 0 bytes<br>
=C2=A0.../connman/<a href=3D"http://connman-gnome_0.7.bb" rel=3D"noreferrer=
" target=3D"_blank">connman-gnome_0.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0.../gnome/<a href=3D"http://gnome-themes-standard_3.18.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnome-themes-standard_3.18.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 37 ++++<br>
=C2=A0.../matchbox-wm/<a href=3D"http://matchbox-wm_git.bb" rel=3D"noreferr=
er" target=3D"_blank">matchbox-wm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-sato/gtk-engines/gtk-sato-engine.inc=C2=A0 |=C2=A0 25 --=
-<br>
=C2=A0.../gtk-engines/<a href=3D"http://gtk-sato-engine_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">gtk-sato-engine_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 --<br>
=C2=A0.../matchbox-desktop/<a href=3D"http://matchbox-desktop_git.bb" rel=
=3D"noreferrer" target=3D"_blank">matchbox-desktop_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0.../matchbox-panel-2/files/silence-warnings.patch=C2=A0 |=C2=A0 64 --=
-----<br>
=C2=A0.../matchbox-panel-2/<a href=3D"http://matchbox-panel-2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">matchbox-panel-2_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0.../matchbox-sato/matchbox-session-sato/session=C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 +-<br>
=C2=A0.../matchbox-sato/<a href=3D"http://matchbox-session-sato_0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">matchbox-session-sato_0.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../matchbox-theme-sato/<a href=3D"http://matchbox-theme-sato_0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">matchbox-theme-sato_0.1.bb</a> |=C2=
=A0 =C2=A08 -<br>
=C2=A0.../matchbox-theme-sato/<a href=3D"http://matchbox-theme-sato_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">matchbox-theme-sato_git.bb</a> |=C2=
=A0 =C2=A08 +-<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-core-x11-sato.bb" re=
l=3D"noreferrer" target=3D"_blank">packagegroup-core-x11-sato.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../sato-screenshot/<a href=3D"http://sato-screenshot_git.bb" rel=3D"=
noreferrer" target=3D"_blank">sato-screenshot_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0.../files/dso_linking_change_build_fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 31 ----<br>
=C2=A0.../settings-daemon/<a href=3D"http://settings-daemon_git.bb" rel=3D"=
noreferrer" target=3D"_blank">settings-daemon_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A022 files changed, 65 insertions(+), 377 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/co=
nnman-gnome-fix-dbus-interface-name.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/im=
ages/connman-signal-01.png<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/im=
ages/connman-signal-02.png<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/im=
ages/connman-signal-03.png<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/im=
ages/connman-signal-04.png<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/im=
ages/connman-signal-05.png<br>
=C2=A0create mode 100644 meta/recipes-gnome/gnome/<a href=3D"http://gnome-t=
hemes-standard_3.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome-themes=
-standard_3.18.0.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc<=
br>
=C2=A0delete mode 100644 meta/recipes-sato/gtk-engines/<a href=3D"http://gt=
k-sato-engine_git.bb" rel=3D"noreferrer" target=3D"_blank">gtk-sato-engine_=
git.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-sato/matchbox-panel-2/files/silence-w=
arnings.patch<br>
=C2=A0delete mode 100644 meta/recipes-sato/matchbox-theme-sato/<a href=3D"h=
ttp://matchbox-theme-sato_0.1.bb" rel=3D"noreferrer" target=3D"_blank">matc=
hbox-theme-sato_0.1.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-sato/settings-daemon/files/dso_linkin=
g_change_build_fix.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c304ba23f17a052dc5bc46--
