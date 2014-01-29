Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 328D36E8A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:59:10 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id up15so1720073pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 04:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=w8gljgeHcC2LsC1CBkuBl+6Jp3YKkk8wVU9kTipBI/U=;
	b=In+Yd3e0pLg7sBKl3GLkeuAOL2R6jr10DQyDYxxMnzJ80fPrrLMf8y9oGAe1HrkGas
	gmEFnvBZO87w+VRbciMlnRumJyKorP+BXjKiUt/hS5ZeMf2JXq5TxS2S+gKlcvx7mDLH
	1s/KQuOjahzDCOA7jrjt9X+bQDSX1mEFwIiCoCe/NlujnP1PUMcCPml5NvyUYGUcM8Ww
	VfZ0B2bIBB0U5BC04G0HrmB374nUBi0V9Gs/sk0D4TlUcGPa6XsgIcHh9uz5pq6Grp2Z
	ND/rZ2DXcmoyROekrUhGiM+cAK6iaBaJyI3JcXK/ryHeReyMQzXJpjMR8juwDJWq/CY7
	Wyxg==
X-Gm-Message-State: ALoCoQmL2tFxoB6iq/bB/J1Vi8pxClOPOe9wBYdCtjIbVMK1DSelUfKmm6++5tH+EgV04zsHMNCp
MIME-Version: 1.0
X-Received: by 10.66.4.130 with SMTP id k2mr7733035pak.95.1391000351307; Wed,
	29 Jan 2014 04:59:11 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Wed, 29 Jan 2014 04:59:11 -0800 (PST)
In-Reply-To: <1390999973.24655.64.camel@ted>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999973.24655.64.camel@ted>
Date: Wed, 29 Jan 2014 12:59:11 +0000
X-Google-Sender-Auth: BIUwr1xbDBJSx838aFyCY21d1rY
Message-ID: <CAOMwXhNLza+hr=Df7dYfQh33wgWezHFtc5Grs9p1vUMiNkHx3w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: daniel.elstner@kdab.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ROOT_HOME: /home/root
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
X-List-Received-Date: Wed, 29 Jan 2014 12:59:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 29, 2014 at 12:52 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
>> Hi,
>>
>> Is there any obstacle why this cannot be /root as per default Unix
>> philosophy [1]?
>>
>> It is not an unusual that the /home partition is a separate, and the
>> sysadmins would like to manage the core system without getting that
>> partition mounted, etc.
>>
>> It is true that it would be possible to work that around, but /root as
>> a default just feels so much more natural on a Unix system.
>>
>> What I currently see after talking to a few people, the people keep
>> changing it in their layer (distribution) config. It looks sub-optimal
>> at first, but perhaps there are still valid reasons to keep this
>> around?
>>
>> I was told on IRC the first embedded debian may have done it to keep
>> rootfs read-only. First, you can remount the root partition on jffs2,
>> ubifs, etc... as R/W.
>>
>> Even if you could not, you can have a separate /root partition which
>> is a good idea anyway to keep the super-user separate from the
>> "regular" users. If that is not OK, there is still the option for the
>> minority to override it to /home/root if really needed, but I
>> personally do not think it should be...
>>
>> So, all in all, I am in favor of changing this back to /root to be
>> more linux-y and well-separated from the normal users.
>>
>> Unfortunately, it would lead to some breakages out there when they
>> update Yocto, so it may not be acceptable in this project. I do not
>> know the rules. The migration could be aided though with some proper
>> documentation.
>
> These directories can be configured by the user extremely easily.

To be fair, it would be just as extremely easy to configure it to
"/home/root" as the other way around.

> By having a default of /home/root/ we can catch software that has issues
> with relocation of that.

I am not sure what you mean. Could you please elaborate?

> Having the writeable user data in one directory like this is useful for several classes of embedded style devices.

Could you please provide any examples?

I have not seen any use cases myself out there, but after a quick poke
around, other people seem to have similar experiences around me. As
written in my initial email, I do not target "several" use cases. I am
referring to the majority which, as per Unix philosophy, I am somewhat
opinionated that is "/root".

> So to be honest I don't see a pressing reason to change this.

I do, because the earlier it is done, the fewer users that may have
incompatible changes. As the time goes ahead, more and more users will
stick to it as "default". I believe this means those who do not care
about proper Unix separation.

