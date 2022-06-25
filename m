Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D68C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Jun 2022 23:47:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.25546.1656200851464022089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 16:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=eGE71BOk;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BD81883D9C;
	Sun, 26 Jun 2022 01:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1656200849;
	bh=CTp/LVNoNCDGM8rsNASWPCp0DF9K1wYZfsMlUM46q2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eGE71BOk18FQjEX+FayZcYxNzJeqs9hZKT24OFYhnpbFIrhikNzbsn5eHS4PxkvH+
	 kZJf4/FfjGqZ/es2QQlno8RM/zZFdjs4Um6m3UZgwk3ty8jlWOaIV/zqtpT9JS7ADH
	 aVnDnmB8O73trPDbT5EdMu/y+d6nT4kJkl3GEdTEyl3V5Kz8oyjqqq2rcg8mZuhNXa
	 kOUKaPAzzowxygfEM03+eJtn4DM/jSv41zzcjHmWynMFfp4K/Le2slBoojfQX0/B8i
	 RMBN2zJQ7lnDLSlRVzg5+1NtvRUOgYOhIgcWZIJknkHvK8kv+0Y9U+qbGSsAmqk7uP
	 UG5h7moKJ/n2w==
Message-ID: <d895911f-c3dd-e067-e6b0-7823664bc932@denx.de>
Date: Sun, 26 Jun 2022 01:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [dunfell][PATCH] lttng-modules: Backport Linux 5.18+, 5.15.44+,
 5.10.119+ fixes
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20220625223936.135521-1-marex@denx.de>
 <YreZrhrd+GqvY/9g@zx2c4.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YreZrhrd+GqvY/9g@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jun 2022 23:47:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167300

On 6/26/22 01:26, Jason A. Donenfeld wrote:
> On Sun, Jun 26, 2022 at 12:39:36AM +0200, Marek Vasut wrote:
>> The Linux kernel commit 14c174633f349 ("random: remove unused tracepoints")
>> removed unused tracepoints and has been backported to stable Linux kernel
>> releases. This causes build failure of lttng-modules:
>>
>> "
>> lttng-modules-2.11.6/probes/lttng-probe-random.c:18:10: fatal error: trace/events/random.h: No such file or directory
>> |    18 | #include <trace/events/random.h>
>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~
>> | compilation terminated.
>> "
>>
>> Backport patches from lttng-modules master branch to address the build
>> failure on all of Linux 5.18.y, 5.15.y and 5.10.y kernel versions.
> 
> Also 5.4, 4.19, 4.14, and 4.9.

Do you want a V2 with this updated commit message ?
(or, can Steve add this line when applying?)

