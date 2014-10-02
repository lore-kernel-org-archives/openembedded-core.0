Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 225A4716B5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 19:02:45 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 9so1446498ykp.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=aoldVAxeG+nxoWldU8+n135E8hWhF06jZ2mUMD28XNU=;
	b=yUf2TxZvIb7/ryb+bk5nOxTWnNgKMMyjX2FcdbbsoHHCOe8CdxJUAFjBghcGlKJCtP
	bfrJjXIVMSB3YEPqf/XFweYyuJs31TUnUvc5gFqPopBmARUrQTJfcin7P5ZhCFhBt83I
	VuE8m/le/65JlG2qEKuz1zY9dc8AqWqD/zijzof3vPx9Vh2YbJRVRGwaj3AhwCq4C+oq
	oGILMrF6E8VpUDnAk43rsFWhq4ebLX2Vjcju3qqjaW6riJB9YY3G8peU4mnVq7RlOIqO
	Vs4UV4p9A/iEmJA324rzkI1uNEyLx5IuBQxaX6LvNzoMBLX4XAcKJRKBMIzTGijuBg1K
	ZVwg==
MIME-Version: 1.0
X-Received: by 10.236.207.69 with SMTP id m45mr1213226yho.6.1412276566327;
	Thu, 02 Oct 2014 12:02:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Thu, 2 Oct 2014 12:02:46 -0700 (PDT)
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB03DAAE@dor-sms-xch01.digi.com>
References: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
	<CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03D9B8@dor-sms-xch01.digi.com>
	<CAJTo0LYOkeLawn2TW=8+E=GwsBLEoYJdTM8LQ6LZfu3RpcAzLg@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03DAAE@dor-sms-xch01.digi.com>
Date: Thu, 2 Oct 2014 16:02:46 -0300
X-Google-Sender-Auth: fPFdrEVQ97wB2JojWM9X3xpTpPE
Message-ID: <CAP9ODKp9EmiTgaLptOQ5qKYjadJ0zBB00_Gjs1whd-i4PB+bJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Viguera, Javier" <Javier.Viguera@digi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: add nativesdk-u-boot-mkimage
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
X-List-Received-Date: Thu, 02 Oct 2014 19:02:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2014 at 1:51 PM, Viguera, Javier <Javier.Viguera@digi.com> w=
rote:
>
>
>> -----Original Message-----
>> From: Burton, Ross [mailto:ross.burton@intel.com]
>>
>> If we're adding u-boot to the SDK then we should add every bootloader.
>> But why install grub for a PPC SDK?  This is why I suggested adding
>> the right bootloader for each machine.
>
> Hi Ross,
>
> Not sure if I follow you. Are you suggesting adding this in a bbappend in=
side a BSP layer instead of oe-core?
>
> Or something like the following would be suitable for oe-core?:
>
> RDEPENDS_${PN}_append_arm =3D " nativesdk-u-boot-mkimage"
>
> This seems strange to me as I don't know if all ARM machines use u-boot a=
s bootloader. How do I restrict this per-machine?
>
> Notice that strictly speaking this is not "adding u-boot to the SDK". It'=
s a host tool that allows to create kernel images suitable for u-boot. But =
not only that, it also allows for example to create FIT (Flattened Image Tr=
ee) images. I seem to remember there was a patch lately to add support for =
FIT images to oe-core.

Ross concern is because we shouldn't force mkimage in every SDK. If
someone is using barebox, or grub, it shouldn't be added.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

