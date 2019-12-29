Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 24A487F7E6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:19:20 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d71so17121827qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Dbhb7XCw7dwU5fcfyWE04okOQ+OitMm2vIRf0rr+ptQ=;
	b=l7lDr16fyZu/7NKUl/5jqQkdAJl7D2cPEKRCm7n/Ao7JxC7yUCRLMs8x8DISloOk9G
	rbeKTb9Hf46f7ue8GUwMVRUGlt8EV7AVARllk+AFpG9/D6hbVQ7am7IcA9WV2k8FJimz
	cE5PvDrGBco+Cv5GR3fG6orUe2wobzCa5S4xoIHUWqQmwZJWRXPwnUMzR4MSSMB9L5I7
	f17HnOsOpKhI3r9pGFR0ZDbeGzbOiUhMTcS6MsXISL8/j5ygIXPcoJZQI5KcIVJhfqpW
	vd6SKKecC5RXFoyWSNUfneY3lT7hXh0ey01KNAmyxawSaslM6EWIU7qk5+wFIgJEkLgh
	WeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dbhb7XCw7dwU5fcfyWE04okOQ+OitMm2vIRf0rr+ptQ=;
	b=LSKcrZ/XEs97h/RJtvGzpGgwZk0aYtowncxCr2S8df1+txAE05fyW2geK9Gvlf0yaW
	wqXK56xY4jfE4wa64lAD0124fvNBL7/r0yuakMppFeS/TFdvUvQr/yXJ2L9vhAlDMr4f
	sA3IHDniKcKBl5DPNxObjzw0ux+qer/MevuSMaT2BULVG2m2zqrhefNIjwx1fPVDVlzx
	yqPjqS/5G588LckTJYdVvsmZvknQdB3VdyD6wHmDWbPJQ2wrsUSb4DnhYAXBfcAke4jo
	JYmlxBctIpCujsoWbo/yAby7gALjlFkO8pPAQxpgsWtBeN/xEuKFsgH/m824aFqTDzB3
	0DGw==
X-Gm-Message-State: APjAAAVAwmr6jzFa86R/YLdsqsZML7T/4EgjBZZGwSwa6ZXfSP2DNckK
	rmC68smUZ4EQm6gt7gXH1bNI7TZ973tenoTg/8U=
X-Google-Smtp-Source: APXvYqx7FhAKk/kqot3OVxLEBZ6pjNl2bwbU1mBJ1qbn4P18oe31c8Q/96wAoOuuhffoO9UB6IezkTxtyh0d6+X4g9s=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr53077302qkh.9.1577643560697; 
	Sun, 29 Dec 2019 10:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20191224224135.20121-1-alistair.francis@wdc.com>
	<8c9256ff3e84ac5d8e9acb0f8e7a9bf60baf9dbc.camel@linuxfoundation.org>
	<20191229134620.GW18106@bill-the-cat>
In-Reply-To: <20191229134620.GW18106@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Dec 2019 10:18:54 -0800
Message-ID: <CAMKF1srQ-4+9rvWWAsG3XeXijNTuv2pYwsuLEPawqHUj3NY1fA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: sateesh m <sateesh0457@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to v2020.01-rc5
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
X-List-Received-Date: Sun, 29 Dec 2019 18:19:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 29, 2019 at 5:46 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Dec 29, 2019 at 09:23:47AM +0000, Richard Purdie wrote:
> > On Tue, 2019-12-24 at 14:41 -0800, Alistair Francis wrote:
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > index a0f9c41469..4799948bb1 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > @@ -11,11 +11,11 @@ LIC_FILES_CHKSUM = "
> > > file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
> > >  PE = "1"
> > >
> > >  # Drop this line when updating to 2020.01 final
> > > -PV = "2020.01~rc3"
> > > +PV = "2020.01~rc5"
> > >
> > >  # We use the revision in order to avoid having to fetch it from the
> > >  # repo during parse
> > > -SRCREV = "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
> > > +SRCREV = "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
> > >
> > >  SRC_URI = "git://git.denx.de/u-boot.git \
> >
> > Seems to break on musl:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1392
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1396
>
> Looks like the Gentoo folks hit this as well:
> http://patchwork.ozlabs.org/patch/1211367/
>
> Can someone review/ack that please if that's the best way (rather than
> reworking include/u-boot/crc.h) to deal with the problem?  Thanks!
>

this patch looks ok to me but I do have one question
Include should be "compiler.h" and not <compiler.h> which would be for
system includes, is there a reason to not do so.

> --
> Tom

