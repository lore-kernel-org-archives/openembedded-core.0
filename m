Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id F016360B34
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 16:01:03 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id d9so4138210pgu.3
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 08:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=yQWE/6G1eTltKu6u4a/AsjoV5HYnyIgq/6udkcLpliw=;
	b=Iqp5gHIAwe2Xc3IkRRdcLNsnomQ30ySLdu5cMiyqDZh4iaiaiRHv99A+9OwF/qHjbj
	DMrJ9jTYKIhP8MhSnOfGHHDIRqAM3gGFMt+8xrqOOLpkgVF226OOs/j+JO2RSIkZoFGK
	ILykXCyGN8XXutOzhptDmEvvk3K2R2yPNd26TwzWbgGtHhA4CXrM5kktXnftll51uxf3
	aoux+QXybppe5ZLCevNNl2/KcReWb6hhb/osFrKRNczmSPA5iPEoEp/GWDholaRh5sAd
	9mij6syfb/APRc8JcJInL4tj/Oa8xg4vcgUuLnAGx2A/x7us//qpbl86l90UpbMURE0h
	aE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=yQWE/6G1eTltKu6u4a/AsjoV5HYnyIgq/6udkcLpliw=;
	b=tRMI53L3WUTyPovhJMaV7lO1HvhT9+zQYBm15mOAJl4HH4PbBSVeAkQu12I+QBKkTq
	0tN0XG+n7C81TUDxi4KsMhtlzVILR0E90otajQ2udJZI3SK+HzDvBPwkgaiqBFyeKYIQ
	vnap9jls/J7nN1hVNFWrQAUbbPvNq422JDFX+/ohRhUFjGc8wSj/XZ66KcBkdRmBiWph
	z2emctH1E9mnm1CNINpqrAsHDyM9ogX1b8m+uvplEkgWOMlYUJi0DlhBdADjKCyRmbmE
	uqHIXbl/K4zdvD3QMsIloZsmTHKPqWXvOZXR1XZffKjx+8kvY8IzknuhPuicY2aZdYv1
	r7wg==
X-Gm-Message-State: APjAAAWCaaGCLRyAl9Or2YDuEVkN4ZIXOhKJ/K2EEksXJTCpsW0E2rse
	naD0v0JvfWiZyfJY3vMldZ9H5EMv
X-Google-Smtp-Source: APXvYqwY+l6txWh/AH37JFNwvG7pXmtasT2tTIu2K7GtpJB1WCLl9UXXrF+1gF24Kj35DnWTNkGHyQ==
X-Received: by 2002:a62:486:: with SMTP id 128mr1803545pfe.236.1581350464622; 
	Mon, 10 Feb 2020 08:01:04 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:58cf:c2e4:7ede:a168?
	([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
	by smtp.gmail.com with ESMTPSA id g9sm800762pfm.150.2020.02.10.08.01.02
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 10 Feb 2020 08:01:03 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Schrempf Frieder <frieder.schrempf@kontron.de>,
	Anuj Mittal <anuj.mittal@intel.com>
References: <cover.1581264380.git.akuster808@gmail.com>
	<e84c869d-1f1c-fdcf-4994-02277ab9d266@kontron.de>
	<2cd46664933442f788e7d5ef62b184eb@XBOX03.axis.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3e9e9b41-a82b-b77f-4ce7-746ae65c8fb0@gmail.com>
Date: Mon, 10 Feb 2020 08:01:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2cd46664933442f788e7d5ef62b184eb@XBOX03.axis.com>
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: [zeus 00/29] Patch review
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
X-List-Received-Date: Mon, 10 Feb 2020 16:01:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/10/20 1:55 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Schrempf Frieder
>> Sent: den 10 februari 2020 09:07
>> To: Armin Kuster <akuster808@gmail.com>; openembedded-
>> core@openembedded.org
>> Subject: Re: [OE-core] [zeus 00/29] Patch review
>>
>> Hi Armin,
>>
>> On 09.02.20 17:09, Armin Kuster wrote:
>>> These are the additional changes to help address reproducibility issues
>>> and additional fixes we would like to be included in 3.0.2
>>>
>>> Please have comments back by Tuesday
>> I have two questions/comments:
>>
>> 1. When I look at the zeus-next branch, why do I see only patches 7 to
>> 29 from this series applied and what about patches 1 to 6? Am I missing
>> something?
> That is a really good question, and one I too would like an answer to.
>
>> 2. Patch 5 (devtool/standard.py: Allow recipe to disable menuconfig
>> logic) goes hand in hand with a change to the u-boot recipe, that is
>> also in master (c634b8db1a8b). This patch seems to be missing here.
> That one is probably my fault. We have a local recipe that defines a 
> menuconfig task and thus I needed the correction for devtool and sent 
> a request for it to be backported. However, since we do not use u-boot, 
> I did not think of that part, which obviously should be backported too. 
will find that one.

thanks,
Armin
>
>> Regards,
>> Frieder
> //Peter
>


