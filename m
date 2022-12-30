Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B226C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 13:38:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.18139.1672407488842477195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 05:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WKMVxrqD;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso15239046wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 05:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z/x1buqbE8IVedS+MH7X58I0lAzoOdvcOhka7QcAxw0=;
        b=WKMVxrqDO/fsHxq1dIuSkxbhNHYOupn0vRBRYACl52tNlZP4hdwKjASlbgesYdDp8+
         cID0SgKNsbTU5FMuZmGnPfeWn5ZcPza7+ROQdnlcyAomdUJP5aTVDZcHrzzQsQfbL76v
         1Lv14cxHwerm6Vvon5NTa6sXxSHgSs4xQrVvllIrvPIbNkLXqfmNhLCjLoNbGAw7tDg1
         qUwpcj47l3o44EQ5q5F8GLzZMSiPbaLtZ/WJxmTYvVdCxP1wrTxy+Dd9jrOM+aMILM0/
         M/wwkBP2rBv6yU/+jgq/LD0mmUMI6+nVJhzXAUISD5HNHcwk4+Y/uZtMAifypLeGOsYF
         RhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/x1buqbE8IVedS+MH7X58I0lAzoOdvcOhka7QcAxw0=;
        b=nQCkebU+3fe9T6qu7LUe1g7mOYh9NyWx4qVYROGIhKnHGY26yaPD0EmO6NQVgLvRVd
         qtpSMvzhJkpFjOAqbXIGfGB37FxElpb/D4Ri2m63qjVdP3Nhfr3gclL99nEDrRPcopiO
         RjQirr6ebfKp7EFSX3J5Oi23oAB/Jh/L0KMbWkiRhftLY0QFuxX6t8EIq5vTYrpbOQfD
         Cw/gHhJymf76giZAXRNt976LMNS2TYOqQU3twJB18B70gj+r5hJZfU419GD7K/XF1Y3u
         oQkbCQraCUKSQvsAb4R0WuBYwr+wFHaKqedZvtlt9WRYLt3czhS0A/quNWC1cXmFUUQ8
         po9A==
X-Gm-Message-State: AFqh2koDJgv5+Ho2i+yGmVlZq1AURFMkJVvzzm/4zhaXdl6Zno7Kzm5j
	IVuGIrXdArtHPALotv2kX4RbY/D8dPsbsvm/yZ4=
X-Google-Smtp-Source: AMrXdXs3/qKsZUbZ9A+snKEmJ8dwn9cMXYqMW1yQigj7t2xkurG1stZ3K4v0BSeIcEJ++t5Igm9Y6DGn1LgoFnmZ/VE=
X-Received: by 2002:a05:600c:4e51:b0:3cf:6b10:ca8d with SMTP id
 e17-20020a05600c4e5100b003cf6b10ca8dmr2286442wmq.44.1672407487186; Fri, 30
 Dec 2022 05:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20221230132826.35918-1-eduardo.barbosa@toradex.com>
In-Reply-To: <20221230132826.35918-1-eduardo.barbosa@toradex.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Dec 2022 14:37:56 +0100
Message-ID: <CA+chaQeeDyWfDNiQhiynXf+=7uBtLYZk0jsx=HkdioFcW5zv5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: fix SOURCE_DATE_EPOCH conflict with meta-updater
To: eduardo.barbosa@toradex.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000318be305f10bb638"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 13:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175140

--000000000000318be305f10bb638
Content-Type: text/plain; charset="UTF-8"

FWIW: there is also SOURCE_DATE_EPOCH removal PR for meta-updater:
https://github.com/uptane/meta-updater/pull/35

as it was breaking more stuff than just systemd, but I no longer use
meta-updater.

On Fri, Dec 30, 2022 at 2:29 PM eduardo.barbosa via lists.openembedded.org
<eduardo.barbosa=toradex.com@lists.openembedded.org> wrote:

