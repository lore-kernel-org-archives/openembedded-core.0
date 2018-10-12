Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B88479BE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 22:10:45 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id h186so1870774vkh.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UvGrwJ750x2igLdIY/4XasGR5jb5IqCqDgYmvm7cv1U=;
	b=PBNojWyq5I7YidCq2P6ZgxTKcRVmM5y2bd+euM/OBaRlpmxyjSCZpzhExSUtE/SadZ
	PPGSVmN6j0LAsoOSdFUHEvdmlqQrrKgpsC/eAhlOe2Dl9Fff58Y5IbsJ4QEZ0po0D+4v
	sTH2m/r4svZzoUcAITIJovE+Rd1juN+1tFFNeOGZQ/fRl1NVCBjWiQwGRijxO4VJ6b/U
	9vGV7SMVhoQqoaqik4qxeZSM8UFgcdEcy4rOumcXGZ41BlkfDxHWSmTRQwqqfk22AADX
	x5++FAscwrnEJTvBUCO8qchnHN5DSzZ3uXiaqhX5ObDAJCjMxQZkLLhSi4tIcbtyXHlK
	SwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UvGrwJ750x2igLdIY/4XasGR5jb5IqCqDgYmvm7cv1U=;
	b=Vf1YdY8hRzIGAVZ0AVevcAUcqnkb5HAVZmfxPD9MTohdivQX/pah96XaH6RisdgliT
	bYNzA0thJmZHx1CtfpQ4xkpKAYZAGIsGdIgbkZaEXBGaIwTDGRVmVMQdRKVx5ZYnz/pB
	NFOfj/sAJ2edWnLEG3KKxdd/58jp2APGe1/3FAtAQREjb+8dw6MwMos9AD5dNRf3lqmz
	i4IbwlFxSty7AVXXBDsG7ZaPy92iian6tBlxXhiUZdWr363V5v4tZP9IhMRaPKCSzxo/
	m+MNVtCUnw7p2Bxa4BOM+7Aski4ufFKS9AB7mYxKfUyzcMvzcfOh30RmBwwV0aqeydli
	LOoA==
X-Gm-Message-State: ABuFfoggfrLTPFly2556G9Q3zWo1rugD1zpi3yWigrw03z7i+uWQ+bCw
	VkKhHUPo8HNQ6rNJN0NBuNbKlpXhUfSHOfs3hDY=
X-Google-Smtp-Source: ACcGV62e+cGBEz3kRkAOUQVC0Nwquh/uhFDOuJyBj0ve9dUAJdvZ5ljNqpXiqVEN2mBPBRBK2poS8vXh0A/Uyqm+rmU=
X-Received: by 2002:a1f:a193:: with SMTP id
	k141-v6mr3250207vke.45.1539382246443; 
	Fri, 12 Oct 2018 15:10:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2748:0:0:0:0:0 with HTTP; Fri, 12 Oct 2018 15:10:45
	-0700 (PDT)
In-Reply-To: <CAMKF1srGfJ8C38hRe=GcpCMRspUkTCwK3j4WgrPZ=eBcS_tiBQ@mail.gmail.com>
References: <20181012202823.4003-1-raj.khem@gmail.com>
	<CAJ86T=WjWNPB+upTuQN8EndUGFC_jBqSRO59Xy=7RZANoaSPdA@mail.gmail.com>
	<CAMKF1sqEBLiSmzJALVmvRep0jzAGpgqtuZZVaoWu69D-X3dktg@mail.gmail.com>
	<d33798973eaad929a0ff674b3651c985ee684f36.camel@linuxfoundation.org>
	<CAMKF1srGfJ8C38hRe=GcpCMRspUkTCwK3j4WgrPZ=eBcS_tiBQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Oct 2018 15:10:45 -0700
Message-ID: <CAJ86T=UF4q2Nq=N68C4Hi3aRZdF1Q5OyiiKk3UjU0xB8cgK0EQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Do not use thumb1 ISA on armv6
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
X-List-Received-Date: Fri, 12 Oct 2018 22:10:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 2:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Oct 12, 2018 at 2:42 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Fri, 2018-10-12 at 14:13 -0700, Khem Raj wrote:
>> > On Fri, Oct 12, 2018 at 1:56 PM Andre McCurdy <armccurdy@gmail.com>
>> > wrote:
>> > >
>> > > On Fri, Oct 12, 2018 at 1:28 PM, Khem Raj <raj.khem@gmail.com>
>> > > wrote:
>> > > > This does not work and is unsupported so lets compile glibc in
>> > > > ARM mode
>> > > > always on armv6 SOCs
>> > >
>> > > Note the comments in glibc-collateral.inc:
>> > >
>> > >   # This needs to match with glibc.inc, otherwise glibc-scripts and
>> > > glibc-locale
>> > >   # will fail to find main glibc, for details see
>> > >   #
>> > > http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
>> > >   ARM_INSTRUCTION_SET_armv4 = "arm"
>> > >   ARM_INSTRUCTION_SET_armv5 = "arm"
>> > >
>> > > Either the two recipes need to be kept in sync or the comment no
>> > > longer applies?
>> >
>> > I think we can delete comment in a followup
>>
>> Looking at the link I'd have said that issue still applies?
>>
>
> I am not 100% sure, thats why I wanted
> to check and come back with followup
> if update was needed.

If you're not sure then it's better to respect the comment and keep
the two recipes in sync.

