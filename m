Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id B516278485
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 17:39:30 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id r203so682808oih.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 10:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=YdWNVnIvM9M43fhpCQUUMbi5q6yu9YfsraJGrWCa8Ro=;
	b=SMoKv7ZrKJL9d4glcmn8SBwVRDsN7Dxsy1G0cNIIJCefcfPZlpnAoO35oBdltv8Y+t
	Jsok8RL3Vp1iVuuP2DnxULjDulwX31Z/I7JYpRyzx/9tC5hIdzP8/3DbarmfFnVlAq55
	zIG8KMoDS39A2R+YRaULmYaO6FWgMcZDUUT5C9dncAlA0Xj6tR/dxD26+QgC/1AwxHR2
	gz3zU4YaFyEJcG397jE5x5W28k+IzNT5ksWBScZWIPGZxqwZrduePkq7qpbGatplAGFy
	2cfPiSYmGEYQibX3Xe4f1EGwmScNxo2oOJhrG6MUEdwd7Y7XBf4AL98QvsmEAqHKz7Yg
	hw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=YdWNVnIvM9M43fhpCQUUMbi5q6yu9YfsraJGrWCa8Ro=;
	b=UEn2Xg2sFFfk3BTXUECLHfLfq2GcowdcHDF1Gn2y+7Cb4J37ZwCp5PksKdRIhTNgEW
	BwigowvtRbdzqdqHkH9MFUSPi80HUp9ckp+/kZoWI2IgsTTfLZtBQ8gS5fHYDKuYPW3z
	8b3hVxCBWr4MrCHBfqa+gttHigmlsyJFmG3YzeXJOxGtySadqjqTFqbud+3aKMbe7Okh
	WkPT6b4e4dUtJGbhmX/Bde7a8hBGcsMslhDyWVW1e8SAtf0l782ZaIbVO1e71fTTU+Gk
	O09+gyHltk5iJ35Mt6mhdVXe2kF1/v4opEB1JrLRVxeN4fkLuVYaNPKFL97uMmw40O9I
	GQug==
X-Gm-Message-State: AHPjjUh+EnqYft+8rOakFaSzEIaIYlJX0wukmhLi5/AHG9tdeOGRxAWU
	Zf2eqSVUCa6J+pyMBzc=
X-Received: by 10.202.243.10 with SMTP id r10mr2246505oih.52.1504287571176;
	Fri, 01 Sep 2017 10:39:31 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	o132sm668905oig.26.2017.09.01.10.39.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Sep 2017 10:39:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id r203so7476852oih.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 10:39:29 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4O/uZ0bzYJy9j32RbX0yW28KzpFxXn2XK7TCIsXXK1ZkrAz0gUiKcnPpstrOEomVIbGGTqdJTdLfjms5bb2sc=
X-Received: by 10.202.213.68 with SMTP id m65mr3274968oig.25.1504287569337;
	Fri, 01 Sep 2017 10:39:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Fri, 1 Sep 2017 10:39:28 -0700 (PDT)
In-Reply-To: <1504285648.27472.343.camel@linux.intel.com>
References: <20170831213435.16487-1-otavio@ossystems.com.br>
	<1504285648.27472.343.camel@linux.intel.com>
Date: Fri, 1 Sep 2017 14:39:28 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr4Z_v4SivEuY5G03y4=96WTwDAm6NOuwTr+3NhF6Bjzg@mail.gmail.com>
Message-ID: <CAP9ODKr4Z_v4SivEuY5G03y4=96WTwDAm6NOuwTr+3NhF6Bjzg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Stop using update-alternatives
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
X-List-Received-Date: Fri, 01 Sep 2017 17:39:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 1, 2017 at 2:07 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On Thu, 2017-08-31 at 18:34 -0300, Otavio Salvador wrote:
>> The update-alternatives where using relative links so not being
>> really
>> in use since December 2016 (see OE-Core:c7bc46b9 "kernel: Fix
>> symlinks") so instead we now generate the relative symlinks during
>> the
>> do_install task and drop the update-alternatives use at all.
>>
> Is there a reason not to fix the U-A usage of the relative links?

Conceptually the update-alternatives use is wrong as the database is
on /etc and /boot can potentially be in another partition and loaded
directly so relative links are required ...

In fact using symbolic links is not used in generic distributions as
they generate the boot script as post inst action so user can choose
which to boot but for our use case, it makes sense.


> How will this affect the installation of multiple kernels?
> for example with Haris's patch: http://lists.openembedded.org/pipermail
> /openembedded-core/2017-August/140996.html

It can be adapted to work with it; we could, for example, use the
KERNEL_NAME to be a prefix or suffix for the image and device tree
binaries.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

