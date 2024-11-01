Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAC3E6F084
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 19:22:24 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.2589.1730488937339110932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 12:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+4EYYaz;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f72c913aso3863169e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 12:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730488935; x=1731093735; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ46h3xjvvQ4RuovhdzguzCZbcJ4QWr/9a2PCS1OlR8=;
        b=Z+4EYYazuvtLgUUTveoxmyi/vrP0oYzxi0dStYXAWep9gBCS9HI0DzGJiobfDUOA+a
         m4shA4haYLJ67vT5xsmBqxNbTwIV8/+ddFpOjqgGb6DwzxRSy5T7mz4z4G3myronCMqs
         p2jvI2fU2VdrEVtOLZK3pxP33W5SXhtnQl46+zOoO4fQXkPVeOgfTY/gmV0jFmj3YXp2
         8EJ5KLUZjwb7kM4HozpkLWQ7vT9UmMftbzDl8H/2DwHaaIpCbCerTUZvd5XVgSWpzUO3
         Y35+KE365CDNN4RciJTwRXmYsaogw3xwy8kppE8GnBcoh4+T3Uzxi9uCnJsBKL/py0Z3
         ixBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730488935; x=1731093735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZ46h3xjvvQ4RuovhdzguzCZbcJ4QWr/9a2PCS1OlR8=;
        b=myc3dyDRbOxFJ4PeFSqQOJCtbvWc8jPdqcpfanR0ILeZtdsXgzTB3EF7GTD1snKW1K
         W/nzpifmL2kARYlJSi7hvuORh1aHvERdgMdq/QIa0AdWe6ZKSFChV9OcMJU9ejVLIR4D
         ca5mDNmQ6F+o1dtZk70r+UczuNrUtpmCjrtT+aHLODxgmKfKHtAR39ExpplW998JgTph
         kcEvE0fY56iCSM1FKlXXe4FGagtrbl8HCgLdcA7vWIZuSX6HnCqRXAMLUdwIf4FLh95v
         RofWMdog8EdghlUW4xI3MxL8XiQWRZRUBPxLqtPSPbbD/u38fuPKx/+nzOo+NTbhTWTx
         tXcg==
X-Gm-Message-State: AOJu0YyAhKahA9oMljqL+LVNn9gRMOj+rga84puHqesZIQKuDS4AGGly
	V2r671DYenR/JjrD0TNtwXU3WFNMGyKhlcOMhuT8H9MVUg8Uz+v3LL9HDg7OsPKnCdf5UyXzlNP
	CvVebN1phbl/5H/LWlvDqfU+bKiA=
X-Google-Smtp-Source: AGHT+IEFRk85agLwWlHK0ZP91CXmV5yys3XJ9jpdgPSIPLwUuTP/e3Wqo/N1zhl2tRwoElkqf70hOyyV8Un+cyw5PtE=
X-Received: by 2002:a2e:751:0:b0:2fb:5504:7966 with SMTP id
 38308e7fff4ca-2fcbe09a653mr96850231fa.30.1730488935024; Fri, 01 Nov 2024
 12:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241101184156.2368109-1-hiagofranco@gmail.com>
In-Reply-To: <20241101184156.2368109-1-hiagofranco@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 20:22:03 +0100
Message-ID: <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] drm-info: add recipe
To: hiagofranco@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000004290780625dedafc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 19:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206629

--0000000000004290780625dedafc
Content-Type: text/plain; charset="UTF-8"

Should this go to meta-oe rather? Why core?

Alex

On Fri 1. Nov 2024 at 19.42, Hiago De Franco via lists.openembedded.org
<hiagofranco=gmail.com@lists.openembedded.org> wrote:

> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This recipe provides information about DRM devices, useful for debugging
> and checking information about DRM.
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  meta/conf/distro/include/maintainers.inc    |  1 +
>  meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 7aafa7a2d146..2c2779f8cf83 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi
> Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-drm-info = "Hiago De Franco <
> hiago.franco@toradex.com>"
>  RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> new file mode 100644
> index 000000000000..9f1cbb47fbfd
> --- /dev/null
> +++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Small utility to dump info about DRM devices"
> +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
> +
> +SRC_URI = "git://
> gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
> +SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> +
> +DEPENDS = "json-c libdrm"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206628):
> https://lists.openembedded.org/g/openembedded-core/message/206628
> Mute This Topic: https://lists.openembedded.org/mt/109340073/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004290780625dedafc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should this go to meta-oe rather? Why core?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 1. Nov 2024 at 19.42,=
 Hiago De Franco via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;hiagofranco=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">From: Hiago De Franco &lt;<a href=3D"mailto:hiago.franco@toradex.c=
om" target=3D"_blank">hiago.franco@toradex.com</a>&gt;<br>
<br>
This recipe provides information about DRM devices, useful for debugging<br=
>
and checking information about DRM.<br>
<br>
Signed-off-by: Hiago De Franco &lt;<a href=3D"mailto:hiago.franco@toradex.c=
om" target=3D"_blank">hiago.franco@toradex.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0meta/recipes-graphics/drm/<a href=3D"http://drm-info_2.7.0.bb" rel=3D=
"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a> | 13 +++++++++++++<br>
=C2=A02 files changed, 14 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/drm/<a href=3D"http://drm-in=
fo_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 7aafa7a2d146..2c2779f8cf83 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets =3D &quot;=
Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.z=
hao@windriver.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-dos2unix =3D &quot;Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br=
>
=C2=A0RECIPE_MAINTAINER:pn-dosfstools =3D &quot;Yi Zhao &lt;<a href=3D"mail=
to:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&q=
uot;<br>
=C2=A0RECIPE_MAINTAINER:pn-dpkg =3D &quot;Unassigned &lt;<a href=3D"mailto:=
unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.org<=
/a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-drm-info =3D &quot;Hiago De Franco &lt;<a href=3D"mai=
lto:hiago.franco@toradex.com" target=3D"_blank">hiago.franco@toradex.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-dropbear =3D &quot;Yi Zhao &lt;<a href=3D"mailto=
:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&quo=
t;<br>
=C2=A0RECIPE_MAINTAINER:pn-dtc =3D &quot;Wang Mingyu &lt;<a href=3D"mailto:=
wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-dwarfsrcfiles =3D &quot;Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmai=
l.com</a>&gt;&quot;<br>
diff --git a/meta/recipes-graphics/drm/<a href=3D"http://drm-info_2.7.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a> b/meta/recipes-=
graphics/drm/<a href=3D"http://drm-info_2.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">drm-info_2.7.0.bb</a><br>
new file mode 100644<br>
index 000000000000..9f1cbb47fbfd<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/drm/<a href=3D"http://drm-info_2.7.0.bb" rel=3D=
"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;Small utility to dump info about DRM devices&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/emersion/drm_=
info" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/e=
mersion/drm_info</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D32fd56d355bd6a61017655d8da=
26b67c&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/emersion/=
drm_info.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">gitlab.freedesktop.org/emersion/drm_info.git;branch=3Dmaster;proto=
col=3Dhttps</a>&quot;<br>
+SRCREV =3D &quot;c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit meson pkgconfig<br>
+<br>
+DEPENDS =3D &quot;json-c libdrm&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206628): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206628" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206628</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109340073/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109340073/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004290780625dedafc--

