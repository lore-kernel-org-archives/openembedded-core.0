Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web09.1614.1616698069537496913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 11:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4F5vHR0Wp2z1s2BJ;
	Thu, 25 Mar 2021 19:47:47 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4F5vHQ717fz1t6pZ;
	Thu, 25 Mar 2021 19:47:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 4fmP3anYyWL5; Thu, 25 Mar 2021 19:47:46 +0100 (CET)
X-Auth-Info: zg8A3pbRe5Bl6hLIofxvQEh8UWoBx3FzTRHhF9RDc4E=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 25 Mar 2021 19:47:46 +0100 (CET)
Subject: Re: [PATCH V2] linux-firmware: Package RSI 911x WiFi firmware
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>
References: <20210312205736.102998-1-marex@denx.de>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <997ce1d3-9961-1760-a16b-53f06bcf8237@denx.de>
Date: Thu, 25 Mar 2021 19:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312205736.102998-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/12/21 9:57 PM, Marek Vasut wrote:
> The RSI 911x WiFi firmware is already part of the linux-firmware
> repository, package it to make it easily available.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Steve Sakoman <steve@sakoman.com>
> ---
> V2: Rebase on current oe-core/master

Bump ?
