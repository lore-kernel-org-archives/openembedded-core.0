Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C53561A3D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 18:11:02 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j14so1478418otq.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=SwRaKpy58rToNrmGituA/Pmkk4fWlkCRZSCbn6IMv6o=;
	b=WmhibYaGoxTaipJiL6TmJHquNpb1sQGRo+niv2vVXKpw5/DWPb/lTZsmyNbOYbQDGn
	dK+FvuTAuWTdfxYKkS/oxp2I3P5yGk85AsC8j7LhXQOD1AvDoDXzP/8vWhZCU65F1Ayn
	RXQy0lY4+HNgtR75oTAyq1WHQtEBnRUOEMny+ptApNqWllHSefe7aSKsfMfXnivCKQ6g
	K0NL8ozYh+uQ5RKkxMqgjz1BWCHoxAZt2cGujotqGD4Rjz0C1kYawHwcXq95jMAdzoDd
	dkGRftIbRoKf2tOPvHO1Fml9TvOJiCzQFyt+bKGSTiaGk19DnbAtRFo8fSuFSjzDhB98
	pdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SwRaKpy58rToNrmGituA/Pmkk4fWlkCRZSCbn6IMv6o=;
	b=Rb1I06gV0tR9AgHHRtuoTmlWL9cg0GR5LhR0TaR2lja25v4/2t7gmtT/n1znE+pzXB
	AkZfWuyN42NpcKv5cVz0QDhk2AxgJslp+eDzvcJm3/fL/KESbx1piotzRGLP3OoxSJkd
	RCG/Dqh82rE/yDX6RAbSzyqb20G3Q9Zy8ZiZZGoKcIOA2fLCWUO+/fD/WStI2IQDb/c1
	2NqVugyzqi/2aSKbIKediTskB6bTM+zOlG2GYr6TsKSjsxemHku7Cj8n8YN1u4SS/uHB
	FM0MsOZYCiMbt4nYeykHiIJteKVVd7vzu25Qx22J3+fZebfXLIAao8LCC7oLY1fSg9bL
	zxqA==
X-Gm-Message-State: APjAAAXsuvfwyGdfCDWqdZKlw6DF6xhphkQwxJtm9jYV3bjYBjHHAFf0
	cfsBfSV7WXt1hk8npEZC/1tRr1jHrIs=
X-Google-Smtp-Source: APXvYqyVk26U9h61aiiAnw8BgW2XVRpPHK2YxTQORgceD7wAZT7XJfpcLmjk1T0/ScIoK5NU+Vjk9A==
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr7933947otq.231.1582999863134; 
	Sat, 29 Feb 2020 10:11:03 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:7d93:a1ab:da87:363b?
	([2600:1700:4c90:60a0:7d93:a1ab:da87:363b])
	by smtp.gmail.com with ESMTPSA id j8sm197775otq.42.2020.02.29.10.11.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Feb 2020 10:11:02 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>
References: <20200228225151.28015-1-jpuhlman@mvista.com>
	<20200229153705.GB25145@localhost>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <05af0b1f-08c2-ee55-dd96-0261a1234d4a@mvista.com>
Date: Sat, 29 Feb 2020 10:10:40 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200229153705.GB25145@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: add fix for arm6
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
X-List-Received-Date: Sat, 29 Feb 2020 18:11:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This was in my queue from a previous yotco version. I haven't gotten my arm
bsp up and running yet. I will double check.

On 2/29/2020 7:37 AM, Adrian Bunk wrote:
> On Fri, Feb 28, 2020 at 02:51:51PM -0800, Jeremy A. Puhlman wrote:
>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>
>> We have had similar problems with missing atomics on arm6 that arm5
>> has.
> How are you able to reproduce this problem?
>
> I was wondering why the upstream fixes that happened in the meantime
> didn't fix it for armv5, but a qemuarmv5 build of mesa on master worked
> even after commenting out this line.
>
>> ...
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -161,6 +161,7 @@ EXTRA_OEMESON_append = " -Dasm=false"
>>   FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>>   
>>   CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
>> +CFLAGS_append_armv6 = " -DMISSING_64BIT_ATOMICS"
>> ...
> cu
> Adrian
>
> BTW: armv6, not arm6 - arm6 is armv3
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


