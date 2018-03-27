Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 766077848D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 20:52:28 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r82so1318440wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 13:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vWm7pbSSiVH8+zujN1J7BKD6XYhLqkfiuwwRmWUdvm8=;
	b=WU6mGzLpBZGtfOMtkVKNw2dNA4jY6Mt1uxtDvxXcN1sTTQ4R8WSMnMyFdHtWBgjoF6
	qJDjnHac9CubwSHw/fXTOWROq70YBNEMlGVMavgp9QhNJ/4eHdlaLChkW0UgNkgaGec9
	yf5n9tlTxfCio8u5Budqd9ZvOcbl5QX4vmS77ubVCD5G8vFP5C64XILAA4nVuJu+pjAj
	hS04JCbwDdLHS8N4ejtLvrWFPSmxZTYDGCJl8eBctg4ckz9w8WeU8jVTaIBiltMfiiDa
	foqCXE+w8FjbeRQHid175eEM6P5iehA9u0ABnG1ihfN2oNzs81wj9dsX6M1AtBOxuxfC
	yn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vWm7pbSSiVH8+zujN1J7BKD6XYhLqkfiuwwRmWUdvm8=;
	b=YDcLM1dweS7bRrogQFDLM2VUoY2LyOzhdM3rT+To2UMWfgqK9MvumHQgNa2dBisXHg
	Uc4gxKU56toKEqBG5kofbwZ35dM6pkzsDlsewzZCGtfOkpkccOZvKy+YTvmT6+LwRpK+
	HlkvuvwYgq+1hi4RGu57b3TzhNQutwUfuUHZySB0CYzd6xi+XW2YXv2wv0BK4UnK+HPb
	+t0vSUs5IcC8GOMzpziRujHBzLwPdleZKHYqy2CEE27OkiveC/t8tV/UbCZqTBF2SwUZ
	UjjXhla5LT9QFaG3Jig9Uxa2t7Knb48D+I0RYxchQVzDoExhYUgpPOmr657mEHJv3/i6
	Bjmg==
X-Gm-Message-State: AElRT7HRsYJWwOGmVi1BiUv6H6XclvIt8drBogc7RdHe22GdKJ3jpF6s
	BokDhN7Swr4MnUpSPoZ/z7JMNGTP4Wjq8GkeL0s=
X-Google-Smtp-Source: AIpwx4+AR/R5H19p7TFyz2faqbVObWvXQ54V1lSbmAa/NFu1yvoAdxEhylg6uIv6jGqiNlAObpyeD+ke36A9dMYwtSY=
X-Received: by 10.28.53.194 with SMTP id c185mr574183wma.27.1522183949399;
	Tue, 27 Mar 2018 13:52:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Tue, 27 Mar 2018 13:52:28 -0700 (PDT)
In-Reply-To: <20180327152026.335b4c2d@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
	<CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
	<20180326210734.165ac038@seebsdell>
	<CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
	<20180326234108.4b52c066@seebsdell>
	<CAJ86T=VtdUAahO+PE2w8BzuPHAJCM1PEyWaYwg4SSGHU6jtm=A@mail.gmail.com>
	<20180327142230.15f1abf9@seebsdell>
	<CAJ86T=V=b2jsSuVEicQbbgrax+8iV7HV0B=cKWDaejLq-Dh2eQ@mail.gmail.com>
	<20180327152026.335b4c2d@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 27 Mar 2018 13:52:28 -0700
Message-ID: <CAJ86T=VdHEb4cyB=oSTHytyGc9B0+wN39qOSHWuVR0g6dFTLUg@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Tue, 27 Mar 2018 20:52:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 27, 2018 at 1:20 PM, Seebs <seebs@seebs.net> wrote:
>
> My concern is that, strictly speaking, this is nearly all undefined
> behavior, and that reading more arguments than you were passed *does*
> explode on some C implementations.

Can you give some examples?

For every architecture I'm aware of that supports Linux, reading more
arguments is going to mean reading more data out of the stack. It's
not going "explode" until you read far enough to reach beyond the
start of the stack. What other failure modes are there?

> I'm trying to minimize assumptions that *could in principle* affect
> portability, such as "it's safe to grab an arbitrary pool of arguments
> with va_arg", or "it's safe to grab arguments with va_arg using
> different parameter types than were used to store them".

ALL of the implementations of libc syscall() I've looked at in both
glibc and musl do BOTH of these things - either explicitly in C code
or effectively the same thing in assembler.

By trying to avoid them in a wrapper, you are holding yourself to a
higher standard than any of the underlying syscall() implementations.

