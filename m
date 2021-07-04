Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web08.7278.1625389180849366288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 01:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=EycLWLHV;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=QFNydt+Pm5LjMTCmxV7VlES9iieIMG3xGHyyGGmwNoE=;
	b=EycLWLHVvOasIo6tQhIs/TBJdHukdPMjFeQQrldnxGnP3Dn5e2nydVqmYHQD/ZZBt0GDrFbYJtSNM
	 Z4QB4DL6yVHU6z5VWoIbnuXIyNzJvT5uDuslfwLwwthmONwIttYS+HPrTPJ2OE0YXr2xmEvQYen5FX
	 3+Bvjowph5r/km8XmadWFxEieXf0QWDp8lcUUA1BBPJF3QkBJhJwsHjCf4vdaXGAlpBjxb9wTOw8/i
	 EOtWYtnSIgrBO/Cct6TWOYTNF56UInCTPM05UUWBA4m2bW09fxMiEZvXUQwgSUW8pPlX7hqxCs5p/0
	 IC2lUb+6OLvJCby5iVGMqabH0AhrDCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=QFNydt+Pm5LjMTCmxV7VlES9iieIMG3xGHyyGGmwNoE=;
	b=x+HHssMj32jj1YwpbDjaSRjh2XJlP9nFM2JogtZaEpr96mDOdlE1cnJXbN5R3evVG/BJ4Uuf+yQeC
	 /7S49YyF8iS6E8BTU67pSIg61qhvG64dKCnuAjfVLGMGU4uwyniik10tXfZVKset8TGKS5q4bojPqB
	 c03V8fDjw+oiIVz7hhiQdJKMq6Iix8ymMM+Zx1HeykTeXpVjBw05KGQSJf6rfpKHdYKhe0E5FzDX3l
	 14Tun9mlrGx21cxQMiOEJVt9jVpZddY7PQmZluZbxqhzbxfwjZ/ls21gQu+AU01gKTniEwYjVN7kps
	 WnrbaxGuQQbzBcNJz5zHX5Tx7DIJeGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=QFNydt+Pm5LjMTCmxV7VlES9iieIMG3xGHyyGGmwNoE=;
	b=RRGDpStolds0OzG9QIVQZ2bsujPvNgUGZ5KQPKSLs/tGrElg6pewFUWbtOkzcgdrXiB+IWRouzJVl
	 sUdFx13Cg==
X-HalOne-Cookie: 973b5e9400a7a3578f4e28b4a39d70fcd7cbc999
X-HalOne-ID: 2919b857-dca6-11eb-a90d-d0431ea8bb10
Received: from [192.168.100.145] (ua-85-227-233-29.bbcust.telenor.se [85.227.233.29])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 2919b857-dca6-11eb-a90d-d0431ea8bb10;
	Sun, 04 Jul 2021 08:59:38 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
 "liu.ming50@gmail.com" <liu.ming50@gmail.com>
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
From: "Peter Bergin" <peter@berginkonsult.se>
Message-ID: <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
Date: Sun, 4 Jul 2021 10:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-07-03 16:55, Mittal, Anuj wrote:
> On Fri, 2021-07-02 at 13:59 +0200, Peter Bergin wrote:
>> This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.
>>
>> As there is no build dependency between libubootenv and the
>> configuration
>> of u-boot there is no reason to check for UBOOT_CONFIG or UBOOT_MACHINE
>> by adding the class uboot-config. Revert this in order to remove
>> useless
>> workaround in bsp layer (meta-freescale).
> This was added to address failures in world builds:
>
> https://lists.openembedded.org/g/openembedded-core/message/141757
>
> If this is not required, then I think we'd need to address those
> failures.

Thanks for the pointer about the reason for this patch. I searched a bit 
but could not find it.

Can you please help me define 'world builds'?

By reading the mail thread my thoughts are that the obvious thing is 
that the build has a bad configuration as u-boot is skipped. This should 
be the thing to solve.

Do we have other examples in oe-core where we have a RRECOMMENDS and a 
requirement that another package is built. Isn't RDEPENDS used for that 
case?

Best regards,
/Peter

