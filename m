Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99EF160249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:41:55 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id e35so5467756qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bljptgJ6f+KtPytWCmRxNEwL7TCohN7E99ANxnbrMOw=;
	b=NL/W+nPzJA0/e5BKXSisXkqJ4vahhEqZGcnRglJFFCthUSKazjpdHZ0Um7IqkfmP6S
	+chUJr3FlON0ZpnfbgLytCr2g/d9NRLdDSBd5r0FrFRs+qeoontgJbADYSbWt77VIxeI
	Qy5fDmKnJnORAItAjZFLEfXJFR9tsNNheEMYpFqbA/F5/6vTb/A66H1ET3pRjvhz7s5a
	/4D7Exq0HGiz6MKIulMWjcNa6aLcEfxFIIDVoDOMiXraMyf13OunqHOi1nGK0zqVX/nZ
	RS4m+mUw2wHxs6+sEIyYgUv6x8t/b8RpG09TibV7kzMQK/3AwLm13fath8e32ihntj7C
	HiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bljptgJ6f+KtPytWCmRxNEwL7TCohN7E99ANxnbrMOw=;
	b=NFQK17DHIemgM+F4qdFOaS2Q1r1bLRvnk9mC8Ga0v/1g5QYNBHRLjT2F0ufbxWXLIq
	PM5+r2i4iaXoFkjnTuIuhgkvrAReF3Sz/lDRud3/EgOAO9W5NV2J1qC1S7vytXuuwjr5
	XCqb4iIzmsRKwN1WBks6xhKSJTiQNEa2g5LoIsXngYw23VzYBdD6UozxPxPQn6ZzEZdp
	4KiMfyVhQDA5vQJYC/vYCLqKvm/jZXHUe5UfuA5a8U9HeOgKnK/JDt/k3giIcq+Jmz5y
	RgKK4istdPaio3yntQCfz93kMY42+8n7jJIiJpC9+Dc5ws71QDqlZLTbmUNKKRKR4Mj0
	1UfA==
X-Gm-Message-State: AOPr4FW/DYyxIslWkOHVr1fZtqTMs45U21Hk+XQK488U1N0dDo1gddmbFTsz1y1eHN0DiOln6UYibp3/QjcTOQ==
X-Received: by 10.55.74.9 with SMTP id x9mr10074397qka.81.1463063303633; Thu,
	12 May 2016 07:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 12 May 2016 07:27:54 -0700 (PDT)
In-Reply-To: <CADkTA4Me6=MAUfLRVdtb0KYua1ut3ofuKxGESr4m-8gB2ZAdBw@mail.gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
	<CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
	<CAMKF1srqdFXR4jD12MFL1rwco2aCyKYwh7dwKnNbC6xnu6ON0Q@mail.gmail.com>
	<CADkTA4O+yfpCXFzpqWcE1sC0TKD6TH2Xfbt7xiA3ncxBkYikTg@mail.gmail.com>
	<CAMKF1sonno53gN+P8=Sdxems6pZnDEGqMCMNzObJsqByPjda7A@mail.gmail.com>
	<CADkTA4M3S=rRWD8+-j+qo0jCJ1AmSJjNEDOy61+AXMLJwRmv8w@mail.gmail.com>
	<CADkTA4MXrL5Z+TwOU=O9dJseT-mFWKBNka1D2Gvb+740zQ+jYg@mail.gmail.com>
	<CAMKF1sq8GmdowYQf6cyVJZxmXWzi7y+usAe-wpTVq2kjztXEQA@mail.gmail.com>
	<CADkTA4Me6=MAUfLRVdtb0KYua1ut3ofuKxGESr4m-8gB2ZAdBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2016 07:27:54 -0700
Message-ID: <CAMKF1so5gMvy2=s-7zmRh9R8x+hobqpyVdYBh=4unMDNNx_gdQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/42] linux-yocto: Fix build on ppc with gcc-6
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
X-List-Received-Date: Thu, 12 May 2016 14:41:56 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 7:27 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Thu, May 12, 2016 at 10:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, May 12, 2016 at 6:28 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> >
>> > The patches are not integrated into linux-yocto-4.4 and I added the
>> > patch
>> > I've
>> > attached o my zedd/kernel poky-contrib branch:
>>
>> Nice, is this branch already proposed for merge ?
>
>
> Yes. I stacked it on top of the -stable updates I sent yesterday, so it is
> proposed to merge
> for master and krogoth.


perfect thanks

>
> Bruce
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"

