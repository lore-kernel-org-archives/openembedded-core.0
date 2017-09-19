Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 12DC9781FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 13:21:04 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v72so1728728ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=CRz8Z5DMaF0XViApr/3hws5vXDK81DUZSwVG0T5wKDw=;
	b=c1Fb96Rhxwl1Xzam5Jhbi11fj/I/QA3Zej4TLd9Wr056wYeZhLUUby7/9Bea2dEbBD
	C08gOim2XSe9Qp3KTHzGwfbnBkPvvHxOw858TmYwmGFjSrhEvk5DZ9lYzNVj6ldKgS9K
	rD5e1+kKIpJy1ibj7zf5kfSFlR3TtrW6RnGE5Hrq7ytRlE9NwyywcKQL4GBDvgJgIx1o
	QiZS+RqbyNnhYOoKIoK/QXA628kjF1152NB+u1SdmzLEvt4BCAOSf9oviGNgVDbkFrQF
	WLW9zq33SmAGkUohhrM5ru+EOOR1AP1RY+5jm6HW6z8B32BrUHVpHuQvuzr+qXPtzlyL
	secg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=CRz8Z5DMaF0XViApr/3hws5vXDK81DUZSwVG0T5wKDw=;
	b=eJz30O0HHYjmAEFT3XUbTlhm2qPpd78D9R6zEBb7M53VsgYd01/p3I2aFMx4xXCRRb
	sDXL3qoGgrHk0xbgWaxWVTAvPrUOHSGFCaG78GCaTWdHrQNHBCn0llqC1XQRtJpKESnv
	OyHp4xOqV+TZxhz1j6d0o+iJKbj2zZ2DddWxF36eVq/4nd/UG4A29P9m9/rKu1UMSDew
	tGZ5uYFyGaLZ3c2DfPkC2kO1xIrv+QVpVMjCvyBf2ctbaIzXNVCBwKO5LwhkSEfn6Qwl
	EXeo6tD6LjLpKcKvhJoouefM+8EwLeelcXbQuTVHfpac+nzAp5d5KjGjFI9IvotOYdAa
	jWpg==
X-Gm-Message-State: AHPjjUi1XeBehM3xPt8UsiSCYDWOqMZra6xZgpVPmuFcTawPUbiU7DoT
	GXw5RAF7En1qYYZD/rODv4LPik5m
X-Received: by 10.37.116.83 with SMTP id p80mr659271ybc.34.1505827263963;
	Tue, 19 Sep 2017 06:21:03 -0700 (PDT)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170])
	by smtp.gmail.com with ESMTPSA id p6sm4011321ywp.85.2017.09.19.06.21.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 06:21:03 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f170.google.com with SMTP id i197so9857473ioe.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 06:21:02 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB974asCw9q9J/Rq6woN0aUWyek0kC1dXAI+GBQTgT1y20bz4LzHgqg2rYl5jVockCu6PkaXNHpZq2N5oeRYDo=
X-Received: by 10.202.83.10 with SMTP id h10mr1423825oib.56.1505827262103;
	Tue, 19 Sep 2017 06:21:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Tue, 19 Sep 2017 06:21:01 -0700 (PDT)
In-Reply-To: <20170919123920.GM17137@bill-the-cat>
References: <20170919054058.20380-1-otavio@ossystems.com.br>
	<20170919112634.GL17137@bill-the-cat>
	<CAP9ODKoSKajx42ti5DD6tEnzseF5SF=4cdU1OjEUo2at=k0jwA@mail.gmail.com>
	<20170919123920.GM17137@bill-the-cat>
Date: Tue, 19 Sep 2017 10:21:01 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqArDWAs3s=HrbzZGcJddPDAg+jEFMxZ5kk2aQjgO46Jw@mail.gmail.com>
Message-ID: <CAP9ODKqArDWAs3s=HrbzZGcJddPDAg+jEFMxZ5kk2aQjgO46Jw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 13:21:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 19, 2017 at 9:39 AM, Tom Rini <trini@konsulko.com> wrote:
> On Tue, Sep 19, 2017 at 08:53:38AM -0300, Otavio Salvador wrote:
>> Em 19 de set de 2017 8:26 AM, "Tom Rini" <trini@konsulko.com> escreveu:
>>
>> On Tue, Sep 19, 2017 at 02:40:58AM -0300, Otavio Salvador wrote:
>> >  - The environment tools target has change to envtools;
>> >  - The HOSTCC variable must be used to set CC for cross;
>> >  - The ARCH variable must be set for cross;
>> >
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> > ---
>> >
>> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> > index c2e8f0fb84..21ab5b3e6d 100644
>> > --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> > @@ -5,13 +5,13 @@ DEPENDS = "mtd-utils"
>> >
>> >  INSANE_SKIP_${PN} = "already-stripped"
>> >  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}
>> ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
>> V=1'
>> > -EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS}
>> ${LDFLAGS}" V=1'
>> > +EXTRA_OEMAKE_class-cross = 'ARCH=${ARCH} HOSTCC="${CC} ${CFLAGS}
>> ${LDFLAGS}" V=0'
>>
>> Since we're messing with this, U-Boot's build system doesn't take ARCH.
>> It's one of the variables that you pick in Kconfig, not set so that
>> arch/$(ARCH)/Kconfig is sourced.  We should drop that.
>>
>>
>> You can't. Try dropping it...
>
> I've never ever built U-Boot with ARCH=, so, what's going on in OE land?

Drop works; it was set wrong. v3 is on the way !!! Thanks to spot it ...


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

