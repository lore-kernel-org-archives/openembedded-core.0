Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBB670031
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 16:51:12 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id d5so10702396uag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 08:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T7PFCAAnzyLD+fTdC+rh74gyFbEAaSCrAh4UUfGYc8U=;
	b=XafEfQmVbf3hQC3WAQ+z7V/ooA4nuh9MVTrQwGyVY8OQKuoNU337iJRMY+kAC4Diwq
	KC9gelPA3hBEEpgPM9+ilsJ1vYGh7QfC49cgnnFReS3zT1jl6CcCYCWa0K5zmGw6K6Pf
	TWwQHksotlA713rKprRgHUpL4kYLdlJ4CvW2lKhHEu8M+Lcd931bnexpmQ6E/1yZXEg3
	xtf0grmEDwSUVxbSsDmqXucokb0M0b4j4p7V+pViiTy7QemZCIi9GrsViWU/Zh+AqTB8
	sKHDqamjWqdoSpsRHF6v890QsnEv75R2qRX+HF11ubP4maPvO3OOEWcOMqzIhUAYojKH
	3E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T7PFCAAnzyLD+fTdC+rh74gyFbEAaSCrAh4UUfGYc8U=;
	b=M4FEG2L9jEO2rvmN/y6fHOqDF43pg7b8/qeXg5RNyobSNosuw/aL6+7ec3vk+Do1BU
	TEEIpvEjfy2oBiYPccoPhUcOb6VkI5AJ0mOpqNLWWrkpHolPEhQAzO2Fo0xxlethPmJ+
	D2e7kSGHoBykG8lY3Zp84W8y95PiLxyZMbwnnOVxGKoQxnhjvCcfGw8TVqM63XelsB7F
	ZZzM2qWEDvQjLaNeDR9K6uWy+3OD9CSX0pbrqN2VWi+Z+89nNrBdrVpBqupCwuwTHE9h
	Zt2pr7PlM1R9lK0rJeu+2J4RKI6fSCVxtKj0/zQ1Ym7oF+EDgnWcDeBQMIE860tOPUt/
	IW8w==
X-Gm-Message-State: AMke39moHQ+a5Zdup1hc3wVkXcm5YVxwzW4k56BfGopUbXLWMfqfox7J7zRkW3Otg/g9/1oTwFVpCby3FB12Gg==
X-Received: by 10.176.83.218 with SMTP id l26mr6927161uaa.69.1486486273323;
	Tue, 07 Feb 2017 08:51:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Tue, 7 Feb 2017 08:50:42 -0800 (PST)
In-Reply-To: <1486478723.26702.27.camel@linux.intel.com>
References: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
	<1486414751-24947-4-git-send-email-sgw@linux.intel.com>
	<CAMKF1spjcD8X=oxK4HHeO05PxRsn_ieRoDhpA3QpNOxKLXCbtg@mail.gmail.com>
	<1486478723.26702.27.camel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2017 08:50:42 -0800
Message-ID: <CAMKF1sqhL0K+-Q53drSo1Mz=_Qs6GTX_QzVRh1jy11F7x3Vc3A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] meta-intel.inc: Enable linux-intel and 4.9 by default for meta-intel hardware
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
X-List-Received-Date: Tue, 07 Feb 2017 16:51:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2017 at 6:45 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On Mon, 2017-02-06 at 13:02 -0800, Khem Raj wrote:
>> On Mon, Feb 6, 2017 at 12:59 PM, Saul Wold <sgw@linux.intel.com>
>> wrote:
>> >
>> > Enable the linux-intel production kernel for meta-intel by default
>> > for 4.9,
>> > this will enable using the Intel production kernel.
>> >
>> > This is a well tested 4.9 tree that will start to include
>> > additional
>> > support for the Apollolake and Joule hardware.
>> >
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> > ---
>> >  conf/machine/include/meta-intel.inc | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/conf/machine/include/meta-intel.inc
>> > b/conf/machine/include/meta-intel.inc
>> > index 21587fb..eb759c4 100644
>> > --- a/conf/machine/include/meta-intel.inc
>> > +++ b/conf/machine/include/meta-intel.inc
>> > @@ -9,8 +9,8 @@
>> >  #
>> >
>> >  # Soft set linux-yocto as preferred kernel like x86-base.inc
>> > -PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
>> > -PREFERRED_VERSION_linux-yocto ?= "4.8%"
>> > +PREFERRED_PROVIDER_virtual/kernel ?= "linux-intel"
>>
>> whats the difference between linux-yocto and linux-intel ?
>>
> Sorry for sending this to the wrong list.
>
> This is a valid question, the difference will be faster integration and
> better testing /validation of upstream (or possibly pending upstream )
> patches for Intel Hardware.
>
> Since the kernel will be coming from an Intel Source, it will be fully
> tested on more hardware that the current linux-yocto kernel gets tested
> against.
>
> The update rate maybe about the same, with security updates as needed
> for more severe issues
>
> As other vendors maintain kernels for their meta-vendor specific layer,
> Intel has chosen to maintain an Intel kernel based on the current LTS
> version (4.9) plus upstreamed patches. All content will be backports
> from internally maintained tracking trees being regularly updated.
>
> meta-intel will likely continue to contain the linux-yocto-<latest> for
> a non-LTS kernel.
>
> Hope that clarifies this.

yes it does. So this is not a clone of linux-yocto but based directly
on linux-stable.

>
> Sau!
>
>> >
>> > +PREFERRED_VERSION_linux-intel ?= "4.9%"
>> >
>> >  # for Xserver older than 1.13.0
>> >  OLD_XSERVER_X86_EXT = "xserver-xorg-extension-dri \
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

