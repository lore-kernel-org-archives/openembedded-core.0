Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 56BAD61BEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:22:13 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id e20so751007vke.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rrSqnOlfKb299lKOo1gAGvTl88nQ/1g3igS6oiOmSIw=;
	b=j/KR8HHqf4UH5nrxYefLhQCqixOyfz2PezVFpaEhNA0u3o5mEiswz9bP2EMMQoiFZO
	3TZ3HYcPIEj8mGCoySzKptf0RSibdpMM51PUegseJ6S83qkMdPAnI15mj3UB97owl4TR
	TALnc7YKGvaIYGmLsKMn+TqnZlf9HHjlxjbw7ZmNJ5IWQ9NaSyuFYKosDEovk8v7uFEJ
	juyWliNl74rRGQtJ4W33ocSLTzN3LNnorSM6EOaVRBnjL9HbWvGZOBG3/zSHScyG1b2j
	7wSlcAcaKgeU2Hzo3lqw+VNh9hEWhAVhLBDanNnsFAXXKXmUahfvHeu8pdMBNpSTnt2c
	iJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rrSqnOlfKb299lKOo1gAGvTl88nQ/1g3igS6oiOmSIw=;
	b=dBtzG69Ga50HOZKMJ23WGU8lFFr4F3eF1Mpf9fpCwkq+4QMdxBYX9LEE1ELxXTvl0L
	ArLy3XC3IVhv7lyRfG5ovVfjpckWDP4eGl/8/2j2BEG26EmzWQ0pISZanAJ/BN1c+HHO
	qqW8/NAhFfr6/XX8pxBSstj8cCzbyZTyfXtbdSQa+Of07i7UK8qyq6q9glYNwhYL30e5
	VuuROAqtDC8vXqDPLpG2OjRpZAZEbRrsnWlB1JiTlkeqGTvEsBPD/HD6yOtYIdL5AeWP
	F7CY0K/Q1Iw7NB471ic/Kj1GMT3+kuLYfGwgBVYIiHV6RIHUirnj6XlNsz+84XiZ/7uX
	h54g==
X-Gm-Message-State: ANhLgQ1lCJaC4RV8A0EjZJSSLOvEQlqPw6NgBw/18GZqazIYL8zvYCn9
	BdgSfew6dNPSAmiQF5PU/O2SVJtbd4uIb9oh1Fo=
X-Google-Smtp-Source: ADFU+vsx/mWC5uW/syCExeeTc6UzuCacb0HDlVD6KtiCbhbQmzlRlJwch5G3FdppM2YUDSaFQh20G9d1uNSsRBctwEs=
X-Received: by 2002:a1f:ee05:: with SMTP id m5mr2807710vkh.9.1583947334140;
	Wed, 11 Mar 2020 10:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165221.23475-1-domarys.correa@ossystems.com.br>
In-Reply-To: <20200311165221.23475-1-domarys.correa@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2020 18:22:02 +0100
Message-ID: <CANNYZj_wh5Xxx38jyzDc6SaFWV9KfVsh=G-k8ceYim=NTi1iVw@mail.gmail.com>
To: Domarys Correa <domarys.correa@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: Allow use of weston without input devices
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
X-List-Received-Date: Wed, 11 Mar 2020 17:22:13 -0000
Content-Type: multipart/alternative; boundary="00000000000031c91e05a0977ae2"

--00000000000031c91e05a0977ae2
Content-Type: text/plain; charset="UTF-8"

I do not think we should be overriding upstream defaults like this. If your
use case is different, you can always provide a custom weston.ini through a
bbappend.

Alex

On Wed, 11 Mar 2020 at 17:52, Domarys Correa <
domarys.correa@ossystems.com.br> wrote:

> Don't force users to have input device in your targets. As the default
> option require-input is set to true, Weston only starts if we have a
> device in /dev/input/event* and this not a requirement for all
> applications,
> e.g. kiosk browser.
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> ---
>  meta/recipes-graphics/wayland/weston-init/weston.ini | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini
> b/meta/recipes-graphics/wayland/weston-init/weston.ini
> index 1eecf48bc1..1e6dff68fd 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
> @@ -1,9 +1,10 @@
>  # configuration file for Weston
>
> -#[core]
> +[core]
>  #modules=xwayland.so,cms-colord.so
>  #shell=desktop-shell.so
>  #gbm-format=xrgb2101010
> +require-input=false
>
>  #[shell]
>  #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000031c91e05a0977ae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I do not think we should be overriding upstream defau=
lts like this. If your use case is different, you can always provide a cust=
om weston.ini through a bbappend.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, 11 Mar 2020 at 17:52, Domarys Correa &lt;<a href=3D"mailto:domarys.co=
rrea@ossystems.com.br">domarys.correa@ossystems.com.br</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Don&#39;t force users=
 to have input device in your targets. As the default<br>
option require-input is set to true, Weston only starts if we have a<br>
device in /dev/input/event* and this not a requirement for all applications=
,<br>
e.g. kiosk browser.<br>
<br>
Signed-off-by: Domarys Correa &lt;<a href=3D"mailto:domarys.correa@ossystem=
s.com.br" target=3D"_blank">domarys.correa@ossystems.com.br</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/wayland/weston-init/weston.ini | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/re=
cipes-graphics/wayland/weston-init/weston.ini<br>
index 1eecf48bc1..1e6dff68fd 100644<br>
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini<br>
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini<br>
@@ -1,9 +1,10 @@<br>
=C2=A0# configuration file for Weston<br>
<br>
-#[core]<br>
+[core]<br>
=C2=A0#modules=3Dxwayland.so,cms-colord.so<br>
=C2=A0#shell=3Ddesktop-shell.so<br>
=C2=A0#gbm-format=3Dxrgb2101010<br>
+require-input=3Dfalse<br>
<br>
=C2=A0#[shell]<br>
=C2=A0#background-image=3D/usr/share/backgrounds/gnome/Aqua.jpg<br>
-- <br>
2.17.1<br>
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

--00000000000031c91e05a0977ae2--
