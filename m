Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id DC05161BEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:29:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b1so1564013pgm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HTPzI8tRM2dwQXtsz7uGZBHwhvtX4Qeq6j2n6OgvOmk=;
	b=c+0SC7avJt5lRnSsaM4arcdcaS6LRjjxd/KHFGj41jrlb5Wx0rqGEyAjVGQg7UvsTq
	J+96jLv2wn/y58Oji5djhq5svVjctN5EjE3sqYtcRHfrw6y+qr9zz79hvKLw35vn8tJU
	yzouubYL3uw5izPNOxnHiukoRM0boJXUPo/Ep7mUsjcSAFYVIpTVKLGpXAFHvxjGGZFA
	OIRI+A7+4GyZHLOQe5brZ95VQuc96ysUxVUMQMjiiEXNGJHMGLZWI24DDru+ByuFlWJl
	sT0XmVkJaW5Dl2l4isk7ROb2e2NKv/di7v1uuzIUKL1vuKQle8O29IoTlH3r2l+3D9Sv
	4ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HTPzI8tRM2dwQXtsz7uGZBHwhvtX4Qeq6j2n6OgvOmk=;
	b=FzkVslJ/Yf/EW5b30AQtyU/LCa3l83SS+oBOzzQAj8dREl5JFloMg23XOYA014zv3v
	ivB6/H9b1HeY/IwpZMp/VfYn2DRBHlRfTSw+3APAeVTn+XgRtZ7048XkYaZlrC7WkqoH
	RvgS3MVfJnTSSDE1hFupGPD3wg2EupJSlevgGIZmEUwJmtMKH6X7KUjs/URiLmOQHSb4
	pwEKTt4gOb3d6DBEnKCcd75POt3sJ8ZAEnd6x9Ei2BYZ2CO/0Nfq0DQ1PvpxQSKaeLg/
	3fa6Ojfrd0qoKKcFwIMWv/BG8wD1cvUo4Fm3dEU0kOE9680/LcL4kIA1vaaOvf/N3Jv9
	GLiA==
X-Gm-Message-State: ANhLgQ0GnGP3AxoBhRnKpVQ4fgo06fK/MEVrzfKvy6wDHJIIYTwNu5dk
	vEzGogT1dLIndY68PozN6QE=
X-Google-Smtp-Source: ADFU+vth2vm2BkNsXQDRPOmRnrwEKf/Lc7Dxz1OUZun0AeP4+eyTIsnhvPvo4o+cV298U69pD60xbw==
X-Received: by 2002:a63:5549:: with SMTP id f9mr3809166pgm.118.1583947771752; 
	Wed, 11 Mar 2020 10:29:31 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:e8b9:f87c:18f3:1405?
	([2601:646:9200:4e0:e8b9:f87c:18f3:1405])
	by smtp.gmail.com with ESMTPSA id
	q7sm37126679pfs.17.2020.03.11.10.29.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 10:29:31 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
	<20200310232814.48572-2-richard.purdie@linuxfoundation.org>
	<4d7b32fb-2163-92dc-f3e3-219eacbc4782@gmail.com>
	<65455f6a8ad443729e919704ef3a9d425b5cb6ac.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <7af79336-fdd9-0690-7552-7aac0b056903@gmail.com>
Date: Wed, 11 Mar 2020 10:29:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <65455f6a8ad443729e919704ef3a9d425b5cb6ac.camel@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Subject: Re: [PATCH 2/6] gcc: strip line numbers from generated code in gcc-plugins on target
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
X-List-Received-Date: Wed, 11 Mar 2020 17:29:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/11/20 10:27 AM, Richard Purdie wrote:
> On Wed, 2020-03-11 at 10:20 -0700, Khem Raj wrote:
>>
>> On 3/10/20 4:28 PM, Richard Purdie wrote:
>>> From: Ross Burton <ross.burton@intel.com>
>>>
>>> The line numbers are influenced by the gcc version on the host used
>>> to generate
>>> the code. Remove these to ensure the shipped source code is the
>>> same.
>>>
>>
>> Please send this paatch to gcc mailing lists for review, I am not
>> sure if this will cause regressions for plugin writers since it does
>> not seem  simple debug info that it is adding, and external plugins
>> might rely on  this information. While I understand it might solve
>> our usecaase its a kind of patch that I worry about to carry out of
>> tree.
> 
> I very much doubt upstream are going to accept anything like it
> unfortunately. Whilst much of the information is useful to plugins, I'm
> struggling to see how/why they'd use line numbers outside of debug
> information so I've assumed so far they're just that - for debug. DO
> you know of it being used in other ways?
> 

I am not looking for them to integrate it as it is, but to get reviews 
if this is something we are not setting ourselves for more trouble by 
doing this. Since lot of plugin writers will be there and can give 
useful feedback.

> Cheers,
> 
> Richard
> 

