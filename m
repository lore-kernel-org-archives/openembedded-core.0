Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id D16CC744B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 00:49:09 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id a2so1764768pff.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 17:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lumUjgqDSTpgsCAwbjESrRsKfMPPPMXWABJq2ysuWWk=;
	b=ZuUu39MLxvjqFlxV7IYYdZrX8ifLsYh2yGxKIrwLepFVaW2BwpvVr3W4KBRZrV+RAD
	L7EmD0uFRy6efxAuBGrd/oq5pWqlz9ikBQwYTZC75kYC5Cg3dVOO2zlEfqNX1qoeRCy7
	1By7KNRP66f/O35kbItewoZ31WHx4ZWBYQjnrHXTnueDf8XPLXXbg3vRIAy4H8USoPRK
	M3elgQBgNq+v6PAW5WAiuYy1N+kxQkCFOvd4WPiyqWBtwC8eQS9r3oKnaAMNUDMuSNgh
	f+HDZs1VFU70/+01lXxyWEKsmsSWcbjKGvnucJXkuDAvJg/5zLi0OKDOuD/Q0lCyWc5p
	qkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=lumUjgqDSTpgsCAwbjESrRsKfMPPPMXWABJq2ysuWWk=;
	b=O56x3VDSDJVsGs/KdBsb4idByaZHWqji95PHv7DvnPdXct0RiXrAohW1kAWNLhdPDW
	3bJR6S5cCw+Z/dWsKaS7y6piad1AJ9Z5js6mcCcpPlgFtgnKsmSxUX1ZL6+7gVkw+zv0
	egIrQOBnCgEzUnokmZA/hknHQpRNQV8Gobr652HaQGqogI0CotOa2+J7cM3NZatqtAnF
	/fgyLpAd3uDtCCOW7PsEJsdXywcda36UnZ/sY80npqhHkM5cuFR/gOCsah/cmm+21s3x
	owc+UqQJ14g9uU0Q2qo6V1QW7XHCgXT9GBGsotPTpANVQ60l68SEKuCxCxp/yuVOX0c+
	eq6A==
X-Gm-Message-State: AElRT7G3kJ/fOnij4i4uEVTsxLrrmCDzoMkKFJ2n6JVALDyQaha/2RFd
	xs2euEfab2Hx9VVnLFHIx6wHpA==
X-Google-Smtp-Source: AIpwx4+3rJwa5JUHWlmbNF8WCxOUmb+YKCneeD8WS/6nlJhLKsBH5JU4tKpA20uMwA0aC1sA5ZVKeA==
X-Received: by 2002:a17:902:d81:: with SMTP id
	1-v6mr10397832plv.324.1522370950595; 
	Thu, 29 Mar 2018 17:49:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:64af:19c1:88dd:eacf?
	([2601:202:4000:1184:64af:19c1:88dd:eacf])
	by smtp.gmail.com with ESMTPSA id
	a14sm13883974pff.75.2018.03.29.17.49.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Mar 2018 17:49:10 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>
References: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
	<CAJTo0LbSaZDNtGmgtoBba1n1aFLBUaaDN00L=G3UUq6UAvT6hA@mail.gmail.com>
	<d08f4cbf-7604-0115-61ca-a020fe2164fd@gmail.com>
	<20180329223348.GJ2786@denix.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; keydata=
	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
	8CS2NxU=
Message-ID: <99ef7037-3e21-26c6-0cce-45edb1cfce1a@gmail.com>
Date: Thu, 29 Mar 2018 17:49:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180329223348.GJ2786@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bind update
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
X-List-Received-Date: Fri, 30 Mar 2018 00:49:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 03/29/2018 03:33 PM, Denys Dmytriyenko wrote:
> On Wed, Mar 28, 2018 at 07:48:34AM -0700, akuster808 wrote:
>>
>> On 03/28/2018 04:15 AM, Burton, Ross wrote:
>>> Hi Armin,
>>>
>>> Does this mean you are working on the upgrade, or should someone else start now?
>> I think I did it. just need to find my work.
> Did your dog eat your work? ;)
How did you know!  I think i might need the openssl update,  its
expecting a new crypto definition..

- armin
>
>
>> - armin
>>> Ross
>>>
>>> On 24 March 2018 at 15:35, akuster808 <akuster808@gmail.com> wrote:
>>>> Hello,
>>>>
>>>> While working on updating the current bind to the next patch level, I
>>>> noticed our current version 9.10.6 will EOL June 2018. I know we are
>>>> under feature freeze for the Sumo release.
>>>>
>>>> Could we make an exception and allow an update of bind to the ESV
>>>> version 9.11.3 ?, it EOL's Dec 2021.
>>>>
>>>> regards,
>>>>
>>>> armin
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


