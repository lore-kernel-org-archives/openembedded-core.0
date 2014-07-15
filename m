Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5127039E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:11:17 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id fp1so3803626pdb.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=c4IvQ2OQckmIo9d6q7ZsLrim9CnqYy2OjqT7ZkI55uQ=;
	b=Q2Kxpwiq/14ySE5VJqSwX8C3oMOZSludSeZKFqMlOJrwB1si2JTdQIliN9Z24JDm2W
	47mBsuXOkyAT6vfo64vM6cUgW4PAb9+we0ppkfxzZ4gua+r/jMeE/nxxIHTjUfk9ZxFc
	6coNsbAc1Mc75m/51+fjfMOeD6Tm0GPKJj06XLmIYIuuCiKPxBmlQYQfH+EaW3VPY4IY
	klcoeqj8wdJuDxuwAA1M1usxmgH61GkUzGBrQQfhr+y5HiE5kCvE3PeRSNLkzDCbsIWY
	JKtpmuyA2Q/lQ/Bshk2P0V+F1ZvWqG5a80bcBy067DDlD8i5lGAfz/CQrnPPBSZqDAZ/
	HdQw==
X-Gm-Message-State: ALoCoQmo6Evj+kIuAQ5LGrLE+JGFowXih2hwmRVPilTnhYkgvRba5y8cQJvpCUD6om7gK/7wqg4s
X-Received: by 10.68.191.232 with SMTP id hb8mr901329pbc.169.1405433478394;
	Tue, 15 Jul 2014 07:11:18 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	hs5sm14096868pbb.92.2014.07.15.07.11.17 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 07:11:17 -0700 (PDT)
Message-ID: <53C53683.7050107@mvista.com>
Date: Tue, 15 Jul 2014 07:11:15 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1405430855-12398-1-git-send-email-akuster@mvista.com>
	<CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>
In-Reply-To: <CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 14:11:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07/15/2014 06:49 AM, Burton, Ross wrote:
> On 15 July 2014 14:27, Armin Kuster <akuster@mvista.com> wrote:
>> Add GNUv3 license
> If nettle 3 contains GPLv3 code then we probably don't want to remove
> nettle 2.1, for people building without any v3 code in the images.

They have what they call dual license in 3.x ( GPLv2 or GPLv3). We 
certainly can keep 2.7.1

I will send a V2 keeping 2.7.1

- Armin
>
> Ross


