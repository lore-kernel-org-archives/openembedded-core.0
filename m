Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7497C949
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 12:32:06 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v62so30978815otb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wYYWyEcqx+jnK/hM4XeM6in37Rky8VsFy5NMPIww/bg=;
	b=PSAaEu1LftrXei57GAWwtTtNKX6N260nnILTTbtuRO8+AEnDeylDJoZJxhi58osGso
	+INY7yPJBibxor7faSZv2Urv7zCNb8DEXIbWjustNn00K6I5EfrEJA5UfpO+F2UBMcWj
	xxINI7zRD20szMElo6W1dE3LF84YYvDXF5YIv2lEPeGOWUD5PiGMAUPtQiwaGddyDMQq
	XAcsZ8X6Wc4td/Zgm6mymiaX3VOKFHDT1uOXR+ny55QdWL5kOdegU/W/M9wnKneqjnkn
	cTVYFxhpamktkaMYylSTgyY7jWTY4wQE6xerbwS0jl+p68IGCxlclm5xwmSlIsqCaZJK
	q+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wYYWyEcqx+jnK/hM4XeM6in37Rky8VsFy5NMPIww/bg=;
	b=iwQaJT8p/lGSGy8dS+nLyeWrzhk6CE1UAMTd0DrPGOVmnxXqU65mp3+AodOPe6z/gJ
	WOzzjy2UFSCD9SNzwnrbSaaSkOJargpaggzORZW/AAq3U+KoZyHvcZkn9pYSWLdXnH7u
	im4dbHfe8YIp4DOK1O8ujKr1qpP6Bj+VWeWLZbAadPnFjgJfvuV0Vc+8w0EzsbwWhqfM
	gAQrfiX49W2ior45PoCNV0elzOZG45LrCEqFfWDEs99GZHzcppnp7w1yAftDZOOuCdK8
	glQTxu1Gu3tNXhrTPdDBFuADrQ4rO6DaOclV2VHpNZ76n3Gfy1Jt4ovaEgVPufoBOXOF
	Vzyw==
X-Gm-Message-State: AHQUAuZ1vLhIJbEZpaM9jbZg20zdNheqII9AT5xhJifu8tRI0HSgt4IX
	3R7eslJ04oQAZxsW7HwbCW/ZP4zgBujyg9VZxyg=
X-Google-Smtp-Source: AHgI3IaJPqPJ1jVKvvE9re1tgoVgMDKiuwPJ1PtzBvNxNPC3Rng0ZT8fCw3iQpXALL4jwvj90q+qhJz9plSVG4qToYQ=
X-Received: by 2002:aca:4d49:: with SMTP id a70mr5818146oib.135.1550665927541; 
	Wed, 20 Feb 2019 04:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
	<CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
	<CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
	<bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
	<CANNYZj98LDCmKD2va9zX26OJCFhTS-jNs6=aikLrAx8VW-CNeA@mail.gmail.com>
	<CAP9ODKoQFi=UbZHQPXmTCw5Sqb2oVcB9GxsrVk0Bet5GdL7gUA@mail.gmail.com>
In-Reply-To: <CAP9ODKoQFi=UbZHQPXmTCw5Sqb2oVcB9GxsrVk0Bet5GdL7gUA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 13:31:56 +0100
Message-ID: <CANNYZj8hjgxiN6O+9xe5sHzy2307y8bRkxAbXshc7PY_auVVag@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 12:32:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 12:57, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> > On Wed, 20 Feb 2019 at 08:58, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > > I guess xrandr needs to be in X11_DEPS, this was added in the
> > > > original
> > > > mega-patch, but overlooked in the split version.
> > >
> > > There were failures all over the autobuilder from this as well :(
> >
> > That's why I still think it would've been better just to test and
> > merge the original all-in-one patch, with follow up patches if
> > necessary. Doing this split and delaying meson into 19.0 is just more
> > overhead and work for everyone.
>
> Patches should be logical units and a "do all once" is wrong. We are
> doing the fixes so it is not adding overhead.

By the way, can you send in the libdrm upgrade as well please? You
should have the patch from AUH.

Alex

