Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8EF786EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 03:47:39 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id i56so955213wra.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 19:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lS6DIidMQ9k18UC+s5irwQBiGkbIe2Xby8Vhc5xz2lo=;
	b=seLjztlW0bgMl0SmqNDUszBt3Wywwr633Vf8dO/2d9O8XJ+HhkBE0V3QQrjkgYGT50
	SKXlNYZLDCppX88MQLnOnCQQ7LStUlWP1Qh9b4NFUkHQO4A2Bsv29v8/cxAhQJyQhGy1
	vQI6AW4SpPsw7LxQbl7z+81AfDY035gIx2+PRg/c9FmLiGmwKgjsn8M6MtE/Q7+ACumL
	V0OJCSQgdGwT8u85zd3MefVPsPceMe7zY1l/ipfg5eZ8mx27iKoYNs2uobJWgb7DLu7k
	sy7ZzAFd2Oke8pGGF+DmRUXpiMFMWSuZCgEAznxinJzPmNS2S21SOclLhzEXpmzZVyQd
	DvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lS6DIidMQ9k18UC+s5irwQBiGkbIe2Xby8Vhc5xz2lo=;
	b=c3G6ge3jLm/LIM0oBi+nSusdmlBYanoKBFoYi7gFTHrunV/lFsbY0f2hXlxQGroFVa
	/o6fx0GbIhiz6w9zQOqbHaC+vh8ldpRjfNHRuPusBqAV73wVzU+4fj+sC9sr1xdar8YD
	ys4CUaPPmKE3HRr8cWQFK4925WeZz9IziRWsZec8vY4ea6w9e2IW4yQYgs5HW0mK0AZu
	ExEKSXo9CL5byM7j6ncoEQZEHb3IuBGrHTjYcZwxfUCH5WXNrlHilusgYGl2xb+uRPd9
	06Agk1grfVQY1ZIxOcahmHHDaRsRD4XivMqHzK3gBtEklSZTjFvfoQx5e0cKhdYWivwk
	lVkg==
X-Gm-Message-State: AKwxytfHzgnkdSW2IDJPBPz7ansbot27W1Pxr9H8p3IiOcmYIju6DD/T
	DqUAp6OPJDDUDUqX/Uq2Sh8zs08B/ocoJJQRfO0=
X-Google-Smtp-Source: AH8x227g/j0y3/Clft0DqBWO0OITZSdOJ3nIMnzaCDAtjDNgyUkbhHs9KvCv8OVGOMo3R0Vzl6PvZJNJnE7RMy1PpbU=
X-Received: by 10.223.188.18 with SMTP id s18mr9512887wrg.226.1516938460786;
	Thu, 25 Jan 2018 19:47:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Thu, 25 Jan 2018 19:47:40 -0800 (PST)
In-Reply-To: <1515935110.29722.214.camel@linuxfoundation.org>
References: <20180112162002.9669-1-alexander.kanavin@linux.intel.com>
	<1515935110.29722.214.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 25 Jan 2018 19:47:40 -0800
Message-ID: <CAJ86T=UUALj0bC2-SWq4itXJf5YGv6h6NS8Dqoy+YYkX2igFbQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/2] ruby: update to 2.4.0
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
X-List-Received-Date: Fri, 26 Jan 2018 03:47:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 14, 2018 at 5:05 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-01-12 at 18:20 +0200, Alexander Kanavin wrote:
>> Existing version of ruby-native (2.2.5) was crashing on my machine
>> (and others' too),
>> yet a functional ruby is necessary to upgrade webkit to a version
>> that less vulnerable
>> to Spectre.
>>
>> I've performed the update by copying the ruby recipe directory over
>> from the current
>> pyro tree; if you want to see the list of specific commits, issue
>> this command:
>>
>> git log 99656fecf4fa6e24ba49ecb7f26f893e733818a0 meta/recipes-
>> devtools/ruby
>> (up to commit e593d3aeb2ea5f08d6e0753133fe89e345b339e8)
>
> Fails on musl:
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/719/steps/BuildImages/logs/stdio
>
> Not sure why ruby-native would fail on musl specifically so could be a
> host issue (its on fedora26).

Seems to be the same issue as:

  https://bugs.ruby-lang.org/issues/13168