> From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
>
> When we use the 'meta-updater' layer, we get a conflit on
> SOURCE_DATE_EPOCH variable. where sota.conf.inc exports,
> globally, SOURCE_DATE_EPOCH=0.
>
> This ends up in systemd's TIME_EPOCH constant, that is used
> clock_apply_epoch function to determine the difference to the system's
> clock. And since there's a big jump we get the following error message
> while booting up:
>   systemd[1]: Current system time is further ahead 15y after build time,
> but cannot correct: Invalid argument
>
> So, instead of creating a function to read the environment variable, we
> can call get_source_date_epoch_value directly, since this is the way the
> variable SOURCE_DATE_EPOCH is populated inside the recipe.
>
> And, this way, SOURCE_DATE_EPOCH can still be used. If the packageconfig
> is not used, '-Dtime-epoch=0' will be passed and when time-epoch <= 0,
> meson build script will read the value of SOURCE_DATE_EPOCH before
> trying to calculate the timestamp via git or by stating the NEWS file.
>
> Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> ---
>  meta/recipes-core/systemd/systemd_252.4.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_252.4.bb
> b/meta/recipes-core/systemd/systemd_252.4.bb
> index eb6f5ecc17..e63b2bb681 100644
> --- a/meta/recipes-core/systemd/systemd_252.4.bb
> +++ b/meta/recipes-core/systemd/systemd_252.4.bb
> @@ -191,10 +191,7 @@ PACKAGECONFIG[sysusers] =
> "-Dsysusers=true,-Dsysusers=false"
>  PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d
> -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path=
> -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
>  # When enabled use reproducble build timestamp if set as time epoch,
>  # or build time if not. When disabled, time epoch is unset.
> -def build_epoch(d):
> -    epoch = d.getVar('SOURCE_DATE_EPOCH') or "-1"
> -    return '-Dtime-epoch=%d' % int(epoch)
> -PACKAGECONFIG[set-time-epoch] = "${@build_epoch(d)},-Dtime-epoch=0"
> +PACKAGECONFIG[set-time-epoch] =
> "${@get_source_date_epoch_value(d)},-Dtime-epoch=0"
>  PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
>  PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
>  PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
> --
> 2.34.1
>
>
> [Toradex Logo] <https://www.toradex.com/>       Embedded Computing
> Made Easy
> Choose Us<
> https://www.toradex.com/how-to-choose-system-computer-on-module-partner>
> | Products<https://www.toradex.com/products> | Developer Center<
> https://developer.toradex.com/> | Community<https://community.toradex.com/>
> | Careers<https://careers.toradex.com/>
> Join our webinar:<https://www.toradex.com/webinars>
> - Implementing Power-safe Atomic Over the Air Updates | January 20, 2023:
> Register<
> https://www.toradex.com/webinars/implementing-power-safe-atomic-over-the-air-updates
> >
>
> Meet our engineers at:<https://www.toradex.com/events>
> - Embedded World | Nuremberg, Germany | March 14-16, 2023
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175139):
> https://lists.openembedded.org/g/openembedded-core/message/175139
> Mute This Topic: https://lists.openembedded.org/mt/95953516/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000318be305f10bb638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: there is also=C2=A0SOURCE_DATE_EPOCH removal PR for =
meta-updater: <a href=3D"https://github.com/uptane/meta-updater/pull/35">ht=
tps://github.com/uptane/meta-updater/pull/35</a><div><br></div><div>as it w=
as breaking more stuff than just systemd, but I no longer use meta-updater.=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Dec 30, 2022 at 2:29 PM eduardo.barbosa via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;eduardo.barbosa=3D<=
a href=3D"mailto:toradex.com@lists.openembedded.org">toradex.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Eduardo Ferreira &lt;<a href=3D"mailto:eduardo.barbosa@to=
radex.com" target=3D"_blank">eduardo.barbosa@toradex.com</a>&gt;<br>
<br>
When we use the &#39;meta-updater&#39; layer, we get a conflit on<br>
SOURCE_DATE_EPOCH variable. where sota.conf.inc exports,<br>
globally, SOURCE_DATE_EPOCH=3D0.<br>
<br>
This ends up in systemd&#39;s TIME_EPOCH constant, that is used<br>
clock_apply_epoch function to determine the difference to the system&#39;s<=
br>
clock. And since there&#39;s a big jump we get the following error message<=
br>
while booting up:<br>
=C2=A0 systemd[1]: Current system time is further ahead 15y after build tim=
e, but cannot correct: Invalid argument<br>
<br>
So, instead of creating a function to read the environment variable, we<br>
can call get_source_date_epoch_value directly, since this is the way the<br=
>
variable SOURCE_DATE_EPOCH is populated inside the recipe.<br>
<br>
And, this way, SOURCE_DATE_EPOCH can still be used. If the packageconfig<br=
>
is not used, &#39;-Dtime-epoch=3D0&#39; will be passed and when time-epoch =
&lt;=3D 0,<br>
meson build script will read the value of SOURCE_DATE_EPOCH before<br>
trying to calculate the timestamp via git or by stating the NEWS file.<br>
<br>
Signed-off-by: Eduardo Ferreira &lt;<a href=3D"mailto:eduardo.barbosa@torad=
ex.com" target=3D"_blank">eduardo.barbosa@toradex.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_252.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_252.4.bb</a> | 5 +----<br>
=C2=A01 file changed, 1 insertion(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_252.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_252.4.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_252.4.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_252.4.bb</a><br>
index eb6f5ecc17..e63b2bb681 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_252.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_252.4.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_252.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_252.4.bb</a><br>
@@ -191,10 +191,7 @@ PACKAGECONFIG[sysusers] =3D &quot;-Dsysusers=3Dtrue,-D=
sysusers=3Dfalse&quot;<br>
=C2=A0PACKAGECONFIG[sysvinit] =3D &quot;-Dsysvinit-path=3D${sysconfdir}/ini=
t.d -Dsysvrcnd-path=3D${sysconfdir},-Dsysvinit-path=3D -Dsysvrcnd-path=3D,,=
systemd-compat-units update-rc.d&quot;<br>
=C2=A0# When enabled use reproducble build timestamp if set as time epoch,<=
br>
=C2=A0# or build time if not. When disabled, time epoch is unset.<br>
-def build_epoch(d):<br>
-=C2=A0 =C2=A0 epoch =3D d.getVar(&#39;SOURCE_DATE_EPOCH&#39;) or &quot;-1&=
quot;<br>
-=C2=A0 =C2=A0 return &#39;-Dtime-epoch=3D%d&#39; % int(epoch)<br>
-PACKAGECONFIG[set-time-epoch] =3D &quot;${@build_epoch(d)},-Dtime-epoch=3D=
0&quot;<br>
+PACKAGECONFIG[set-time-epoch] =3D &quot;${@get_source_date_epoch_value(d)}=
,-Dtime-epoch=3D0&quot;<br>
=C2=A0PACKAGECONFIG[timedated] =3D &quot;-Dtimedated=3Dtrue,-Dtimedated=3Df=
alse&quot;<br>
=C2=A0PACKAGECONFIG[timesyncd] =3D &quot;-Dtimesyncd=3Dtrue,-Dtimesyncd=3Df=
alse&quot;<br>
=C2=A0PACKAGECONFIG[usrmerge] =3D &quot;-Dsplit-usr=3Dfalse,-Dsplit-usr=3Dt=
rue&quot;<br>
--<br>
2.34.1<br>
<br>
<br>
[Toradex Logo] &lt;<a href=3D"https://www.toradex.com/" rel=3D"noreferrer" =
target=3D"_blank">https://www.toradex.com/</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0Embedded Computing<br>
Made Easy<br>
Choose Us&lt;<a href=3D"https://www.toradex.com/how-to-choose-system-comput=
er-on-module-partner" rel=3D"noreferrer" target=3D"_blank">https://www.tora=
dex.com/how-to-choose-system-computer-on-module-partner</a>&gt; | Products&=
lt;<a href=3D"https://www.toradex.com/products" rel=3D"noreferrer" target=
=3D"_blank">https://www.toradex.com/products</a>&gt; | Developer Center&lt;=
<a href=3D"https://developer.toradex.com/" rel=3D"noreferrer" target=3D"_bl=
ank">https://developer.toradex.com/</a>&gt; | Community&lt;<a href=3D"https=
://community.toradex.com/" rel=3D"noreferrer" target=3D"_blank">https://com=
munity.toradex.com/</a>&gt; | Careers&lt;<a href=3D"https://careers.toradex=
.com/" rel=3D"noreferrer" target=3D"_blank">https://careers.toradex.com/</a=
>&gt;<br>
Join our webinar:&lt;<a href=3D"https://www.toradex.com/webinars" rel=3D"no=
referrer" target=3D"_blank">https://www.toradex.com/webinars</a>&gt;<br>
- Implementing Power-safe Atomic Over the Air Updates | January 20, 2023: R=
egister&lt;<a href=3D"https://www.toradex.com/webinars/implementing-power-s=
afe-atomic-over-the-air-updates" rel=3D"noreferrer" target=3D"_blank">https=
://www.toradex.com/webinars/implementing-power-safe-atomic-over-the-air-upd=
ates</a>&gt;<br>
<br>
Meet our engineers at:&lt;<a href=3D"https://www.toradex.com/events" rel=3D=
"noreferrer" target=3D"_blank">https://www.toradex.com/events</a>&gt;<br>
- Embedded World | Nuremberg, Germany | March 14-16, 2023<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175139): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175139" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175139</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95953516/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95953516/3617156</a><br>
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

--000000000000318be305f10bb638--

