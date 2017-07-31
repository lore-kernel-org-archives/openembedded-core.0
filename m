Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5231071D97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 03:23:43 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id u185so27004904pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 20:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=mHBZP/nYh4poJGzd0MNKauvCOey/RCM0856VqNYxcPg=;
	b=O1jqi0QBaE5EFEu/ipicI7EwHXHPUpJ+EbxyFsCwV1gBvWU/Kyi8nCeCDV4Y6dSpfr
	4MrS/yw7ZK2iJ7NnQCXnEJKkERMxeEeXROgMFFS7PJHRCR8QOfX8DtXCigX8V/qPSr85
	5gBW1gol/Ox5pxHYiME4IsU3re1I3z2VjTB+Wd9kjAeEyipWF/6HGwva7O0+AY3PTTT9
	3P74sbm1qOJ5T9jpK4Twv7vcl2iS4PA5tZebQLF2WsDTNt717BI4txj/W6nS8vGfTvoM
	rCf+7JmcuDgPVeTaeDZ3bWl5fU1DqqdPN1/HS0XElElIGkjy9yGVIIJNEYE4KpuN5Lhh
	1yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mHBZP/nYh4poJGzd0MNKauvCOey/RCM0856VqNYxcPg=;
	b=itoIikWiVIr8kPd6KfJUjVSxtu3rnjtjW7lRvziOUb9Tfnu0tXAyrjPvtJyMNxH+7L
	P2MZV76YAeN99zwvvcIfWPpQ543dx85pk4DvFW+Iy02bf7RFaliE64vYTARCFBqfGt6n
	dMBO17aVX2kYH+2NignLw5Tvov0NQxrMi/eAqjhn+XKkDp3/mhuKe76WpZ4gvWocfPfG
	xpxe1qXOKJRnNPpCWU7an8LwbD/ikK7uT2YW+JqpUrGA+qTZVaL/P2SW9s0Y80DnaFna
	KfkUXd3/pzAw1JWqiouPXFcq1tbCzCiFkvur7FfapwZHw9a3qzY/3JaL3Smh29h+ws+l
	qXPg==
X-Gm-Message-State: AIVw112gV4O42FG43V6ZQQz1+/FaRtxgRl5KnDHFo0ajrP9tbtDWWro8
	AhzRsn3l34h/sg==
X-Received: by 10.84.209.142 with SMTP id y14mr16055924plh.286.1501471425411; 
	Sun, 30 Jul 2017 20:23:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:a06c:b971:cca2:453e?
	([2601:202:4001:9ea0:a06c:b971:cca2:453e])
	by smtp.gmail.com with ESMTPSA id
	r86sm16502674pfi.138.2017.07.30.20.23.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Jul 2017 20:23:44 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Cliff Brake <cbrake@bec-systems.com>
References: <CAMKF1sqWosmxhDABfXu59DvPHmxMNybw0_5qprvbo+jHDoN+GA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a15e5c58-8834-3fec-3f8e-b848d8381ee6@gmail.com>
Date: Sun, 30 Jul 2017 20:23:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqWosmxhDABfXu59DvPHmxMNybw0_5qprvbo+jHDoN+GA@mail.gmail.com>
Subject: Re: [Pyro] backport request
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
X-List-Received-Date: Mon, 31 Jul 2017 03:23:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/28/2017 01:08 PM, Khem Raj wrote:
> Hi Armin
>
> Please consider
>
> http://git.openembedded.org/openembedded-core/commit/?id=5d3df78367be0afbfe001b4fa776a98a82e6ce54

does 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=pyro&id=cc48789276e0f91b37f1d89e418c87ee8bcc2d2f 
work?

- armin

>
> for your next pyro backport list.
>
> Thanks
> -Khem


