Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E9E98719A7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jul 2017 13:14:25 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 62so41062403wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jul 2017 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vbaN03AOGIVBz3uT1aFw2Xd295gO4HgjvYsyrv+vEw8=;
	b=TZ5vpp/1KzqbRRKl8N1oVAaxm+BspwELMhsDqmPX5fTeqC55MfqBVg2ZXl8ZTT2It7
	03NpNGlPPxM5fLGQyxXFTCMtRMAxDgwPZ7ieqhIIHTObnwwNJtl/fQ/G8g1KrhZC5zeh
	F0aS4nwLjKiu0I0EkYBK0wVIYo5G1erHzI+grQZ//z0fEFKhw8zWdJwjyhgcAxkJ1+fX
	3v4R0AO2gL/a2y7d+jsDFHibFXNy20t0qj21mtTYS4J+ji5abTyx6Mq+BY85OnTVFZgZ
	lbKbHGkzpJNdnNzWQ7P67EPgu97cPtHo8yWQQlkZ776Xs5A+OATSutnFrrsQJi6T9aBF
	HHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vbaN03AOGIVBz3uT1aFw2Xd295gO4HgjvYsyrv+vEw8=;
	b=DOVRgtFoJlmjzojkjof7V20wV+jSMRZZfRE1pQjDhiqRiVWDErySkCfaskmQ6dghCj
	nCtDT2AdOziPeGVmyPFvbHahxSYSnZGpHy8XpNlJS+FqOgtPD9cSXXzfJ5AyX/rX9xcH
	0U3wzPaMMibqZ/sbtDsCSz+97i4fVppUHjKlZDHH3nziiAbG0CQ91W7jx4GHRGqgj6an
	YLxCv7DRl6tP8T+qhzLH67WS9vUzzGy6XCSWDHzYsgecb/35TPgCJ9qDl55+XUIHhcK3
	p9Ly24N3JAehbYOCl082DMxYA9US8Ca94glKnZMzKlj6BCBjgw1Xecydb6gaP5M6fLUG
	KqCg==
X-Gm-Message-State: AIVw113Hzmq6SQYbmPAgaBR83IjHpKLkuKX0/JYgX5OX5gkMyxpEWY8u
	i9r+g+vYD8gyp3kEUlyJgegPXP45rQ==
X-Received: by 10.80.171.165 with SMTP id u34mr9384420edc.99.1500124466628;
	Sat, 15 Jul 2017 06:14:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Sat, 15 Jul 2017 06:13:55 -0700 (PDT)
In-Reply-To: <dc06c161-4226-aae8-963b-87090202913e@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LYUwPxW_0aLGwmwANyNv5sCovXijF-XrMCzTjGSr_V=Nw@mail.gmail.com>
	<dcbc00ff-666c-ce9a-9884-42224e2701e8@windriver.com>
	<CAJTo0LanadueCFtjEZXDrk3-jkv2+Y3kBO6FsSBC-9t-Ey1GWg@mail.gmail.com>
	<a75792ff-4291-1f5c-dca3-0a97ce64639b@windriver.com>
	<CAJTo0LYV+oyEwE15JQ7+wyRAAWFqorcrAcCRGZOqLdoyY40w_g@mail.gmail.com>
	<dc06c161-4226-aae8-963b-87090202913e@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Jul 2017 06:13:55 -0700
Message-ID: <CAMKF1spYtmTfAw8aaayFkKbU1eJA2cdgqQX7qAH_VBuMu0FX5g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cryptodev: 1.8 -> 1.9
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
X-List-Received-Date: Sat, 15 Jul 2017 13:14:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 13, 2017 at 3:03 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 07/13/2017 05:50 PM, Burton, Ross wrote:
>>
>>
>> On 13 July 2017 at 03:51, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     BTW, I sent a meta-gplv2 patch to poky@yoctoproject.org
>>     <mailto:poky@yoctoproject.org> two days ago, but
>>     I didn't find it in poky@yoctoproject.org
>> <mailto:poky@yoctoproject.org>,
>>     Ross, did you see it, please ?
>>     Maybe I should send it again.
>>
>>
>> The list is yocto@yoctoproject.org <mailto:yocto@yoctoproject.org>.
>> Please
>> resend to the list.
>
>
> Sorry, I had sent it to yocto@lists.yoctoproject.org which is from README,
> but
> I didn't get it in my mailing list, and I resent it to
> yocto@yoctoproject.org
> just now, I got it, should we update README, please ?

now meta-intel stepped ahead by applying the patch where as OE-Core
does not (yet)
have this patch applied. meta-intel should have waited for this patch
to land in master.

