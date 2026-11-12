Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9270.1794473655629902421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 00:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H44rcQGI;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ec396c93dso47394946d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 00:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794473654; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4W66Sh+9Zo660FseqDLDnYVNEVeDDRfnb2HlRZvmq8mZq6jZ/QBmkTE9eu6Pncktm
         pQk9TQjKEcqPoEnOho4HrKz4nKYvPlbItzF8cfwYkBnsnXPghyepw3DXd8iZ06DsomjE
         N13BYXh3oOH2GXJrEBYI+jSt9WQaCQP4JVx6bEN6Ui8l4vqdn/ad7SgRqmkZC83Ow4xu
         97BfwHG6T8e+cemGdt6DBHg/wOnYja7oTXoK+Q4PETguu8RJPo/5iz52SgnJ7Uusohuy
         UN7Um9REZtNPzdbbfkgnkzTCmPxBAyP7gdcNvS28CYamMj2bY7yXH3RljfOxUuxtO9li
         oUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k92OmhPwZJrXUs7afrmIsoPQsDfWfDiiWNrHGDQ0pl4=;
        fh=FxPQcvcPQCuYv5p+cTI4sfqaVBcM23gFaSmq5pfnDY4=;
        b=CUBC2LkW3xn6CnaWn5jme3H5RNhiwPpryI+K/BaLrS93hKRXJBxnZF4hy21atZR8fA
         mW7irAe4nS+CDfbn5sgK0bToVKg4agqj5MjdnWQcWjgV6tYsS0gudzpmb08ffg0xAmst
         aCbgwsw6iW63yai21z5Fm/xWX5pPqtHkkizMhqTIZXWB6q0AhEAzvCgv/vjSdbQK4EpX
         7dG035k3JGC1p9uBC4tYpTBJ7sL2j1h5mLIyjnGss27KA8c8NxaME3iJu8/CDVXQ8uME
         FG9c8zlc8NEcZvEDQk8vLdCpaJW6R/HCi2jHEd9U5WsY8QJGH2Gzx2Rp+aARYn+4PWNM
         sU8A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473654; x=1795078454; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k92OmhPwZJrXUs7afrmIsoPQsDfWfDiiWNrHGDQ0pl4=;
        b=H44rcQGIwxDtPfAmiMv2+3RC41MCqyd5wJNmJ0y8V24UrX/6wxslT9GpSXInmZ6Yw2
         6C/3jJqqhGJIHlIo52YM7zpoBEqSmNuw4IEbpun3P8gzc3LjXAL/Y/ydxTrR7p3Yc7so
         7I6oxVhJNMwDiTeowWdrxM/W82bkofvjcyOIIs0ca+j5+Vebd3wOPyClvMbJy4ioXSam
         /6xgLTqxy06yuSIQ95K+AbmUdl+ElCHQraEgxpQcJZgld8cDcHkSn3K7t51QNKFMx5yK
         ifjk0gJ6xj95rnqSBG1netlxLXNgSXKBWdUvLyx2iA69YKMNY+SbtV41khGAZ2qIdekC
         vMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473654; x=1795078454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k92OmhPwZJrXUs7afrmIsoPQsDfWfDiiWNrHGDQ0pl4=;
        b=BQPzVHL7Hll7MG8GsTeKz19xjKjweKwYk2kTrT8+Zu0ZhFTfdlAeCV7Hki0OCCmRNz
         VS+wyyvHkPpGZXkaCi1/x4uY2OllfEO5x/IULN3PZSKxSFu60hB2p6ihiod3z7y7hZzS
         CHD8WMwVtHvb3B2qVy7iPngw3v4UpSQqWJbRZNejCP+ek02XeCTiEKQLEaAGSG/CWbHi
         Rlyd3en1U7U0+GJwcJqA8DrM+TiGInkw8npw8/ryKvpRMrEICCXZe8GFpFropR26m2FN
         bJTwngfmCzo5Oj5lJqn/9SkkqgFupkmADq6skiN0t9U5PpLd2fYsi5i7SHVdCzrz5QRq
         M+SA==
