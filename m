Return-Path: <franksinankaya@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD78A7E71E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 22:57:02 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a27so130435qkk.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 15:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:cc:references:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QfaDpmU+T/OZ5dVqfbITEKkshx/t2aTMXgftI5N0oB4=;
	b=fzGFdCZ4Ja0/P41a4IW2WqqbvdAgNe38jbK56C3Nyg/D99FwOyXBYRrjVI6q7rAgak
	3RdczZmunoKsESyKo6o6/Rl6B5PnFB/Dzow7ZsiV/jvHc7pS7HxsrTGJhsD/WoC3axUG
	Csf3VSBjMRoM6I19HprHsmwgVDrCLScDq4ekpvURkY8Eyv38Vtw1DDcmb0kHpan/bo7Q
	NyMvOIsIekTzv2a4+ff/7DHLUPk5Jkzr81ZQIpvp7BrenVCOzuq8Z6/w0guEglza39rl
	plXdXwRSr8FQCv4Et2jQx9eXrw2wzWSJm0Oe/B634Yfl2yJLz+ZRBYU4SvMP44Zt7tSU
	D1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:cc:references:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QfaDpmU+T/OZ5dVqfbITEKkshx/t2aTMXgftI5N0oB4=;
	b=V9hBjSaIL9GWZP7DNAN4xmbf2rC0YlWKPhmHffeggVmYoyftKym/7B/+YY24Y0MEJX
	4KiXhyHjyrO3frEUizM9D0NsTIQcP5x3cuQRArv0tlQyWefTs0jVoR+6FPcie97tySZp
	CqW62FfEtkH6w4/7Ak8CfA54dPOek4w8ypr+tR7WrBaR2Niu28HRuFryT1CTAOHBZ5la
	SnkvkV84XEL3AsKTZv88cZXf+D7+YvfNZKdrqB4Az7U+bbB1eJhUrnGmcH9hIBBxI7FX
	zGHY+AAxJ4Ku2d0bweoDssI6FC1cjnhr9ptBxazkfHLGsqqvPw2MvFvriT6JL0pkxQZa
	teeQ==
X-Gm-Message-State: APjAAAWJbTPqD9h+bEvmGhYmQxT4qMFz1k/7Kwwf0twacKt1YCGJA1Yx
	UEIIH/iO9Q32PalCuUAa2fYXNosC
X-Google-Smtp-Source: APXvYqyLziGOsCdKY0z47lfjGlawTVb20caHkATl40w70MuxaaBbldVlp3UgfGDmk7UUIeHY/kh5xg==
X-Received: by 2002:a05:620a:1393:: with SMTP id
	k19mr491253qki.67.1561589823187; 
	Wed, 26 Jun 2019 15:57:03 -0700 (PDT)
Received: from [10.84.150.60] ([167.220.148.60])
	by smtp.gmail.com with ESMTPSA id j66sm98048qkf.86.2019.06.26.15.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 15:57:02 -0700 (PDT)
Sender: Sinan Kaya <franksinankaya@gmail.com>
From: Sinan Kaya <Okaya@kernel.org>
X-Google-Original-From: Sinan Kaya <okaya@kernel.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>, ChenQi <Qi.Chen@windriver.com>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
	<5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
