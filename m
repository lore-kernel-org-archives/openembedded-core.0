Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 247A0786BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 20:59:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 15so15626982wrb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CvEJbV4OObgckBHvWN2JOTYrbF6mgETTJSg9261ZM6s=;
	b=IxDYpxicBokCJ5+zNDiKd5PKM/FtHhaiGTHWiCoIdo3/+wqTu6kiyFxtL0Xx+poXL5
	WdUMcxuoyaxQ3fW52ppurF1bi8bCjMZB9mkun6CFY22gG7EFEaVXlEXJI44LL2rgxWMz
	nKc4o3DYvpTqdnyKFVUkq9QQva+KRe8F7NMMkwjOEym/dqoJSYyQ2eaiF6ImhMA9Kvbm
	zklC0XavIvFroxCDJVgh5Ni1YG0XZ6gdBLXsT9kQ5WPRB+MOSvWHuswQc9NE5Vu/ZfLf
	pLzccsPzwnADyy4/OTSrRmX70Zao4suy97PbiTAnrr6924srfuzPP7rHDbC6JmUxv7p6
	pnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CvEJbV4OObgckBHvWN2JOTYrbF6mgETTJSg9261ZM6s=;
	b=EC5lOnC6oSrgzyjM0mCMEkK/K/hPWU4XVMe9tXyTlo5o8kGYKMzE86horgNL+4cj/W
	Z1pCBeskjZG4J67EwzTNnRAKDcjKipYki46Lq4SVtmK2zbfEzJziaLl/2OxDsu8sI0Zm
	U7kxL5GpbmVXH1PQEdRwYmMzyHX7udhgEVYRPtagQcx6Wq7yZomrgnKR3ApEXRsYi1+P
	3xzqgbJY0n+uy7Hi/KhxRUuuzEDNd5M6ZNCJsqG5sXQo5YDCzklavlZTn/vO6HR+avKi
	LAmBRifKm6hjumXc8GyPcX7gwdgdSb50lDXg/wxk2E02DX1UzsBg1pMZuGBpQsnMfWWR
	lwZQ==
X-Gm-Message-State: AJaThX5Sa4DLRrg1xFuHZsJk40C8UlGQhjJZq/Fai/CmdyEQpMUFqihF
	NqqbpTLfk/QuddJd/4SBmpuByJss2wB0e9fV68K6UQ==
X-Google-Smtp-Source: AGs4zMYiKOTyhG/MG09tUGUeTWZIEncPZK8hR00EwfXjrhnYtI36LfdTnpDsdP8RkJrjhWEFOhgyrbLPAFb1cjot5f8=
X-Received: by 10.223.196.174 with SMTP id m43mr9098230wrf.7.1510606774168;
	Mon, 13 Nov 2017 12:59:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.99 with HTTP; Mon, 13 Nov 2017 12:59:33 -0800 (PST)
In-Reply-To: <1510604789.5979.1.camel@intel.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
	<1510584490.22094.65.camel@intel.com>
	<CAJ86T=UQ_b0RLUTCTGPONvkxXCO_s3Hvim0Zh4_MpcBBPoDpeA@mail.gmail.com>
	<1510604789.5979.1.camel@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 13 Nov 2017 12:59:33 -0800
Message-ID: <CAJ86T=XNTYR=5=bZ=+Uecz_uJRHSktinLmb=4QX6Z3dwBkm2CQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Mon, 13 Nov 2017 20:59:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 12:26 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2017-11-13 at 12:18 -0800, Andre McCurdy wrote:
>> On Mon, Nov 13, 2017 at 6:48 AM, Patrick Ohly <patrick.ohly@intel.com
>> > wrote:
>> > On Thu, 2017-11-09 at 21:54 -0800, Andre McCurdy wrote:
>> > > The default systemd-tmpfiles config file expects to be able to
>> > > create
>> > > files etc belonging to the wheel system group. Currently the
>> > > wheel
>> > > group is created at run time by systemd-sysusers, but that
>> > > doesn't
>> > > happen if systemd-sysusers is disabled (as it currently is by
>> > > default
>> > > when building with musl libc).
>> >
>> > Isn't this something that the systemd_create_users rootfs
>> > postprocess
>> > command in rootfs-postcommands.bbclass already takes care of?
>>
>> systemd_create_users() does a build time pass over the
>> systemd-sysusers config files, but those files are not installed if
>> systemd is configured without sysusers support.
>
> I didn't know that this is optional. To me it sounds like an invalid
> (or let's say, unexpected) configuration to install tmpfiles config
> files but not the sysusers files, because as you said, the tmpfiles may
> depend on the sysusers.

In the current recipe, there's no control of tmpfiles (so it will
always be enabled) and sysusers is controlled by PACKAGECONFIG
(enabled by default - but only when building with glibc), so the
recipe does allow that combination.

> Anyway, I just wanted to know because I was wondering whether it is
> really necessary to duplicate the user creation information in the
> systemd recipe.
>

