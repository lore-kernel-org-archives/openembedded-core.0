Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id EA7CF77346
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 15:18:26 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id f81so58397867iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 07:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aXQ0ZKMaY/d4Gdi7YzY+uErf6UDdsB2PJ/vv1BLZXQo=;
	b=Scol34/VWga/AHAQ/NdKnSOpPdX+avsxSEHZQxyabbKAgqQ7Sf2hWRUkQ60CRxSVqt
	3BKtABLy9+QORY7wIyvh6UEeFgYbilaoIk+/D237prUXQCNYtoltNCoc+8CiJ2CaqaLr
	dCvNS57Nqll8nAfW447OEP2bE8GuNiGXX53t3hKHDqz1Ipxe2Kxm4gSJiI6fph0wirWK
	AdRg2x7dILFOIUaFl7j67S/Z707kU9UFSC26R7EPIf/h/vtqkLYlMcKblvJlac7EI5Kw
	eXs+Ta/35xUvRod7Kbd78F3HX9apcwlBpY1FTOPv22wnLNdxe+PtiC63lBF7nLDH/A7Y
	WooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aXQ0ZKMaY/d4Gdi7YzY+uErf6UDdsB2PJ/vv1BLZXQo=;
	b=kHjSFXmlGmGIsF02FYwHPAHRoWa22Sb/CL1e1Uqk4uPJibf3un2/epNr/PWzjgzWRI
	j1IOcOFHjwidonwC+n5ieqNRVUMYxOAPA1iTzXPyi9gYSeaZxhF6dL4PvAmWSvfdpFVe
	FEdF0HBSI02GUJRD/vUvEyiC6XsXIU5l7EFLyr10aki/vrHVMjydogX7EsOfQZE7regN
	3S/t1knfj5Mn93P6hEntl/GaJvO0CwV6sAMsxjxezhFMSXocxKW2nxQGTJBwkCV6Yzqv
	FQRI0tSvJFQ/onHknNOAe+EGm7Flm75gfOHDAbBW0FE+AAtw+M2qZOTj7u/13LMwv06H
	vbdA==
X-Gm-Message-State: AG10YORYXteal+5SKtRkQHyYK+hOJUcZGkRDdjisacifFvX4DhvGHw7+ulq+WO6v3Bv+Z05N3ZzaGeGHav+Vtg==
X-Received: by 10.107.9.211 with SMTP id 80mr3820765ioj.112.1454512706760;
	Wed, 03 Feb 2016 07:18:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Wed, 3 Feb 2016 07:17:57 -0800 (PST)
In-Reply-To: <20160203150847.GB20736@mbabyjoh-mobl.fi.intel.com>
References: <1454495408-23334-1-git-send-email-maxin.john@intel.com>
	<20160203150256.GA2567@jama>
	<20160203150847.GB20736@mbabyjoh-mobl.fi.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Feb 2016 07:17:57 -0800
Message-ID: <CAMKF1sr53+P_tb+aYr_G5rtfQBHX5rh_e+KzEHn85dcTvohQdg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] formfactor: add machconfig for qemumips64 and beaglebone
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
X-List-Received-Date: Wed, 03 Feb 2016 15:18:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 3, 2016 at 7:08 AM, Maxin B. John <maxin.john@intel.com> wrote:
> Hi Martin,
>
> On Wed, Feb 03, 2016 at 04:02:56PM +0100, Martin Jansa wrote:
>> On Wed, Feb 03, 2016 at 12:30:08PM +0200, Maxin B. John wrote:
>> > We need machconfig file to automatically choose between physical and virtual
>> > keyboards.
>> >
>> > [YOCTO #9027]
>> >
>> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> > ---
>> >  meta/recipes-bsp/formfactor/files/beaglebone/machconfig |  3 +++
>>
>> I still don't understand why beaglebone specific file should be included
>> in oe-core, all other BSP layers are providing own machconfig for their
>> MACHINEs, why should beaglebone be first exception for oe-core?
>>
> Apart from what Ross mentioned before,
>
> commit 76b1d595cd7104797495067cc8c59db631edb75d
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Wed Mar 26 15:21:10 2014 -0400
>
> added beaglebone to meta-yocto-bsp. Before that, ARM reference board was
> beagleboard.
>
> commit 7254dfb642cb0262c7e14ef2a4c8a7a42afada60
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Fri Mar 28 18:07:01 2014 +0000
>
>     Drop beagleboard, replaced by beaglebone

yeah so move it to meta-yocto. OE-Core in-tree BSPs are just the qemu machines

>
>> >  meta/recipes-bsp/formfactor/files/qemumips64/machconfig | 10 ++++++++++
>> >  2 files changed, 13 insertions(+)
>> >  create mode 100755 meta/recipes-bsp/formfactor/files/beaglebone/machconfig
>> >  create mode 100755 meta/recipes-bsp/formfactor/files/qemumips64/machconfig
>> >
>> > diff --git a/meta/recipes-bsp/formfactor/files/beaglebone/machconfig b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
>> > new file mode 100755
>> > index 0000000..ffce012
>> > --- /dev/null
>> > +++ b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
>> > @@ -0,0 +1,3 @@
>> > +# Assume a USB mouse and keyboard are connected
>> > +HAVE_TOUCHSCREEN=0
>> > +HAVE_KEYBOARD=1
>> > diff --git a/meta/recipes-bsp/formfactor/files/qemumips64/machconfig b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
>> > new file mode 100755
>> > index 0000000..56777b6
>> > --- /dev/null
>> > +++ b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
>> > @@ -0,0 +1,10 @@
>> > +HAVE_TOUCHSCREEN=1
>> > +HAVE_KEYBOARD=1
>> > +
>> > +DISPLAY_CAN_ROTATE=0
>> > +DISPLAY_ORIENTATION=0
>> > +DISPLAY_WIDTH_PIXELS=640
>> > +DISPLAY_HEIGHT_PIXELS=480
>> > +DISPLAY_BPP=16
>> > +DISPLAY_DPI=150
>> > +#DISPLAY_SUBPIXEL_ORDER=vrgb
>> > --
>> > 2.4.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> Best Regards,
> Maxin
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

