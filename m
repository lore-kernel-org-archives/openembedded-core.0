Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 395E374665
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 10:02:48 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 71-v6so5287595ith.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jnzxDQcWDgu1LcYj5UARhJthJTs0oQtDhujTEd3Mt5o=;
	b=d5xFaRozTjNHdm508f78VgiuMWcUkalnL4dOzazHUwWBCS3rpnCh7UEtGd41a6DYpg
	mnTvX4FxkgnRcLyFMlOUKXcfCGQ+Nc9d/W4H1APlnYfUd8ieZDzvJV8SmowS9jeNQP2v
	XkPlZPVIL3/TIsc9zccnq51aqb0+NMMc5TgBdkHbbEkrqesvIRYPrL7MhYCRP3uB3cI2
	KDxuEwdcSpDOC1XTsghJVYGwyMHgrafhCGBJQI5jFd/Dx8Ppj91A4tD9lpLYoO/Yi8n9
	CeOP11NGw/4M2kBI5OQ7P/SuqfNL+oJFo5icRxH2h2u8e15mFW8IYhTzYFeWpVy/w89J
	E4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jnzxDQcWDgu1LcYj5UARhJthJTs0oQtDhujTEd3Mt5o=;
	b=JNJRcFy4gFX75uFoRDZGt4TeDn73oEtCwydf/HCmZajG7ZsgP3I7NchWC2lQj5GgBZ
	6h+790C2vFHg8lDCLRUyFLcYrlDx8J1yyICOE09byFBqo2cr3ml+/quIdJ/bcujgDyvi
	bGY/budoTZZkWOW2D2MAWwTrZWgGcA9qn0w/wjNcCbfLF7bjG34YLZtoL9T0kXi98y6M
	bYzjiaTAbWpAKto759Dq3nVTfCwgliOMFNtCfjb57RZ2En16dLRS73z+hNvrrQ26ePuy
	6agfFNMwg9O8xWk2aO4hn3iKjxbnrHt50gs9HUghzv7qt3WeyjpbI+JENF6+wwtcVohv
	e9mQ==
X-Gm-Message-State: ALQs6tA4kqhZVpr4fnSL9SL30ZtnhyhBJdqBmPujCaWBHE8h7c80moRE
	grhbeB5A43fk5OzYSoRd5nLMqm2gzVMiPlgXYyhxLw==
X-Google-Smtp-Source: AB8JxZrJBPz7bOvtF8Ig5ivx9VTuAgYZ3zX2XNULzDL03o9mCT6pDYQu9ph9CtnBSIHD9sDTHRn5xpaBvleftqqJR34=
X-Received: by 2002:a24:a00a:: with SMTP id
	o10-v6mr6400558ite.34.1524304970096; 
	Sat, 21 Apr 2018 03:02:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Sat, 21 Apr 2018 03:02:29 -0700 (PDT)
In-Reply-To: <CAJTo0La18XQEUw2AMnNXxmQCSZacGvsaKv5pK08T387JM5A78g@mail.gmail.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
	<CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
	<CAJTo0LbD2vOaKQW7_afZXzRtY5a665mUxThgO+LPjHEAyowbBg@mail.gmail.com>
	<CAJTo0La18XQEUw2AMnNXxmQCSZacGvsaKv5pK08T387JM5A78g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 Apr 2018 11:02:29 +0100
Message-ID: <CAJTo0LYSXOA42j0_-8oVxtwnAj9FehKOikRBn-cghkyVhsUMQw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Sat, 21 Apr 2018 10:02:49 -0000
Content-Type: text/plain; charset="UTF-8"

Good news is that went green, so the problem is restricted to
CC_FOR_BUILD usage I guess.

Ross

On 21 April 2018 at 09:09, Burton, Ross <ross.burton@intel.com> wrote:
> Okay, fired at https://autobuilder.yocto.io/builders/nightly-x86-64-lsb/builds/969.
> That won't be catching people using CC_FOR_BUILD in target recipes to
> build pieces using the host compiler, but it will be interesting to
> see if it catches anything.
>
> Ross
>
> On 21 April 2018 at 09:08, Burton, Ross <ross.burton@intel.com> wrote:
>> On 20 April 2018 at 23:09, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Fri, Apr 20, 2018 at 2:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> Hi,
>>>>
>>>> We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
>>>> today to see where we stand. As is typical we got two new failures on
>>>> the autobuilder...  My test build included the pseudo bump which
>>>> caused an almost complete rebuild, which is a great way to shake out
>>>> intermittent failures.
>>>>
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
>>>> Go appears to be using the target CFLAGS when using the host compiler,
>>>> with predictable failures when the host is old and doesn't support new
>>>> flags.
>>>
>>> Maybe worth resurrecting something like:
>>>
>>>   http://lists.openembedded.org/pipermail/openembedded-core/2016-February/118212.html
>>>
>>> to flush out similar issues?
>>
>> Thank you for finding that, I remembered there was a patch but
>> couldn't find it. :)
>>
>> Ross

