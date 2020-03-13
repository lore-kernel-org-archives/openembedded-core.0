Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 374D061CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:07:46 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t2so3218931wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kEpCFCPRacatVO7dupAFLCsDXKkwfMW7/O8MltWkT9s=;
	b=CejxEOi5DW1Z1uqiVlaThl9sWvUGkueZA21O8dDuJsXu9Kvo1YXSCLvRTlsP5jqIYo
	midSvhPk7poy1RmssJDSCSywkW6Md4Jl+jC5aJ9eimz32KI1PShC+lQgz+Te10uR2GYv
	if/CFd7yFRmL8tZRRv59oj8Edh+lUkWtqyu7oNcXv8UtyrHX8RCwCCqCdokR6SgSaoME
	XiWlYhYp+diNSn5XAkGm63uoMzKmnnm5jCELg2rQtZ0YXVDyNh8FqOhm1BuE8CY56xxP
	RCHy7v7l9ZX6A2xESKp+mXpC4miGkq8tSqFonPtqFAv9F290VvSwPhMQVqzOrtZQBcjp
	8u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kEpCFCPRacatVO7dupAFLCsDXKkwfMW7/O8MltWkT9s=;
	b=HEQSzalQLeE7ZRAySOShM7dWv9WctIaXu5kwwxo/0sTX62d14IeNyUb3y3msStUYTY
	/vnWW4YIm05hEcReKc+H+M15Hx6QydCRYMcBsMO4QrvLuh1z3NA7xTYb6ONCt4uKDdCy
	qJ+OfFsF0n+jLmsCcAVnPegK/198Lu9VRjAFCrqpJIEwC79gca6cKg9KVqVLbOQR8tIl
	8pOweXpo/kmP4nODMj46IW4L0gUSIhJHyQvLVOV8BRrriln0ngs9oxsDit/dnqs22v2T
	ZScPtitStvHiY8vDuRVYi9OG/8RcmZo5hf7TJE+c9ijZaRvDRZXPfMyBiv3injC/569r
	Hvnw==
X-Gm-Message-State: ANhLgQ1+mB47MnPENYWu0hQvsI3Fcyz86hNbKJvsu3S8RmZ8DOdb1Bhn
	co5sGw0XV/39Y0ifuv+XXbAU343AhUEsaK2HLKA=
X-Google-Smtp-Source: ADFU+vs638Mx93hJsGuSdehpKfR3rywMDpLDX5/MCAOEFVmAfNRT+R2wecOvRcXB0SNEiQdZTle3MnBRDusTslwvfnQ=
X-Received: by 2002:adf:db50:: with SMTP id f16mr2359849wrj.73.1584122866832; 
	Fri, 13 Mar 2020 11:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSGmz-GRFac-UR6AcTRyUYjvf1buRaYQvvCMrr__OuV_g@mail.gmail.com>
	<20200313164014.GN1578@denix.org>
In-Reply-To: <20200313164014.GN1578@denix.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 13 Mar 2020 19:07:34 +0100
Message-ID: <CAHtQpK7c88eUNPDcCoX7OdrDzhNhGyntYU53WqrJXXbSYtT7nQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] menuconf u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2020 18:07:46 -0000
Content-Type: text/plain; charset="UTF-8"

JH,

Please refer to my replies to Denys, cross-posting to unrelated lists
is generally not a good idea.

On Fri, Mar 13, 2020 at 5:40 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> What's u-boot-imx?

This is U-Boot fork for NXP devices (former Freescale), which is not
maintained by OE-Core.

>
> It's definitely not in openembedded-core, so there's no reason to cross-post
> there.
>
> If google doesn't help, it's recommended to post such specific questions to
> the corresponding mailing list for the layer this recipe comes from.

The correct mailing list would be meta-freescale@yoctoproject.org and
JH already had some questions posted there.

>
> If it's not clear where the recipe comes from, Layer Index can help:
> https://layers.openembedded.org/
>
> Thanks.
>
> --
> Denys
>
>
> On Fri, Mar 13, 2020 at 08:15:17PM +1100, JH wrote:
> > Hi,
> >
> > I tried to run bitbake -c menuconfig u-boot, it popped up a terminal
> > u-boot-imx configuration:

It is not clear which yocto branch/machine you're trying to build
here. If you provide more details - then there is a bigger chance that
people would step in to assist you.

> >
> > make: *** No rule make target 'menuconfig'. Stop.
> > Command failed.
> > Press any key to continue...
> >
> > How can I  run menuconfig u-boot?

I've tried it now on the [master] branch of yocto for imx8mmevk
machine - it is building OK and I have the menuconfig from u-boot-imx.
Hence, please refer to my point above regarding more pre-information
on the issue.

> >
> > Thank you.
> >
> > Kind regards,
> >
> > - jh
>
> > 
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Regards,
Andrey.

