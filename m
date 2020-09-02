Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web11.1911.1599030666216675032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 00:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f3w0gyPH;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id s62so182691vsc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 00:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UG6o4fGZXRUkN7C+T1BWnXdkcoTCMeCOFsVjPn/U3Cw=;
        b=f3w0gyPHN+1p8rms81nJEgjrqrbv6uGdyBTrbd6UM2/NdXErmRXQKPn9w3A9k56bm5
         2yGeqk7nNNg+gAZPbWcjWnN/QZO3+9z9B9tuHinKD9CHVe5tjl7h9lcMoP2VcOJu+oRN
         aGEmtJZZ+GoBaHX3sJhqYlMWlZbrBnFVOnzrRZLF7sKBgm+e8SmEwuCToYKq1x5aYJuy
         5lfAgki+pIuOuI3lUoSQ9v8PyNQ4djPEaHsmM7MSxQpIBwI8e7t69JDrO9c/s111mCY3
         V9GwPodbPCMBb6YHoHnmMp2+XHt/gFZwqYbHnU+D5v7ZQAeEc2k6CGtf280kzns/+wPX
         qfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UG6o4fGZXRUkN7C+T1BWnXdkcoTCMeCOFsVjPn/U3Cw=;
        b=ltqHnFtSX+xbK8FChpSu0nsi7qRoYq7uFRvMTxaJSINhl77sdX+LNLL73ORwH963xt
         ccJHizu70glPc0GG7rquseJhVBKtHyZGxXFSz0nLD2fqm3inlcZKXb0+ffLadhrZ1vC4
         Sx5a6y72RTrjUwhaLqdeTwXXxXoi8zSpsrOA0qt79HGbYkYKlb9qmNr0dDVnhN2+nG5v
         AkVFi+nqM/WOd0t12os2fD6VujIeje8gONXGytN7PeFxbX7wPCMvoA1M3JRMPBDAsQo/
         xH87mo+S7W4mlqoUlaKUwDFX1yyPVSzcPGjSVJuRU8aGePQSfUtCEXO388fXbCDMVU7b
         mU6w==
X-Gm-Message-State: AOAM531jRGodKowo75/aftvsiq2nbIsnRG6EhQs6iC+ugj8OJrlIBrCs
	JCrDVq2YohCFCrReEutBpGpeJPNgYIEe1XYrRBU=
X-Google-Smtp-Source: ABdhPJzb9wISaRRfwCRR7lcQLV6LOHzGCJqrfK8OHZ6xvFHwIhqQbVx3dCYL+gtHHcmVDaYJG1WpOgtwTY07nLIy7FQ=
X-Received: by 2002:a67:8e88:: with SMTP id q130mr4197904vsd.197.1599030665228;
 Wed, 02 Sep 2020 00:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200901225324.17870-1-changhyeok.bae@gmail.com> <20200901225324.17870-3-changhyeok.bae@gmail.com>
In-Reply-To: <20200901225324.17870-3-changhyeok.bae@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 2 Sep 2020 09:10:54 +0200
Message-ID: <CANNYZj9Z+766uE7cg8_gSaVX2BoOmRfN2rGQrWPGc5Kwy3FKkw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 3/3] packagegroup-core-full-cmdline: remove iputils
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c935ad05ae4f5664"

--000000000000c935ad05ae4f5664
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This doesn=E2=80=99t seem correct to me. Iputils is an empty package but it=
 pulls
in all the sub-packages with individual utilities.

Alex

On Wed 2. Sep 2020 at 0.52, Changhyeok Bae <changhyeok.bae@gmail.com> wrot=
e:

> iputils package doesn't have anything.
>
>
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
>
> ---
>
>  .../packagegroups/packagegroup-core-full-cmdline.bb              | 1 -
>
>  1 file changed, 1 deletion(-)
>
>
>
> diff --git a/meta/recipes-extended/packagegroups/
> packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/
> packagegroup-core-full-cmdline.bb
>
> index 16c2f9f2aa..f38577b043 100644
>
> --- a/meta/recipes-extended/packagegroups/
> packagegroup-core-full-cmdline.bb
>
> +++ b/meta/recipes-extended/packagegroups/
> packagegroup-core-full-cmdline.bb
>
> @@ -101,7 +101,6 @@ RDEPENDS_packagegroup-core-full-cmdline-utils =3D "\
>
>
>
>  RDEPENDS_packagegroup-core-full-cmdline-extended =3D "\
>
>      iproute2 \
>
> -    iputils \
>
>      iptables \
>
>      module-init-tools \
>
>      openssl \
>
> --
>
> 2.23.0
>
>
>
>=20
>
>

--000000000000c935ad05ae4f5664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This doesn=E2=80=99t seem correct to me. Iputils is an em=
pty package but it pulls in all the sub-packages with individual utilities.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 2. Sep =
2020 at 0.52, Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.com=
">changhyeok.bae@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">iputils=
 package doesn&#39;t have anything.<br><br><br><br>Signed-off-by: Changhyeo=
k Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.com" target=3D"_blank">cha=
nghyeok.bae@gmail.com</a>&gt;<br><br>---<br><br>=C2=A0.../packagegroups/<a =
href=3D"http://packagegroup-core-full-cmdline.bb" rel=3D"noreferrer" target=
=
=3D"_blank">packagegroup-core-full-cmdline.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br><br>=C2=A01 file changed, 1 deletion(-)<=
br><br><br><br>diff --git a/meta/recipes-extended/packagegroups/<a href=3D"=
http://packagegroup-core-full-cmdline.bb" rel=3D"noreferrer" target=3D"_bla=
nk">packagegroup-core-full-cmdline.bb</a> b/meta/recipes-extended/packagegr=
oups/<a href=3D"http://packagegroup-core-full-cmdline.bb" rel=3D"noreferrer=
" target=3D"_blank">packagegroup-core-full-cmdline.bb</a><br><br>index 16c2=
f9f2aa..f38577b043 100644<br><br>--- a/meta/recipes-extended/packagegroups/=
<a href=3D"http://packagegroup-core-full-cmdline.bb" rel=3D"noreferrer" tar=
get=3D"_blank">packagegroup-core-full-cmdline.bb</a><br><br>+++ b/meta/reci=
pes-extended/packagegroups/<a href=3D"http://packagegroup-core-full-cmdline=
.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-full-cmdline.bb=
</a><br><br>@@ -101,7 +101,6 @@ RDEPENDS_packagegroup-core-full-cmdline-uti=
ls =3D &quot;\<br><br><br><br>=C2=A0RDEPENDS_packagegroup-core-full-cmdline=
-extended =3D &quot;\<br><br>=C2=A0 =C2=A0 =C2=A0iproute2 \<br><br>-=C2=A0 =
=
=C2=A0 iputils \<br><br>=C2=A0 =C2=A0 =C2=A0iptables \<br><br>=C2=A0 =C2=
=A0 =C2=A0module-init-tools \<br><br>=C2=A0 =C2=A0 =C2=A0openssl \<br><br>=
-- <br><br>2.23.0<br><br><br><br><br><br></blockquote></div></div>

--000000000000c935ad05ae4f5664--
