Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFCD74553
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 04:08:19 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id m125-v6so2202201vka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 21:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rdo6Dm2foeoec2B8Fpma95gr6matsZx49LwFdSrC984=;
	b=YMOFluJ3dY1I88BR1IuehoPVI9lMJcHP7DYv9MKt4dQFrgNRBB4Ji4DRAC7ZIobRnS
	SXDOkxQ/mWiH1xLQNCpyZx1QG2qREpXDwB2wdxVOf3HBLi7uQhKVPBxPeNymOzZajla4
	SPq2d0m0MLHIG4TDBBVX5OtyDgImMPwrKYf1jiwC5jvbR3lsykJHk1QQySf9BwHFqGz6
	EIUpEEQAf1ACjt5BOxwQenTCQMRJQzonf7U7oQLcqUe+BuRYM85Tlw4hc6b4WgW/jRmp
	R5Jf7yi4p9CMyO5FSSXGxMNe5a+rVhXRLCukSdOOyODOYPS4ZJVPgTMZhxTKE0bNygCj
	QOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rdo6Dm2foeoec2B8Fpma95gr6matsZx49LwFdSrC984=;
	b=NV4TsvGerGXOz6eDpb/Ddr0uPLTHDewzOUAkGKhSbajTuSlAjIrIY604eS0QHxQr56
	eAAWESLJ2jawEbgtoT4vSbTps6CsR5smgHR2mSG4krGwjrrO8V1TV9U3m9+oOZJRp6UX
	vlI9pfyP3tygRcI7RBrAW1ZnE+4V0l4qZNeTHdJ/+Q7w+49NJ1R+5XP5ruV1+4wXuOSg
	ygK4kX+4j04xDgowOlzmUOCODpQttw1njgDGWxEJRnvW9JdX1GpEnbwtsvFsh79nEiuR
	sqYb+s+93ZM7aV1FLN6YTyXGyGM3NHUe7NZxR6TEvF/hVI+O+DWdfp9qDiuEO5oH6LXy
	W+7A==
X-Gm-Message-State: APzg51AHwjhVmHqVd7pmyp/8hOqlF5zPJddLC3fBGF/gi+eEUEQg7m/9
	mewmL9PL+6Hp/bzo9r2wFr6hrcD/lduCqmGK2po=
X-Google-Smtp-Source: ANB0VdaZmC3sFs7YkiloAfyi4pQmcE0XKZMRPB63cV/K/CSW9VUgYFJVRMqpgWsqrnu0j/Cb3vYw8kkuDUbzMNJEzaY=
X-Received: by 2002:a1f:c252:: with SMTP id
	s79-v6mr17711747vkf.127.1536120500125; 
	Tue, 04 Sep 2018 21:08:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 21:08:19 -0700 (PDT)
In-Reply-To: <CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 21:08:19 -0700
Message-ID: <CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Sep 2018 04:08:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Sep 4, 2018 at 3:58 PM <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2018-09-04 at 13:43 -0700, Khem Raj wrote:
>> > I pointed this earlier before merge as well
>> > meta-openembedded has 40 odd recipes failing due to openssl 1.1
>> > upgrade
>>
>> Sorry, I think I missed something somewhere as I thought the
>> indications were the bigger problems like qt5 were working now :/.
>>
>> > http://errors.yoctoproject.org/Errors/Build/67457/?page=2&limit=50
>> >
>> > so obvious fix was to keep them pinned to openssl10 and i created
>> > couple of fixes
>> > to start
>> >
>> > https://patchwork.openembedded.org/patch/154517/
>> > https://patchwork.openembedded.org/patch/154516/
>> >
>> > and the effects are showing up where sysroot task now starts to fail
>> > for dependent
>> > recipes here
>> >
>> > http://errors.yoctoproject.org/Errors/Details/190427/
>> > http://errors.yoctoproject.org/Errors/Details/190433/
>> >
>> > in meta-oe certain recipes can be upgraded and we can get openssl 1.1
>> > support
>> > but others like the two examples I cited above do not have openSSL
>> > 1.1 port.
>> > so I think we can not live without openSSL 1.0 and OpenSSL 2.0 being
>> > able to
>> > co-exist.
>>
>> The latter link is php 7.2 which should have openssl 1.1 support
>> (https://bugs.php.net/bug.php?id=72360).
>>
>> For the former, libgdata doesn't have an openssl depends so I guessed
>> at liboauth pulling it in which does have an openssl 1.1 patch at:
>> https://github.com/x42/liboauth/issues/9
>>
>
> Thanks for pointers and they do help. However IMO the problem that
> Martin decribed
> is going to be a real blocker. Unless we can provide a solution to let
> both openssl versions
> coexist, this change is going to be problematic since we maintain
> several old recipes which
> would have to be fixed for openssl 1.1 and this can take time, right
> now we are only seeing
> meta-openembedded layers, we don't even know all other layers which
> might get into similar
> issues.

To be clear, the issue is ( foo depends on openssl 1.1 and bar ) and (
bar depends on openssl 1.0 ), right?

Anyway, just for reference, it looks like Debian is packaging both
openssl 1.0 and 1.1:

  https://packages.debian.org/source/sid/openssl1.0
  https://packages.debian.org/source/sid/openssl

In the case of liboauth, they avoid to need to patch by configuring
liboauth to build with nss instead of openssl.

