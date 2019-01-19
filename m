Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE2AB6C216
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 15:35:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e5so18503363qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 07:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/JjVfnXFw9CslSzCbg3rqZV4ALp8MRbWjTzLvgSufQ8=;
	b=l5gELAZxAcvvdeOezdbSH65EIZzeHMHHIkjKOHCuIJCxPXfivw1DVlLD0hrWzziGXy
	Ft/gInvY2fhIBW18+8uuMtVWmnlgnDVUEF70KdTpJOZ2YBjDRmo3oI1eJson8/dXMFbS
	mPnEq7WBHx0FvvDLc14MgrEeQqIl1Mk2jQpKeOUNt2r9KlUBX6vGwmAOusOCFgVxPRsP
	TFzsqEzwFyD7cVBqHTYln0OEOSrz9aTY2p2vyx5Gd/haO03SoKWU7ij9QLM7C9LoU5yW
	3Shg9rok6JVCANslYkMTk9bAIt3y+vgpnL2qqLDRXan3S4xuBi9HR+hreV78DV1v8moe
	qUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/JjVfnXFw9CslSzCbg3rqZV4ALp8MRbWjTzLvgSufQ8=;
	b=SZdnv08rV7Al3U9YLEcR2pd/w9ol+JcujJft541T6X56T/bFRorWshI35ACwnSOKMP
	VzF4LI7zx7pEl6Mnta5M8yqENnqrfSwsdFr0V6kJuxrz3lWl4RNon9ydvIA5VNHd0lim
	z2oOwza9rQTRYyNJk2NuaO0osCXt5vIlBnqyepI7Kgic5xikCYrrLqfeQqFDc5B/Y1Zb
	zTPbsB9f0E7+Bvk7ro+qYu8JaxkWp/gFI0ldsLlJgZHiG7Rk5gbOUSMgyADqQZBKIYMl
	hT04lJ5X/a3DsUhfiwawaoaHSFDOiygTNIhZkGrdpFmDpTJVJ3/jdUPzNYe3h851CIGJ
	yO/g==
X-Gm-Message-State: AJcUukdjtzFEHeSwJo7e4Pco8abuueFkQp+LAhANdmFow32VpZv2Fqcf
	KKkw1ZUiTgtkC0/AKsKtHzyv4F3JhKS7T4lMHAw=
X-Google-Smtp-Source: ALg8bN64dKZCL/xOkkTLQPHqlSLzVJ9b32mKvbFqqfI1O/+V8pb2WY3vjbgYXfhkmYH3QqtmLmP/Zu3RLTFbOBR5zFY=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr20639540qtk.253.1547912151300;
	Sat, 19 Jan 2019 07:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20190118221737.14443-1-jdmason@kudzu.us>
	<9fe559c1167c274a29f0c2d73f779e024401174a.camel@linuxfoundation.org>
In-Reply-To: <9fe559c1167c274a29f0c2d73f779e024401174a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Jan 2019 07:35:25 -0800
Message-ID: <CAMKF1sq_6Ms1VRbExriCVNjMGy0pTR0JoOBcMmdP_3+P2EmTEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] qemuarm: update to ARMv7
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
X-List-Received-Date: Sat, 19 Jan 2019 15:35:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 19, 2019 at 4:16 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-01-18 at 17:17 -0500, Jon Mason wrote:
> > This series of patches allows for qemuarm to be a more modern and
> > (hopefully) faster platform to test on by default.  Firstly, it
> > introduces a QEMU ARMv7 based Cortex-A15 system (of machine type
> > virt).
> > It then renames the existing qemuarm machine to qemarmv5 to allow for
> > it
> > to be used by those who still want to use it.  Finally, it renames
> > the
> > newly introduced qemuarma15 to qemuarm.
> >
> > Jon Mason (3):
> >   qemuarma15: ARM A15 Support
> >   qemuarm: rename to qemuarmv5
> >   qemuarm: Rename qemuarma15 to qemuarm
>
> Thanks, looking forward to sorting this out!
>
> Unfortunately it failed in testing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/191/steps/7/logs/step1c
>
> (the rest of the build is ongoing)
>

indeed this is a long standing wish of mine too.
I have staged it foe meta oe builds too

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

