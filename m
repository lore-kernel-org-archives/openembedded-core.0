Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5271.1793216496338321216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CKT8ud/+;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91bb5795792so15600716d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 12:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793216495; cv=none;
        d=google.com; s=arc-20260327;
        b=sNgBjbubOJQz4ey28vKbl1Efdr7nzkO1iaBDc00kmRO9xZiHwAU4/7abz9Tw3Fi1PN
         HiJ7wbxr1PGRLKH37VaTjC0fpR7V4aO/VUeGBEzoyJ7cUU3G0g8W29qPBcjsMnz0c7uE
         kNAq37HR5MaBLq0ABgHEz84JXZgRh56gUleB1nFqxEbOm4zVREUSxOJ1Mx5P4F5vZLdR
         0VHNcMxlBEEWmGSIw6/gCStAv3Lbt3QORhO2M9eNlr4DaM9hSEwVEpGqv1wlKHY+81IJ
         uFkhIMdaZtz3BpIbx/YVJmJlwmpmyCog9EbioR2mZyjx2MB5p///Ko0hY1aZME8qc8tu
         DIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wEdDME74NGWRjuYMULoHeHePECUJigo8n06SZ6BrLJI=;
        fh=7dEbV1WW9m2j1KP9EZeCCRc1Xki8fKT6cElcswOnG8s=;
        b=hNCITlc3dUxJyNi4lUWYPM84RpjoXRDvO/rXjJvh6l69KQ1ZzNQlLSa54F41621gAs
         JKLcrWwPI7kwoAXrAjC0AtZE6TXnE7GC2Cp7+hnaAskzku0+yg3Lf7olV49Z837TiiXd
         UPXCGkZw/XVidKJ2JiTgo+/MzzJOBeH6huj5tOsqgMb3MYZ8Ps4iMlWOrIsq7eq1eqmx
         dF9b+6zcQpAUE2B+VjoizHBilCKxt5uP0hyYNOGLnfbQEXPcZF0aKPMewlFaWKrVgM1X
         yNSj+jEGgeJQrYAYETPIEybyupq2M8ZOAXTQjUxedxHMy7eIWvyLh4PnLR+zh60cqvzT
         N2SA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216495; x=1793821295; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEdDME74NGWRjuYMULoHeHePECUJigo8n06SZ6BrLJI=;
        b=CKT8ud/+A2nmLfgwrnsFkt3DTAp7RJpPdZSyZr0oZRKty1tD8xFvs+40NilmGcZin5
         HPw5MMV76SCteUA7DqEdsSfrT0xQ+SoOTL4tkuM4ZAYGYYHLmfwPIwPxP1gXs1SAzFdH
         RG6No4JhcnqybglImOgFQhdc7aZoLP9PqKbDj2YWn8GRe0f7JqCIsK4rPnTIy9myrq44
         P3Aux2PyRO+jZDwo/QiS7VsatAW76UkWjNS/EeyVNY+liUkK4dNKL7E/tPPH83b++C5K
         asXWyiYLnhVRTvMybl1DX0XPVpSQbedl9sLutJjnTomMpCAQmY1TqamkhM2PaaqFzbZ3
         LsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216495; x=1793821295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wEdDME74NGWRjuYMULoHeHePECUJigo8n06SZ6BrLJI=;
        b=LxN6mXDR+/0WVBK5Na8GhO1PsTgKxFrc2SldV/7OWnD6Hsd6rf5UncKJX26hqiXyVL
         MzOS5DedCeUNYCOXjOlC6NMAz4WehhRT9LJIhHB8c200MDXkSWI3Jzvdsq48eHPOcYL9
         3YPrrJIzHzHX1C/S4AnN+TedBbaGQidlWEhUrooTUVfsxVMULMBvarSc2g4Qed6ASYZB
         7LCy6In6odC5XfjodfjWvgmHTF2g8j7YlUW0hUssjv6jhzC2edIu3a1iLp4mKHH8hYWg
         ev06Nc07UX/MMHUYoXGInJXd7nbPmz7SW3DY+UOuFiXOI5mHUcQQjabNTt4wEkhs43hB
         MbDQ==
X-Gm-Message-State: AFq9FYJD8O4eVH9VL2Tf9c0Uf2MMC30EavJDzdvO6Qi7BXjC3a7RiaR1
	BEoy5dDJNqgHCUqeOTnJnVd4GulOaIib3QnmLvFS52TFYPNr28Qf5HcOza7D5+GMQiCBnFyL0cz
	ZCYQeXYclDJoowwcocnz3bWzIx4dcc+Y=
