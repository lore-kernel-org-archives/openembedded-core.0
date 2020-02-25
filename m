Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E7A8E616F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:39:01 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 84so80542pfy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=1mxds0VJScgp79MXC9sthOinP/uzGiIbEAtKudUR7LA=;
	b=KkbGzmKVYYoNEtFNejTP/LXsaoAuEtWEm5qXkyBBucr+mh24paZ3yEJGcBzdfUW/V3
	2A2l7GVZP0DynneIH6ucOZLTEEPsIwqgn+zFo4YvKLt06vGKitd0nBcJVIIbNIYCHo67
	t9bve/Wa/KweoW4plnbNZyU+5IGyVHdQxgex4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1mxds0VJScgp79MXC9sthOinP/uzGiIbEAtKudUR7LA=;
	b=GJ/cSJHTv9BsK6QghVQsIvss8dOM1gqK98BeygqWtWhNWjG4kHEClZCmoDsP2vO0jc
	YGblQ4aTPRsi2w7c2jG2pgyO3tk43vaoBqSOvIfsPWg5AKtNW5t+kpaVPEBZ18J4jBO4
	Q4y/H8wBYytV/m6RTEp4eRQKkP+HFbpsW7Bet8YdgeK5mbNj3NE24Rkr+MdqMxnqgkcA
	+d07zI9wwJxhRPgbnNQu1ojtuDnM7B5aSZ2j7lyzb+6wSK4ANEkWIEf0YRGFXqzeSOvK
	waw20gpAPHO5okvhmfqvS/j7IKeJzlvCImhDwdcrNdIkaTWpBcl1ZYtLev6pQFe2ajoO
	lnOg==
X-Gm-Message-State: APjAAAVFhyzTyah/daW4Vta1/gHmscH0Ln07Ff0gHEhPBcG6jIn1naPu
	IJUAujQZFhQpIc+3x+kPUoqV2dL2MSBxlT+4
X-Google-Smtp-Source: APXvYqx1C/3UlhsHJGA4tgZWuoJlYM01DAEbzxlRQEshGF00rfGJU+6dwnNbrH0t8cn2S1SaxlrUDQ==
X-Received: by 2002:a63:3689:: with SMTP id d131mr135995pga.250.1582659542849; 
	Tue, 25 Feb 2020 11:39:02 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	q4sm18678297pfl.175.2020.02.25.11.39.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 11:39:02 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200225001115.18188-1-scott.branden@broadcom.com>
	<628af1221089667f1377f419dd9375637ac1d028.camel@linuxfoundation.org>
	<f67bc5ca-b6c3-ef92-538c-f2b61c1a761a@broadcom.com>
	<90132247-53a6-3ae1-efc0-7aa2479fde86@gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <06e06e15-76a8-7c8e-578d-3ac10de79232@broadcom.com>
Date: Tue, 25 Feb 2020 11:38:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <90132247-53a6-3ae1-efc0-7aa2479fde86@gmail.com>
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: Re: [PATCH 1/2] common-license: add fdk-aac license file
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
X-List-Received-Date: Tue, 25 Feb 2020 19:39:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2020-02-25 11:30 a.m., Khem Raj wrote:
>
> On 2/25/20 11:13 AM, Scott Branden via Openembedded-core wrote:
>> Hi Richard,
>>
>> On 2020-02-25 2:46 a.m., Richard Purdie wrote:
>>> On Mon, 2020-02-24 at 16:11 -0800, Scott Branden via Openembedded-core
>>> wrote:
>>>> From: Mircea Carausu <mircea.carausu@broadcom.com>
>>>>
>>>> Add Fraunhofer FDK AAC Codec Library license.
>>>>
>>>> Signed-offby: Mircea Carausu <mircea.carausu@broadcom.com>
>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>> I'm not sure this belongs in Core? Is it a commonly used license? This
>>> recipe isn't in OE-Core? Does the license have an SPDX identifier (I
>>> couldn't see it on https://spdx.org/licenses/)?
>> If we do not add this license the following WARNING is emitted:
>>
>> WARNING: fdk-aac-2.0.1-r0 do_populate_lic: fdk-aac: No generic license
>> file exists for: Fraunhofer_FDK_AAC_Codec_Library_for_Android in any
>> provider
>>
>> We have submitted the fdk-aac recipe to
>> meta-openembedded/meta-multimedia here:
>> https://patchwork.openembedded.org/patch/170495/
>>
>> Please suggest the appropriate place to submit this license.
>> It is an open source license but does not have and SPDX indentifier and
>> is only used for fdk-aac at this time.
> you can propose it for meta-multimedia
That makes more sense.  We missed seeing a licenses directory in 
meta-multimedia.
>>> Cheers,
>>>
>>> Richard
>>>
>> Thanks,
>>   Scott


