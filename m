Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DF9437961D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 16:42:18 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l42-v6so2480524qtf.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+7uaYkQVYa+4HJ7zVEgHuZpVnnfZ4k95dw5HVOvn04I=;
	b=iYw7LBYebSUXM4KDIcub1KVroZMotN5pHFMrc/njT8MuzO3MgDdTYS956L87nDlbiX
	Fy2N3y13ySYTzUSnab7Ie1dr3Cc+rKtNKjvJyM72tH6pL6OJ20giygLsP7B4BMNrzlIj
	fAcFYmPeRfRJYC2KMDxo+Y36xrlJVC9iceBC36IkZ9upqwARr2I+YZrxFymITJAaR9ZG
	JAPQrkuZEDG5mUjQLEh8afhLcEIYfLlUr1oiU2cOXU9eHERm45ewIpffK5426oMbN2cS
	68O722JK4XkjKwulXlqrrkzYvgsZypU4uubnl+5yennHh71z1lIXFyBfb+Y8xP8NiRcU
	UAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+7uaYkQVYa+4HJ7zVEgHuZpVnnfZ4k95dw5HVOvn04I=;
	b=HUWu0Nm1KwYg200tYHOWc7War90LcEyVQJRBHYF6mNtd8ToE1i9Qrp8fd7yzlp+WPs
	yjd8X/bOnckS61mLMqE94C/Hi6mGzQ95YHhjoRuq0B9PTFdRjEc6inL4Mv0m96drGRRa
	5RGPg9LZoD5OQAbKWUvDSPvGGkan9aCYturHoOB5gmqU59CPtD4/IVpG5MuUl64khxsK
	lflA6T1rl9EeTXWc8pYd2urG0FouOW1o7M+ArFlN+wxfIv24zcmvBfh8/1zkCEkUE4R3
	FUV49tj0nlXINoCAMeaekxaLXbFxEbfEuBDxb7VcdcUura41TS5AS419VzC/2gHfG2BQ
	fDDw==
X-Gm-Message-State: APzg51Ale97hnVuu6e/Zoq5I9IsuObQmDeq6EGLH/V8nsyedC0TH/JN+
	YJDRd5ZuyIMxrIf7BQCUS8vSwggO9RrHjZfsbr0=
X-Google-Smtp-Source: ANB0VdZDkjt3TZnr0zHsi85fF145Gg+vKBnr9evIUGM3AVG4JNckEZ0LCPCDOZGlCYYnouTKgePUP94Zm317SSPOlB0=
X-Received: by 2002:a0c:f78d:: with SMTP id
	s13-v6mr2226143qvn.194.1536770539416; 
	Wed, 12 Sep 2018 09:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180912155519.7513-1-abrodkin@synopsys.com>
	<CAMKF1spaqXM5Yr8u4j2ppQXAUdLS2QvOqasy+tdju3VceAvVhQ@mail.gmail.com>
	<55a9c23a7768c79e94f676ca7665f6c6571358bd.camel@synopsys.com>
In-Reply-To: <55a9c23a7768c79e94f676ca7665f6c6571358bd.camel@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 09:41:53 -0700
Message-ID: <CAMKF1sr7nYn+La3kQ5BZ+nE8zLY5dybgS53736Q-6ScJfcZd1w@mail.gmail.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Don't do useless configuration
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
X-List-Received-Date: Wed, 12 Sep 2018 16:42:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 12, 2018 at 9:35 AM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Khem,
>
> On Wed, 2018-09-12 at 09:29 -0700, Khem Raj wrote:
> > On Wed, Sep 12, 2018 at 9:03 AM Alexey Brodkin
> > <Alexey.Brodkin@synopsys.com> wrote:
> > >
> > > There's no point in configuring Linux kernel before
> > > headers installation.
> > >
> >
> > At one point the headers install did not work with out a .config file,
> > has that changed ?
>
> Well that's hard to tell as I have no idea when and what kind of breakage
> was seen :)
>
> I'd say with up-to-date kernels it shouldn't happen and that's the
> point Masahiro-san made here: https://lkml.org/lkml/2018/9/12/678
>

We lock the kernel-headers anyway to if it is how it is in 4.18 we
should be fine

>
> > if so then this is fine to remove it but this change needs to be done
> > a bit differently if thats what it did in this task
> >
> > remove do_configure and then add
> >
> > do_configure[noexec] = "1"
>
> Ok will do that. But why do we have 2 lines below:
> ------------------------------>8--------------------------
> do_compile ()
> {
> }
> ------------------------------>8--------------------------
>

you can change that too. Probably its there before noexec approach was adopted
widely.

> -Alexey