Openpgp: preference=signencrypt
Autocrypt: addr=okaya@kernel.org; keydata=
	mQENBFrnOrUBCADGOL0kF21B6ogpOkuYvz6bUjO7NU99PKhXx1MfK/AzK+SFgxJF7dMluoF6
	uT47bU7zb7HqACH6itTgSSiJeSoq86jYoq5s4JOyaj0/18Hf3/YBah7AOuwk6LtV3EftQIhw
	9vXqCnBwP/nID6PQ685zl3vH68yzF6FVNwbDagxUz/gMiQh7scHvVCjiqkJ+qu/36JgtTYYw
	8lGWRcto6gr0eTF8Wd8f81wspmUHGsFdN/xPsZPKMw6/on9oOj3AidcR3P9EdLY4qQyjvcNC
	V9cL9b5I/Ud9ghPwW4QkM7uhYqQDyh3SwgEFudc+/RsDuxjVlg9CFnGhS0nPXR89SaQZABEB
	AAG0HVNpbmFuIEtheWEgPG9rYXlhQGtlcm5lbC5vcmc+iQFOBBMBCAA4FiEEYdOlMSE+a7/c
	ckrQvGF4I+4LAFcFAlztcAoCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQvGF4I+4L
	AFfidAf/VKHInxep0Z96iYkIq42432HTZUrxNzG9IWk4HN7c3vTJKv2W+b9pgvBF1SmkyQSy
	8SJ3Zd98CO6FOHA1FigFyZahVsme+T0GsS3/OF1kjrtMktoREr8t0rK0yKpCTYVdlkHadxmR
	Qs5xLzW1RqKlrNigKHI2yhgpMwrpzS+67F1biT41227sqFzW9urEl/jqGJXaB6GV+SRKSHN+
	ubWXgE1NkmfAMeyJPKojNT7ReL6eh3BNB/Xh1vQJew+AE50EP7o36UXghoUktnx6cTkge0ZS
	qgxuhN33cCOU36pWQhPqVSlLTZQJVxuCmlaHbYWvye7bBOhmiuNKhOzb3FcgT7kBDQRa5zq1
	AQgAyRq/7JZKOyB8wRx6fHE0nb31P75kCnL3oE+smKW/sOcIQDV3C7mZKLf472MWB1xdr4Tm
	eXeL/wT0QHapLn5M5wWghC80YvjjdolHnlq9QlYVtvl1ocAC28y43tKJfklhHiwMNDJfdZbw
	9lQ2h+7nccFWASNUu9cqZOABLvJcgLnfdDpnSzOye09VVlKr3NHgRyRZa7me/oFJCxrJlKAl
	2hllRLt0yV08o7i14+qmvxI2EKLX9zJfJ2rGWLTVe3EJBnCsQPDzAUVYSnTtqELu2AGzvDiM
	gatRaosnzhvvEK+kCuXuCuZlRWP7pWSHqFFuYq596RRG5hNGLbmVFZrCxQARAQABiQEfBBgB
	CAAJBQJa5zq1AhsMAAoJELxheCPuCwBX2UYH/2kkMC4mImvoClrmcMsNGijcZHdDlz8NFfCI
	gSb3NHkarnA7uAg8KJuaHUwBMk3kBhv2BGPLcmAknzBIehbZ284W7u3DT9o1Y5g+LDyx8RIi
	e7pnMcC+bE2IJExCVf2p3PB1tDBBdLEYJoyFz/XpdDjZ8aVls/pIyrq+mqo5LuuhWfZzPPec
	9EiM2eXpJw+Rz+vKjSt1YIhg46YbdZrDM2FGrt9ve3YaM5H0lzJgq/JQPKFdbd5MB0X37Qc+
	2m/A9u9SFnOovA42DgXUyC2cSbIJdPWOK9PnzfXqF3sX9Aol2eLUmQuLpThJtq5EHu6FzJ7Y
	L+s0nPaNMKwv/Xhhm6Y=
Message-ID: <5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
Date: Wed, 26 Jun 2019 18:57:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Wed, 26 Jun 2019 22:57:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/26/2019 5:21 PM, Richard Purdie wrote:
>> What is so special about these?
> Put another way, why aren't lots of people seeing failures due to this?
> 
> You're obviously doing something differently to everyone else but we're
> having a hard time understanding what, or how we'd trigger the problem
> you're seeing. 
> 
> We're nervous about fixing problems we don't understand, not least as
> it potentially means we have a huge hole in our test matrix. Your
> patches shouldn't be necessary as I understand the codebase either.

Let's see if we can peel the onion.

Can you explain how it was designed to work for cross compilation use
case where host machine architecture != target machine architecture ?

If I understand this right, all of these postinst intercepts create
a native package dependency via inherit foobar.class.

AFAIK, Native packages are built against the host machine architecture
not target architecture.

Where are the tools supposed to come from?

I can focus on details if my build actually follows the design.

As I said, I do not want these packages on my target machine but we
want to run QEMU using the tools that were compiled against target
machine in order to execute postinst intercepts.

This issue showed up in thud using core-image-minimal. It was not there
on sumo.


