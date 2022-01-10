Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64559C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 18:49:14 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web12.35976.1641840553870916461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 10:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BDLaCe8a;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id m90so9977612uam.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q70OMa/+B+4VGCse5ElQg1aVrhrt+UIY2rgcRyiiV7I=;
        b=BDLaCe8aPjUnLNFzdp+Ivzytw5RDRW0+BAvWdryViMzY/ZlQEwKHkS9tlKq3oa/qqb
         wRu1U8nN1dLaANW3DoYHU1tRaGQ+YWQBxMgbaQwk35rWt0rGJwCyXP9HmjAVoGyS0Fv6
         U9MHTpYsU1CWiYr1oUjJqB7eZGqyygjZXBf8mWmdXTzHcFJUV1ALsf5MU0Ew+FWoyK6N
         GZNz4tsHwcAlQW2jU3R+nPQhxb68l5wrr3C20XC+wT9Q69aD+Zd/iFaleu5Fv46fOxfb
         hKUveGYqi+7aoz5myjL94HK5XYWoTbxTro1qiSnRvA/6QC+WnE3PbXAF1boQPmSBTuip
         2vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q70OMa/+B+4VGCse5ElQg1aVrhrt+UIY2rgcRyiiV7I=;
        b=UKB91bxCVTgBZ4Mx6ZbnHH5L80/AgxJJWR29aC0hCUeEOuVkqr6b972EmRtXh4mpor
         JjYqt1+FnFWe+gVCDG1phERkYve5i6tsmN1ZNBOoWe3IcDVirB4T38O1Zm7CzqgMhda4
         5QwFCVltC5qzCDs82Peu6QIGCngu02gB4EOoBJMZBZQUo8Mre3xMjB0CjPXBlifOVIuZ
         i0/dsNs6q3SeuusYDY7HaE8S7fBCuynya4Fyh/v1u263Ok3EfkT11m95lX0/v32VTObs
         miSXeT1Y0B69koETPkxKm3XnkBMDf4kxqACFCkuBi8BiDgA9WGFmOlI6z1QSS1qt6Iu5
         +RGQ==
X-Gm-Message-State: AOAM531CCI/bRxUq5fKQXffyYY0GPiiqJF05MN5/PS8py3icRfHmbPhi
	5KA18FiisA3i6zgepdVoCBDTHoeSJvZPiHnVcWI=
X-Google-Smtp-Source: 
 ABdhPJxYVme7j+HKi6w23r2YXnkp7U/T2SWQGzHG5e0WxpAue78g6KA//W9W5O496CSBXlKiGmWL9SLK6fyYDu8dzeM=
X-Received: by 2002:ab0:134:: with SMTP id 49mr498703uak.22.1641840552830;
 Mon, 10 Jan 2022 10:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-10-alex@linutronix.de>
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jan 2022 19:49:01 +0100
Message-ID: 
 <CANNYZj8jt-Wh4nyBNdXm5ykPjOkK1nvoLH7vcJwgZpPnxn=NeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/14] epiphany: make libportal optional, and
 move it to meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000edec7005d53eca69"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 18:49:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160374

--000000000000edec7005d53eca69
Content-Type: text/plain; charset="UTF-8"

Was this patch included in the build?

Alex

On Mon, 10 Jan 2022 at 19:43, Khem Raj <raj.khem@gmail.com> wrote:

