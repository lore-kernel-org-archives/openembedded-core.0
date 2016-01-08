Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id B2109731BD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 16:25:46 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g73so93556762ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Blkc77LZ7hnS0O3QxPwN4WC0ut5Q+wpk99lqSgLAl3g=;
	b=GiVbjq9ha9AuhJ/9A8BGUO7D86tlvkhAu6PU1uCL43h0rafpSUDxrWJcf93RxmSSIb
	gPpllokKFMaTFeVnuPd5FmRNSlV3vw+FVBc0XMQW0R5a7pkFjTTxKOr+UjyvuU4BVL96
	G14zVQU0H9UT21a66xtS+TIe5N7QoTfkXaVx7npcN3ZC0VksW0Tv2gEefoNqse79Vaom
	aR2b7TGM7nA8g0SLGm0EgSz9zzyH2+4mc1QtOXlMNPlbrg/adJkfcNJ/qnWIli8wIyDR
	hDaORM45FD622HWG7srtmw81pW4vnYE68RoiCeoe07Ha6r200ucskpzurawx2L1EHCQJ
	nDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Blkc77LZ7hnS0O3QxPwN4WC0ut5Q+wpk99lqSgLAl3g=;
	b=FqXTgB9BZ+EX100bfsMxDKJ7MdpoeAI1GWjOre/YV7SUphx1q7QB/z35MGHZX4b2vT
	1XKUQe6JAX+NnUEJgpmFCmcY+dwdJfR1TpUuDMVmb8lk6t2/VorkKcMuvLTong7jSJyn
	fd1UJBAD3uDHwTkV/amitgKWoWpIDgN3l6e/HkhYZDbHPUhxbBU39TsyVy8/LKK/Gmho
	tD7wY7gw88TAnet3hNL6JH9J8Se0JHUoOl4Zqe9sfgS3pU5OTcKG6vSYhn2cJVOlSmUE
	LA/PRF8dfgHcS9Dh+ivjvMZxZSUIhFt5vtEnGpJdeTYuZVdH9vZf08H9T6zrnCwP+/Nj
	3Nug==
X-Gm-Message-State: ALoCoQkbkNN8HlcwQev7EOZFdPuWUX/R6Kk2hv69ubbcEc0rg7ASO7NrIdWHFAECGE/qrb6EA2ID36NNqCGW0aJhbwYT0R/AO27Wayax6LkiCyuedwgwLLg=
X-Received: by 10.107.135.104 with SMTP id j101mr76214975iod.133.1452270347298;
	Fri, 08 Jan 2016 08:25:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 08:25:27 -0800 (PST)
In-Reply-To: <CAJTo0LbiNhcb3G_omDB=V37p53dpG3MGA0O28T19BQiT4aL8Zw@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<baa98869574d7bb44be4171ff58d5abdc76f7d69.1452248145.git.raj.khem@gmail.com>
	<CAJTo0LbiNhcb3G_omDB=V37p53dpG3MGA0O28T19BQiT4aL8Zw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 16:25:27 +0000
Message-ID: <CAJTo0Lbvw5fsvSAPQXpV_E341ZDa53uVzOMnkgHpRSVROcLP7g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/53] mtools: Fix build with uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 16:25:47 -0000
Content-Type: multipart/alternative; boundary=001a113ebe922b3f2a0528d50a1c

--001a113ebe922b3f2a0528d50a1c
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 16:17, Burton, Ross <ross.burton@intel.com> wrote:

> It appears to be the first time that virtual/libiconv-native appears.
> Should we just ASSUME_PROVIDED that?
>

I think this is the right solution - patch sent.

Ross

--001a113ebe922b3f2a0528d50a1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 16:17, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">It appears to be the first time that virtual/libiconv-native appears.=C2=
=A0 Should we just ASSUME_PROVIDED that?</div></blockquote><div><br></div><=
div>I think this is the right solution - patch sent.</div><div><br></div><d=
iv>Ross=C2=A0</div></div></div></div>

--001a113ebe922b3f2a0528d50a1c--
