Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6183.1619269112147466662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 05:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=y0h84/cJ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 607058172F;
	Sat, 24 Apr 2021 14:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1619269109;
	bh=A4nhvK2Ghqe1tTNIuCjlI2tMfNlo1Cf+OCWaAAbp6YM=;
	h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
	b=y0h84/cJhqQHNlGdmZEZKPPvm4Ans6+dC0RrIHmHevI+ksgXYl/xv5VRk7d5OK21Y
	 umKi24T/jdFOr6QPRZvRBFrvWtUvSt2NULcaNfowEWdiZrbqx2lugO/6BY3QvFeEyj
	 uU0+5LLr0MOOkrlLNyQA4H095FszAjAfrDYbMNd8WOaGGQl2ldOCcmArAXAezMA4SE
	 22dXzXYieuVEmcDVNk6UpL1gznKSGVH61wFY4AqGzSrc04LQ0Qgn9bfhoR9tXoiVqg
	 Qbnj34/SlmTxxcVXwNBj25FfEXiu5U+ez2YaHbxT/Qz6in8fRscp9+3JgXdJyqmVPH
	 ZIZdW/YrrLE7Q==
Subject: Re: [PATCH V2] linux-firmware: Package RSI 911x WiFi firmware
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>
References: <20210312205736.102998-1-marex@denx.de>
 <997ce1d3-9961-1760-a16b-53f06bcf8237@denx.de>
Message-ID: <296fcb47-7f51-db9c-702a-7ca923aa4a9c@denx.de>
Date: Sat, 24 Apr 2021 14:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <997ce1d3-9961-1760-a16b-53f06bcf8237@denx.de>
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/25/21 7:47 PM, Marek Vasut wrote:
> On 3/12/21 9:57 PM, Marek Vasut wrote:
>> The RSI 911x WiFi firmware is already part of the linux-firmware
>> repository, package it to make it easily available.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Steve Sakoman <steve@sakoman.com>
>> ---
>> V2: Rebase on current oe-core/master
> 
> Bump ?

Any news on this patch ?