X-Gm-Gg: AYBFou1uWWKHquxLm7dD5TYYlsBCVPAusx2CMId2Xnpt9aunHo9JNagw/SjfVO7TC2j
	hWtySP+GNLGdO2abPL27pGq84mVpLmKlJdWSLFsJ6+Scit8JnwK+8Lnv5GOCXaP3OuWpjKkqul4
	1u70qEY36Dm7UEKqK0Il/aiFdUB/owByTl9UQAhD47tbDf62G17Nk7kOwszSSk4ifwnIa2rdt1x
	QRa4qqCht+kGna7ORMY3WJ1JxR5NxYMKfhYXW/QKaqSV8KmMHqFvU+7yBb+68FATm+EKWar0BfB
	KoGrQFHr0oBA+1/LySbSiVfnXlJB9ILaNUx0u+eP2liUNNfCne98xh1kYcRHGGDp7tW/JfP9kvn
	NWsaiuD81I9w75uf0r2Kb8DyBTzDerDqKJi7eC05TsQ+7DNxuba/Ao7+52gwjpS5DpXPVzfg=
X-Received: by 2002:a05:6214:1bc5:b0:91c:75df:650c with SMTP id
 6a1803df08f44-91c7d2346eamr57416896d6.56.1793216495150; Wed, 28 Oct 2026
 12:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261028093240.345039-1-ayoub.zaki@embetrix.com>
 <CANNYZj__g7pMtjyu-yBj1aOtTkRPqfy7kTPWsL4yPo_jwyb4Dg@mail.gmail.com> <021d92db-a77d-4cd4-aa41-73cb43ed3bfe@embetrix.com>
In-Reply-To: <021d92db-a77d-4cd4-aa41-73cb43ed3bfe@embetrix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Oct 2026 20:41:22 +0100
X-Gm-Features: AclHuK9NtsGcpeOoArk-AzzcKLebxd3sCBVgf7yBRUkBaDBCBt4TuLcnE9lzruQ
Message-ID: <CANNYZj92Z_LBBqwDoiPMkefbeEmquaABPzQOYZ_Dcm6zMUb9Ow@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH v2] pkcs11-provider: import version 1.3.0
 from meta-oe
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: openembedded-core@lists.openembedded.org, jlu@pengutronix.de
Content-Type: multipart/alternative; boundary="00000000000032ec47065eebc043"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 19:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248825

--00000000000032ec47065eebc043
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2026 at 16:58, Ayoub Zaki <ayoub.zaki@embetrix.com> wrote:

>
> The primary motivation is OpenSSL 4 removing the ENGINE API rather than
> avoiding a meta-oe dependency!
>
> PKCS#11-backed signing now needs the provider-based integration.
> There is already a concrete consumer in OE-Core:
>
> U-Boot=E2=80=99s OpenSSL fit signing Provider API patch:
>
>
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipe=
s-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API.patch


This patch  was added to u-boot recipe, so that it would build without
errors with openssl 4.x as a part of an update patchset to that openssl
version. That doesn't mean that the function was tested, or that oe-core is
expected to support the use case. There's lots of oe-core components that
load plugins at runtime, that doesn't mean oe-core should provide recipes
for them all.

If you want this in core, you need to show how the ecosystem would benefit
from the move. There's lots of meta-oe recipes that could be moved to core
(actually all of them), what makes this one special? What layers are using
it, and do not already require meta-oe? If it is added, how can someone
confirm that it works, using only oe-core?

Alex

--00000000000032ec47065eebc043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 28 Oct 2026 at 16:58, Ayoub Zaki &lt;=
<a href=3D"mailto:ayoub.zaki@embetrix.com">ayoub.zaki@embetrix.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
The primary motivation is OpenSSL 4 removing the ENGINE API rather than <br=
>
avoiding a meta-oe dependency!<br>
<br>
PKCS#11-backed signing now needs the provider-based integration.<br>
There is already a concrete consumer in OE-Core:<br>
<br>
U-Boot=E2=80=99s OpenSSL fit signing Provider API patch:<br>
<br>
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API.patch=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/open=
embedded-core/blob/master/meta/recipes-bsp/u-boot/files/0001-Add-support-fo=
r-OpenSSL-Provider-API.patch</a></blockquote><div><br></div><div>This patch=
=C2=A0 was added to u-boot recipe, so that it would build without errors wi=
th openssl 4.x as a part of an update patchset to that openssl version. Tha=
t doesn&#39;t mean that the function was tested, or that oe-core is expecte=
d to support the use case. There&#39;s lots of oe-core components that load=
 plugins at runtime, that doesn&#39;t mean oe-core should provide recipes f=
or them all.</div><div><br></div><div>If you want this in core, you need to=
 show how the ecosystem would benefit from the move. There&#39;s lots of me=
ta-oe recipes that could be moved to core (actually all of them), what make=
s this one special? What layers are using it, and do not already require me=
ta-oe? If it is added, how can someone confirm that it works, using only oe=
-core?</div><div><br></div><div></div><div>Alex</div><br></div></div>

--00000000000032ec47065eebc043--
