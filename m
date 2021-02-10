Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.8748.1612977282621047770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 09:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GBoLzoAt;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: raymsmithuk@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id a17so3868634ljq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 09:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V6Bma/TOaZZ5sqxVbmn82lkYaoglqg+Bnn/reUnZi20=;
        b=GBoLzoAtjKI/rq8W/+A5oBCPLUaCZcGO2xUeJCLF0bJ3BUR/gcO8UIW0BvZgW28mRp
         C6iDaXU1zJyJOtbFvwHgBqlQLJwBd26+CoVlMrWO5vZ9fL0a6IzqBeivVa+HmiQeUoe2
         dH0Ts9gyU+sbLQdh2UePdCj1KrMjQlSBu0SVnHY39Dc3vs+Kl/ZWfdBnuYe7YzzJ+aCB
         e/pa+Qmeu0/P6prpaYhakCmgXVqdNoAiLBqnISUSQLFgSm0r59NuB0bntK+1OkLymGox
         fy1cWWJjwHVE5Rrif06r5arqOX0I/5qZ4s9pKF6cvuYbgkeapwSG38OccPBh3bOK1w6j
         sHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V6Bma/TOaZZ5sqxVbmn82lkYaoglqg+Bnn/reUnZi20=;
        b=iOyCIWfeeulYpXuZFrhjju9KauPWT6ZqS8Tox4JLYkxVExFLxyIheaOBgaQRsp+vrK
         1qIFb/0j9O5qQ64pgVKw/Iy0vTrlYiFrNvMFW+IyH6ifSKog9WENLYua+e2Qh4w21y9F
         FDSwErUoayZpd9rj02ze25nVPKorOzhVsYDFTGCqfgKxmoNlJjI/x00AZdMkqxIKiuB4
         Nhyq6QmSmiIrqUnzohDBht1yViONKtX6zEmKXxVL03PAGkrhZkIt3FQ+O82kqDoaVImv
         SafpoEo7Ssmy77wGQnm79Z9i8phFnpkW84+UnLQ1Y1TPJ/z9f0bk6ChragSFecl+Yo26
         Sfdw==
X-Gm-Message-State: AOAM5311HFGCyc1mR5iSgfhv4VPFqADqwut4dcl3QTGIgzilQPhkHhLM
	rcYoIDk6okPTBEMBj4eD351+WHMB9Rl8lCVJdnc=
X-Google-Smtp-Source: ABdhPJyQ5HrfuercroPuEg0vtzPvdgdCiLzlikd2mFF4R5eFtl0Bht1fXona0HJv3axR3b+TEYN9o+9vbdeLD9WX+Tk=
X-Received: by 2002:a2e:974f:: with SMTP id f15mr2527842ljj.412.1612977280759;
 Wed, 10 Feb 2021 09:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20210210111113.17318-1-raymsmithuk@gmail.com> <37de26c1-3d02-313b-dd91-7e3fabe93928@gmail.com>
In-Reply-To: <37de26c1-3d02-313b-dd91-7e3fabe93928@gmail.com>
From: "Ray Smith" <raymsmithuk@gmail.com>
Date: Wed, 10 Feb 2021 17:14:29 +0000
Message-ID: <CAHS1ALJjxL2uVWGiBbJBdGxtbO395CMsEHsuUdBT8mB3DwZf1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d9b9af05bafe8965"

--000000000000d9b9af05bafe8965
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 3:15 PM akuster808 <akuster808@gmail.com> wrote:

>
> Did you run yocto-check-layer to ensure this passes?
>
> -armin
>
>
I didn't, but I don't think it makes sense for this. At least, it fails for
fundamental-looking reasons when run on oe-core/meta without my changes
(assuming I'm running it correctly):

~/src/oe-core/build$ ../scripts/yocto-check-layer ../meta
INFO: Detected layers:
ERROR: meta: Can't be DISTRO and BSP type at the same time. Both
conf/distro and conf/machine folders were found.

--000000000000d9b9af05bafe8965
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 10, 2021 at 3:15 PM akuster808 &l=
t;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Did you run yocto-check-layer to ensure this passes?<br>
<br>
-armin<br>
<br></blockquote><div><br></div><div>I didn&#39;t, but I don&#39;t think it=
 makes sense for this. At least, it fails for fundamental-looking reasons w=
hen run on oe-core/meta without my changes (assuming I&#39;m running it cor=
rectly):</div><div><br></div><div>~/src/oe-core/build$ ../scripts/yocto-che=
ck-layer ../meta<br>INFO: Detected layers:<br>ERROR: meta: Can&#39;t be DIS=
TRO and BSP type at the same time. Both conf/distro and conf/machine folder=
s were found.<br></div></div></div>

--000000000000d9b9af05bafe8965--
