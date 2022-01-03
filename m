Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E24C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 15:32:46 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.29040.1641223965624490382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 07:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HKySqN2s;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id h2so65135883lfv.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 07:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p1L8He6WixYeWVj8hQSi4Eo/yNlArNoqzhOj1NWNs6w=;
        b=HKySqN2sSIRfpuFina8HmN3A4peFEGEk0kCq5JFAsDnsnJ9qp0iYDJZUNzesGE71a/
         x2dnCINtLNdsNW+gE0qt5KxerjWPO5oB9NDc4aJE7FS73cA5mGk2AbgFOf5swHXxRjJJ
         g7FbEuizv9Nbl/xfIaNLHSCidUZF8MNkZDyHcKXhAEvTd+pQXtAhx+M9+DhEHRdjpX6M
         rTUIOsZxNeSd7AXy/OMx6PMr0oVVWVeiF9wpbFzIzoSn2pjc2GBKygbTSVpUFq+Gc9cV
         qcx+3zc9FRm144MjqigdGm4o9h3h7mno4dTBY/78ICDmuY+WJIOh8lQw0AfHBWIfWdja
         ARGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p1L8He6WixYeWVj8hQSi4Eo/yNlArNoqzhOj1NWNs6w=;
        b=6ln1jgy5RT5V6KVB+H5eL5jh5AyBk4egqsnk0J+R/0yHuZAIxIpCBA+lNH4IC3GxXw
         PkI+UvHUp03xQ7uiz89AVvBWmu779WwfZ3bZzfrsTEnqGW6MeEAgcj7IWhDyROREUlX0
         ggLUdFr1V15f9Dh+5+nOC3ROroIFZnXPbfaB2RsnQ29QeO4IfzP55XeEiVXGobEfC0Y/
         VVDP+X96CzBbFji23as8dphujZEFB2tL2Int/96mjTnxSiz3IS4kSYkhBwuFgL09uoNh
         ILtKXsWhgVoylNKuAg0cFo0MtVpGwqrz22rve6UJQUVZE5ctkTvvwI97OV0E2S/UR+zQ
         ywEg==
X-Gm-Message-State: AOAM532m/4gDZs1pFaYwobKsiV18J5+yazJCLm1CbS39ISHDzu2vT4Lw
	ZGkWMjw7rygfp961Zlfsnc3hFihvgCkQoFtC+cw=
X-Google-Smtp-Source: 
 ABdhPJwMTqELIIekTyYAe1iI4qn3hKZvvFMUo8CuyDzKuW3DH96yUauflgjGc0L5SbV4iNPex7wAOUncgxPQY1NH4jA=
X-Received: by 2002:a19:d612:: with SMTP id n18mr2362563lfg.555.1641223963509;
 Mon, 03 Jan 2022 07:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20220103083850.385326-1-joakim.roubert@axis.com>
In-Reply-To: <20220103083850.385326-1-joakim.roubert@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 3 Jan 2022 15:32:32 +0000
Message-ID: 
 <CANPvuRmoXvv4yYDqfeDyXYxbYSDrGxF-FRyX2UibBTtP-XMYwQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] gstreamer1.0-plugins-bad: Add support for
 mpegtsmux
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joakim Roubert <joakimr@axis.com>
Content-Type: multipart/alternative; boundary="000000000000578aed05d4af3b71"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 15:32:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160117

--000000000000578aed05d4af3b71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joakim Roubert <joakim.roubert@axis.com> escreveu no dia segunda, 3/01/2022
=C3=A0(s) 08:39:

> From: Joakim Roubert <joakimr@axis.com>
>
> When enabling srt one most likely also wants to use mpegtsmux.
>
> Signed-off-by: Joakim Roubert <joakim.roubert@axis.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb                 | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.18.5.bb
> index f90dff693d..9233c3bec1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.b=
b
> @@ -65,6 +65,7 @@ PACKAGECONFIG[libmms]          =3D
> "-Dlibmms=3Denabled,-Dlibmms=3Ddisabled,libmms"
>  PACKAGECONFIG[libssh2]         =3D
> "-Dcurl-ssh2=3Denabled,-Dcurl-ssh2=3Ddisabled,libssh2"
>  PACKAGECONFIG[lcms2]           =3D
> "-Dcolormanagement=3Denabled,-Dcolormanagement=3Ddisabled,lcms"
>  PACKAGECONFIG[modplug]         =3D
> "-Dmodplug=3Denabled,-Dmodplug=3Ddisabled,libmodplug"
> +PACKAGECONFIG[mpegtsmux]       =3D
> "-Dmpegtsmux=3Denabled,-Dmpegtsmux=3Ddisabled""
>

