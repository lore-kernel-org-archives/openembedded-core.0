Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id A75AA6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 17:01:13 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id s184so9081887vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VKiE3oD4OzhUbcq4gumes/yBUj2uxFhoGm35SligJZA=;
	b=YXbwiEfsaGdhYFUdRGmpyQwGS0bsS40jmL4CgcGQ3eKcbvF8N3jyijGtU1t6H6+IBo
	x0PSi8mmlQNK2t8GvvHHJN7PMf6t7T4nxY7iTrWUSivLrR7vMyisFnxI5/j9hJVuizh9
	pt1dK3xkmoBl6WeBdyE5nf1Qc+G8ir/G9OBp6W7/KEuEcOOCOtU9TaJ+KWiBklDI+17d
	pzqS78VfL1p8O94yhsz8GeOiQJXpfYRaM12asH7jAcsaT0yIyS7ZF4+RcFlMC15UtPwk
	1OAZ4qZRpRkuxAzEZ5U1mODgHxFt4YRySKO+duRCoZPuQ4ZE/19qWuLH7KOklLpp1ziG
	CypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VKiE3oD4OzhUbcq4gumes/yBUj2uxFhoGm35SligJZA=;
	b=bqc7rh3+bG26kSsKVXCdOmA+4PinFZHKYSgrD0Uw/VEvAiejxlb7jkaEr/UHp8W8x8
	A7vtgywNMEnWuCrFYtQY70eR+zoI/u+l+3084V43HSAzA6GNx+pKl2O8HjjqkaDV04oh
	xfk4xvGeRy33Hl7g4HYuU3OKECN3zShtT5tlxEn5eBnmtQb4SqfMf3U7l6Dedo1iQPoj
	vOpJBQuSB6K5mZ+BL/OBF5l5BW9Ej4IYWI3jZNQiutLJEEXvi5KyeHyqLgRZB1fyXgmx
	s9DHcsYKDseSeWpRvBfF3f5GVyMgXPTNg2mYxMziFCB6IIc0720i5AybG46MshZY2kQr
	BgTg==
X-Gm-Message-State: AOPr4FXR6I/5WAimbjkuNOPcJTSgSPZPska9vQ2GZFFtenf7JC1TkwAklbroOOiG477E2skGki4xZnkmFB4ryA==
X-Received: by 10.55.155.22 with SMTP id d22mr11216617qke.26.1463068398780;
	Thu, 12 May 2016 08:53:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 12 May 2016 08:52:49 -0700 (PDT)
In-Reply-To: <CAMKF1so5gMvy2=s-7zmRh9R8x+hobqpyVdYBh=4unMDNNx_gdQ@mail.gmail.com>
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
	<CAMKF1so5gMvy2=s-7zmRh9R8x+hobqpyVdYBh=4unMDNNx_gdQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2016 08:52:49 -0700
Message-ID: <CAMKF1so8GZgy=BR_QGwwoFGy3NxWzQ4iibuYCEwXWgxU4RDUoQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 May 2016 17:01:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 7:27 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 12, 2016 at 7:27 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>>
>> On Thu, May 12, 2016 at 10:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Thu, May 12, 2016 at 6:28 AM, Bruce Ashfield
>>> <bruce.ashfield@gmail.com> wrote:
>>> >
>>> > The patches are not integrated into linux-yocto-4.4 and I added the
>>> > patch
>>> > I've
>>> > attached o my zedd/kernel poky-contrib branch:
>>>
>>> Nice, is this branch already proposed for merge ?
>>
>>
>> Yes. I stacked it on top of the -stable updates I sent yesterday, so it is
>> proposed to merge
>> for master and krogoth.
>

I have now merged your pull branch into mine and dropped my kernel
patches from my original pull requests.

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6

