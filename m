Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web08.7003.1619703795967202654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 06:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a0P6zJLQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id g24so9791266uak.11
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BCxZbkeuFFUM92/tDcJ+ISbw1bStYr+EVQfgayFQ7lU=;
        b=a0P6zJLQbhEiSr/20D0Aao2EocuvDnaNyClaUcngHGu9qPJMA8F4Tqx4M9dIu9JYso
         jGJiIxTrvIlCH3TgDb+XS6yozcfmp4D2r66O1c6qX7N7qCFQO/f1fIM2YcF7BneMZWwq
         rFmVNP6Es6oBHo404ZfwemXi1KPbSnh5ftUk9+zKPmJQhCUuYg+03IYHCpi/hT3T9Azh
         lmhRIwIdXepn1ZiDjQv0Isb0rNMsZX1qiFFuZFdxDBxiVTRXpkp9AwURg65k5yoYR16l
         x+ud2di7fxycXgj+qMtHuoF5WhXWFkHitu3ISXMVUdORhgy98QfwVNIi6MdvI0elTxeA
         JXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCxZbkeuFFUM92/tDcJ+ISbw1bStYr+EVQfgayFQ7lU=;
        b=qQhqmaXs7VEiDvJXFKjig0Z2GF7sfbzZlpB4puzhrGnNVRoI6MfmuHR1Ek5x3kjcUc
         JyRAFmux58/ZJvA4CN/dodWABSi3hB1nHFZzHMKe+h/idVH66/K34VdAnNz2p5dFt496
         61kocW7+hJH2y7PoSDSFqoP0gJNALy+UU+p97e2dsEsShLzx4tszfQx57hrcUMMd0vi8
         Fti/dhht542kR7OsimZ0k6eAs8zbEmbSvTo2l1m0bsNTTyXFwumipqkSAq3qw6d7yrj8
         Cc6UgbEJjjTCz2LDC/SU7veue0Yra3XqUIpUDzFfcyVesvtc068KcactrDcAM/NakP9P
         POWg==
X-Gm-Message-State: AOAM532DA4rsnrDO98h8qod+JRe33IJ/o2CwxAMLe4sdslqyL6Tldz7R
	EamVZvOzNhp/LJiLnSOuSZgfLsg/1dM0wpTS9WY=
X-Google-Smtp-Source: ABdhPJxJmLKlRHwoIXcO7UjeRsTLrHkFAmpJh4TqAsqBqXywACewAl8eXHKiYCWmro6jWZ9WFcCL4TgS4qdRLhU0tio=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr30650203uar.100.1619703795143;
 Thu, 29 Apr 2021 06:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <1619700210-5544-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1619700210-5544-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Apr 2021 15:43:03 +0200
Message-ID: <CANNYZj_NcGXDPQT_obKT1kfB08_eO_B7TC96hLCvuY32=-5_vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shaderc: upgrade 2020.5 -> 2021.0
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000059d79a05c11cadb2"

--00000000000059d79a05c11cadb2
Content-Type: text/plain; charset="UTF-8"

Neither SRCREV nor tarball checksums are updated. How come?

Alex

On Thu, 29 Apr 2021 at 14:43, zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../shaderc/{shaderc_2020.5.bb => shaderc_2021.0.bb}              | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-graphics/shaderc/{shaderc_2020.5.bb =>
> shaderc_2021.0.bb} (100%)
>
> diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.5.bb
> b/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/shaderc/shaderc_2020.5.bb
> rename to meta/recipes-graphics/shaderc/shaderc_2021.0.bb
> --
> 2.25.1
>
>
> 
>
>

--00000000000059d79a05c11cadb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Neither SRCREV nor tarball checksums are updated. How=
 come?<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Apr 2021 at 14=
:43, zhengruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fn=
st@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fns=
t@fujitsu.com" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../shaderc/{<a href=3D"http://shaderc_2020.5.bb" rel=3D"noreferrer"=
 target=3D"_blank">shaderc_2020.5.bb</a> =3D&gt; <a href=3D"http://shaderc_=
2021.0.bb" rel=3D"noreferrer" target=3D"_blank">shaderc_2021.0.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A01 file changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/shaderc/{<a href=3D"http://shaderc_2020=
.5.bb" rel=3D"noreferrer" target=3D"_blank">shaderc_2020.5.bb</a> =3D&gt; <=
a href=3D"http://shaderc_2021.0.bb" rel=3D"noreferrer" target=3D"_blank">sh=
aderc_2021.0.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-graphics/shaderc/<a href=3D"http://shaderc_2020.=
5.bb" rel=3D"noreferrer" target=3D"_blank">shaderc_2020.5.bb</a> b/meta/rec=
ipes-graphics/shaderc/<a href=3D"http://shaderc_2021.0.bb" rel=3D"noreferre=
r" target=3D"_blank">shaderc_2021.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/shaderc/<a href=3D"http://shaderc_2020.5=
.bb" rel=3D"noreferrer" target=3D"_blank">shaderc_2020.5.bb</a><br>
rename to meta/recipes-graphics/shaderc/<a href=3D"http://shaderc_2021.0.b=
b" rel=3D"noreferrer" target=3D"_blank">shaderc_2021.0.bb</a><br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000059d79a05c11cadb2--
