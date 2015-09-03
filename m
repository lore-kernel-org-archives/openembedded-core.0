Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id BA2E976EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 12:15:38 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so37878747igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 05:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=TPGcUoDaMRqK+kLs/UjXhRiNcN29HEg45rQFkdjikas=;
	b=O1VLsB4AH8acJalq3dtJQfj+Seg0TJDbwvQSS7E3TOnhAfnWviACJAY8Cn3EvZObXd
	p+gD/h1fsvvG4gx9T9kYwcnHb2B6QRwKjGR13OnuatynK8mMqcrnYdp0x3yXfTskM3e1
	0TBtoW4//SaI4g5TUOZqz9DCW7UrrvKiHxtYL4rYDpNsFvgDA9R9ptQ52zrPimaRry7h
	YiOgQfa0T4TNoDKJvJbHqD+vdrglfMKhnOFnBy8nPvoB7QyGDR8jB7oL5lAKpT3I3xH/
	RL7Kyw4QWRNm6kOFXl6YeAnBDGHex+XAOUTp+E8mJNpARsRVSw2t8yiC82/KBrf6Fs17
	X/Yg==
X-Gm-Message-State: ALoCoQmDuxYDofU2rt7SR0rGmKpjo6tCSROUvTFgrUWb07aEEOVyQ4JHZR7F3SDLf7GgibKKFJWu
X-Received: by 10.50.13.72 with SMTP id f8mr11919830igc.50.1441282538215;
	Thu, 03 Sep 2015 05:15:38 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174]) by smtp.gmail.com with ESMTPSA id
	i89sm14695128ioo.31.2015.09.03.05.15.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 05:15:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so55425047iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 05:15:36 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.130.153 with SMTP id m25mr41828126ioi.192.1441282536242; 
	Thu, 03 Sep 2015 05:15:36 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 3 Sep 2015 05:15:36 -0700 (PDT)
In-Reply-To: <1441282288.24871.113.camel@linuxfoundation.org>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
Date: Thu, 3 Sep 2015 09:15:36 -0300
Message-ID: <CAP9ODKrX2ebnP9p3xz8M5+zQmy-6a37yz3rUR1QXEroozHCSvQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joe Slater <jslater@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 12:15:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 9:11 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2015-09-02 at 16:23 -0300, Otavio Salvador wrote:
>> On Wed, Sep 2, 2015 at 4:09 PM, Randy MacLeod
>> <randy.macleod@windriver.com> wrote:
>> > On 2015-09-02 11:55 AM, Otavio Salvador wrote:
>> >>
>> >> On Tue, Sep 1, 2015 at 6:34 PM, Joe Slater <jslater@windriver.com> wrote:
>> >>>
>> >>> Implements ifup and ifdown.
>> >>>
>> >>> Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
>> >>> as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.
>> >>>
>> >>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> >>
>> >>
>> >> I think this belongs to meta-networking. Also, what this one provides
>> >> which is not provided by the busybox one?
>> >
>> > We're trying to make busybox optional for larger systems
>> > that want to only use the full-featured/bloated packages.
>> > It's not a large tax to carry busybox in a 50+ MB image but
>> > it would be nice to not require it.
>>
>> I see; I still think this belongs to meta-networking as it will allow
>> this to be done however won't add new recipes in core.
>>
>> If many people start to use this, we can move this to core.
>
> To put this another way, I think it is probably reasonable that we
> should be able to build an image from OE-Core with basic functionality
> like networking without busybox?

That is the point; this were not in meta-networking and noone missed
it until now. Moving this to oe-core straight seems overkill.

I think moving this to meta-networking is right and if many people use
it, oe-core is next step.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

