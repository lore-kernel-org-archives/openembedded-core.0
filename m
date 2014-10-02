Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id DB9B57029A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:40:42 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j5so1986296qga.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 07:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=aAXK41JYGNuYqfwgCinVZdVEX1W/35NcL8DzUFEH6F0=;
	b=JYTAaL6tKFaISUTf1TMJzDdD7r7K+3R79FNUizw26UEOvNfmPiFxSUcCuqGELp4Bi5
	nSmMB9BKZvFOiwRnp7X3tkk+uCK+MCvclryk4EExhB9ZAqioGn90WuUcpLf0KzIDvOd+
	/AXjSaxHiK2fquzd8TGP4vZGXYY6bTz0CEvxuGrt0VMpuzutppsVz7beWcVJG6nE+Bws
	bOYAKVJ9E298zPPZK4OA43E6CJQ51TwUgesmN74WgzktTi2A/iX4RiaeJvziK0AG9SWj
	VJLDjjPVTCMu5NJ8gHuMZXKYyRB6HInNVgCWK7AvTKbWRpMCvXuQmsAlixd8+qJTTR4J
	sA5Q==
X-Gm-Message-State: ALoCoQkapQLbxIsPt6WiEgPBXyd1dFEqgmHQu468TUM9JMiB7Gb8ofrk4RLxurN8S4JCcGBYXcSN
X-Received: by 10.140.23.50 with SMTP id 47mr68197929qgo.77.1412260843409;
	Thu, 02 Oct 2014 07:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 2 Oct 2014 07:40:23 -0700 (PDT)
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB03D9B8@dor-sms-xch01.digi.com>
References: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
	<CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03D9B8@dor-sms-xch01.digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Oct 2014 15:40:23 +0100
Message-ID: <CAJTo0LYOkeLawn2TW=8+E=GwsBLEoYJdTM8LQ6LZfu3RpcAzLg@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Oct 2014 14:40:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 October 2014 15:34, Viguera, Javier <Javier.Viguera@digi.com> wrote:
> Hi Ross,
>
> I was not targeting any specific BSP. I was just using a generic toolchai=
n created with poky. My steps:
>
> 1. Clone Poky (or oe-core)
> 2. Created a generic project and configure for 'qemuarm' (MACHINE=3Dqemua=
rm changed in local.conf)
> 3. bitbake meta-toolchain
>
> With this toolchain you can build zImage kernel images but not uImage. Su=
re the uImage is to be used with u-boot, but I see the value of having a ge=
neric ARM toolchain and that still allows me to create uImage files. The mk=
image binary adds about 80 KB in a 273 MB toolchain (doesn't seem too much)=
.

If we're adding u-boot to the SDK then we should add every bootloader.
But why install grub for a PPC SDK?  This is why I suggested adding
the right bootloader for each machine.

Ross

