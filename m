Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4546F7D2D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 08:59:58 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id n5so1790034otk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hVCCNNyoY8Th/vE4Ijf3Ti/HEf9shmhKlS0n4hCRTOM=;
	b=CU4/Eo+HTppRNyrOc6Ihebe+0OIxKfIpeDJlAKV9xArHq2Z3re4zdvcJZD/esaeCfm
	im9dbzGygDPJ5srq22c0ccx2EnwF08dalhhucAwd55gyT4x6w/iILinPYrISgkwHY0U3
	sZE0QvbFWdMckm7+9xNzXeT4w+eYJCy+/42ZWDv+wCyWVsco7M0kIU89fqA9hI2qEofv
	QesHJSDa8LjOBIGviUSdXkIWyaih+0tEJwSnTygn+lexRJLvYGunm0bq1k7aBtfBu+sB
	vEXkTBiFEonb6e8yw11rsJndPCRzOUoqLOwyL7RuVPeBnySpSzKF3ZvtUnm0eaYr7qnI
	ojug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hVCCNNyoY8Th/vE4Ijf3Ti/HEf9shmhKlS0n4hCRTOM=;
	b=CQcG+zoO3kKiapaUiTO+ZuRZrfoDvpeKrXfk5+Vfqg79/kz69F5pUoSo8AwVuqxDHU
	IuyT1pjwwKdJ211WAgoxZyZ+m/Q9B+ki5IRP7TId6su1SAumFOGHk8VTveWY29Zbb3C3
	9eVwNDuJP/f7+/tbZooGcc35YvuLMQY8sN9RRjV5g+bL9ENludDmntQNIiIapT8fd/kz
	0hTXNCyES3aycxOSNdYJKNq5AACk/YzS9cfVJZtH5xcySrDU+8wR3BpXJ3+UyRrFOljV
	Lye95HifhxtbFpq+zNpjy52bA0wuapNLMul2+khNYEcF2fHlS2J1pspTOsWsy1SQzLJh
	2Pzg==
X-Gm-Message-State: APjAAAXgY2xWEcbTtUXrAqPaJq1CnFEf17HdS/GhOzq3lSgydaOAAZM0
	w4uDkC3N+7rUi24KoM/eurfMnp894NerC5Y4J8g=
X-Google-Smtp-Source: APXvYqzW6f471J8YNNLniStDt180HTHDLQwVo7NMcaQ0WP7sovVgeRUYQtPrT2WDf2s/MF4NTwg0jHmNA/5UKKO/eLU=
X-Received: by 2002:a9d:7dd9:: with SMTP id k25mr2422905otn.350.1561539599102; 
	Wed, 26 Jun 2019 01:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
In-Reply-To: <4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Jun 2019 10:59:47 +0200
Message-ID: <CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>, Sinan Kaya <okaya@kernel.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Wed, 26 Jun 2019 08:59:58 -0000
Content-Type: multipart/alternative; boundary="0000000000001b7a42058c364570"

--0000000000001b7a42058c364570
Content-Type: text/plain; charset="UTF-8"

Yes, this looks suspicious to me as well. If the tools are absent you need
to investigate why they are absent; skipping the tools execution is just
sweeping the problem under the carpet, not fixing it.

Alex

On Wed, 26 Jun 2019 at 04:15, ChenQi <Qi.Chen@windriver.com> wrote:

