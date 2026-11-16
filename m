Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3495.1794863419089213824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ao2x9a//;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67da7d18f2fso426403d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:10:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794863418; cv=none;
        d=google.com; s=arc-20260327;
        b=dPqrinkLInUa/El8QL6UD6iu3CPZfnWx+gAv15pnzvpyEzHifUtjgzSUMLeRvPYVF+
         CBo/PZt67qG8tV/2tN7GsmXNN+QPbk5VWIp9X0VpLaCXyWcHBY6Kxn4gh11CKtD72FTk
         rx3SJfGGKpt1QfVAH3Hwi+0jEKMqFk6pqnzDgje5cHXibpfRpYI9ZnoQI+U3ikeO/HzQ
         9Tq/gfQaI8CljP1LFr8orB/xxDjA+XhSdLm99b6wvrGdr0JfCdxe52VRaAKrDBMHvfZn
         knDVnvG9wUhq1k9yQ/K2+eaHVENaaV+GtOpmQoah8O7b42TyVvICD97u7XGUCSzbHdsi
         JrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p1VbVDueB3cE8yjZslD11RQn+ru3meZ1SRwt0ngzVH0=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=GUNGSyM/CzyGNui5fAAUyqbOHyTrcRr2T0v9wpYRvkuZnNEq/NL1BaOBB6nW4eNLxP
         7UHXKAjZys9YEA9a+bCmbQedqRM7//ll/QO5RfUOxAWT+R9yET2gxT8R+r7C2wMLT4Z4
         MDOpg0GKuT0SSVwOOISwiR9RgC7oi3Uf5LuzMg0gY52O43e8avgzSMHNOLBfoQUExib5
         JvlXkY/cJ0F97Fgfpz42myUmv+B/HFkr3vIgQYBzXL8eTzAE/RVaUwKbZ9PZxCEZBIYw
         /ML/BrTTZdGFnv65fDO61PGQPL2edjqiQz6ViJjL6j5UQ8A3cq7pdg6hfgMAz/QnCQ70
         CFUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863418; x=1795468218; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1VbVDueB3cE8yjZslD11RQn+ru3meZ1SRwt0ngzVH0=;
        b=ao2x9a//83tAoxsob5Y+4aK3eKQl/7J7taKcyJfrrbqYBuYG/r2W+Ehz2K9HXo0Rs5
         lRzo1WQPtX0XKmM8RqDaeJibEQmGPtEwliS1/d9BkxYuvuJxLYu0re5BP2UgE6pZb6Np
         Ud2Yo3c6seFwzHT30CVLSgPknH9B9KgGW31RDFIwbHj/e88OuitxjVaEW2x6MtQYtphg
         Q/hBz16AxA/ZFQyH/XMR5s7S7orvHqw4otqJ5SMuAaVRzItOFtvWmt4HtJ0oI1l5u76/
         VtC8hIR48aRVMWWyJhImu+o4lQBWLH6eT020nyWf/LrdqcIfPHy7REOCv7gF3OKzqLjs
         YTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863418; x=1795468218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1VbVDueB3cE8yjZslD11RQn+ru3meZ1SRwt0ngzVH0=;
        b=ye13KZCrdsYQIjEy5xKojC4vCZ3aZmwu1j/Rno7tn/vAuD74WxYbxQmsYTQ9J7TaAY
         MkLOgXAVoxWUcbq7U9Lf16DWtv81lM1BlVdYj884L2uSv8zfX2jwq0+ARv9P6WA8BJWL
         di/xzDIO90XX8tHmchVjTcL/0eTmVa6SZJ85E+QK214aLJsC0U5AX5djdDhHZH1XXAp3
         XkJDAGLNapkgU79BKfUPb9MCgOvZDXKTn8d11UGGRdf9exm9W1HeViXFKXRD0gBW2+D4
         bLlTD9GyInNuuT6Cf+XOU5G8zFtjVvVo77afydKvtmSPRr0KmE7oAgmHVh+6YfjLuGXm
         Wp0w==
X-Gm-Message-State: APuU4Z/8qx/P0dwtPatpj1t4xtbDCLfjjL5ZL6EQcwrkWjhH0EQmQ2cb
	e77pQXYUDl7kWWmiHygtItePpN+1k/6upiXU3oNN/TvZhqu5FC3q/fEnXWeGLAYEedZYctYngCP
	UBh0oS/5fOkRMoqt/99Xkjt8KTTsHAxCi2AkU
X-Gm-Gg: AZFdTZfUJV72QHE2yKAlnz/BOiwZZyFP8Js1ixSP5Ume6EY8ZjIQfXr5lCqonhH5Lbm
	P8/3Ojw/oCIehgHAsmLCzttzVljxHJ0WnxQYsC1AL6xkq3vLnih32AqUMI2utEE5m6C4LJCFk/r
	ftBDllVlkW1WQMvhf2sRuk9v7LvfZ0Zx3OHyYMvVY9Q14iMZzd14rhJZ0f4/7yn/nEXGfxjAKy+
	nqHzAaVoxTLt8tPaml+biZmzCna5MvS434jfQYKpJVEadW0W4e3Tu/MQJA01a7uX0BHycUGzmo5
	EhYm5flWRqFaE+lPQu3mI0m6/KJMt4F88ZfnY7fQ4z7PPTW+rSYvIb0wZ4PwLTg7FljWh1g8fSo
	X4R8kx5gBDf1W/dkhbGAejapZn4Zd6lShoullsL6hbaMXZb7UuIsxsIb6DKrYMYscLDh9hCXZxk
	6gyZroYi4gDUYDjljzAO3J6+cEm80T4iJvI7CNImg21FW7wp2k1pormQr4ee6btGdFevDvx4pI7
	4OwqHSeF4Z2S8oLk22L/VH3kQ/PJRkICns9sNoC0L1mVK9SdrXBbKUGAXip0I/XGfWn/J6crw6S
	3ViEZedhf7W3kX5kx8m91Veve9H2D1soUbHWVGScOyUlgqXpttIMWaMO8MxGhOgV0A==
