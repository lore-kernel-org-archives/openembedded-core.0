Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6336BC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 15:57:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.23886.1657727863772252126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YGtZdaGA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id r10so9968434wrv.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GmwfV+MiRodyNp4RBOac31lHqap1bk8TkbwdCEBw8Ek=;
        b=YGtZdaGAv0wfKQ4g6TFxfCMuOWAz7j7VylyTiP1O9sHRwBNDwRgP34mPm3ANm0syEP
         n6eiDa99Z4sC/3aQjWeo1AJ4rJECNKUZJt8J9osSoqhX5+2IWwFzpUTEcAad3HNR/Kf4
         AgK11axGXvJEdWjhpH1+Qwifzdo1BeVTPIvEHufitx5ZwQXmFLHANTmp1fgEDvbl8eNi
         gyYZv3EqEdrQ/Be4hwzdRhZ5vdUBu3p6oXzlkEm4n8lT/pvDTwHDeZJ0/nAmDnKHI1NC
         hDmjCc4e99YAABv3lA6KyXy0CMaCyGMz5iZ8/6G7xKY7PD2xIEeuqxip2nuzj8A6wRjo
         2buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GmwfV+MiRodyNp4RBOac31lHqap1bk8TkbwdCEBw8Ek=;
        b=M5x5O6pMXr1G+NlHnl3GpjG0aUGVb1gdnTBuTR9SJxV8fyAb1LvxhdHwTbQ5loKmMx
         UtHuhYB96uayQkhwoh0ip+B4SlyphfOCSCNtU+PgjJiUeI1caZkp9o+yghMB55FfLMqc
         kuVQd3wAT3zYFitJ/KHyUAptUH7cDffkzEZxmmW0mFUy+2gWfj7H2FQb/sXxSNFpxxQT
         mk3lEAnn6EKXeWia35z/kGoTUIOIhxsQ6tFRiq0IO5UUhHZUPYr5Mc7e/IigTWTtDlJa
         2dKdTyUn4NT3RbEx3GD+6nvMz81qaJAh6x21zES02W61rIrtriRjao1//V4drjp7D6jv
         lsgg==
X-Gm-Message-State: AJIora+9GWWPupobrOhszuRFqikOJvWYIxkTpef+qCIqe/8Jp6yBsnkg
	LnrZf12DcIsfVrayA0mxDmWfU/S7YaAHcYhVpmM=
X-Google-Smtp-Source: 
 AGRyM1vlyFCJrIGZ3fJwHHamiQtEi8fg5Jn4yUBcWM9X6pCFW/y6Mdezgfek+ykqFgKoHNML6iOUr+9EniJpqtZz7EE=
X-Received: by 2002:a05:6000:128d:b0:21d:6d4d:b2ba with SMTP id
 f13-20020a056000128d00b0021d6d4db2bamr3627770wrx.507.1657727862073; Wed, 13
 Jul 2022 08:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713154139.101744-1-luca.boccassi@gmail.com>
 <20220713154139.101744-2-luca.boccassi@gmail.com>
In-Reply-To: <20220713154139.101744-2-luca.boccassi@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Jul 2022 17:57:24 +0200
Message-ID: 
 <CA+chaQdbnw84B4eu07Yo6QYAs96wnSb8CaWoEo39Z7YWzfP-SA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a6e5105e3b1d8e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 15:57:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167962

--0000000000005a6e5105e3b1d8e4
Content-Type: text/plain; charset="UTF-8"

Don't use :append together with +=, just add the leading space in the value.

Wasn't there a warning when these 2 are used together?

On Wed, Jul 13, 2022 at 5:41 PM Luca Bocassi <luca.boccassi@gmail.com>
wrote:

> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Support for unmerged-usr is deprecated upstream, taints the system and
> will be
> removed in the near future.
> Enforce building merged-usr images when using systemd.
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: use :append in each recipe
>
>  meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
>  meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
>  meta/recipes-core/systemd/systemd.inc             | 5 +++++
>  meta/recipes-core/systemd/systemd_251.2.bb        | 2 +-
>  4 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb
> b/meta/recipes-core/systemd/systemd-compat-units.bb
> index 55ebf99117..9085075a78 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -14,7 +14,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>
>  ALLOW_EMPTY:${PN} = "1"
>
> -REQUIRED_DISTRO_FEATURES = "systemd"
> +REQUIRED_DISTRO_FEATURES:append += "systemd"
>
>  SYSTEMD_DISABLED_SYSV_SERVICES = " \
>    busybox-udhcpc \
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
> b/meta/recipes-core/systemd/systemd-serialgetty.bb
> index fd888bb834..60e18c4298 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -14,7 +14,7 @@ S = "${WORKDIR}"
>
>  # As this package is tied to systemd, only build it when we're also
> building systemd.
>  inherit features_check
> -REQUIRED_DISTRO_FEATURES = "systemd"
> +REQUIRED_DISTRO_FEATURES:append += "systemd"
>
>  do_install() {
>         if [ ! -z "${SERIAL_CONSOLES}" ] ; then
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index b8dbe2263a..f9e109bba4 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -21,3 +21,8 @@ SRC_URI = "git://
> github.com/systemd/systemd-stable.git;protocol=https;branch=${S
> <http://github.com/systemd/systemd-stable.git;protocol=https;branch=$%7BS>
>  "
>
>  S = "${WORKDIR}/git"
> +
> +# unmerged-usr support is deprecated upstream, taints the system and will
> be
> +# removed in the near future. Fail the build if it is not enabled.
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES = "usrmerge"
> diff --git a/meta/recipes-core/systemd/systemd_251.2.bb
> b/meta/recipes-core/systemd/systemd_251.2.bb
> index bb3c59f418..b1358420eb 100644
> --- a/meta/recipes-core/systemd/systemd_251.2.bb
> +++ b/meta/recipes-core/systemd/systemd_251.2.bb
> @@ -12,7 +12,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d
> update-alternatives qemu
>
>  # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
>  # that we don't build both udev and systemd in world builds.
> -REQUIRED_DISTRO_FEATURES = "systemd"
> +REQUIRED_DISTRO_FEATURES:append += "systemd"
>
>  SRC_URI += "file://touchscreen.rules \
>             file://00-create-volatile.conf \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167960):
> https://lists.openembedded.org/g/openembedded-core/message/167960
> Mute This Topic: https://lists.openembedded.org/mt/92360228/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005a6e5105e3b1d8e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Don&#39;t use :append together with=C2=A0+=3D, just add th=
e leading space in the value.<div><br></div><div>Wasn&#39;t there a warning=
 when these 2 are used together?</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, 2022 at 5:41 PM Luca =
Bocassi &lt;<a href=3D"mailto:luca.boccassi@gmail.com">luca.boccassi@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft.com" t=
arget=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
<br>
Support for unmerged-usr is deprecated upstream, taints the system and will=
 be<br>
removed in the near future.<br>
Enforce building merged-usr images when using systemd.<br>
<br>
Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft.=
com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
---<br>
v2: use :append in each recipe<br>
<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-compat-units.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd-compat-units.bb</a> | 2 +-<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a>=C2=A0 | 2 +-=
<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_251.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A04 files changed, 8 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-compat-uni=
ts.bb" rel=3D"noreferrer" target=3D"_blank">systemd-compat-units.bb</a> b/m=
eta/recipes-core/systemd/<a href=3D"http://systemd-compat-units.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd-compat-units.bb</a><br>
index 55ebf99117..9085075a78 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-compat-units.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd-compat-units.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-compat-units.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd-compat-units.bb</a><br>
@@ -14,7 +14,7 @@ INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
<br>
=C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
+REQUIRED_DISTRO_FEATURES:append +=3D &quot;systemd&quot;<br>
<br>
=C2=A0SYSTEMD_DISABLED_SYSV_SERVICES =3D &quot; \<br>
=C2=A0 =C2=A0busybox-udhcpc \<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgett=
y.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a> b/met=
a/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" rel=3D"nor=
eferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
index fd888bb834..60e18c4298 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
@@ -14,7 +14,7 @@ S =3D &quot;${WORKDIR}&quot;<br>
<br>
=C2=A0# As this package is tied to systemd, only build it when we&#39;re al=
so building systemd.<br>
=C2=A0inherit features_check<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
+REQUIRED_DISTRO_FEATURES:append +=3D &quot;systemd&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -z &quot;${SERIAL_CONSOLES}&quot; ] ; th=
en<br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc<br>
index b8dbe2263a..f9e109bba4 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -21,3 +21,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/syst=
emd/systemd-stable.git;protocol=3Dhttps;branch=3D$%7BS" rel=3D"noreferrer" =
target=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3Dhttps;br=
anch=3D${S</a><br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+# unmerged-usr support is deprecated upstream, taints the system and will =
be<br>
+# removed in the near future. Fail the build if it is not enabled.<br>
+inherit features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;usrmerge&quot;<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_251.2.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_251.2.bb</a><br>
index bb3c59f418..b1358420eb 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_251.2.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_251.2.bb</a><br>
@@ -12,7 +12,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d up=
date-alternatives qemu<br>
<br>
=C2=A0# As this recipe builds udev, respect systemd being in DISTRO_FEATURE=
S so<br>
=C2=A0# that we don&#39;t build both udev and systemd in world builds.<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
+REQUIRED_DISTRO_FEATURES:append +=3D &quot;systemd&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://touchscreen.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00-create-volatile.conf \<=
br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167960): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167960" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167960</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92360228/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92360228/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005a6e5105e3b1d8e4--

