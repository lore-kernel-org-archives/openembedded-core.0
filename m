Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE59AC433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 00:11:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.25714.1656202286073906347
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 17:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=MhvQ6qyY;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D14B182140;
	Sun, 26 Jun 2022 02:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1656202284;
	bh=w8ULeVwLVuoxCQPmh+m8XElbL2klLVHAXTj+XnJEl1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MhvQ6qyYRTDp8lrdg6MD6vjL+PkXAq5rA18HZv8zFTRz6pD8gSZwNbFItUr22W1E6
	 LVuItvQAkiB2pvX5YWksoC2VGIkcFsMmej1jWDt/lnDo9AUsZkAGW39JzVTzFGHA0B
	 aOOJIo8nCPRlKFaGVU58jt7qoPLgwzV810SPh8jnxUiNvHtyEVOz/ZmvGdfyJyopQy
	 ntKuHwjg17fj87WKIdiY9ukARpN8Vb0l0bJNeLTP/0GkLThZowFkukLA6jEUzVT6uz
	 /zaQur4XlndoU6oMQ9gQMmRivtZHyaF/GWDixnqw1GFoklz8XKkfph30XXMAYyYJD0
	 EQyt7jLXwPXsw==
Message-ID: <123f99a7-e24d-2d25-f6c9-db3fbf64ba38@denx.de>
Date: Sun, 26 Jun 2022 02:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [dunfell][PATCH] lttng-modules: Backport Linux 5.18+, 5.15.44+,
 5.10.119+ fixes
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20220625223936.135521-1-marex@denx.de>
 <YreZrhrd+GqvY/9g@zx2c4.com> <d895911f-c3dd-e067-e6b0-7823664bc932@denx.de>
 <CAOSpxdZnCqvxUCxHUw-hi-2UzpC8NdsqBtYHcgPHhObgpapb8A@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CAOSpxdZnCqvxUCxHUw-hi-2UzpC8NdsqBtYHcgPHhObgpapb8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 00:11:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167302

On 6/26/22 02:01, Steve Sakoman wrote:
> I can add the extra info.

Nice, thanks !

