Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id C066B7E918
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:16:20 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n5so5592664ioc.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cbEXOqDIDOPvexX4OylrxHzmq00oGN5FTl7vK/w/Yqk=;
	b=EZJf09ZDJ0ltz8xPUagrp2il3OpoRBFKsVbyUmXPOzDkoOx2baS6nkGJnnIrTBXa5w
	IUvij7aU9UdTxJYDwk7diKjOmSeHc/jqQFWDm46b3xbo2glDD9QvRBsSmeHVXfsHAPCi
	IF6xqnxHlmdqSbuzY87BLa2wptztPcWRSakZCfC56BQ8t2uRx3H2n8WgXaUxkSe+ZcYy
	NdsHZbbChhHW67b4Zbsyr3akm4PkEijjUrLZJzGxuP8Cg+nH+DUjHXCF1EYPJfzqQPm8
	ZDl3rOeV2g4oVeS0DGtMtNLRpAsaVhnTPpHb5mEzIybi2c6X89VtrpSDhMUbZx0aEOus
	PaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cbEXOqDIDOPvexX4OylrxHzmq00oGN5FTl7vK/w/Yqk=;
	b=kPT/yZHYYJUmlYdxDRlSFeRfdvuxPvPpbG8cRgwY/DuQud+K6cqaUgEE0lDoi24e0G
	4NfrhaGbgCCyTxwGZooMsKlWVD0DtkV0v6I0/ilrYqGGKJY4Xr4316wRCicmRS35YH7o
	58YUyBAnHS7ts/FcAjUomvzUOauF0UAj0ZQY2IjItntF2x7RNj5/xcdpjA4KQ0whgwyn
	eqZdRBCKa8fjIqK2bUIANnyqRr09qPIbVGce3u7Ec0mTJlTplJOs2Hj078Fjgsio89ae
	5hENnoBOp2MbSLuXLK0OTZh2GdtPfQVN9NMgwcYJwZpkF4cjmhHIXPz/ojMUjWsmpxGy
	TJOw==
X-Gm-Message-State: APjAAAVvxkf/+C75hvOQZWK4kvBkNaw+76AJEYdHkH2Lyyj145qckAvJ
	Yz8Qkb1yqZq9SmZefjnED6Ab44CO1aJmBfHTwy4FFA==
X-Google-Smtp-Source: APXvYqxSrwKb6LKxkgcfLI2GKMcJu0fVFJahmBUqxX/fWnyDDE9MjcBXIxmugcOoanta0WIi1zp1zXyRKsSzP9QDHbI=
X-Received: by 2002:a6b:8bce:: with SMTP id n197mr4415286iod.299.1560518181851;
	Fri, 14 Jun 2019 06:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<CANNYZj-7=AVo51+aRpCL7k14VFiDhCtXozsSzZTbPWZO0=Ud1A@mail.gmail.com>
In-Reply-To: <CANNYZj-7=AVo51+aRpCL7k14VFiDhCtXozsSzZTbPWZO0=Ud1A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jun 2019 14:16:09 +0100
Message-ID: <CAJTo0LYA8yC8T10rj0ga0gsGT8z1J_oboW_xr_5s-V63oZsmpA@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Jun 2019 13:16:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Jun 2019 at 13:46, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
> I would rather replace swrast with virgl in the qemu machine configs. Cur=
rently it's pulled in implicitly via the megadriver package which has virgl=
 included because it is enabled by default in the mesa recipe. From what I =
can see beaglebone etc. are not affected by this.

So the failure is that swrast is no longer shipped by mesa but the
qemu BSP does this:

XSERVER ?=3D "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
            xf86-video-fbdev \
            "

However as Alex says, we have virgl now.  Does this work on all qemus?
 Should we just change the XSERVER assignment to explicitly pull in
the megadriver instead?

The 'proper' swrast driver *is* terrible, lets not enabe it by default
now we have virgl for qemu.  If a BSP wants to use it then they can,
but it's not something we should enable out of the box.

Ross

