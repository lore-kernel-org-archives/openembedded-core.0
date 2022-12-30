Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC09C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 10:41:02 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.15891.1672396859697578237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 02:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUzbsxsq;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f34so31186930lfv.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2B5oCCe5EJF6B70K+mV7H0fdVoqIYF5ApnOzhb4gZA=;
        b=DUzbsxsq0WhVVMQWQDqx8z0fOhp4KVwMjtzRnIx+rzlDWLN6qGaneGX2TnBeOKyWlR
         AVUuWqoxNVOhoWrDi/B223wFSXRwbRBpdvajk4FaPBeCIA7em9I1Q21u/tb4Y1XKgg3K
         xQrORQFfvhWWvq4C2WeT8cMaKcFYpLRXNOvntKEeiKFWOYZ7+2Kcupx7UcijDwfpc+OR
         A1V1DO6bolIAKA79R+60KJuUU8BdhjjhKLL8MgmQkdC0eH4dgEMcp9hjbHlLch+X+3Cp
         9/fZk/P6qIrvHDJ08IOa8vsyrXg0/gVqYvNi11Jf7P9kUOB5s9Dc0Zi/scpCp2k5i5Dj
         mowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2B5oCCe5EJF6B70K+mV7H0fdVoqIYF5ApnOzhb4gZA=;
        b=mxdjdRJGJyFnqOW5J9sfhRTE+vheOs9NEPAaL3kFUifz5wDGqRNlWGOGc/rqyKjyDD
         sFQ63c7GLaDrpPlfMqfsnig+rU6g3sjcDNwVjv6S4NUNUEi3R233UweExH5FjuXmcbhO
         u3F9ZdqlHpLAjYI2SqyHcEjYbY0Ht9Ass9bhHBbebxf72NhdR8QgDYCyebhkzC1J2I3X
         stRQX5X1r99yIoDq5DT6c606+9JIDp6waMwLjPxroWOYGy2IV+uOU5qJ3dHZzclMsT+9
         WUhG7Yw7kDcfVuiGOaSMO8fvvnKWcyc0Z9gxN471uDpItAT+dRVEcFJJxcW9FNsDNgq3
         iWuw==
X-Gm-Message-State: AFqh2kq5n+nPIZLoW1Thhbf2r4ttfbYjIiQitQP7cTYZRUGs50OXFCkB
	tZTLpIpoTLeWtyALUCd6QTZmGrsF0sgNkYfuw8o=
X-Google-Smtp-Source: AMrXdXsGYUYa7+7/COcyXxQXeNgRw5kN0OY9EW6iqhO/ABn/Tk8mdeOPNRrfbQBSP5ZmiULX+LAHe+tyKJqfCjAkLLw=
X-Received: by 2002:a05:6512:1107:b0:4cb:2508:f535 with SMTP id
 l7-20020a056512110700b004cb2508f535mr171506lfg.131.1672396857512; Fri, 30 Dec
 2022 02:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20221229160110.255775-1-alex@linutronix.de> <20221229160110.255775-8-alex@linutronix.de>
 <0DVNNR.Q4CA1GXU22T31@t-online.de>
In-Reply-To: <0DVNNR.Q4CA1GXU22T31@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Dec 2022 11:40:46 +0100
Message-ID: <CANNYZj_DhGX74NeXHEX3mrCSSO8=BSd0Dtx=YnifKOryB9NFtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/10] epiphany: update 42.4 -> 43.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175138

That will be adjusted as well, thanks.

Alex

On Thu, 29 Dec 2022 at 17:34, Markus Volk <f_l_k@t-online.de> wrote:
>
> By adding gtk-icon-cache to the inherit line gtk+3-native could be remove=
d from DEPENDS.
>
> Am Do, 29. Dez 2022 um 17:01:08 +0100 schrieb Alexander Kanavin <alex.kan=
avin@gmail.com>:
>
> soup 2.x support has been removed upstream. libportal is no longer option=
al. epiphany now also needs some native executables from gtk and desktop-fi=
le-utils. Signed-off-by: Alexander Kanavin <alex@linutronix.de> --- .../epi=
phany/{epiphany_42.4.bb =3D> epiphany_43.0.bb} | 12 +++++------- 1 file cha=
nged, 5 insertions(+), 7 deletions(-) rename meta/recipes-gnome/epiphany/{e=
piphany_42.4.bb =3D> epiphany_43.0.bb} (78%) diff --git a/meta/recipes-gnom=
e/epiphany/epiphany_42.4.bb b/meta/recipes-gnome/epiphany/epiphany_43.0.bb =
similarity index 78% rename from meta/recipes-gnome/epiphany/epiphany_42.4.=
bb rename to meta/recipes-gnome/epiphany/epiphany_43.0.bb index 0cbe1c9c58.=
.071be328f3 100644 --- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb +++ b=
/meta/recipes-gnome/epiphany/epiphany_43.0.bb @@ -15,8 +15,12 @@ DEPENDS =
=3D " \ libarchive \ libdazzle \ libhandy \ + libportal \ + libsoup \ glib-=
2.0-native \ coreutils-native \ + gtk+3-native \ + desktop-file-utils-nativ=
e \ " GNOMEBASEBUILDCLASS =3D "meson" @@ -28,16 +32,10 @@ SRC_URI =3D "${GN=
OME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN file://mi=
grator.patch \ file://distributor.patch \ " -SRC_URI[archive.sha256sum] =3D=
 "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860" - -PACK=
AGECONFIG_SOUP ?=3D "soup3" -PACKAGECONFIG ??=3D "${PACKAGECONFIG_SOUP}" +S=
RC_URI[archive.sha256sum] =3D "b66d499f9ee72696d83cf844125377181a954554a4bb=
3785b73293380ac0c227" # Developer mode enables debugging PACKAGECONFIG[deve=
loper-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_mode=3Dfalse" -PACKAGE=
CONFIG[soup2] =3D "-Dsoup2=3Denabled,-Dsoup2=3Ddisabled,libsoup-2.4,,,soup3=
" -PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2" -PACKAGECONFIG[libportal] =
=3D "-Dlibportal=3Denabled,-Dlibportal=3Ddisabled,libportal" FILES:${PN} +=
=3D "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/m=
etainfo" RDEPENDS:${PN} =3D "iso-codes adwaita-icon-theme gsettings-desktop=
-schemas"
> --
> 2.30.2
>
>
>

