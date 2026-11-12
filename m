Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12866.1794489326263217736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 05:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e4TduOUp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so37319455e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794489324; x=1795094124; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w77Dcmzo5NgO4j9sDCcstiP5uTWjUxdj8ruei7Bs7Uc=;
        b=e4TduOUpY+jc/8azqU1OfuQqz/qxP9phgL0G1evHPm03J4ZgCd0LBPZNLaFO2mN+jq
         LaIw3W92mLSANHj5Ty9W0yF+Lzhnw4wQP2GV0nrNcjQBx3HI4Lg8uHzkY/u7OFpRLDF7
         McpOcnPFFpqXnN7Bs/XSkgHcJw+Us0dZOEcAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489324; x=1795094124;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w77Dcmzo5NgO4j9sDCcstiP5uTWjUxdj8ruei7Bs7Uc=;
        b=PbiElhfxah8BpbBVZACrZR3HcPExvwcFluBtxdVoNBdHBoIz/bdFKIHXYEO7ZxqXo0
         yPq2rlaWZViaJGlpfzy6NJ/FyJ5XQ1bKKfOpCl7kPv9SxlIdFMUbbIFzxD0vAfwTXp/P
         As5kjpMDuA82V6vgh/DmE5XWl2InOxmZhclAJTQPFwO9UaP2tCcTemujRXLcxtRzzqUK
         D9D/jne0AeVnKoi2he+QZhMnyXWvpUii4ZqrO2LQ3w+mUD2GPkdPOmNH+eEi3P6qC5r3
         iR9bsBOEFrmJJwW2zEdiSpHvKy1mNJb8a6Ih05/iIEm2eTZpUQLUX9s8LbTddl16oR8E
         6mXw==
X-Forwarded-Encrypted: i=1; AL+hErEEWaTL1fpa8DmyoTQQn63nYLmyQptmWMFLNsqP4EVohF+Pes4Qcx6BmN7xTbMA2c6ix1fy7bIhk6fmp2LRL6l9gQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/f3mmONSqYbmFeZoom0aA68tyyvSaGp4c9x8Go3M87xIx73odl
	+U2ZwcNCzAke7q4SrB2m2vI/Z/bARS8jJT+4npfORGTHl4pgMMFEsrPBxeIV1XNPPRY=
X-Gm-Gg: AYBFou0vnVVyWv1Y2n/lGaQqBJk0HuG0jAx35NiLP/IGCRXomX238dVnvryeANXyWNE
	qOgtghwVoHAYO2Se+lgMeSVFhWsrF1qHy/P817gBMek1t0cRr3I+qNiQAu0DdrcVDDvEz2AwSNo
	0ctyOu26dd5BmgzIzZeSr+vMuHHQizRZppcO3yv+vLo3OlyafcXJzzVDeqnAcbDUbGtCva6Bo28
	U51A9rhpKJjThRvA/8fCurT1kP2H4LS45zxJe7xOQp5Gwnm3YS5oNAoOUSXObJvrP3iDG16Zl3u
	Gxn1gh1biLq7tmHQ1J9nPdDm10v+S4StHCt7+XGudKmZC0zuLO1kkLcM6zAxNd1KZrqqD+fYr5L
	cJ8TgGVc4pDePykB7jW52SdBb/Is2yidc0lUpX+EHesJu0alfIvt64+eBDJNXW7/1o1eazwFa0T
	ScDEDG29M7nPxowrykMEJGxJxCaQofIja5BBf/jpx55M6T/fc4twZQbwN7x+M4kv8YX3B4jQmZ6
	ZinVAjcwg5P89q1W3+qhyQKr95Ip7dLTzsTkml6KWC/tb+d8zj6WmwlNxy2orTUmcIBTt5XNBCC
	fa9IvpEkiXMla6qKBxKJLg+Zc6Q2nWOQeijmJQt+5JwpLU6sBr8XDkv4mOl2qEtvpRNYKnSdpk9
	dgUsyGz9UNC+5+jZT08s=
X-Received: by 2002:a05:600c:3554:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ba0937ded6mr103128975e9.31.1794489324466;
        Thu, 12 Nov 2026 05:15:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1562:9f61:e354:1b51? ([2001:8b0:aba:5f3c:1562:9f61:e354:1b51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm79027315e9.13.2026.11.12.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:15:21 -0800 (PST)
Message-ID: <009b6c46042e0aab4046eb4bb24efeb63a06cb96.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-grub.bbclass: use KERNEL_PACKAGE_NAME
 for the image packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ragaprasanth@gmail.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Date: Thu, 12 Nov 2026 13:15:20 +0000
In-Reply-To: <20261029060913.1586484-1-ragaprasanth@gmail.com>
References: <20261029060913.1586484-1-ragaprasanth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 13:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250091

On Thu, 2026-10-29 at 15:09 +0900, prasanth via lists.openembedded.org wrot=
e:
> kernel-grub adds its scriptlets to kernel-image-<type>, but kernel.bbclas=
s
> names these packages ${KERNEL_PACKAGE_NAME}-image-<type>. With another
> KERNEL_PACKAGE_NAME the scriptlets go to a package that does not exist,
> so they never run and the GRUB menu is not updated on a kernel upgrade.
>=20
> Use KERNEL_PACKAGE_NAME, as kernel.bbclass and linux-dummy.bbclass do.
>=20
> AI-Generated: Uses Claude
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Checked with bitbake -e: with KERNEL_PACKAGE_NAME set,=
 the GRUB
> =C2=A0=C2=A0=C2=A0 scriptlets were set on kernel-image-<type>, which is n=
ot in PACKAGES. With this
> =C2=A0=C2=A0=C2=A0 patch they are on <KERNEL_PACKAGE_NAME>-image-<type>; =
the default is unchanged.
>=20
> =C2=A0meta/classes-recipe/kernel-grub.bbclass | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-grub.bbclass b/meta/classes-recip=
e/kernel-grub.bbclass
> index 2325e635e1..7c6abc5b4f 100644
> --- a/meta/classes-recipe/kernel-grub.bbclass
> +++ b/meta/classes-recipe/kernel-grub.bbclass
> @@ -98,6 +98,7 @@ python __anonymous () {
> =C2=A0	fi
> =C2=A0'''
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"


I'm afraid I'm not happy with that fallback default. If something does
change in the code paths later, I really want this to break, not have
inconsistent values. I'd therefore like to see a revised version of
this please.

Thanks,

Richard
