Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A11C001DE
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 13:50:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.11471.1691329824818628216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 06:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U2/jJght;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe2bc2702cso36608165e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691329823; x=1691934623;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RBo762yESUN0qrS+UOcyDgP+0t/YcbDNgj5GGEkB68w=;
        b=U2/jJghtxoAXyLcGIyinE/mHUQ8v04I6LTQRyempF8B3BSuAxZIh+L2OfqhXIrGDO6
         Vsj+zUAYa8hRxnX+QdoTYxguDNrF6w+Wuf8fIYAXCwdOdHrHaLKtflt8kCTcvo7odLc8
         rwkt/KMTDT3hHpKDUlxpUYGnLFcjEDJP3BX7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691329823; x=1691934623;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBo762yESUN0qrS+UOcyDgP+0t/YcbDNgj5GGEkB68w=;
        b=dpeRO9znFQ0Owa0rhZQjxFFvyPk+7p2MBqD+sJVKEmZpaWkggKrzDv6OHU9339/Av4
         90jHKY3oBkFEvdbt8RW1rq3B0J7Tw0FzXGsxQ5AO1zvY72kzunJZLSBOr3foXwyd8vMb
         +f3F7l7+w0kY9OXi7gK6KKvoEWDw6E/kr1VDzzTWsjuwMHQac/awAuCIWlSVQ+4y8m7Y
         DQqhODZNHOw73Uy+bHBSszckLUSg8lis5M9ZbNFtOiY1jnpEb4NaIoZBY7x45f56tkMB
         Y+knmnHK21VfQ9+a/a1CbCLXgaU3SGb98bytNcDxQAsYYoxBa1abCGfqGiwFeu6RYsOi
         82Eg==
X-Gm-Message-State: AOJu0YwfQ+5LvJxZ1yUxwIVtQiLpAzXPOHWRKLzWSORMOZ98rSZgrFBy
	T0KAphQ7mrKZyYOGVAoaBf+ezQ==
X-Google-Smtp-Source: AGHT+IFshKZW4VxJ7HBtR+gmzaHDkTTJrElPuE/bpPKpJmX2wzRd2JtO4f88uJhRHff4ZASrVZ6FqA==
X-Received: by 2002:a05:600c:21d7:b0:3fb:40ff:1cba with SMTP id x23-20020a05600c21d700b003fb40ff1cbamr4984158wmj.6.1691329823094;
        Sun, 06 Aug 2023 06:50:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6cfa:509f:598b:3d30? ([2001:8b0:aba:5f3c:6cfa:509f:598b:3d30])
        by smtp.gmail.com with ESMTPSA id x17-20020a1c7c11000000b003fd2d33ea53sm7671959wmc.14.2023.08.06.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 06:50:21 -0700 (PDT)
Message-ID: <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Date: Sun, 06 Aug 2023 14:50:21 +0100
In-Reply-To: <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
	 <20230802231615.2106089-1-luca.boccassi@gmail.com>
	 <202308061238184bdb334c@mail.local>
	 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
	 <20230806132213bed8666e@mail.local>
	 <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 13:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185569

On Sun, 2023-08-06 at 14:34 +0100, Luca Bocassi wrote:
> On Sun, 6 Aug 2023 at 14:22, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >=20
> > On 06/08/2023 14:15:27+0100, Luca Bocassi wrote:
> > > Where does that objcopy command come from? It looks awfully like it i=
s
> > > hard-coding VMAs? That cannot possibly work reliably, the actual VMAs
> > > have to be calculated based on the components being added to the PE.
> > > I'd recommend to use 'ukify' as that makes it much easier, and
> > > actually we have an intern working to add a bbclass for that just now=
.
> > > But it's not needed, you can do the calculations by hand too, dracut
> > > used to do something similar and was fixed some months ago iirc.
> >=20
> > This is from do_prepare_partition in scripts/lib/wic/plugins/source/boo=
timg-efi.py
>=20
> https://git.yoctoproject.org/poky/plain/scripts/lib/wic/plugins/source/bo=
otimg-efi.py
>=20
>                 objcopy_cmd =3D "%s-objcopy" % target_sys
>                 objcopy_cmd +=3D " --enable-deterministic-archives"
>                 objcopy_cmd +=3D " --preserve-dates"
>                 objcopy_cmd +=3D " --add-section
> .osrel=3D%s/usr/lib/os-release" % staging_dir_host
>                 objcopy_cmd +=3D " --change-section-vma .osrel=3D0x20000"
>                 objcopy_cmd +=3D " --add-section .cmdline=3D%s" % cmdline=
.name
>                 objcopy_cmd +=3D " --change-section-vma .cmdline=3D0x3000=
0"
>                 objcopy_cmd +=3D dtb_params
>                 objcopy_cmd +=3D " --add-section .linux=3D%s/%s" %
> (staging_kernel_dir, kernel)
>                 objcopy_cmd +=3D " --change-section-vma .linux=3D0x200000=
0"
>                 objcopy_cmd +=3D " --add-section .initrd=3D%s" % initrd.n=
ame
>                 objcopy_cmd +=3D " --change-section-vma .initrd=3D0x30000=
00"
>                 objcopy_cmd +=3D " %s %s/EFI/Linux/linux.efi" % (efi_stub=
, hdddir)
>=20
> Yeah that's a bug, and it needs to be fixed, those sizes can't be
> hard-coded like that, as soon as you build a slightly different stub
> it's going to break.

Given this is causing multiple breakages on the automated testing, the
systemd upgrade shouldn't have merged. It has. Technically I should
really just revert everything (the upgrade and the fixes on top) and
wait until someone has a fix for this. I'd prefer not to since we
obviously do want to upgrade eventually.

Is there anything we can do with this short term to make things work?
Can the offsets we need be read from somewhere?

Cheers,

Richard




