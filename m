Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8642.1792766405670012547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 07:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y5t9IF8f;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679a2b540f3so930899d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792766405; cv=none;
        d=google.com; s=arc-20260327;
        b=Je/aLZLKrvvsm0w81HWGMJo1kmg9dTJCBpnXadG2POCRoc/eL7gfdZs7jyIzGlBNed
         bw4cD8yDt4o3Lxiu8uCQtFC08tjj49qYQ0+BePsjgXGUwtS2yGatYfErudCXdOTQvgYj
         /oUR7OVRvMdhagA6DxPDOzutGz+sOpvUSso4NC136rLKk49V/NVLXgD+YyhmJpfhFBaE
         r6hwHweszvz7ck+vvTZWi+s+jIXr73e7DAxs1GRCDziVE/39VL5lpYoan84BKyOfEp/J
         kV4AP9HgnBEVtAiCJF3fXGs214PTwmG8n3hhIKKWvxI0vofAEoJz6eVj9AzGE8kU48Y3
         Q56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AHlYnlF/rAop0eEf7AnPrYHaoA/CGurAPDHY95/ayuY=;
        fh=Oyp0vZkthY33qxuTu49euvFnXWw2uEogdk3yUFh22TY=;
        b=FtuhtBnisrdsc0eK4qGBJKi7QuHwfnyTZYlqN4GOL75XJRJtUmsBfvDRiTu/hSMZsl
         R639cyL7nQmp3IkQN6H9IUQGTwgqg8bnDPqz5QrCx3o+l6YgcWKLFIvxvxr/WEcAePVp
         Kj/IbfILNcESX+vuJBdjJXM122hCwWjYbdBYk8MYhBzD0y+cVx/M1oadZtcWdtij85oC
         ejHJDmIkR34nHjUuavUN8W+3xwFU9Cfiwf5X23FQ6Vn+J6kvPKx2In5Nkfat3jREQpXz
         GkWxz/RU4QirGgpuXUxsCW/Cu477+VJdcbqOLKy4g7NVpdS4BV+VTdi0l5Hj02BTkb6w
         d+zw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792766405; x=1793371205; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHlYnlF/rAop0eEf7AnPrYHaoA/CGurAPDHY95/ayuY=;
        b=Y5t9IF8f/VJDwSDK2/cgMx0hs1cCrGwk/htSxoSJtYQnLr1kWswfwHCOLs5mulsx5r
         qWpT2wxM5TNNWxUs1P5IWHPKUS1DzzKSrNsDr4yHDpb90bD5FTHRzVr4Wj6ckmpmwQgP
         xtWCMd6kg+4TBeS/eJ+Na7WiFzAbk8xshx/h4SF2hsMBU28GaHvirMu6QZ2ecVly56Hk
         mExNurc03fNuvN7kNEdthmzwlI00aoPk64DYKLrn4amizGMSLD+4rXTX/SuE/DSaWoQJ
         1CgraUhooH6NfQIUKE+NFpJRj0+3BFO3uLYs+dxdaFlnmKH9bW4ATTbaPm0Spkadf16g
         9/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766405; x=1793371205;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AHlYnlF/rAop0eEf7AnPrYHaoA/CGurAPDHY95/ayuY=;
        b=Km3Zz1J/ARAXEgTS3VLkXCs0t98k5zs4G1UpJOhyqFVK6f338DWsD5RrmOyNVKaV/S
         PdG6RUGseer8WRyQUBSYF5ifQGpzsfEaH1tPVW1LEgz7vNx8jBcYxwrgwzdvt3+tfpcT
         7FEuYVywxD/UfNjWpdc7VlOXy9Xj6kx4RfVJ1cL1aK2HLGI4QuHCxKNVWcapWlCqzDMg
         IH5+nd8AqrOCGU9+RJugIcrvAzXzkz/N6CE5v68ODVjcZoCoSo+4dD2cY4fC/mbXxAm5
         j/hIzUM5cEOhmAVUpoMeJHJGDQCaqUVvt4fsuOJAHuQ8pXTrgHG/9SC1VRoDJRadl/Lh
         zeKg==
X-Gm-Message-State: AFq9FYLw4JZQDoXO2UZalPOzqSBD1vZn9s3YKq/+7wAP+irXAL+X8ONA
	g6vTgc65Ztk+KWoiWm00sYWypDoytQa0W7RIo3Sj1VVHfLG8BGNfibSy0JaA+fvQXztFmayJwKn
	t5a18lq7svjqliDa4z6PZGQ9UjyM/a74=
