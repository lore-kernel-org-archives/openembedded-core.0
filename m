Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3873.1793752067233850970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 16:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vfiWOxun;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b1ce85287aso178772c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 16:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752066; cv=none;
        d=google.com; s=arc-20260327;
        b=U1h0Ytpq7q1Ks3D2U9kGKDGUeJb7YygiyLNCfCOMRSUL5zBdw3Ro8Wvo8R02NJ5SGX
         hxc+cNuYiHRFePFfxr477ESNoCUR7gUC/B2Mq08udfjmB51MDJMyTyewTKenzTG5cZI7
         SCW6EA1WUIlNsHRwMmzW29a8NPrRJYEnllvya3e3z8I6vI51sqOGvq3jjQpL6esemyne
         yo27/rOBJDkfZCHTbh4b3mtXnqugxwS/whWJDfrl8HSF1hLRJxVCdNek0VXUPY6Mw17E
         kPQQHGDaB+g+EOY7Zkhm9ywwc1cJU0qcqN7L98vKeSbe84kCl6GgnUHnrDazdWza42Ym
         ZgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0C4dGslj+3i72MYCHPTvFOoKuYn/Q6B4RH3UmnNQLbk=;
        fh=lgc1ShYQgJzkSaxSbCXB/S1Eni0mdaya29OgnDN98ww=;
        b=WdHLjBuhJhGYw0lyS5rNCL/dec3N8sh7i9sj/GJgkwctKmaDxdFX7uV8RVO8c90VEn
         Sw/n3oD6Bad02WMGr6X/YluHQsaEECZkhbm8sPUux4Ip+u9vUYmlCRghZVWt3aTyuW2d
         G4qA6G93d3WcJppKKhQhq8nu9dni04degoXhZhyIP026nl00Ny+LWNZ+IFWq43eLsM4u
         t6mikxpE7Ce78q8VCTj0QWQFaT8mEV1pFkuKqGgMKAJWpJIGa/2Kzgx6WYQFPHWH10yD
         Py0/Xt0hxUckwEZIgnuUueqsNa4tIqX7aZCPHrh7sR8mPDtzOr/YQlwS3kkan2QYvZLb
         qttw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793752066; x=1794356866; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C4dGslj+3i72MYCHPTvFOoKuYn/Q6B4RH3UmnNQLbk=;
        b=vfiWOxunu/yQOB8q8hIydbpdKXq0hag86n8tfln6q69NOba3+fsovboK2f9yUqCMY6
         If6o+Jks/nPSnp49ErEcaEb3Ok1VUGFpwFLVci4yHJDZJteUu4pOeKqb4w5qery4W8J3
         xqoApbbYzUM0lDCbX1aVMtm6sGyS2QCtj1tRcauU5oRYSlG5CgD/dJhtD9M+rSbGOpOh
         ORZe/fZXhAyV9Xun+ZVncJDROXLoP/vCJpJqeePr26GO97hCGLoKT+zTB+6CaJBgdhls
         /AHvM82nEERyuEq/hOemzssj6hpON7AIb/ySaD/0IUrfnc8gO634r+iMU1Q2jV4owJ37
         ws1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752066; x=1794356866;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0C4dGslj+3i72MYCHPTvFOoKuYn/Q6B4RH3UmnNQLbk=;
        b=XmSTFLIjbx53oaaixYtJeDxTskqkRYYRii9t+ssXr8ikiGfdWcgyPxbBAGnLLWnoHB
         NW/Q9cQ9R5J4nfM8916xvDfx4NfeoOtMgppGZ0n/rZfZg+ZX0F4tz0HZx1eatgJeG+0P
         xtYlrKiTT02h5Luv44iVe+Ltp7mnCalYapUh9sefBvERkXaMT04TN7NaJ47YSHBJ3LV3
         ZK7y4Wl/aPhw2dMq3LQBCusAI/zYrnhUtD+1yoUd93asqDsi1hJ/p3wqaBB7swg93irp
         47FYR4o9iGpuB1eVPQw8rGvITnu5e9dpxldW9UluPEwC6yzDm5NJ4TP82WBtA5dIxr3b
         OZIw==
X-Forwarded-Encrypted: i=1; AKwUvByXqH4qG3rVi5FB5Sr/eur3R034cqH3UY0J+SpfbnwGSEWpPdrvK4GiL3QpLg/vEuzg77qCp+OoPA7jRwmqYoe0kQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9ItSZOCt/DNNs5Hb6Ctwj3sB3phrHbgO/7CE8YnkYFJpnCXrSz
	PG16EsTsQsTjIH8EzwOcLTgVZHvwjRHaqN/TmQuSUKglOCQgvHluCOmFTkJZANEpVgIQRH5Hg1f
	kpB0LWDcw7jkcQn8Xp6OwCrn3PgPVfPU=
