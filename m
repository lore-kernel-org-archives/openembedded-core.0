Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7B44771D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:59:56 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id n19so11586150vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1f3TAJ2IHWBo2PdTSx55sM9abT7tHs0a04wrHRCyeSM=;
	b=khVXg4YYK1dqfaQh64td14Ry4WRwpAJQPf5f2aPKQE7+QexgraQklWGTA7xC1P6D2j
	qtRTsq2eES/rezWx94vMwebO1+XBayppz9RvEjWno+enoDZqaf7aeRfDuOHaXpnVkH9u
	AjtqTEbf9EphQxbGZvcdGHHzn58uqLnMPNKt1U3r6q5CqA/fTFB+tcflzX6iqOJbu7qj
	PddIoJBXbBW/7XvrZMAINMk6Ency4gAJheI0C0HZ3QfhmQPsyweVOOKYHR06yKYU+S8Y
	clSJKvlSGrPnClr4fC3TkYuSS7lY//rQA4kh8fIwaGAy1AIUaatVZgRFUBo0A+zMoCIR
	8nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1f3TAJ2IHWBo2PdTSx55sM9abT7tHs0a04wrHRCyeSM=;
	b=NGUcUGC3l8MkCOzT1BjEL/hi63Xt7U2S/TBI7OTmvkgBe+pLH4hoO6Mhxo74vxfX3f
	uGP11/4oY8rFyHbcAHR89Ah3k9HGwZ9XAKiXAMaXYuaSs8u8+8bkSzabLOO5ctc0VDqo
	P9dRN66NQM4AZV4gl004XfzsDg4XzUw7lxqMTRENMcYZ9A572e9pldIfV22XVa1xGg5v
	Toco6Z+M+N+C3RNTVLLrIiUhnXpBchyUdjnEI3TTvvFVCOMyqtp+PoNefi7oBS3MjCf1
	uumgvOghvpNE9OgjVc2f3bE7TSuBvEvpxiIZCdFNWK9Fj/KI67xEJo/cpTPmL4MUJCoQ
	PIHA==
X-Gm-Message-State: AIkVDXL0Tu7ZrbGs9DSAhvGruDG+DzBLqKX1SB1CD/jZcrYh0guhcPXOQ89hrR/4KLuDMivqv7T4Pgl0rpTPGg==
X-Received: by 10.31.115.142 with SMTP id o136mr13764919vkc.139.1485190796534; 
	Mon, 23 Jan 2017 08:59:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 23 Jan 2017 08:59:26 -0800 (PST)
In-Reply-To: <CAJTo0LYogrcREAzmPUdBwcP6Yx5e-oZEBOTL1EnpVD9jwg=XiA@mail.gmail.com>
References: <1485178169-27145-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYogrcREAzmPUdBwcP6Yx5e-oZEBOTL1EnpVD9jwg=XiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jan 2017 08:59:26 -0800
Message-ID: <CAMKF1so7OY5b8eQaQmgyL0ktNkT2kR=JGfMtxEsusSMR=5zH+w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Mon, 23 Jan 2017 16:59:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2017 at 6:04 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 23 January 2017 at 13:29, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
> wrote:
>>
>> +# no python -> smixer is not build
>> +ALLOW_EMPTY_${PN} =3D "1"
>
>
> Not sure this is the right fix.  What package does the Python support go
> into?  The smixer files should be in that package, and the real dependenc=
y
> on PN-dev is to libasound, not PN.  Can we fiddle the PN-dev RDEPENDS to
> ensure that it depends on libasound instead of PN?

shouldn't shlibs notice and add this dep automatically ?

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