this patch is not backward compatible as it will disable the mpegtsmux
plugin because PACKAGECONFIG don't have mpegtsmux

mpegtsmux doesn't have any external dependencies and is not present
in EXTRA_OEMESON so it is always enabled.
with this patch the default config will build it with -Dmpegtsmux=3Ddisable=
d

Jose


>  PACKAGECONFIG[msdk]            =3D
> "-Dmsdk=3Denabled,-Dmsdk=3Ddisabled,intel-mediasdk"
>  PACKAGECONFIG[neon]            =3D "-Dneon=3Denabled,-Dneon=3Ddisabled,n=
eon"
>  PACKAGECONFIG[openal]          =3D
> "-Dopenal=3Denabled,-Dopenal=3Ddisabled,openal-soft"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160115):
> https://lists.openembedded.org/g/openembedded-core/message/160115
> Mute This Topic: https://lists.openembedded.org/mt/88108871/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000578aed05d4af3b71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Joakim Roubert &lt;<a href=3D"mailto:=
joakim.roubert@axis.com">joakim.roubert@axis.com</a>&gt; escreveu no dia se=
gunda, 3/01/2022 =C3=A0(s) 08:39:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.c=
om" target=3D"_blank">joakimr@axis.com</a>&gt;<br>
<br>
When enabling srt one most likely also wants to use mpegtsmux.<br>
<br>
Signed-off-by: Joakim Roubert &lt;<a href=3D"mailto:joakim.roubert@axis.com=
" target=3D"_blank">joakim.roubert@axis.com</a>&gt;<br>
---<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.18.5.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.18.5.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-bad_1.18.5.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttp://gstreamer1.0-plugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gstreamer1.0-plugins-bad_1.18.5.bb</a><br>
index f90dff693d..9233c3bec1 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.18.5.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.18.5.bb</a><br>
@@ -65,6 +65,7 @@ PACKAGECONFIG[libmms]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;-Dlibmms=3Denabled,-Dlibmms=3Ddisabled,libmms&quot;<br>
=C2=A0PACKAGECONFIG[libssh2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Dc=
url-ssh2=3Denabled,-Dcurl-ssh2=3Ddisabled,libssh2&quot;<br>
=C2=A0PACKAGECONFIG[lcms2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;-Dcolormanagement=3Denabled,-Dcolormanagement=3Ddisabled,lcms&quot;<br>
=C2=A0PACKAGECONFIG[modplug]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Dm=
odplug=3Denabled,-Dmodplug=3Ddisabled,libmodplug&quot;<br>
+PACKAGECONFIG[mpegtsmux]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Dmpegtsmux=
=3Denabled,-Dmpegtsmux=3Ddisabled&quot;&quot;<br></blockquote><div><br></di=
v><div>this patch is not backward compatible as it will disable the mpegtsm=
ux plugin because PACKAGECONFIG don&#39;t have mpegtsmux<br></div><div><br>=
</div><div>mpegtsmux doesn&#39;t have any external dependencies and is not =
present in=C2=A0EXTRA_OEMESON so it is always enabled.<br></div><div>with t=
his patch the default config will build it with -Dmpegtsmux=3Ddisabled</div=
><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0PACKAGECONFIG[msdk]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;-Dmsdk=3Denabled,-Dmsdk=3Ddisabled,intel-mediasdk&quot;<br>
=C2=A0PACKAGECONFIG[neon]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;-Dneon=3Denabled,-Dneon=3Ddisabled,neon&quot;<br>
=C2=A0PACKAGECONFIG[openal]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-Do=
penal=3Denabled,-Dopenal=3Ddisabled,openal-soft&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160115): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160115" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160115</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88108871/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88108871/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000578aed05d4af3b71--