> Under which circumstances will the tools be absent?
> And why do you check the existence of files for some the the existence
> of directories for others?
>
> Best Regards,
> Chen Qi
>
> On 06/26/2019 06:13 AM, Sinan Kaya wrote:
> > do_rootfs: The postinstall intercept hook 'update_udev_hwdb'
> > do_rootfs: The postinstall intercept hook 'update_gio_module_cache'
> failed
> > do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
> > do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
> >
> > Signed-off-by: Sinan Kaya <okaya@kernel.org>
> > ---
> >   scripts/postinst-intercepts/update_font_cache    |  6 ++++--
> >   .../postinst-intercepts/update_gio_module_cache  | 10 +++++++---
> >   scripts/postinst-intercepts/update_icon_cache    | 16 +++++++++-------
> >   scripts/postinst-intercepts/update_pixbuf_cache  |  5 ++++-
> >   scripts/postinst-intercepts/update_udev_hwdb     |  6 ++++--
> >   5 files changed, 28 insertions(+), 15 deletions(-)
> >
> > diff --git a/scripts/postinst-intercepts/update_font_cache
> b/scripts/postinst-intercepts/update_font_cache
> > index 3053c7065f4..954acbb41b2 100644
> > --- a/scripts/postinst-intercepts/update_font_cache
> > +++ b/scripts/postinst-intercepts/update_font_cache
> > @@ -5,5 +5,7 @@
> >
> >   set -e
> >
> > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv}
> $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only
> ${fontconfigcacheparams}
> > -chown -R root:root $D${fontconfigcachedir}
> > +if [ -f $D${libexecdir}/${binprefix}fc-cache ]; then
> > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
> ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D
> --system-only ${fontconfigcacheparams}
> > +     chown -R root:root $D${fontconfigcachedir}
> > +fi
> > diff --git a/scripts/postinst-intercepts/update_gio_module_cache
> b/scripts/postinst-intercepts/update_gio_module_cache
> > index c87fa85db9e..e8483cb0bf5 100644
> > --- a/scripts/postinst-intercepts/update_gio_module_cache
> > +++ b/scripts/postinst-intercepts/update_gio_module_cache
> > @@ -5,7 +5,11 @@
> >
> >   set -e
> >
> > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
> $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
> > +if [ -f $D${libexecdir}/${binprefix}gio-querymodules ]; then
> > +
> > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
> $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
> > +
> > +     [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
> > +             chown root:root $D${libdir}/gio/modules/giomodule.cache
> > +fi
> >
> > -[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
> > -     chown root:root $D${libdir}/gio/modules/giomodule.cache
> > diff --git a/scripts/postinst-intercepts/update_icon_cache
> b/scripts/postinst-intercepts/update_icon_cache
> > index 212209a9daf..a67ff7ef970 100644
> > --- a/scripts/postinst-intercepts/update_icon_cache
> > +++ b/scripts/postinst-intercepts/update_icon_cache
> > @@ -5,12 +5,14 @@
> >
> >   set -e
> >
> > -# update native pixbuf loaders
> >
> -$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
> --update-cache
> > +if [ -d $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0 ]; then
> > +     # update native pixbuf loaders
> > +
>  $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
> --update-cache
> >
> > -for icondir in $D/usr/share/icons/*/ ; do
> > -    if [ -d $icondir ] ; then
> > -        gtk-update-icon-cache -fqt  $icondir
> > -    fi
> > -done
> > +     for icondir in $D/usr/share/icons/*/ ; do
> > +         if [ -d $icondir ] ; then
> > +             gtk-update-icon-cache -fqt  $icondir
> > +         fi
> > +     done
> > +fi
> >
> > diff --git a/scripts/postinst-intercepts/update_pixbuf_cache
> b/scripts/postinst-intercepts/update_pixbuf_cache
> > index ea12814474e..166422e5c37 100644
> > --- a/scripts/postinst-intercepts/update_pixbuf_cache
> > +++ b/scripts/postinst-intercepts/update_pixbuf_cache
> > @@ -8,6 +8,9 @@ set -e
> >   export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
> >   export GDK_PIXBUF_FATAL_LOADER=1
> >
> > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
> $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
> > +if [ -d $D${libdir}/gdk-pixbuf-2.0 ]; then
> > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
> $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
> >       >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
> >       sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
> > +fi
> > +
> > diff --git a/scripts/postinst-intercepts/update_udev_hwdb
> b/scripts/postinst-intercepts/update_udev_hwdb
> > index c4fb2bffcbf..7b6e38338f3 100644
> > --- a/scripts/postinst-intercepts/update_udev_hwdb
> > +++ b/scripts/postinst-intercepts/update_udev_hwdb
> > @@ -5,5 +5,7 @@
> >
> >   set -e
> >
> > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
> $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
> > -chown root:root $D${sysconfdir}/udev/hwdb.bin
> > +if [ -d $D/lib/udev/hwdb.d ]; then
> > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
> $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
> > +     chown root:root $D${sysconfdir}/udev/hwdb.bin
> > +fi
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001b7a42058c364570
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, this looks suspicious to me as well. If the tool=
s are absent you need to investigate why they are absent; skipping the tool=
s execution is just sweeping the problem under the carpet, not fixing it.</=
div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 26 Jun 2019 at 04:15, ChenQi =
&lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Under whi=
ch circumstances will the tools be absent?<br>
And why do you check the existence of files for some the the existence <br>
of directories for others?<br>
<br>
Best Regards,<br>
Chen Qi<br>
<br>
On 06/26/2019 06:13 AM, Sinan Kaya wrote:<br>
&gt; do_rootfs: The postinstall intercept hook &#39;update_udev_hwdb&#39;<b=
r>
&gt; do_rootfs: The postinstall intercept hook &#39;update_gio_module_cache=
&#39; failed<br>
&gt; do_rootfs: The postinstall intercept hook &#39;update_icon_cache&#39; =
failed<br>
&gt; do_rootfs: The postinstall intercept hook &#39;update_icon_cache&#39; =
failed<br>
&gt;<br>
&gt; Signed-off-by: Sinan Kaya &lt;<a href=3D"mailto:okaya@kernel.org" targ=
et=3D"_blank">okaya@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0scripts/postinst-intercepts/update_font_cache=C2=A0 =C2=A0=
 |=C2=A0 6 ++++--<br>
&gt;=C2=A0 =C2=A0.../postinst-intercepts/update_gio_module_cache=C2=A0 | 10=
 +++++++---<br>
&gt;=C2=A0 =C2=A0scripts/postinst-intercepts/update_icon_cache=C2=A0 =C2=A0=
 | 16 +++++++++-------<br>
&gt;=C2=A0 =C2=A0scripts/postinst-intercepts/update_pixbuf_cache=C2=A0 |=C2=
=A0 5 ++++-<br>
&gt;=C2=A0 =C2=A0scripts/postinst-intercepts/update_udev_hwdb=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 6 ++++--<br>
&gt;=C2=A0 =C2=A05 files changed, 28 insertions(+), 15 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/p=
ostinst-intercepts/update_font_cache<br>
&gt; index 3053c7065f4..954acbb41b2 100644<br>
&gt; --- a/scripts/postinst-intercepts/update_font_cache<br>
&gt; +++ b/scripts/postinst-intercepts/update_font_cache<br>
&gt; @@ -5,5 +5,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0set -e<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcachee=
nv} $D${libexecdir}/${binprefix}fc-cache --sysroot=3D$D --system-only ${fon=
tconfigcacheparams}<br>
&gt; -chown -R root:root $D${fontconfigcachedir}<br>
&gt; +if [ -f $D${libexecdir}/${binprefix}fc-cache ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -=
E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=3D$D=
 --system-only ${fontconfigcacheparams}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0chown -R root:root $D${fontconfigcachedir}<br>
&gt; +fi<br>
&gt; diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scr=
ipts/postinst-intercepts/update_gio_module_cache<br>
&gt; index c87fa85db9e..e8483cb0bf5 100644<br>
&gt; --- a/scripts/postinst-intercepts/update_gio_module_cache<br>
&gt; +++ b/scripts/postinst-intercepts/update_gio_module_cache<br>
&gt; @@ -5,7 +5,11 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0set -e<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${bin=
prefix}gio-querymodules $D${libdir}/gio/modules/<br>
&gt; +if [ -f $D${libexecdir}/${binprefix}gio-querymodules ]; then<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $=
D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ ! -e $D${libdir}/gio/modules/giomodule.cache ] =
||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown root:root $D${l=
ibdir}/gio/modules/giomodule.cache<br>
&gt; +fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0chown root:root $D${libdir}/gio/modules/giomodule=
.cache<br>
&gt; diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/p=
ostinst-intercepts/update_icon_cache<br>
&gt; index 212209a9daf..a67ff7ef970 100644<br>
&gt; --- a/scripts/postinst-intercepts/update_icon_cache<br>
&gt; +++ b/scripts/postinst-intercepts/update_icon_cache<br>
&gt; @@ -5,12 +5,14 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0set -e<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -# update native pixbuf loaders<br>
&gt; -$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-=
loaders --update-cache<br>
&gt; +if [ -d $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0 ]; then<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0# update native pixbuf loaders<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2=
.0/gdk-pixbuf-query-loaders --update-cache<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -for icondir in $D/usr/share/icons/*/ ; do<br>
&gt; -=C2=A0 =C2=A0 if [ -d $icondir ] ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk-update-icon-cache -fqt=C2=A0 $icondir=
<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for icondir in $D/usr/share/icons/*/ ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d $icondir ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk-update-icon-cache=
 -fqt=C2=A0 $icondir<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0done<br>
&gt; +fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts=
/postinst-intercepts/update_pixbuf_cache<br>
&gt; index ea12814474e..166422e5c37 100644<br>
&gt; --- a/scripts/postinst-intercepts/update_pixbuf_cache<br>
&gt; +++ b/scripts/postinst-intercepts/update_pixbuf_cache<br>
&gt; @@ -8,6 +8,9 @@ set -e<br>
&gt;=C2=A0 =C2=A0export GDK_PIXBUF_MODULEDIR=3D$D${libdir}/gdk-pixbuf-2.0/2=
.10.0/loaders<br>
&gt;=C2=A0 =C2=A0export GDK_PIXBUF_FATAL_LOADER=3D1<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${libdir}/gdk-pixbu=
f-2.0/gdk-pixbuf-query-loaders \<br>
&gt; +if [ -d $D${libdir}/gdk-pixbuf-2.0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $=
D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;$GDK_PIXBUF_MODULEDIR/../loaders.cache &=
amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s:$D::g&quot; $GDK_PIXBUF_MO=
DULEDIR/../loaders.cache<br>
&gt; +fi<br>
&gt; +<br>
&gt; diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/po=
stinst-intercepts/update_udev_hwdb<br>
&gt; index c4fb2bffcbf..7b6e38338f3 100644<br>
&gt; --- a/scripts/postinst-intercepts/update_udev_hwdb<br>
&gt; +++ b/scripts/postinst-intercepts/update_udev_hwdb<br>
&gt; @@ -5,5 +5,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0set -e<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${bin=
prefix}udevadm hwdb --update --root $D<br>
&gt; -chown root:root $D${sysconfdir}/udev/hwdb.bin<br>
&gt; +if [ -d $D/lib/udev/hwdb.d ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $=
D${libexecdir}/${binprefix}udevadm hwdb --update --root $D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0chown root:root $D${sysconfdir}/udev/hwdb.bin<br>
&gt; +fi<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000001b7a42058c364570--
