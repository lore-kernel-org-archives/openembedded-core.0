Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 37AE165C63
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:06:59 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so119607262igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8utqJyOZW/TynMVU932Ke5bghvS97mPOiDQtjDSB4Gc=;
	b=iVico7MIboLT4EK3qOWhdzhiOM8TeZLXG8gUvKZTm0pe+KYqHIIqQsze3fZlV46InV
	flMzzOWvFa2M78S+UCXmwfeh2DHw9UI49D+73gNKRIN9cHPebaqweyYLeqxi8X1Vzlqs
	FMiL/ERXO2hc/yaZ4B9zrXhl7gpYtdSD1PlwBzIeuQhLblO/x45NPHpB7QmOvPHamn2n
	1L+xagG6gUstHGR3eLWAUzlVK526dW8MQQev2DwskNZ1Gtvmcuk2ITsM1DDzeEREmZAG
	iZK+rjS2hG0U1HnZG813V/9eVpvmk7JL98Lvg3DTUqL/N0y//cnk4IDZ5e8PAqjJz4nE
	ynHw==
X-Received: by 10.107.157.205 with SMTP id g196mr42640058ioe.57.1433354821195; 
	Wed, 03 Jun 2015 11:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.166 with HTTP; Wed, 3 Jun 2015 11:06:30 -0700 (PDT)
In-Reply-To: <CAJTo0Lb_sTZvpxKpaeOK2y4HQUvyKyMYQEUpO8xt3PtncBoUMA@mail.gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<b945778bab5ef3c85d9e42efcf2cc904f0a137cf.1433349512.git.raj.khem@gmail.com>
	<CAJTo0Lb_sTZvpxKpaeOK2y4HQUvyKyMYQEUpO8xt3PtncBoUMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jun 2015 11:06:30 -0700
Message-ID: <CAMKF1srqpY_UzZ4nPK3mkmPTnYLa_555HHtXKwV7suamCmCqig@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Wed, 03 Jun 2015 18:07:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 3, 2015 at 10:12 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 3 June 2015 at 17:42, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> When booting weston-core-image with latest wayland/weston/libinput
>> mouse/touchpad would not work on qemux86, this fixes the issue
>
>
> Presumably you verified that X still works as before with this change?
>

On qemuarm, I did boot sato image with musl yes. but more the merrier
since everyone has different setup
there could be something I did not catch

> Ross

