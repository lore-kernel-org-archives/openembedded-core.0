Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5C8471A92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:14:03 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r78so6505778wme.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TrGhDOGgDJfzJXxdvLc7dfsV1IWCvxmL/HmNZJsIlXs=;
	b=srPC8vs15np/haGWepdtYNBpWw8kmNn+eOf5mRmH9zRuJoQMxQwEa7OdYd3IcQQE7q
	egPJiqqUgffYfEN8Y9sXmet66L4Muv9QtWfB8SFPOM3vCcI4j2pwcNugsdvrFe3MUfhr
	thuim4MyWhqnTqicMye5cpeSzpEImDzEVkdZRKhWDntuXxLiUxQPqx7wmdkErtinShIF
	ijkDo/Tz8x7ZPGBAAHOM5PxKgblLLTerXkXD5K0UqTsmUa57fvkdJhvWPV8DR+dKsbVz
	zcfi8JTrDghg6asKVLpEQFINb161dNFzVqH/drzaH5PZna8B3jSMGPoGxaDvp8JEsbH4
	gC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TrGhDOGgDJfzJXxdvLc7dfsV1IWCvxmL/HmNZJsIlXs=;
	b=qon7efnkMlMwR4PUQMWVQg72ZukRcXWPYyfZk3G9O/fDoNtkqJVHBxt+aNgTb7ZF2d
	uxtIWy1IaPMQkmGGBLcm9gE/PSFP/2OB3trWQf6UBNXJb2kJN0pMsVA2yCwQtfsCgmFT
	+x0wTkMExkdjmy7q750UaNtboqGpIv1EntDpTmy4uOPY3f6Gwrn6Y0q42MKCvaL48fQM
	xLlIWLP/H6xv/AttOgaanUfEVyYfP1k2/8X2kTHAnZDfhb691CW46fPvJfv5sNw/VXyh
	SuBy3IdCjOrvAxUEaMTU1YaORA5yIS93blz0CWcSltcMtx6g3MbLgpMn6ww+FBvXzm4f
	/Smg==
X-Gm-Message-State: AKGB3mJOIw8JoGdlScqMpvt5O9oP/ivP8Y5FC1TjYLoRTPF5aHMvV0q4
	kFORHM10kmI4gEx4OvbHbHxGrbWd1tMNsrogbaA=
X-Google-Smtp-Source: ACJfBougmoMqSybsMPofAq0Wow9jECtG0NuZQKDG2+fYnQ19vDzEvrzBtVhpjUfr2vNLOTW6aR+FAwaXZGpSryjeZ0U=
X-Received: by 10.28.172.202 with SMTP id v193mr5346354wme.10.1513721644441;
	Tue, 19 Dec 2017 14:14:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.184.47 with HTTP; Tue, 19 Dec 2017 14:14:03 -0800 (PST)
In-Reply-To: <20171219220638.GR14220@bill-the-cat>
References: <20171219201148.19828-1-sgw@linux.intel.com>
	<20171219205438.GN14220@bill-the-cat>
	<CAJ86T=Vkj_5FEWTheHJrH_N0nucHo9yW0MANMoevgUFwnswQ-w@mail.gmail.com>
	<20171219212050.GP14220@bill-the-cat>
	<CAJTo0LYRX7xJzvGNJoNWztCAdWZB=pKfFfjKsaPSA9J=WtfEPA@mail.gmail.com>
	<20171219220638.GR14220@bill-the-cat>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 19 Dec 2017 14:14:03 -0800
Message-ID: <CAJ86T=WDyE8ikOvrTeS+ZYwhOOb+-Bwykp5oWrMTk+5E-fRRKg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Tue, 19 Dec 2017 22:14:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 2:06 PM, Tom Rini <trini@konsulko.com> wrote:
> On Tue, Dec 19, 2017 at 10:04:29PM +0000, Burton, Ross wrote:
>>
>> I suspect this will just hang in master-next and never merge into master.
>
> That sounds good.  And I suppose at this point, it would be pretty
> likely to not, too.  Maybe in the future we want a tag in the commit
> message or something to make it clear it's not for merging to master
> itself?

The previous two rounds of debug for this issue are already in master,
so I expect this will get merged to master too... and then all be
reverted once the underlying bug is resolved.

Personally I think occasionally adding some debug to the master branch
between releases is OK.

