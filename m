Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.8641.1616738451832124536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 23:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xf4PHBeo;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id q18so1267338uas.11
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 23:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YHREnmYsA9/5/jm62fsNMRN/cVID3fvfCa02c5U1lU=;
        b=Xf4PHBeoZGww/8UIIP/kepJ6t4ft/5KLg/GTTxuNxKLoh3tgGHFMe29OerGgzWCC0F
         Y89hI8Ej0hLCO9LD68emrqfTQ/M98M9cjld16ZbRr6PSHZ+efrXWjm8nMkejKSISruLZ
         dB1shgO9uQGcqbqsyzJYUk+y3SFY9yoVSKr57BsB6NgRw8q8USxTYLBI6Bk0k4rJAV/A
         ZhHgHfNducUy/zZMGi41suewHklTHI/Dqld6HY6fHAqUGx2M3SKIG3ey3hCt5IWjS/nU
         JSccVrSndadUon1NA0fdAGT2JIhUT+5YcFtkquBC36m7+NT+xMbn37xfDpudLe6U0Uis
         sxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YHREnmYsA9/5/jm62fsNMRN/cVID3fvfCa02c5U1lU=;
        b=lnukrzXKR8NrfnfjG7hQh4FdQJ7/O6J7jTG/PPqEN3GcHucxmEtIHyE6ELqDQE8YL7
         3R9a0LDNdmoumZsmnvrIEa4CRDAhmOmsDCD8617pNVdzz8Pv4pco1JDROHdxWfd0DNgl
         soXSaGumNktWC/FwiZdMlotjc7X0Jkh4s0QN46EbN79z/TVKZPIC0HP3XiszFWdMcq/s
         /nA5FF2La9fyY4cotciLJWDK0tQH2U9Uz9girGNXgLN4h3JMRAiqXqEf4ERHLv0o9hgE
         lGPlszrB5evt08TwZx3ot8sJ3JUAMj4RoeiFgQ/yD4oKIzfmlhySNoGqe53hnkAVrEZ1
         V7Tg==
X-Gm-Message-State: AOAM533cAX3eGuoLhR8vgDWN4QVkrIehBN1A//fWY7woZZz7Ff+S7b4m
	mYt3Cbc+RB8hWGjgBhMdJbXiDrMBR8OkQtqz0/8=
X-Google-Smtp-Source: ABdhPJx02DCILDLH7YoWZMpX0D5MDrLwPmxWrouE6TZeIvmqmqV5ILqjHP5JBGm4ApzhHuGn4pllIaZRtvz+bvThL6A=
X-Received: by 2002:ab0:7150:: with SMTP id k16mr7227037uao.71.1616738451014;
 Thu, 25 Mar 2021 23:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <1616754229-67687-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1616754229-67687-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 26 Mar 2021 07:00:39 +0100
Message-ID: <CANNYZj_mKuJ=JPNw4DspHr10_6B6zrk3TZ08fom_=DKJeiKwYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: upgrade 247.4 -> 247.5
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000011486d05be6a41d6"

--00000000000011486d05be6a41d6
Content-Type: text/plain; charset="UTF-8"

The commit message needs to be corrected, this updates systemd as a whole.

Alex

On Fri, 26 Mar 2021 at 02:52, zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../systemd/{systemd-boot_247.4.bb => systemd-boot_247.5.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  .../recipes-core/systemd/{systemd_247.4.bb => systemd_247.5.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot_247.4.bb =>
> systemd-boot_247.5.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_247.4.bb => systemd_247.5.bb}
> (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_247.4.bb
> b/meta/recipes-core/systemd/systemd-boot_247.5.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_247.4.bb
> rename to meta/recipes-core/systemd/systemd-boot_247.5.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index 098bca98f1..87ee794f05 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>
>  file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>
> -SRCREV = "069525e84a67375e27429cb490e8d28af78e673a"
> +SRCREV = "c86f4f5f287258938d0c30354040c3b034b0c066"
>  SRCBRANCH = "v247-stable"
>  SRC_URI = "git://
> github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}
> <http://github.com/systemd/systemd-stable.git;protocol=git;branch=$%7BSRCBRANCH%7D>
> "
>
> diff --git a/meta/recipes-core/systemd/systemd_247.4.bb
> b/meta/recipes-core/systemd/systemd_247.5.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd_247.4.bb
> rename to meta/recipes-core/systemd/systemd_247.5.bb
> --
> 2.25.1
>
>
> 
>
>

--00000000000011486d05be6a41d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The commit message needs to be corrected, this update=
s systemd as a whole.</div><div><br></div><div>Alex<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 26 Mar=
 2021 at 02:52, zhengruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Signed-off-by: Zheng Ruoqin &lt;<a href=
=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.=
fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../systemd/{<a href=3D"http://systemd-boot_247.4.bb" rel=3D"norefer=
rer" target=3D"_blank">systemd-boot_247.4.bb</a> =3D&gt; <a href=3D"http://=
systemd-boot_247.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_24=
7.5.bb</a>}=C2=A0 =C2=A0 | 0<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
=C2=A0.../recipes-core/systemd/{<a href=3D"http://systemd_247.4.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_247.4.bb</a> =3D&gt; <a href=3D"http=
://systemd_247.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd_247.5.bb<=
/a>} | 0<br>
=C2=A03 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_247=
.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_247.4.bb</a> =3D&g=
t; <a href=3D"http://systemd-boot_247.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">systemd-boot_247.5.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_247.4.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd_247.4.bb</a> =3D&gt; <a href=
=
=3D"http://systemd_247.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd_=
247.5.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_247.=
4.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_247.4.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_247.5.bb" rel=3D"noref=
errer" target=3D"_blank">systemd-boot_247.5.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot_247.4=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_247.4.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot_247.5.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-boot_247.5.bb</a><br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sys=
temd/systemd.inc<br>
index 098bca98f1..87ee794f05 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -14,7 +14,7 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419260aa9544=
99f7abaabaa882bbe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c&quot;<br>
<br>
-SRCREV =3D &quot;069525e84a67375e27429cb490e8d28af78e673a&quot;<br>
+SRCREV =3D &quot;c86f4f5f287258938d0c30354040c3b034b0c066&quot;<br>
=C2=A0SRCBRANCH =3D &quot;v247-stable&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd=
-stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=
=
=3D${SRCBRANCH}</a>&quot;<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_247.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_247.4.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_247.5.bb" rel=3D"noreferrer" target=
=3D"_blank">systemd_247.5.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_247.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_247.4.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_247.5.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_247.5.bb</a><br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000011486d05be6a41d6--
