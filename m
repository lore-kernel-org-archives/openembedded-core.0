Return-Path: <leon@sidebranch.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF8957CEC4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 15:36:38 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id m20so4732900vsq.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 07:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yzNgugB5Zl+Xd6E+QvUNQXuSj/UU7pR/0sN0lECn3e8=;
	b=hfJu6fi7vEo+vrIcWFXcn/aS1/m9AB5bJf0yek2n+Guncxca4wC4jkIwWOObIIlxOI
	iu+vLRLTlFP6nPn2ARDG356VBqALV3VFgBCXbmDTrFIkzypocPkM6vRFxVeg1iOv4eHK
	WdpLfYoD5IgekZzH4VeYI8vt6WiRVGo41109z2hnpvd/wEp6Xht7eshX6kda6IfF71fA
	6o+Eq736kewB85AsZs/hxb9+oQxY5vTBsCKbeDbQsWHr/MtBDFE3IsYXbfcTonXTD/7p
	CKmM/75Bg/XJhHOe28wHTy2bF6ml4IqaeEJwtFeXLDdPA5vYMy1IP5XcNUzcRNyC4CAN
	G8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yzNgugB5Zl+Xd6E+QvUNQXuSj/UU7pR/0sN0lECn3e8=;
	b=CgnkrPMJ1SKPSF/iePE/YnPFgp7vKiohv1Gv1V/ltuZDSpjq5MVjyr9pAbgouZ7r8c
	MwX31++P7DzUNUmjK9zch1FMDIlyAld03UtrBsBlsbTsd+XpenHGLB66CK6IEyPN0xZr
	UdG+AlUP3hNiJD0RuZ5/AwXfjdzmk5Nmu4navc3ws5ZuMp1/pYBfimVPi6OsLgmvFaY8
	tH8XnQ0To4kgv8g6jh5yHG1LW+QnL12yE5INvQxnzx1x5GNyEd7P+CVe0f8N5jRtBusJ
	GOrRQ8gJwJ20Slx1RYcgTN+JLZQu9WARpz21dE2t8YYjKuZ6GD6V8eQovZRFQP5MZpHl
	p7rw==
X-Gm-Message-State: APjAAAWu6NnOVJa2Fk7GlYAUwahwZfnKEs3aq1eOogfEdqsX0cZc3z3A
	0Ftx9FVpjiFO0ygZSXvxfOVYM4QPyJ5+FWmcP+y/ew==
X-Google-Smtp-Source: APXvYqzYQO6pRYsOBh7RLrsP1FgOud5YE0RrLRS0cgJf0VSV34ffzkQ/o1sAhSd2uNyuWkZKZZL2DkvTi+/6+IksA3o=
X-Received: by 2002:a67:f153:: with SMTP id t19mr7357636vsm.233.1551972999519; 
	Thu, 07 Mar 2019 07:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20190307142709.12076-1-bunk@stusta.de>
	<CAMjhiJg_2+jdiJaiWHumQ2oXc80apXhJ3RaiGnsWM4_-2QOMRg@mail.gmail.com>
	<20190307151827.GA16556@localhost>
In-Reply-To: <20190307151827.GA16556@localhost>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 7 Mar 2019 16:36:27 +0100
Message-ID: <CAMjhiJhJqTiPSAf+0zWS_FxadAJSXkuw0Mps00JpS3KAbaX=eA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Thu, 07 Mar 2019 15:36:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Thu, Mar 7, 2019 at 4:18 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 07, 2019 at 03:56:33PM +0100, Leon Woestenberg wrote:
> > On Thu, Mar 7, 2019 at 3:27 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> > >
> > > It looks like there is an implicit dependency on util-linux'
> > > umount - as otherwise when using busybox' umount we see a
> > > long delay on shutdown / reboot.
> > >
> > > [YOCTO #13058]
> > >
> If systemd needs util-linux mount/umount in master it should also
> depend on them in older releases (both master and thud had systemd 239
> at that point).
>
Agreed. I was just adding info to this e-mail thread. The "looks like
there is an implicit dependency" text was a bit too vague for me. I'ld
like to add the root cause that was found.

The implicit dependency was for a specific option to umount to be supported=
.

If we have the proper busybox in master, we no longer have a implicit
dependency on util-linux-umount.

(The reason for the util-linux-mount dependency was different, AFAIK.)

Regards,

Leon.

