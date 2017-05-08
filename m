Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0171365CC6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 22:51:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y10so18612133wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 15:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nnv7IKeKkJHGO2ybi8dVYn6N5TbQRDAv2jIszb4hisM=;
	b=iDqADd5ZxpyKbsrnWv+Ow3K0wFC3/nM5EjR5ox1IN4qiewLIxn4kHzDstWp7HM5Vfn
	BU+4Q87/b++J2OksNKfTK/tRMVuKLUf78jRA57ohGkiGywSg4G2KEimHTuZC6u+gKASg
	5oqVF+nbTmobC9GaDIzkMLUgyqM2S6qoG0EbwIuq6Sx0kygy2JaDdAfioAn8KmHkxc1k
	Fxapst8cogIiUOT52weiGAUCNc33FZATWWoQvgl94A45ZzyDYvEP0pKsjcL+4zz3t+w2
	ubaiLFdYnk0XHVVHVFmhyyRMVzbchC7BFQSrDMwqEUCwsSgwMH4scfHiq+QTDvRIqXAG
	qC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nnv7IKeKkJHGO2ybi8dVYn6N5TbQRDAv2jIszb4hisM=;
	b=hWHs8Gt5u5e0rl336rawWkBW6LVvjNrnvD3qgf7eT5y36y+eApPCmtf3NVctoSM0Ic
	HocvO/j0alLEo/Sc+97PBGAWrEMqe8Cm6EXsT8LEN0oj63iE/lOrY1k0l0oCgaq7TLu/
	ZsVPVwLmd0Zt4VpVttZJLy4PJ33zen1QX//N4ryB+ouyKVqkcmHrtdPkOvO3OKQvUHSw
	xI2U2hOzwK3LKiltrBYKonTmz397gTQmNaVPqVVqWdj+lTOZvHJCLOurEVKmKVCds5kT
	z+1b8CheS7YwPRNIgnNvKTKqumj9W38uR07IZodqpamE24W0BxTsgyH2uHv5lEUBmvy6
	Mo9A==
X-Gm-Message-State: AN3rC/4asCrYvZWUvcmZqIFFar7VXMFYuztCIxsZ44eAdXs2epEOSL9m
	0hdQr8UagQJ1VZUu1khpyws77Euyag==
X-Received: by 10.80.151.5 with SMTP id c5mr46040264edb.30.1494283880585; Mon,
	08 May 2017 15:51:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 8 May 2017 15:50:50 -0700 (PDT)
In-Reply-To: <CAJTo0LY67aoeeHiNXDSA+FYmEYMQdw3tq1_N7+N=a9xq9nyPiw@mail.gmail.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<CAJTo0LY67aoeeHiNXDSA+FYmEYMQdw3tq1_N7+N=a9xq9nyPiw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2017 15:50:50 -0700
Message-ID: <CAMKF1spO7Crq+rqse5BMrShom1tSGBuoY5zm1yL1eS2K2zfN-g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 08 May 2017 22:51:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 8, 2017 at 4:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 May 2017 at 12:33, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> Sato is extremely lightweight (not just runtime-wise but with regards to
>> build time and maintenance effort). I admit I'm not familiar with LXDE but
>> other DEs known as lightweight are in reality on another level compared to
>> Sato... Sato projects themselves are tiny and depend on very little: this is
>> quite beneficial since it keeps the automated test runtimes reasonable.
>
>
> Also Sato works on a wide range of devices: if you have a 30" monitor with a
> keyboard/mouse, or a 4" touchscreen, it is still usable.  It's not optimal
> on anything, but it's functional on everything.  Put LXDE on a 4" capacitive
> touchscreen and you'll probably have trouble getting anything to start.
>
> Obviously if you're happy to say "I target desktop users" then there's
> meta-gnome, meta-xfce, and so on.
>

A general usecase is that someone takes the reference and tweaks it to
meet the needs of a product quickly. For such usecases, it would be good to
consider the most widely used UI framework in embedded space. I
personally don't know how much sato is deployed but QT based systems
are quite widely deployed as far as I know. I think users can drive maximum
out of the testing and stabilization we do if they were using the reference
software as much as possible.

