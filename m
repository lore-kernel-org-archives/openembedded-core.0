Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.6559.1608781281116237496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 19:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rYxouVHU;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id 6so1808215ejz.5
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 19:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4R92rRv9iKMX/etPkwpA01p1MmD2VINNuB2bdeBnYfU=;
        b=rYxouVHUCpjSZJxY7ospvsLM6LkNC3etIMxZjbHk/7+7H4hj2dF1ciHjsW2OEaYlhB
         Cf4ikEh0d+eMkBWprthTU9NcKm+OD4qLvtUTI9HPt/DaOb8onpB5tLEFDa1trAVKsXNN
         /iW1uFxdtZCjwBXVEVAgH6SwB2zhm1AlQK9OohsEnDIfZawfHd4jQSjEtqnx1PQXh4iQ
         qxzp7dqjigSLoW+guI/fhxSFvVG/KUDHPGkEooFfxn+uLCJpdMWAUBIzs+8ZdTNitfRb
         w9CdkYslEHsmu3yoUq9ITFWFFWfojwqWLSJKqz9CgUPI93ernho2JSdN+3GvEGxGdnD8
         ML4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4R92rRv9iKMX/etPkwpA01p1MmD2VINNuB2bdeBnYfU=;
        b=ID3uq0oYcsQpvqJMSZO+M+L8ZX4JFfu6midOfkCcHWAIUoHxE+V2iCfyjb/espnDry
         rEsyqxgkUc0x7mdu1HzP+b1so7alOHiGflvaFJde1ux9n3oIYMqlBh1+ZjDJ8oiOO/zO
         7cXTliNFG0Ch+mLZ2cfJro3Lk9xuYcvB8afl/L+ZAUkECzrOm+H5nlLiVPuNLbwycbjH
         HztnBDTY0Sj8LRi7j1q7kDMzHVfRcBiHm75FhpoJmYMWOzQJThkgYE1i/ItPDH4qJCGW
         i4NCYCLqlS+yJpjxeFKfIjHJcCRD3gzD93DP/ITjPnb6cukcTpfoVQg1Ay42GOyRW5+j
         4iEw==
X-Gm-Message-State: AOAM532niczWLGJR5k5xSxaRWd4qlIZeaTljbw7XgcoaK975AFgWbQwq
	gFX92d66mt9zhu3M/+nm6tExFxQo8A/NT19/nGI=
X-Google-Smtp-Source: ABdhPJyyrMRQB0xx73mqmXMJXsvKkokv8+rbcQ6PGrPoZ3RoLYyQkvfzWX9Fgr/536x86TQOavGk08SEpyVlEevoIMQ=
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr25386788ejb.298.1608781279512;
 Wed, 23 Dec 2020 19:41:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
 <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
 <CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com> <AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0@AM4PR0802MB2162.eurprd08.prod.outlook.com>
In-Reply-To: <AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0@AM4PR0802MB2162.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 23 Dec 2020 22:41:08 -0500
Message-ID: <CADkTA4NZTB3nisjyFORQX=4ozQmzYvq=8nFF5fkQOkhEYpLGCg@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel: consolidated pull request
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Jon Mason <Jon.Mason@arm.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 6:03 PM Ross Burton <Ross.Burton@arm.com> wrote:
>
> > I'll tweak the v5.4 meta data and send it as a separate patch.
>
> Will that tweak the metadata sufficiently to fix the problem?  That was t=
he Juno machine failing, and that just uses defconfig.
>

Should be.

It's explicitly setting the option, which comes after the default
mode. The final .config is compared to the last option, so it will
match.

Bruce

>
>
> KBUILD_DEFCONFIG_juno =3D "defconfig"
>
> KCONFIG_MODE_juno =3D "--alldefconfig"
>
>
>
> Cheers,
>
> Ross
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
