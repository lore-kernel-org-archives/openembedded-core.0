Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E50874C7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 07:14:20 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id k12-v6so11714596oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SfD+WTMCONMksyH+Mjv7cmzAwII08xxhOp6NcYlu9yo=;
	b=CGIqNbjIDCXCVGLmD6TQJVjQu6+dEbWp0msHzEAnLg/tEPtPQ1E6fucUSfhfJUofBe
	JB0+NC0pg6ZqunIc1E2aGRayGEC42mq3pKkHQyM8zItomPWl5lh9wAaPHZ2MQNWE5sYR
	CVKjBZkS/xaVHszz3ujqn8AasgLrfWFFhjjsOf7ul8CuSLM0DhmAkIDjCilI1KEHG+Cp
	xgUqPqOgqG7pepNxvqDoOfevS2yFj13KujzgStnUwz2Uo0G3R/8t31C6uuhnyVL2OqA2
	Ze0+W/9wR8HGT86ouuMfLNH2QnY179uARPiNFXfbhFL4g7HMmPyXqalX89JTmOyj8BkZ
	EgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SfD+WTMCONMksyH+Mjv7cmzAwII08xxhOp6NcYlu9yo=;
	b=XA0LNpc13ErV63e9FmDU3Wy52LmXcfrsXCGTKEnoSGyHO+n7+biM8vtio16ELQTlm5
	k87GYw/GnBT1m6Gsjp4vK2dQIocVTLZiyWMxhjiJTWlggBpMwIAVPqRYSDg8kKJqnPAj
	2tsEMWk0P0qbO4aRD8Jh/wOaOOADzyNh+U3kGfeQqHohkVsebP2tcLbuuBHBx1xmW2K4
	u936WI1ILAuz7nMBlxJDmtSKQF42sWsI0hkZ8m12LI2HfnITDbpZr58+a1cyAbHPDi87
	o8TvK4ghjMlZL9OABZUr0JUnLaSjps65wDDhRc9Ndf+7zVdo4wcaxepajDb+GsavKCmi
	qR4A==
X-Gm-Message-State: APzg51ApniavIzM6JXu5qFoOp+/rr63s2WFXk9AduFd+Ma+9bN0uraWH
	xmynaavw7UAQRT3baC4QFhkqUuThNYYYNe3RwOA=
X-Google-Smtp-Source: ANB0VdZOkA3zKR/C5UhVrphJYowmdKmKYmE4JAzoXbQp7tstsmU24Koyb1ojzOBQjjmMZuvgQulPjkSOzs3SorUX+Gg=
X-Received: by 2002:aca:4fcd:: with SMTP id
	d196-v6mr26078992oib.51.1536131661484; 
	Wed, 05 Sep 2018 00:14:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5c9b:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 00:14:21 -0700 (PDT)
In-Reply-To: <CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Sep 2018 09:14:21 +0200
Message-ID: <CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Wed, 05 Sep 2018 07:14:20 -0000
Content-Type: text/plain; charset="UTF-8"

I am also disappointed to see that openssl10 does not help much,
however, I do not believe we should wait another year, and hope the
problem would take care of itself - this clearly did not happen over
the past year. Let's just look at failing recipes one by one and
investigate what needs to be done for them. I've done this for
everything in oe-core, and so it does not need openssl10 anymore
(except one issue with openssh on arm64). It might be that much of the
failing stuff is simply out of date.

Making 1.0 and 1.0 coexist in a sysroot means one of them has to be
renamed into, say, libssl10.so, and everything that is using it
patched accordingly. Not really possible. Yes, upstream has botched
this transition badly. If you have better ideas, let me know please.

Alex

2018-09-05 6:54 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Tue, Sep 4, 2018 at 9:08 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Tue, Sep 4, 2018 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Tue, Sep 4, 2018 at 3:58 PM <richard.purdie@linuxfoundation.org> wrote:
>> >>
>> >> On Tue, 2018-09-04 at 13:43 -0700, Khem Raj wrote:
>> >> > I pointed this earlier before merge as well
>> >> > meta-openembedded has 40 odd recipes failing due to openssl 1.1
>> >> > upgrade
>> >>
>> >> Sorry, I think I missed something somewhere as I thought the
>> >> indications were the bigger problems like qt5 were working now :/.
>> >>
>> >> > http://errors.yoctoproject.org/Errors/Build/67457/?page=2&limit=50
>> >> >
>> >> > so obvious fix was to keep them pinned to openssl10 and i created
>> >> > couple of fixes
>> >> > to start
>> >> >
>> >> > https://patchwork.openembedded.org/patch/154517/
>> >> > https://patchwork.openembedded.org/patch/154516/
>> >> >
>> >> > and the effects are showing up where sysroot task now starts to fail
>> >> > for dependent
>> >> > recipes here
>> >> >
>> >> > http://errors.yoctoproject.org/Errors/Details/190427/
>> >> > http://errors.yoctoproject.org/Errors/Details/190433/
>> >> >
>> >> > in meta-oe certain recipes can be upgraded and we can get openssl 1.1
>> >> > support
>> >> > but others like the two examples I cited above do not have openSSL
>> >> > 1.1 port.
>> >> > so I think we can not live without openSSL 1.0 and OpenSSL 2.0 being
>> >> > able to
>> >> > co-exist.
>> >>
>> >> The latter link is php 7.2 which should have openssl 1.1 support
>> >> (https://bugs.php.net/bug.php?id=72360).
>> >>
>> >> For the former, libgdata doesn't have an openssl depends so I guessed
>> >> at liboauth pulling it in which does have an openssl 1.1 patch at:
>> >> https://github.com/x42/liboauth/issues/9
>> >>
>> >
>> > Thanks for pointers and they do help. However IMO the problem that
>> > Martin decribed
>> > is going to be a real blocker. Unless we can provide a solution to let
>> > both openssl versions
>> > coexist, this change is going to be problematic since we maintain
>> > several old recipes which
>> > would have to be fixed for openssl 1.1 and this can take time, right
>> > now we are only seeing
>> > meta-openembedded layers, we don't even know all other layers which
>> > might get into similar
>> > issues.
>>
>> To be clear, the issue is ( foo depends on openssl 1.1 and bar ) and (
>> bar depends on openssl 1.0 ), right?
>
> yes.
>
>>
>> Anyway, just for reference, it looks like Debian is packaging both
>> openssl 1.0 and 1.1:
>>
>>   https://packages.debian.org/source/sid/openssl1.0
>>   https://packages.debian.org/source/sid/openssl
>>
>> In the case of liboauth, they avoid to need to patch by configuring
>> liboauth to build with nss instead of openssl.
>
> this is already taken care see
> http://git.openembedded.org/meta-openembedded-contrib/commit/?h=kraj/master&id=b1f87edc4202d6238c469dde358819c534b35751
>
> but thats just one case.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

