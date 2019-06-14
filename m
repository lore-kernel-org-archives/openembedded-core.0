Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5D27E982
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:36:23 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u13so5877072iop.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BDQFou/uJHSufVW3oDmYBA17Ua1ucNmfv5BStTPbyow=;
	b=oPbRjy1kWwsKO1XOIHegcCsa8+QAXkP/MUTYmYtyO3ogTOuoEf+8RnFylhIkha+G6n
	wUqh3Flbjg++M5f23RDLiUJTYiNE1NJgiGKo6vFtTjCtIqO6qEgytRpkRUOUwHVEGBOf
	Rr/H1kAY7F1LNq0jeY9UjXZ2tppO1hC7SMIF8UPUXix3rbEt19bl/ob3aV521v3nYfFi
	p7YSHEwmD4HeN+Ee5g2lp+t6hH9RmWLQy/raP5mO8cdRxUomtBbLhaWJRCqJSd8l9atc
	hc5SRvnRxcBB1CLi7z3wGjj425lbLD8BPRWMJWr8/uBj/pIyba3NWbgznP1OgmjyiCFX
	mSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BDQFou/uJHSufVW3oDmYBA17Ua1ucNmfv5BStTPbyow=;
	b=Yv4ZPbLRTiHgiSOhXGb0KonpBXOQbPlyZqd6Z5Pxfe4wgGJFFz1vK1rpmua19FZNCj
	7beJrLzA5rnHFn2G79eRLDChqEPvDGHeU9327OXcDUlIA1BT2rFgIWj68bWrPsPRJtKt
	3oblcOZFPb7Igz5t0II0rh1g9midSkpTIc9+eNJn09tJqRnd4cIA/G7dMCB0fV1eKZDV
	iRXN3hQu/05DlUq+hUBeQ3ofpwQ0qQgwQ+o9XuvN/cxaKB3HtdHO53i90DqAcVTYzUGn
	+zO3DZ0ryB/ocGw4xje18Q07FNwcQx0EakqIMJ719p06EB6E8VoIjDPaOxId/AKQs9d1
	P5Jw==
X-Gm-Message-State: APjAAAXablzy5sgGNAi2DZoycq7qgADscNa+B/4dK3mhW3QNbO5faPsW
	+qepUkIoXx7ftbbW4i6toVnMZYCqsrrR54UvKzkTww==
X-Google-Smtp-Source: APXvYqwIsr6bNf5kV6qbajr5Vc/6O+Ki1CNOtIRHQlKvok4BPOf3kpc0JCuZyj1PdK2RcohXNKzi+0F89BU54AHhc4s=
X-Received: by 2002:a02:3217:: with SMTP id j23mr67189112jaa.79.1560519384535; 
	Fri, 14 Jun 2019 06:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
	<99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
	<c85e93b13ddcbc27c27ac17fdcf97a0d1ffc4020.camel@linuxfoundation.org>
	<CANNYZj-9xUFE0x9D_BpLiqkNitLmXnrv9n8boodZpE5bX-psgw@mail.gmail.com>
In-Reply-To: <CANNYZj-9xUFE0x9D_BpLiqkNitLmXnrv9n8boodZpE5bX-psgw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jun 2019 14:36:12 +0100
Message-ID: <CAJTo0LZbf2Y6_nN0E8tsVLHKxZAtE6zyqP25nyKk=v6+bQjkHg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: kernel@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 13:36:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Jun 2019 at 14:34, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 14 Jun 2019 at 15:26, <richard.purdie@linuxfoundation.org> wrote:
>>
>> I guess if we can track down where the swrast dependency is coming and
>> and change things to avoid it, that would probably be ok.
>
>
> As Ross said, qemu bsp has this:
>
> XSERVER ?= "xserver-xorg \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
>             xf86-video-fbdev \
>             "
> Dropping the swrast dependency will not help though, as it is provided by the mesa-megadriver package, which will continue to include swrast as long as it is enabled in the mesa recipe. mesa-megadriver is also pulled in through other dependencies.

Won't that stop the build failure on the autobuilder though?

Ross

