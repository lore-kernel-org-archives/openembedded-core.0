Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 85120615C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 12:39:32 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ha12so4870755vcb.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=30Tcp1Lf4GYRv0mqwDUSuv14EEeRYxlz/8WEyun4o4I=;
	b=Z2AWASFQDID8ixrTt3aVIlPSXmxyT64kXwCPT2eHsO/rH805r3HW5FaOqcEXGeQy2H
	teM4aX4F63O5FFuPlhI8PoaSfJuF+CC85Wh0e9Dxvq1ea2WNjJyD/84FaAPuZLFKpOYC
	1PB5pEyZ/AxKxRSXvPzCo2zQngolGViza8l+YUCUUdMD8IqxFvAnA6695KT0YHKOKYU7
	/a1WW7MkxFG8LxJ5U11ESHljala6HKaU5rO0EclEjrS3G0pOxuNGyDlElH/m9c71rAQn
	I1Pba9BmbebiYBvKKDdngdAqPNJDrpaZZYglGoyNijL+p1zd1N055RYj1vlnsjve911N
	0XdA==
X-Received: by 10.58.161.116 with SMTP id xr20mr22553424veb.2.1378816773846;
	Tue, 10 Sep 2013 05:39:33 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.155.17 with HTTP; Tue, 10 Sep 2013 05:38:53 -0700 (PDT)
In-Reply-To: <CAFyqS9qs5YpbA2q_WLZb95qq_pGY-dezGMC1k7C5xAou2iCsAA@mail.gmail.com>
References: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
	<CAFyqS9rEabcr+RMS_i+9+JMpVMnKucSB8GU9GS5pJf8SAr-MSA@mail.gmail.com>
	<CANyK_8duW8cshoAkNKo3mnRdmaCNz12ZK3xKVCni9Uxx1hVftA@mail.gmail.com>
	<CAFyqS9rHuWo+DXkBxCmtPwzeunMe01y-swKjYKjUkQ_YcofXqg@mail.gmail.com>
	<CANyK_8eQB9KEs5NMXEhysakBrFzkBcGCBRs0=v3Kh6vxNYo0_g@mail.gmail.com>
	<CAFyqS9qs5YpbA2q_WLZb95qq_pGY-dezGMC1k7C5xAou2iCsAA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 10 Sep 2013 13:38:53 +0100
X-Google-Sender-Auth: CReApXRXMM1nMpcbUoupt5box3U
Message-ID: <CANyK_8eNK6j6HZjpNpZHJs0_uqKJ4-zKv4vRZpue1O9Cnr8Q6g@mail.gmail.com>
To: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 12:39:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10 September 2013 13:30, Hans Beck=E9rus <hans.beckerus@gmail.com> wrote=
:
> Yes, or I will just try to find a simple stupid mail client that does
> not mess up the formatting.
> I will try later today from a different client. That will be the last
> attempt. I am making a complete fool out of myself already ;)
>

You should have seen the first patches I posted! Don't worry about
looking like a fool, we were all new to this at some point.

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