X-Gm-Message-State: APuU4Z+LGsjqGJ7c7gHJRFClJ8Uexh+GYFxq96Bf6enG5yaNRAjqg4+0
	bRN0ppGLyBprCCo3dXK+vHQel9cvUooqF6iPNPPXUoA4LguPYSq2iMEWOjzAIp10N9MtT5rEBsh
	jbylM7GQqjkEGqRURTZTHKeADdXihEkeSdQ==
X-Gm-Gg: AYBFou3pTor2VEfzmdMz2eY11qk/ENe6KhhUgdb+2dKpJwZq1OGSzBiM8wnd164jfjF
	jmHmhJWO25pUZvi1ru4m+C46F77W1tW0A+m/Z+wt3Xq17ivHB8xGxPoDza4bX3tRUUSdEbwBC1P
	mLPWaod35KJHkBQi1sXYILMfJqr7BwzTCH2ECPqXmci5cAw0RZrkVDqguu/VJHG6sLrAZzWZLNV
	tQD4Uvl4s0gK4URIOUstOUfE0DdXL6nsielxhteBXvyrQyBw1t+nf27cNr5A8hGtatAP7o2ctj0
	E09ZhPyyhsOPZUTObhqNQYBEaT04xj3R3kJlRcU0KxubYWzXXPFpf96xZU3rFRd6YVALEWygPSP
	FJly5kuOMU9l7IyjwZ3RyrCizGNk9oZASWUvNhuI/wbiF7VyH5SxLUTBA3/zHW6UCKW1SGojI/F
	ZcWUj1PBic3dBp1V0n
X-Received: by 2002:a05:6214:80d8:b0:91f:b96:1094 with SMTP id
 6a1803df08f44-91f0b962493mr49701256d6.47.1794473654371; Thu, 12 Nov 2026
 00:54:14 -0800 (PST)
MIME-Version: 1.0
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com>
 <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com> <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com>
In-Reply-To: <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2026 09:54:03 +0100
X-Gm-Features: AclHuK9qV3MSkJu9fXNOlVRBYp4uTHeCeefGOFiuejS4IaWax0BkbvG_YRbhVzE
Message-ID: <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com>
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ba4c6406601074b4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 08:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250079

--000000000000ba4c6406601074b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2026 at 09:35, Sean Nyekjaer <sean@geanix.com> wrote:

> Globally in my distro conf.
>
> I have tried:
> INCOMPATIBLE_LICENSE:pn-os-rootfs =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=80=
=9D
>
> INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=80=9D
>
> INCOMPATIBLE_LICENSE:class-target =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=80=
=9D
>

What is os-rootfs?

Setting this globally is obsolete since several years ago and it only ever
worked in combination with meta-gpl2. You need to put INCOMPATIBLE_LICENSE
into your product image (which is the only place where it matters), and
then it will be applied only to that image during do_rootfs. Is there some
documentation you followed which misled you?

Alex

--000000000000ba4c6406601074b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2026 at 09:35, Sean Nyekjaer &=
lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Globally in my distro =
conf.<br>
<br>
I have tried:<br>
INCOMPATIBLE_LICENSE:pn-os-rootfs =3D &quot;GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=
=80=9D<br>
<br>
INCOMPATIBLE_LICENSE =3D &quot;GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=80=9D<br>
<br>
INCOMPATIBLE_LICENSE:class-target =3D &quot;GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=
=80=9D<br></blockquote><div><br></div><div>What is os-rootfs?</div><div><br=
></div><div>Setting this globally is obsolete since several years ago and i=
t only ever worked in combination with meta-gpl2. You need to put INCOMPATI=
BLE_LICENSE into your product image (which is the only place where it matte=
rs), and then it will be applied only to that image during do_rootfs. Is th=
ere some documentation you followed which misled you?</div><div><br></div><=
div>Alex=C2=A0</div></div></div>

--000000000000ba4c6406601074b4--
