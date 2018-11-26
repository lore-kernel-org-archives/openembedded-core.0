Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96C0A6C597
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:22:58 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id e12so12604807otl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=efhJ+Mr6I7qnGPxp98j/ng7fROH1r4R//rc/LDg2hdI=;
	b=ZwsZY4INNUEdIz4Ps6FFs//WsCUAvvmwSvoFKmqRyKWhTm9uFkSsMxQt7ky9teAXee
	buOzxD1CqWfj7gw9/OVJgWylS29OyCsBQXeNCf6XUZuQo5YkB0W23uEifynTa39IVoVa
	RHmUC69k4lcZxg80fEqdkYS4FbLwt2//InUNHCoQku8pOKOpSWxtdId+b8ZbZphbq4Zw
	MkjhZIgc233tbqqVJe2XD9sdCuy0WXvOnOclowpybkLFlTBBVmQ8ceXjtlNUk4y9yGrv
	f//8NggSAqKAmnj4LZzbCgdLwW6FsCsqRvZtrQ44ftJDBook66QBtewgfVyIAlJYJ8Sg
	rbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=efhJ+Mr6I7qnGPxp98j/ng7fROH1r4R//rc/LDg2hdI=;
	b=H0/B0ULxRD6kZflkJRnDiDAILTkyqIsT1vL7TMniaSVSxf96qbHMs6JurP6x8FWHUq
	kZilLvLErocfloIx1CMyiYWOgxRQccCEMHAo0acw9NlM/6nzz4Nzxh2blixTEBNC4wsO
	VGv+aERQGpyhMiawqacahiWEeZzbwiBbGfx11yvkJT7vPfbHtVKCdu5l/1ubHEALF/9O
	/Yywg80pM1Z+ZgVMtNEf6AxAfjl7Rcp3BN9gY2N1r3p3dB7RQfcGJg9/L990KxRMWNhx
	DL3J7egj03MKL7uHVWt8q1ucRTqwMmFBmdjxsj/DOuIHTBdJFUla9a5JzawqWq4oM9Ev
	YTag==
X-Gm-Message-State: AA+aEWaN1X4piGkHYwjgXN4ovudba7hESYgHq5Pn19DtqzhWTniiXemJ
	L5gkRLO/CPxTkiRrhWw5Noo3TdYf5/EEYJb0vD0=
X-Google-Smtp-Source: AFSGD/XX3kTL5WaUhpYdxbv2kRFOuUYJktJkRpA7nMN2DRvzz6DF90NIA5qllgTL1MZtZ7FB2pvbclwHPMLWkbgZ69I=
X-Received: by 2002:a9d:5090:: with SMTP id b16mr13923704oth.96.1543245779305; 
	Mon, 26 Nov 2018 07:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20181126144308.13862-1-sno@netbsd.org>
	<CANNYZj8gJiXCBBqFb-gLvV83RhO7StKxGiaTnjE_iuMK7ZGG-Q@mail.gmail.com>
	<F8563831-C398-42EA-87CD-9C1A50A1F5A8@netbsd.org>
In-Reply-To: <F8563831-C398-42EA-87CD-9C1A50A1F5A8@netbsd.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Nov 2018 16:22:47 +0100
Message-ID: <CANNYZj_6NPPkiS1FGNpnWq4AWrxSioyKSLofzXJH_-muJTbTug@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl{,-native}: Update 5.24.4 -> 5.28.0
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
X-List-Received-Date: Mon, 26 Nov 2018 15:22:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Nov 2018 at 16:17, Jens Rehsack <sno@netbsd.org> wrote:
> Even if I'm not a meta-perl maintainer - checking whether it works and
> how it handles meta-cpan would nice to know.
>
> That it's not submitted - does it means it has Q/A quirks or just unsure?
> Maybe I find a tuit before next contract to finish then ...

Basically I only just got oe-core to build without issues with it. So
nothing else is tested, and RDEPENDS generator is missing, but as you
came out with the patch, I thought I'd bring mine forward as well,
otherwise I'd let it cook some more time.

Alex

