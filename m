Return-Path: <franksinankaya@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 83EC36A441
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 16:56:19 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id m206so8041384oib.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:cc:references:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CqwguXQTjYdb0KYUwPUXUMP2yB/JyQtzQqrOe33B618=;
	b=HiwpiO2YzPTPj6v6GaUtXOfQVMAwd9eo4znLfT3+w51NhbY7iL1kPq9EAuvr+jbBsF
	T7MzTkeopEe63Nqa/AlYWPsSQnPXnObdoFD2NXlHmgXHj7wwQzXNfatCD3Lk5BjxRN/B
	p8diGaaH5y3/sOg6tN9kpBBnBvZ0wgGnivM0wFrxCTrrZz7C26Q8uxvtBzTe4Wrhr1VB
	XYogErPwu3yVMSvfFbdFPicvRnsjYaSwLLIEo0iGy8CBZEF3dOt0caZZ/ancfXz3QjiV
	O4fWkSu3VvLmnl1UdPaZlgc4NPRrKQcRCfF7TkcUPql50H1dmDSMejEsvYUKuWjuMoau
	mLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:cc:references:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=CqwguXQTjYdb0KYUwPUXUMP2yB/JyQtzQqrOe33B618=;
	b=F05r7Pg8RpJpMzIl/fv58lhwofDzd06JSWa0sfOSBCuYZ0L1vuYl6gVNv7JXff072a
	W9B/1iyTuq0yogyiy6ChyAE9NyU4GBtKs3EvWgp/RW3ggMVmgBEVD+vbIGnWD5Lijo1G
	10BUYbfnYGaNib0huaRsl9P/DL4aq7OUWTl4NRReRzJxf3/zGW9o9k5jDujRxgNnskaI
	bKymAUvnMkUzRKtWQX3aQoA8s/Et2BTLOyVy4/u2uW+0OVNPoc4TA4YYOqz6hv/whUVC
	YPberZ+CxAS7zfFAk6EsOYOxkuS2m62joZ0mi1TCcAYz0b8f+8FGDqnkthAN1EMirGPT
	XTrw==
X-Gm-Message-State: APjAAAVur6b7Q7anj99DycECuDLv+Dc5MfEw0NbOPKo4QAkIY2C+fcUt
	hga/3GfxR9p8qHtD+mg964NsuKaO
X-Google-Smtp-Source: APXvYqz8txnGpPamYbiXwNzOoW4fJ7PNMPSntr7evNVi7xkpWKoh1XK/LUjWkM20dWk4CYEc4kePqw==
X-Received: by 2002:aca:f555:: with SMTP id t82mr4207088oih.154.1561913780221; 
	Sun, 30 Jun 2019 09:56:20 -0700 (PDT)
Received: from [192.168.1.74] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net.
	[75.58.59.55]) by smtp.gmail.com with ESMTPSA id
	x193sm3155371oix.15.2019.06.30.09.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Jun 2019 09:56:19 -0700 (PDT)
Sender: Sinan Kaya <franksinankaya@gmail.com>
From: Sinan Kaya <Okaya@kernel.org>
X-Google-Original-From: Sinan Kaya <okaya@kernel.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
	<5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
	<5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
	<CANNYZj-Oow=4m4A1a6k+Mcjo6qf5cnCAR5_OGrhitM1-XqZALg@mail.gmail.com>
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
Message-ID: <879d6ab4-5948-61ac-d783-401d660b0e94@kernel.org>
Date: Sun, 30 Jun 2019 12:56:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CANNYZj-Oow=4m4A1a6k+Mcjo6qf5cnCAR5_OGrhitM1-XqZALg@mail.gmail.com>
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
X-List-Received-Date: Sun, 30 Jun 2019 16:56:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/27/2019 4:46 AM, Alexander Kanavin wrote:
>     This issue showed up in thud using core-image-minimal. It was not there
>     on sumo.
> 
> 
> If you can provide steps to reproduce, it could help. Please start with
> a git checkout of poky thud branch.
> 

Issue in only happening on the build machine with docker using ubuntu
16.04 as a baseline.

I'm having hard-time reproducing on my development machine.

My cursory web search says that I'm not the only one hitting this issue
and people have mysteriously solved this issue.

https://github.com/riscv/meta-riscv/issues/26

The following matches what I see on the build machine.

"/update_pixbuf_cache: 8:
/home/riscv-yocto/build/tmp-glibc/work/qemuriscv64-oe-linux/core-image-full-cmdline/1.0-r0/intercept_scripts-2c03b46bc7941049a88b6c1719c35aade81b0ce5490421e7cca768bf8beb0d01

/update_pixbuf_cache: cannot create
/home//riscv-yocto/build/tmp-glibc/work/qemuriscv64-oe-linux/core-image-full-cmdline/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/../loaders.cache:
Directory nonexistent"



