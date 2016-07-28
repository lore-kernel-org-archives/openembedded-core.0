Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E28876072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 13:56:21 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q8so4893922qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tzkaqXYUD4b+kMRZouYJZ6AAhlw+tbFmXRrJqTyPqCc=;
	b=Wc/vWEpsu0IZ/Lur6REKYWOwqB+fGNibswbBvNHJI9ZihjCCrlPFIo4TXaORzc0Kly
	W/VY6R7Muy14SRHdqBAunRZwZvDRDWpZa3skkEbv/vDCiiYKlcVLjPbSuXSYHhQ5T68j
	SMqb9G1qBd6hi2iLE2aSRIQIbHDFpoNRrz27NDosjMLVGolHjF/lPqgDI5dOc/r78xTF
	URPyAIeU7U90q3fDUWktLgxCHnXi+d1TSgWcmGae1OAE1Kot+h05z4LCcr851eI6BKti
	/QryTXVWjT/JeNmMFKA07D04a9DfKdVjAdA8kSg7HSoR9uSrg0gLo7yq5VrzbOAZCiZr
	p+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tzkaqXYUD4b+kMRZouYJZ6AAhlw+tbFmXRrJqTyPqCc=;
	b=M++RCX2fJygV3iflx2cuJBNigDgnu9MgeJ9AlKZ4m6Q1X8Lcl+F/zENBM/quDVyNqA
	c2oDJe5UzP4ntyoBN8lqYLe8Mc8cBhYj6tb9RX1eJpF6h5Youfz85ketkGFnFwW0AFs9
	spvzAEu3o2qe4DCf1x2weV45IPkkDEtaylcuvWKAaWo7cymSNhzYh38kskrzVPLb0ksg
	ZVN9NDIFEmJ2FfRq8GULbszjN9oJCAVfrQhADQtfoBcqwDVMh1Yz03d5M2Hv6sObR26S
	Uwd38SLCc9CNi2caImokmCpwv3iLGL42T8Ur+1/qsKvVwETJRHlCuYAiE4Ap0udJFy6X
	shnA==
X-Gm-Message-State: AEkoous1C+xFTbdeJ5hyiRHNE6lmUew0pwUs2Xl9Mf8p/7bHHVVsdJL0hpKIVPKjhq9dwzhHwnfYUUSX8e3EEQ==
X-Received: by 10.55.39.142 with SMTP id n136mr44981236qkn.149.1469714181887; 
	Thu, 28 Jul 2016 06:56:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Thu, 28 Jul 2016 06:55:52 -0700 (PDT)
In-Reply-To: <1469693736.6948.5.camel@ts.fujitsu.com>
References: <1469194596.6594.13.camel@ts.fujitsu.com>
	<CAMKF1srBan-tupS7qGb3kDnAn-2-u8dox3vFk5ssGwQLzeGaHw@mail.gmail.com>
	<1469455403.6896.29.camel@ts.fujitsu.com>
	<CAMKF1soyDLFePf+JqwQeyqCeig=CeZqHADwJJ7yZ=Nz9PcW0Hg@mail.gmail.com>
	<1469525795.6937.1.camel@ts.fujitsu.com>
	<AA7383CF-888C-4605-97BB-BB016A5EB450@gmail.com>
	<1469621486.18503.9.camel@ts.fujitsu.com>
	<0AFF0F4F-BAA0-43F7-ABE3-32ABEC5D924C@gmail.com>
	<1469689696.6948.1.camel@ts.fujitsu.com>
	<1469693736.6948.5.camel@ts.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jul 2016 06:55:52 -0700
Message-ID: <CAMKF1soeCNV61bQ7JPjQZg8ZHHQwWp3hVFBWgfX+u5yWSZkkpQ@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building for armv7athf-neon but toolchain is softfp
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
X-List-Received-Date: Thu, 28 Jul 2016 13:56:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 28, 2016 at 1:18 AM, thilo.cestonaro@ts.fujitsu.com
<thilo.cestonaro@ts.fujitsu.com> wrote:
> Hey Khem!
>
> Thanks for your help!! We used to have an extra ld-script which once worked. It was injected into the sdk in our sdk-install script by moving the toolchain ld to ld.real and creating a script which
> calls the ld.real with the ldscript as parameter. I didn't introduce this in the sdk install, so I thought it is from oe-core. But just found out that we create that ld script usage and removed it.
>

avoid such hacks in future. Or mention them when you describe the problem.

> That fix the executables. I guess, as we did the step from gcc 4 to 5, it was for gcc 4 and broke gcc 5.
>
> Anyway thanks for your patience and time!
>
> Cheers,
> Thilo
>
> On Do, 2016-07-28 at 07:11 +0000, thilo.cestonaro@ts.fujitsu.com wrote:
>> On Mi, 2016-07-27 at 08:18 -0700, Khem Raj wrote:
>> >
>> > >
>> > >
>> > > On Jul 27, 2016, at 5:14 AM, thilo.cestonaro@ts.fujitsu.com wrote:
>> > >
>> > > Hey Khem,
>> > >
>> > > I figured, when I do the compile in 2 steps, so compile then link and change the link command to use the ubuntu arm-linux-gnueabihf-gcc instead of the gcc from the sdk, the binary is useable.
>> > this could be a gnu_hash issue then. Can you add -Wl,--hash-style=gnu to compiler cmd when linking using OE SDK
>> >
>> No success :( ... I tested it, altough it was already included in LDFLAGS from sdk env. Added it the the compile command and the link command. Doesn't change anything :(.
>> Any other idea?
>>
>> Cheers,
>> Thilo
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