X-Gm-Gg: AYBFou3rVnSAEysiJyq57AuYoG0cczkWFDHrhJVXPSrA0OD3pETfkujcyy1mAy9mVON
	+EzSUunbOzA8IVTuLRP0bX+TV4OpumFVKlBqMdNP7xpXeSkQhmA/YwAYMpwWvVpauylnzCzAzDD
	ansMuf4kVB1ploSG3h3EECGfKtMQIg6eGysiceFdufB1U49HndfnI1oYgBOpTA/CbNg0+AI/h9e
	jQCNXbr1L/KGr8kOObvvDyDrg6RDKR/RN4H9FmUewe0IP5CfpBTdcEz6PLPE4O3LlMdNsnaN4Hi
	WQR02v578xyJ/QD2G4wdsWeTRmXqMlFgxAagAfeErhfdS5GGc9UFpI3cp0Y4XTe9abMPgC70Ko/
	u25Cl3QHxaZYQbdvbAb9zqyBqrtMCq/lOF6Z7qDM=
X-Received: by 2002:a05:7022:ea8a:b0:188:e51:e86a with SMTP id
 a92af1059eb24-1ac56c9fe97mr19149225c88.2.1793752066282; Tue, 03 Nov 2026
 16:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20261029060913.1586484-1-ragaprasanth@gmail.com> <6ae34604.ca480166.87e27.0c55@mx.google.com>
In-Reply-To: <6ae34604.ca480166.87e27.0c55@mx.google.com>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Wed, 4 Nov 2026 09:27:09 +0900
X-Gm-Features: AclHuK82eZD7-jscc5e-3co38f9eE3V_ycPlard3xqnUuuVs6p-upg8z-3_Mcp8
Message-ID: <CAG7eodE0GBmOtBsDM-4Sj2xEUmhLWZyu5sEy1Sdh68RUM=1H4w@mail.gmail.com>
Subject: Re: [PATCH] kernel-grub.bbclass: use KERNEL_PACKAGE_NAME for the
 image packages
To: mathieu.dubois-briand@bootlin.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org, 
	prasanth.r@lineo.co.jp
Content-Type: multipart/alternative; boundary="000000000000b9dbe5065f68722e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 00:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249314

--000000000000b9dbe5065f68722e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

I see the kernel.bbclass v2 and kernel-grub patches are both marked
=E2=80=9CChanges Requested=E2=80=9D in patchwork.
Bruce acked both. Are there any issues to look into?

Thanks,
Prasanth R


On Thu, Oct 29, 2026 at 10:11=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com>
wrote:

> On Thu, Oct 29, 2026 at 2:09 AM Prasanth R <ragaprasanth@gmail.com> wrote=
:
> >
> > kernel-grub adds its scriptlets to kernel-image-<type>, but
> kernel.bbclass
> > names these packages ${KERNEL_PACKAGE_NAME}-image-<type>. With another
> > KERNEL_PACKAGE_NAME the scriptlets go to a package that does not exist,
> > so they never run and the GRUB menu is not updated on a kernel upgrade.
> >
> > Use KERNEL_PACKAGE_NAME, as kernel.bbclass and linux-dummy.bbclass do.
> >
> [...]
> >
> > +    kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>
> Minor: the 'or "kernel"' isn't needed, since kernel.bbclass already
> defaults KERNEL_PACKAGE_NAME with ??=3D. It's harmless though, so I'm
> fine with it as-is.
>
> Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Bruce
>

--000000000000b9dbe5065f68722e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr">Hi Mathieu,</p>
<p dir=3D"ltr">I see the kernel.bbclass v2 and kernel-grub patches are both=
 marked =E2=80=9CChanges Requested=E2=80=9D in patchwork.=C2=A0<br><span st=
yle=3D"background-color:transparent">Bruce acked both. Are=C2=A0there any i=
ssues to look into?</span></p><br><div>Thanks,<br>Prasanth R<div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><br></div></div></div></div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 2=
9, 2026 at 10:11=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashf=
ield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Thu, Oct 29, 2026 at 2:09 AM Pra=
santh R &lt;<a href=3D"mailto:ragaprasanth@gmail.com" target=3D"_blank">rag=
aprasanth@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; kernel-grub adds its scriptlets to kernel-image-&lt;type&gt;, but kern=
el.bbclass<br>
&gt; names these packages ${KERNEL_PACKAGE_NAME}-image-&lt;type&gt;. With a=
nother<br>
&gt; KERNEL_PACKAGE_NAME the scriptlets go to a package that does not exist=
,<br>
&gt; so they never run and the GRUB menu is not updated on a kernel upgrade=
.<br>
&gt;<br>
&gt; Use KERNEL_PACKAGE_NAME, as kernel.bbclass and linux-dummy.bbclass do.=
<br>
&gt;<br>
[...]<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 kname =3D d.getVar(&#39;KERNEL_PACKAGE_NAME&#39;) or &q=
uot;kernel&quot;<br>
<br>
Minor: the &#39;or &quot;kernel&quot;&#39; isn&#39;t needed, since kernel.b=
bclass already<br>
defaults KERNEL_PACKAGE_NAME with ??=3D. It&#39;s harmless though, so I&#39=
;m<br>
fine with it as-is.<br>
<br>
Acked-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Bruce<br>
</blockquote></div>

--000000000000b9dbe5065f68722e--