> seeing this error
>
> https://errors.yoctoproject.org/Errors/Details/621908/
>
> On Sun, Jan 9, 2022 at 2:28 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 -
> >  meta/recipes-gnome/epiphany/epiphany_41.0.bb  |  2 +-
> >  meta/recipes-gnome/libportal/libportal_0.5.bb | 17 -----------------
> >  3 files changed, 1 insertion(+), 19 deletions(-)
> >  delete mode 100644 meta/recipes-gnome/libportal/libportal_0.5.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 0af6974a3d..ab7915482a 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <
> yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <
> unassigned@yoctoproject.org>"
> >  RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
> >  RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
> > -RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> > diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> > index 8f3bd87340..a64cdefd86 100644
> > --- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> > +++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> > @@ -15,7 +15,6 @@ DEPENDS = " \
> >            libarchive \
> >            libdazzle \
> >            libhandy \
> > -          libportal \
> >            glib-2.0-native \
> >            "
> >
> > @@ -37,6 +36,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
> >  PACKAGECONFIG[developer-mode] =
> "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
> >  PACKAGECONFIG[soup2] =
> "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
> >  PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> > +PACKAGECONFIG[libportal] =
> "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
> >
> >  FILES:${PN} += "${datadir}/dbus-1
> ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
> >  RDEPENDS:${PN} = "iso-codes adwaita-icon-theme
> gsettings-desktop-schemas"
> > diff --git a/meta/recipes-gnome/libportal/libportal_0.5.bb
> b/meta/recipes-gnome/libportal/libportal_0.5.bb
> > deleted file mode 100644
> > index 67f63fea68..0000000000
> > --- a/meta/recipes-gnome/libportal/libportal_0.5.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -SUMMARY = "libportal provides GIO-style async APIs for most Flatpak
> portals."
> > -DESCRIPTION = "It provides simple asynchronous wrappers for most
> Flatpak portals \
> > -with a familiar GObject API along side the D-Bus API"
> > -HOMEPAGE = "https://github.com/flatpak/libportal"
> > -BUGTRACKER = "https://github.com/flatpak/libportal/issues"
> > -LICENSE = "LGPLv3"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
> > -
> > -SRC_URI = "git://
> github.com/flatpak/${BPN}.git;protocol=https;branch=master
> <http://github.com/flatpak/$%7BBPN%7D.git;protocol=https;branch=master>"
> > -SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
> > -S = "${WORKDIR}/git"
> > -
> > -inherit meson gtk-doc gobject-introspection
> > -
> > -DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
> > -
> > -EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#160313):
> https://lists.openembedded.org/g/openembedded-core/message/160313
> > Mute This Topic: https://lists.openembedded.org/mt/88311445/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000edec7005d53eca69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Was this patch included in the build?</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, 10 Jan 2022 at 19:43, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">seeing this error<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/621908/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/621908/</a><br>
<br>
On Sun, Jan 9, 2022 at 2:28 PM Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
&gt;=C2=A0 meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_41.0.bb" =
rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a>=C2=A0 |=C2=A0 2 +=
-<br>
&gt;=C2=A0 meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">libportal_0.5.bb</a> | 17 -----------=
------<br>
&gt;=C2=A0 3 files changed, 1 insertion(+), 19 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-gnome/libportal/<a href=3D"http:=
//libportal_0.5.bb" rel=3D"noreferrer" target=3D"_blank">libportal_0.5.bb</=
a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 0af6974a3d..ab7915482a 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre =3D &quot;Yi Zhao &lt=
;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriv=
er.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libpcre2 =3D &quot;Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctop=
roject.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libpipeline =3D &quot;Wang Mingyu &lt;<a hr=
ef=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&g=
t;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libpng =3D &quot;Anuj Mittal &lt;<a href=3D=
"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&=
gt;&quot;<br>
&gt; -RECIPE_MAINTAINER:pn-libportal =3D &quot;Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libproxy =3D &quot;Anuj Mittal &lt;<a href=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</=
a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libpthread-stubs =3D &quot;Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kana=
vin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libptytty =3D &quot;Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_41=
.0.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a> b/meta/rec=
ipes-gnome/epiphany/<a href=3D"http://epiphany_41.0.bb" rel=3D"noreferrer" =
target=3D"_blank">epiphany_41.0.bb</a><br>
&gt; index 8f3bd87340..a64cdefd86 100644<br>
&gt; --- a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_41.0.bb" =
rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a><br>
&gt; +++ b/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_41.0.bb" =
rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a><br>
&gt; @@ -15,7 +15,6 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libarchive \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdazzle \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libhandy \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libportal \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0-native \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; @@ -37,6 +36,7 @@ PACKAGECONFIG ??=3D &quot;${PACKAGECONFIG_SOUP}&quot=
;<br>
&gt;=C2=A0 PACKAGECONFIG[developer-mode] =3D &quot;-Ddeveloper_mode=3Dtrue,=
-Ddeveloper_mode=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[soup2] =3D &quot;-Dsoup2=3Denabled,-Dsoup2=3Ddisab=
led,libsoup-2.4,,,soup3&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[soup3] =3D &quot;,,libsoup,,,soup2&quot;<br>
&gt; +PACKAGECONFIG[libportal] =3D &quot;-Dlibportal=3Denabled,-Dlibportal=
=3Ddisabled,libportal&quot;<br>
&gt;<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot;${datadir}/dbus-1 ${datadir}/gnome-shell/=
search-providers ${datadir}/metainfo&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;iso-codes adwaita-icon-theme gsettings-=
desktop-schemas&quot;<br>
&gt; diff --git a/meta/recipes-gnome/libportal/<a href=3D"http://libportal_=
0.5.bb" rel=3D"noreferrer" target=3D"_blank">libportal_0.5.bb</a> b/meta/re=
cipes-gnome/libportal/<a href=3D"http://libportal_0.5.bb" rel=3D"noreferrer=
" target=3D"_blank">libportal_0.5.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 67f63fea68..0000000000<br>
&gt; --- a/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">libportal_0.5.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,17 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;libportal provides GIO-style async APIs for most Fl=
atpak portals.&quot;<br>
&gt; -DESCRIPTION =3D &quot;It provides simple asynchronous wrappers for mo=
st Flatpak portals \<br>
&gt; -with a familiar GObject API along side the D-Bus API&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/flatpak/libportal" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/flatpak/libportal</a=
>&quot;<br>
&gt; -BUGTRACKER =3D &quot;<a href=3D"https://github.com/flatpak/libportal/=
issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/flatpak/lib=
portal/issues</a>&quot;<br>
&gt; -LICENSE =3D &quot;LGPLv3&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3000208d539ec061b899b=
ce1d9ce9404&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/flatpak/$%7BBPN%=
7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blan=
k">github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;=
<br>
&gt; -SRCREV =3D &quot;467a397fd7996557f837cdc26ac07c01c62810e5&quot;<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -<br>
&gt; -inherit meson gtk-doc gobject-introspection<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;glib-2.0 glib-2.0-native gtk+3&quot;<br>
&gt; -<br>
&gt; -EXTRA_OEMESON =3D &quot;-Dbackends=3Dgtk3 -Dvapi=3Dfalse&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#160313): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/160313" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/160313</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88311445=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88311445/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000edec7005d53eca69--

