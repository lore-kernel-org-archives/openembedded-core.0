Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 309CE7FCA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 19:26:29 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id e11so210959pjt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 11:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=T5uCn7N/5IisqZBREJu+ijR6OfO0TFjDZp9loP8uxBo=;
	b=P3T6KdRWq6IxSzYr/4wMWkTezcjLve9/pnEwTq2hj1Zn5y1lc4k2EDqFBLX1N5/eVl
	wkYOzYv+e0oE8g4GVU0LWEHYCPnIXbkfmooaj1P2XdYMgv0PwMkpKivJQ4XfqkNkthBg
	oME1OfulZU7bJg1yebMQCTXfkWD7VEEouTAMNNb4pxwfyfFzSrPmUoaByp/CYmXRZNn5
	aNk+w93yGIU2DhhGfl02k9NbdwL6Z85AasAQofu+ci9sWhun9O9cmCTx59UIilxindOK
	ySug0jn7c6+raqQ0+wUAF1mzHAjNyWYq26tzDB8k+RCsuo6o1NI7bbaZwcEkYKhLbSqb
	dkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=T5uCn7N/5IisqZBREJu+ijR6OfO0TFjDZp9loP8uxBo=;
	b=kcBNsGxJ3LAyAvLa3UnGoHyVSt7SYPuKZEQbwbQaX3XVRHFVwVFLkvokhUYJT9dyr4
	ZLmWW+3qbejzqxsaxO2sBKPt92+Oh6iBWwWQXPj62rJJ45tCb4DNPY+QHJF8BhSnJD3Y
	+MCMVY7sQqU6tN87ltyNF+XRK94BCDhu00yuo7Q4JNyMZfdTEy0aDuEkgwzxa3wEKuuj
	1+6+mozjFgDNhI3KlNZhFF4XCIWK9ZJEyrrJAEiZaj7fhwPIpCOu2Lnf8pleNyhCA8sN
	n46Qat+ou3dPeSEcKSbdchRtX9179XZSPNRlvr7QJJOLs1P23gf3OLI8/EIsnl95eaZ9
	o+0Q==
X-Gm-Message-State: APjAAAViaboFLlam7JLPq/8qJXg9Nimp1RRFlF7Fijec0gGb8vf3jCWW
	1PZPJipaVScQH8kR/9zn5JKGGj7ZiGs=
X-Google-Smtp-Source: APXvYqwSsB5/+0t9IqcdtF9sfepo7eVgE3b/fm29bRms6Q8X4Dk/SKbaMeCg0YsaqQQkkk9X01XKZA==
X-Received: by 2002:a17:902:34a:: with SMTP id
	68mr1273633pld.250.1579548389489; 
	Mon, 20 Jan 2020 11:26:29 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:2443:dc13:4404:96b1?
	([2601:646:9200:4e0:2443:dc13:4404:96b1])
	by smtp.gmail.com with ESMTPSA id d2sm247914pjv.18.2020.01.20.11.26.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 11:26:28 -0800 (PST)
To: Stefan Agner <stefan@agner.ch>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20180514144415.40730-1-stefan@agner.ch>
	<20200113145729.amwegnpvnp2kb3ut@qschulz>
	<20200120123246.o5abx73ehcoqbbim@qschulz>
	<4e98fdb7ff73df6804e58f2f4339c816@agner.ch>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <059aa62b-1c45-50a3-5d58-40f2646247ad@gmail.com>
Date: Mon, 20 Jan 2020 11:26:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4e98fdb7ff73df6804e58f2f4339c816@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Mon, 20 Jan 2020 19:26:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/20/20 4:57 AM, Stefan Agner wrote:
> On 2020-01-20 13:32, Quentin Schulz wrote:
>> Hi all,
>>
>> On Mon, Jan 13, 2020 at 03:57:31PM +0100, Quentin Schulz wrote:
>>> Hi all,
>>>
>>> On Mon, May 14, 2018 at 04:44:15PM +0200, Stefan Agner wrote:
>>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>>
>>>> The udhcpc script calls ip addr flush .. which flushes addresses
>>>> of any address family, including IPv6. However, busybox udhcpc is
>>>> IPv4 only and should not influence IPv6 addressing. Hence use ip
>>>> addr flush with family constrait.
>>>>
>>>> The script particularly broke IPv6 SLAAC: Typically when udhcpc
>>>> calls the script the kernel already assigned the IPv6 link-local
>>>> address. The flush removes the link-local IPv6 address again and
>>>> prohibits proper IPv6 operation such as SLAAC since neighbor
>>>> discovery protocol relies on IPv6 link-local addressing.
>>>>
>>>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>>>> ---
>>>>   meta/recipes-core/busybox/files/simple.script | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
>>>> index 6ed0293525..8b5eb53633 100644
>>>> --- a/meta/recipes-core/busybox/files/simple.script
>>>> +++ b/meta/recipes-core/busybox/files/simple.script
>>>> @@ -28,7 +28,7 @@ case "$1" in
>>>>   		fi
>>>>   		if ! root_is_nfs ; then
>>>>                           if [ $have_bin_ip -eq 1 ]; then
>>>> -                                /SBIN_DIR/ip addr flush dev $interface
>>>> +                                /SBIN_DIR/ip -4 addr flush dev $interface
>>>>                                   /SBIN_DIR/ip link set dev $interface up
>>>>                           else
>>>>                                   /SBIN_DIR/ifconfig $interface 0.0.0.0
>>>
>>> Kindly pinging, happened to us as well many times.
>>>
>>
>> Kindly pinging.
> 
> Just checked, we still override that script in our layer, so definitely
> would be happy if this gets merged upstream so I can get rid of our
> custom script downstream.
> 

I think this is good to go got OE-core, but I was wondering if default 
script in busybox also need this and perhaps upstream too

> --
> Stefan
> 


