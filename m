Return-Path: <franksinankaya@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEE097D597
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 01:39:02 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id u134so7688413ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 18:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:cc:references:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WLpR6bVKyCPv7LM238dSDfpG7AB0bFbsz5USXoaeMzY=;
	b=pc64/ON2s5EqYC7cghA1PCe6lYNpzWJgf0b/MGGB8aNn6Ehp3QrIcpOLC8bwHYWUQh
	fLkPnJsHdBA/q34F++29QJ6O9lH/Lih32Q+tumfEPqspdjOvQDOIJ3tgPpnMczi3EsmS
	xMUBjvvVMRlOFKzuKq0fAbjSathMHbpsBKS4ODvqiyPzE3UAsel7fzrxa2nFIYXFC3U/
	m0nlWFhmE+z7IvEZVBC7vGPMezKywV24v4SkxCiZeRWD91O1k0MsLJLEQnIKc0m7zyRN
	A/ahQEO8n7G7Mkevg9auEqetMVt25i9YNs/SzWGpLwv0INM9crxBmfODZspZxMymAoCA
	PhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:cc:references:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WLpR6bVKyCPv7LM238dSDfpG7AB0bFbsz5USXoaeMzY=;
	b=J/12bSp8sTYS2j64BedTHb+lk72h8Agd4N0Ou9eB7LLh+15CGLsHROPxCtjNIG/bOi
	VwatFpoxgg0oSA7NuNloBBduKE8c4q1/zKbBAfbA1hsBNqMqwIIupDfFhjVx4NaTG78b
	OftWg2haf4U6SG1VT8Aw/O8R5o+yyj+TM10Nr5kc94lDA6GKIdKcNX6pnOile663cTvx
	19apQNjX6Xbh0fkEOk6whmAC6zMJgGHr6ZX3KgegW/6oauHOJu5VnjzYw5nHZ6Wy+A9m
	rGshlts3M8KykfMszhonVEqawmogdOyafbkTYzpCcGEyDaR24N+s0sw8wlfxhrEuDVYl
	7nqg==
X-Gm-Message-State: APjAAAU5ZtXddvf06zc7AZumgBZaBuugqvTuTceysMnTzBLu2pklkzRD
	WTE824HgDvU2pk3Dkv28dMpQ52QE
X-Google-Smtp-Source: APXvYqyTZcWx53wkkFOVCDkcKC0kwf3Ulfg/i4LwD33EQGvssU7lxLvv9I9ULtL8KVzeakBNRywnmQ==
X-Received: by 2002:a81:5597:: with SMTP id
	j145mr13110258ywb.328.1561945143638; 
	Sun, 30 Jun 2019 18:39:03 -0700 (PDT)
Received: from [192.168.1.74] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net.
	[75.58.59.55])
	by smtp.gmail.com with ESMTPSA id i5sm2218510ywa.75.2019.06.30.18.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Jun 2019 18:39:02 -0700 (PDT)
Sender: Sinan Kaya <franksinankaya@gmail.com>
From: Sinan Kaya <Okaya@kernel.org>
X-Google-Original-From: Sinan Kaya <okaya@kernel.org>
To: richard.purdie@linuxfoundation.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
	<5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
	<5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
	<CANNYZj-Oow=4m4A1a6k+Mcjo6qf5cnCAR5_OGrhitM1-XqZALg@mail.gmail.com>
	<879d6ab4-5948-61ac-d783-401d660b0e94@kernel.org>
	<9b521556e6134041d0b5b966dc4d602d74bf8153.camel@linuxfoundation.org>
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
Message-ID: <e1993622-7ac9-8605-7eb1-f41a57eab3f4@kernel.org>
Date: Sun, 30 Jun 2019 21:38:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9b521556e6134041d0b5b966dc4d602d74bf8153.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 01 Jul 2019 01:39:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/30/2019 5:54 PM, richard.purdie@linuxfoundation.org wrote:
>> /update_pixbuf_cache: cannot create
>> /home//riscv-yocto/build/tmp-glibc/work/qemuriscv64-oe-linux/core-
>> image-full-cmdline/1.0-r0/rootfs/usr/lib/gdk-pixbuf-
>> 2.0/2.10.0/loaders/../loaders.cache:
>> Directory nonexistent"
> Knowing which branches (sumo vs. thud) and which layers does help put a
> different perspective on this issue and helps us help you!
> 

Sorry, I thought I mentioned this before.
Issue showed up in thud. It was not there on sumo.


> Is this a difference in dash shell vs bash shell (e.g. for /bin/sh) on
> these machines? (if I had to guess that is where I'd start)


Dash vs. bash didn't make a difference. I changed build machine to have
/bin/sh point to /bin/bash rather than /bin/dash.

The commit on github also says "it may help" with the postinst.
Apparently, the issue has been solved mysteriously for them.

One thing that issue on github mentions is that these issues were being
ignored in sumo but are marked as real failures starting from thud.

