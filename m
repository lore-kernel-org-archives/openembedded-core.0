Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CBADC7D3DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:12:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 459McG3G61z5l;
	Fri, 24 May 2019 12:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558692736;
	bh=0ZZDyZZl513jR51MrVUnEfgo26dWwBqMCgt4NmNEZC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkUJhnoGGaZIEy/hKJbrmkqA+SR8wJ7xJPHBsBKs6YPElqyJBy9wGHbX6/u04bbn8
	OsGCKsgde0WWHGK4qE3874APr1AJIhmkMl0SMa1J3AIWyJL28dvbWXWPp0Per3NJgT
	Hp/HGUXJhIxFOtKGsKs57+hU+gGKsnLYackRkUkLyqRG89UI/yGIUB38zOn8BYzj1J
	bATqn2VB/6ALtr8d+kh9C1e71F/ElFEKq/QiHtBa3OZa6/5tAKxZWhFLIJOv7OE0RY
	nkZnO8oVgBSQr1Mf79oubE3JPixXod+o7/lmHM7jq01TgUPFT+Onw0nja8nQD8dKjE
	ZzoY3gZfP6Kt46HRReTrmNEom1fzqGjdNHiirKro0lwaGMBg/2MQDxx4b860k98QlO
	SIAUFTPMRsepFGOSucvhg22+d1cppOH3msBt1rsu/xI34TArV1KUjq0KAFfCNvxqLs
	iqJNQYf7f8kXeUJZwsT3fVOYvXA77OSHxHnZqlNwIbxUUZ7V3mk4TdWQjo4x9PyN10
	38xAKK35rRsC7pV+ikVgb9PS2jHVDme7Hd6cUtMYhOQVYDFRljuwAR+EOoh/PSefRV
	leAX8Y8qKUqlvcffHheDMwsPOVrHNrbSobI4ElOGE2295tLYpQhs/hk+SlRRLbZ4EE
	ZD9M7fi8pPUfoFHToYA7dTKw=
Date: Fri, 24 May 2019 13:12:11 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190524101211.GA25912@localhost>
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Fri, 24 May 2019 10:12:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 23, 2019 at 07:16:53PM -0700, Khem Raj wrote:
>...
> but I think dropping
> systemd support completely from musl is not an option I would like to go
> with, there are cases where this makes sense. Especially when you have to
> cater to different set of devices from small to big, userspace remaining
> same is big advantage atleast in the world I am in.
>...

That's a good point - when arguing against systemd as default init system.

systemd is bigger than glibc, therefore on very small systems where the 
size of the C library matters using systemd is usually not an option.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


