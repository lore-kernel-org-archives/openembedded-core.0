Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8289CC0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 09:24:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9935.1689758676052973559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=gltKsVzI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3110ab7110aso6860980f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689758674; x=1690363474;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YwfcoXr4kTqOuYKk99/jwd2xeM6axXTyBWJOQ1KqRso=;
        b=gltKsVzIFBH+/ZHC9vLmE870i5rDrCpyF0Sv0VCFUcAmlrmX2ViM0y5YfJX+J1pHnC
         43XYGue/a6RDsBzfAqG8QuRtmlnFeOJ6FAWbsawYDpS0TIiaUqhY9Wijz3QKaoEyjLVW
         oWFxrq7mGU49XQpYGo3Ikb8fxoL8lxvulO//I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689758674; x=1690363474;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YwfcoXr4kTqOuYKk99/jwd2xeM6axXTyBWJOQ1KqRso=;
        b=BFtV1gtd6nUMDXi/kqg5tKHCd6oO9uZQpu04beexO3ZX7nU6PhVSmsbjxsIr36DR+Z
         3eA9ZCcpq3DkoorPQsMM/JMtckPWlVVQuTsxBRoiVNH9NvyN0rpOSjlLhtcVK8jtDfMo
         zZ6dR1MnM9eoznlleRqB8Oyj5I9z7eAK6SQUrQIubR59gSZJygCfilNKNlwQlc6coGcD
         8b9H20FxIiqj9vDN8/LKzuqQTc3qRX/hG9syNudAYF5Xl1D2CpOh0N79MZUlX77Yzr5h
         kdp4csTb/sPcEJkOJgMImqsbE4PvUjVZJTkvwtTZnq7gGST48UMdjmdOxF8DyH7G50VA
         QPHA==
X-Gm-Message-State: ABy/qLbpr3dODSukkQKZ94/dm+uDZVY1HpxMUrvtFS7GixX4TVaLjJsM
	AQ7tIK5lZp2QU++LljvX+yPQXA==
X-Google-Smtp-Source: APBJJlEKErgZIVcyk+ngoJUDgRMnVNbtN+hHzVgchiArWftL7JI/hBPxyI6jqeoOU/y/j969nwNkCQ==
X-Received: by 2002:a5d:498d:0:b0:314:13d8:8ae7 with SMTP id r13-20020a5d498d000000b0031413d88ae7mr15532748wrq.26.1689758674090;
        Wed, 19 Jul 2023 02:24:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id b11-20020a5d40cb000000b003142eb75724sm4747498wrq.24.2023.07.19.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 02:24:33 -0700 (PDT)
Message-ID: <5ef0c81123f4abb3be2234cd8598cfa0a4cffea5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Wed, 19 Jul 2023 10:24:32 +0100
In-Reply-To: <20230719092014d84e04f9@mail.local>
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
	 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
	 <2023071611474165f97b23@mail.local>
	 <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
	 <202307171246212fd06366@mail.local>
	 <9441c96a-33fe-19d4-4228-54a8f4ea413a@windriver.com>
	 <20230719092014d84e04f9@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 09:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184572

On Wed, 2023-07-19 at 11:20 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> On 19/07/2023 17:10:37+0800, Yu, Mingli wrote:
> > Hi Alex,
> >=20
> > On 7/17/23 20:46, Alexandre Belloni wrote:
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> > >=20
> > > On 17/07/2023 15:10:35+0800, Yu, Mingli wrote:
> > > > Hi Alex,
> > > >=20
> > > > On 7/16/23 19:47, Alexandre Belloni wrote:
> > > > > CAUTION: This email comes from a non Wind River email account!
> > > > > Do not click links or open attachments unless you recognize the s=
ender and know the content is safe.
> > > > >=20
> > > > > Hello,
> > > > >=20
> > > > > This causes the following meta-mingw error on the AB:
> > > > >=20
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds=
/7501/steps/12/logs/stdio
> > > >=20
> > > > I didn't find the core-image-mingw-sdktest recipe which I noticed i=
n the
> > > > above log, so I cannot reproduce the issue as you mentioned.
> > >=20
> > > As stated above, this is part of meta-mingw:
> > >=20
> > > https://git.yoctoproject.org/meta-mingw/tree/recipes-core/images?h=3D=
master-next
> >=20
> > Thanks for your pointer!
> >=20
> > BTW, the below error which in https://autobuilder.yoctoproject.org/typh=
oon/#/builders/89/builds/7501/steps/12/logs/stdio
> > seems irrelevant to the added nativesdk dependency though I have remove=
d the
> > nativesdk dependency in https://patchwork.yoctoproject.org/project/oe-c=
ore/patch/20230717071114.2734859-1-mingli.yu@eng.windriver.com/.
> >=20
> > > /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nat=
ivesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/u=
sr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32=
/13.1.1/ld:
> > ../obj_s/lib_kernel.o:lib_kernel.c:(.text+0x5c): undefined reference to
> > `_nc_mingw_tcflush'
> > > /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nat=
ivesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/u=
sr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32=
/13.1.1/ld:
> > ../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0x2c): undefined referenc=
e to
> > `_nc_mingw_tcgetattr'
> > > /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nat=
ivesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/u=
sr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32=
/13.1.1/ld:
> > ../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0xbb): undefined referenc=
e to
> > `_nc_mingw_tcsetattr'
> >=20
>=20
> It is relevant, this is because of the dependency that this gets built
> and fails. I've seen v4 but didn't have the time to test it yet.

I've still not seen an answer to Ross' question or mine about why we
can't just add a couple of dependencies and resolve things that way.

Cheers,

Richard