X-Gm-Gg: AYBFou2/CVcxjMkp0wWzgWZQF7oR3be0LqWV6WSgOgc4yqGQ6/w99F2onZd2+8qyki+
	BV+rMmhrOgyEKKS6ot0Mq6X6OYV5dhIQ1ZbYAHT8EmC6kIW3D9y5UsOwiGevRYgcjKbyfZxRx/3
	VtUUZU89rTS2AUf7Qhjf+vRdtIr2t2ktYLkVasdIB1Hmylx0o55K1FKF1ZGsNbcNB89WjqcAzMq
	4nr0qjvHJN2iZIOnSrBmANZRfrQSjTphavwirrdN/qUrYimmycllfJuTnXw6PEmfA2RpEi9ulvQ
	DQSNeZDGyyCCNuhGxuhWs/wTChhuvRtk/9BgfYNd0XNEYDgTR0xkth438qhBfszaB3ySv1HqU8i
	O90lMfQoGbAwZ5Z3uS1m8DylFLdQemXp7FRvlXhSbny2lID4XX0EAoMTsxOoKw/CfOwH0ejV6Ml
	e3stoQP2hxR084wttp89mmzVI2uH2cyU1DmwClQceYyVnXAf/cCVykTVFuMoA78OsH94vhYIAaZ
	SE+My8LzQIolATvJl+Ya9yg0fOmksA4ylWMfRoNMXMvTwC8D+IFUZ6XOXXsU04shzr/lcVoMdxy
	ir8DainfxVs6UDf8rx0tiU94sjMb5VC+geFqND89RYbcVC+zb5A20W3OuqbLgl8lBvCrQnOUzwE
	ClARgQcKj+yfVWPEceY5l
X-Received: by 2002:a05:690c:6e83:b0:8ab:3918:33c9 with SMTP id
 00721157ae682-8b157df3d77mr16107817b3.96.1792766404591; Fri, 23 Oct 2026
 07:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261023042749.1756636-1-khem.raj@oss.qualcomm.com>
 <20261023042749.1756636-2-khem.raj@oss.qualcomm.com> <DMC7J563H5Y0.3G5XOPFZQCKZO@bootlin.com>
In-Reply-To: <DMC7J563H5Y0.3G5XOPFZQCKZO@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Oct 2026 07:39:38 -0700
X-Gm-Features: AclHuK9_uaGyssYV2DuvkRrlY0oh_KrREGksmgIzv7SItpN9vZwd9J0OxCnUSmE
Message-ID: <CAMKF1soxDW9yBOpD5JeGj_H5pJLZF6N3FebxHjiT1myXwoPaYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-uv-build: Update rustix to 1.1.5
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000b6051c065e82f41b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 14:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248556

--000000000000b6051c065e82f41b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:13=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Fri Oct 23, 2026 at 6:27 AM CEST, Khem Raj via lists.openembedded.org
> wrote:
> > rustix 1.1.4 glob-imports the STATX_* constants from linux-raw-sys for
> > non-glibc Linux targets, but libc also defines them for musl with its
> > musl 1.2 layouts, which are used on riscv32, so the build fails:
> >
> >   error[E0659]: `STATX_MODE` is ambiguous
> >
> > rustix 1.1.5 imports them explicitly. Add a patch that updates it in
> > Cargo.lock and regenerate python3-uv-build-crates.inc.
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
>
> Hi Khem,
>
> Thanks for the backport.
>
> We have another patch on the list upgrading python3-uv-build to version
> 0.13.5. Looking at the git log, this version contains the rusix update,
> so we can probably skip this patch.
>

I think so.


>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000b6051c065e82f41b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 23,=
 2026 at 5:13=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathie=
u.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri Oct 23=
, 2026 at 6:27 AM CEST, Khem Raj via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<=
br>
&gt; rustix 1.1.4 glob-imports the STATX_* constants from linux-raw-sys for=
<br>
&gt; non-glibc Linux targets, but libc also defines them for musl with its<=
br>
&gt; musl 1.2 layouts, which are used on riscv32, so the build fails:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0error[E0659]: `STATX_MODE` is ambiguous<br>
&gt;<br>
&gt; rustix 1.1.5 imports them explicitly. Add a patch that updates it in<b=
r>
&gt; Cargo.lock and regenerate python3-uv-build-crates.inc.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
Thanks for the backport.<br>
<br>
We have another patch on the list upgrading python3-uv-build to version<br>
0.13.5. Looking at the git log, this version contains the rusix update,<br>
so we can probably skip this patch.<br></blockquote><div><br></div><div>I t=
hink so.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000b6051c065e82f41b--
