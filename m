Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1D747CBB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 14:56:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y140so4390649qkb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 06:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/bJnMVYlrCXOjhywh3reuFqz3CRnGf6L2hVw0Xw3Bww=;
	b=BnLoKj+V7GfKFcAC0nzUUSI+sHSlM6lGWBgMM3ZjrKUKuU2mXrFKNIW8OtAZgY2l7X
	OBQUjsCOn5jLJ7c61cCys3oK28qAliKsS13TFA5qT9TN3xrM6uwszuSWIhNcoKy6v/TG
	kznmbNXgzeAKZzG84Y28SICeJRTQcDzLTxc9AGHx+QTvF+BpuawJQiBarC3c74UfrNw2
	Ri31Ek8qWdftq3oNTxSTwnf2Bpl+x3t3nHImQM26ue66c+GM5ZA7FF8iZ65C+1G5AH5a
	XNtBrqoVED83eOV0qIRTJVR8VO8oDulnkLxwxbYFBFQr8g/TP2HaTc/3tYWjwhL31ea0
	uF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/bJnMVYlrCXOjhywh3reuFqz3CRnGf6L2hVw0Xw3Bww=;
	b=l4bRcXvr9P9W0lMV+xVXLFhcFl9HG2oU6pE55gRSl2dg3xCetyeIKWk9AUi4exaxbv
	dmFFDNeczY4ryxffKsEuq6+nPi9ODe7mESWY7/HqwOMO/vfswj2MRxvJH3L9OdMHuuap
	uYbTanojh+Wn7wXwtofH2TLrYp+KjGzpMSMvYoMZYnIihDquUwu/qYy0JcjcuSyw8WK4
	uS3vecl7xOsjWAhAzXBitV/e1rHzsQ9b0wKEFp+RmqOcYCCcVths9LAnHcYV+Fba1FyJ
	pbHkbekg0jZdA5Q20ZRmHFdC5LvusFHT9Pq+pI/e87kzsKm3rq42cKHJ8qrAu0KDhQSE
	Gq0g==
X-Gm-Message-State: AHQUAub/KzOzhwYqiQ7drs8RyxudY9k572+9zYUfC0Q7nv06IvUSCy+2
	ZSqD7nY2UNUEQN2QZh5hCdiXuZRG80w33tZZzOc=
X-Google-Smtp-Source: AHgI3IaiYMrF3QMRZcysF8Ve+6mc2+Lh6PiRii05GpNXpKD4NVe94WYwfWtZIk9AUqhcvbfb6jo5U6oy8JFLmM9TYQc=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr28548681qkd.223.1550761005231; 
	Thu, 21 Feb 2019 06:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20190220211034.27159-1-fabio.berton@ossystems.com.br>
	<451a3c0d5250062208cb29a8e16e9c8373538ce6.camel@intel.com>
	<CAMKF1sqss0=crDQ0pGGA8FHXjjRYv+9tHE5i5ohZneipW6J7TA@mail.gmail.com>
In-Reply-To: <CAMKF1sqss0=crDQ0pGGA8FHXjjRYv+9tHE5i5ohZneipW6J7TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 06:56:19 -0800
Message-ID: <CAMKF1srcbPFfGcEFWdNT+P=bmv+eweQN4d2uR_Cena8tvBvd1A@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v3] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Thu, 21 Feb 2019 14:56:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 9:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> still seeing errors when building for rpi3-64
>
> | checking for xrandr... no
> | configure: error: Package requirements (xrandr) were not met:
> |
> | No package 'xrandr' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
>

This is fixed with latest commit so we can move on but there is new one
on aarch64/rpi

https://errors.yoctoproject.org/Errors/Details/229582/

seems to be due to this commit.

https://gitlab.freedesktop.org/mesa/drm/commit/b541d21a0a908bf98d44375720f4430297720743

probably a revert of the above patch is what can get us further.

>
> On Wed, Feb 20, 2019 at 4:41 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> >
> > On Wed, 2019-02-20 at 18:10 -0300, Fabio Berton wrote:
> > > +PACKAGECONFIG[xvmc] = "-gallium-xvmc=true,-Dgallium-
> > > xvmc=false,libxvmc"
> >
> > This is missing a '-D' ... Was a problem with my original patch as
> > well.
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