X-Received: by 2002:a05:690e:4388:b0:677:b7c3:12c3 with SMTP id
 956f58d0204a3-67dc775b2bdmr239327d50.29.1794863417795; Mon, 16 Nov 2026
 13:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20261116210435.4161338-1-ross.burton@arm.com>
In-Reply-To: <20261116210435.4161338-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Nov 2026 13:09:51 -0800
X-Gm-Features: AclHuK_FMbMq2YVwTsPAzvk0l3qccMvo7a3sjbud1ApAHAeP4TZh5WO90yBU5FU
Message-ID: <CAMKF1srDiYjWbAnER9Rp32X2wH-snHdehWvqgzjjXmFF8b2u+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] python3: don't copy from UNPACKDIR to WORKDIR
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000702a1a06606b34b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250381

--000000000000702a1a06606b34b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 1:04=E2=80=AFPM Ross Burton via openembedded-core
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> There's no need to copy files from UNPACKDIR to WORKDIR, we can just do
> the work in UNPACKDIR.
>

IMO unpackdir is more of less what sources come from unpacking and patching
modifications happen in workdir. is it not the case ?


>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3_3.14.10.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb
> b/meta/recipes-devtools/python/python3_3.14.10.bb
> index c50c4d4babc..765f93ddc66 100644
> --- a/meta/recipes-devtools/python/python3_3.14.10.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.10.bb
> @@ -498,11 +498,8 @@ do_create_manifest() {
>      # e.g. BerkeleyDB is an optional build dependency so it may or may n=
ot
>      # be present, we must ensure it is.
>
> -    cp ${UNPACKDIR}/create_manifest3.py ${WORKDIR}
> -    cp ${UNPACKDIR}/python3-manifest.json ${WORKDIR}
> -    cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}
> -    cd ${WORKDIR}
>      # This needs to be executed by python-native and NOT by HOST's pytho=
n
> +    cd ${UNPACKDIR}
>      nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
>      cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.jso=
n
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250376):
> https://lists.openembedded.org/g/openembedded-core/message/250376
> Mute This Topic: https://lists.openembedded.org/mt/122302833/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000702a1a06606b34b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 16,=
 2026 at 1:04=E2=80=AFPM Ross Burton via openembedded-core &lt;ross.burton=
=3D<a href=3D"mailto:arm.com@lists.openembedded.org">arm.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">There&#39;s no need to copy files from UNPACKDIR to WORKDIR, we can=
 just do<br>
the work in UNPACKDIR.<br></blockquote><div><br></div><div>IMO unpackdir is=
 more of less what sources come from unpacking and patching modifications h=
appen in workdir. is it not the case ?</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.14.10.bb" re=
l=3D"noreferrer" target=3D"_blank">python3_3.14.10.bb</a> | 5 +----<br>
=C2=A01 file changed, 1 insertion(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.10=
.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.14.10.bb</a> b/meta/rec=
ipes-devtools/python/<a href=3D"http://python3_3.14.10.bb" rel=3D"noreferre=
r" target=3D"_blank">python3_3.14.10.bb</a><br>
index c50c4d4babc..765f93ddc66 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.10.bb" re=
l=3D"noreferrer" target=3D"_blank">python3_3.14.10.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.10.bb" re=
l=3D"noreferrer" target=3D"_blank">python3_3.14.10.bb</a><br>
@@ -498,11 +498,8 @@ do_create_manifest() {<br>
=C2=A0 =C2=A0 =C2=A0# e.g. BerkeleyDB is an optional build dependency so it=
 may or may not<br>
=C2=A0 =C2=A0 =C2=A0# be present, we must ensure it is.<br>
<br>
-=C2=A0 =C2=A0 cp ${UNPACKDIR}/create_manifest3.py ${WORKDIR}<br>
-=C2=A0 =C2=A0 cp ${UNPACKDIR}/python3-manifest.json ${WORKDIR}<br>
-=C2=A0 =C2=A0 cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}<br>
-=C2=A0 =C2=A0 cd ${WORKDIR}<br>
=C2=A0 =C2=A0 =C2=A0# This needs to be executed by python-native and NOT by=
 HOST&#39;s python<br>
+=C2=A0 =C2=A0 cd ${UNPACKDIR}<br>
=C2=A0 =C2=A0 =C2=A0nativepython3 create_manifest3.py ${PYTHON_MAJMIN}<br>
=C2=A0 =C2=A0 =C2=A0cp <a href=3D"http://python3-manifest.json.new" rel=3D"=
noreferrer" target=3D"_blank">python3-manifest.json.new</a> ${THISDIR}/pyth=
on3/python3-manifest.json<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#250376): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/250376" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/250376</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122302833/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122302833/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000702a1a06606b34b5--
