Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF2177009
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 20:32:21 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so1055450igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 13:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=wvBFYjSxnI18U/yRlI3iSKX3LltTXhSICQPq8lU86Nw=;
	b=TI6tmKz+tJ29JdlwBaeMEkrP9AhUmk1xjIf8N5fgBtvPEQOgzlmVq+LeW0ASE2ck7y
	VRzNfoWKodutzfVdDASuwIkLaA3A6kWKRapIiTv6uNjE4IQl9QnUM7vm48HL6F40v0o2
	1RB+nJBEbUFk9uJdne2XHZVkFQPH8eLqipf0UK/Nel+fHqbWsYCvssnMOCijE//NYubU
	ZX7Cvt4a6Yl5r50rabmyO+YMSxpjepig4K0FDiLwMOIJlVLYVWto5x8yEDB+GKq82zx7
	JhIRih38Rn85KHx/JjhdPW7Lxjid70td3CrQUNhI9B5eyjXhJU+pfE2KkHI0TsifMghG
	lrWw==
X-Gm-Message-State: ALoCoQl9SUU1HXwsGcJ7bi8NEOiFeHHHU49oaN8/ANPuWhk9KBb/BOmXo6SEuj0QwRwcmHCwtDyE
X-Received: by 10.50.3.37 with SMTP id 5mr2039368igz.96.1441312341804;
	Thu, 03 Sep 2015 13:32:21 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176])
	by smtp.gmail.com with ESMTPSA id oo2sm126198igb.6.2015.09.03.13.32.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 13:32:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so253208igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 13:32:20 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.32.69 with SMTP id g5mr74663igi.5.1441312340348; Thu, 03
	Sep 2015 13:32:20 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 3 Sep 2015 13:32:20 -0700 (PDT)
In-Reply-To: <1441312024.24871.135.camel@linuxfoundation.org>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
	<1441312024.24871.135.camel@linuxfoundation.org>
Date: Thu, 3 Sep 2015 17:32:20 -0300
Message-ID: <CAP9ODKrgg8vAT2c6iEkU3THqpqrCYiEz=d61mr3tNwa9P6HGmA@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Sep 2015 20:32:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 5:27 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
>> On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> >> To put this another way, I think it is probably reasonable that we
>> >> should be able to build an image from OE-Core with basic functionality
>> >> like networking without busybox?
>> >
>> > That's what I'd support. If everything you need for the functionality with busy
>> > box is in oe-core, to me, it doesn't make sense to go outside core to get that
>> > same functionality without busybox.
>>
>> irrespective of this change. I see yet another configuration with this
>> into OE-core, overall OE-Core should get smaller
>> and case does not sound convincing to me. You dont want to use busybox
>> in a fairly large image which has other GPLv2 software in
>> it. Thats fine but doesnt look like a common usecase to me
>
> Nobody mentioned GPLv2, that isn't relevant here.
>
> I have heard OE being dismissed since it can't produce an image without
> busybox in it. The implication is we can't build "big" Linux, only small
> embedded things. The pieces we need busybox for are tiny and should be
> easy to replace (like this does).
>
> So I can see a fairly compelling argument for OE-Core to be able to
> generate a busybox free image with standard functionality just from a PR
> perspective. From what I gather we have people willing to test and
> maintain it too...

If people were demanding it, it would have been moved for
meta-networking ages ago, it seems it is not the case.

So my vote is:

 - move to meta-networking
 - for 2.1 we see if it goes to core or not

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

