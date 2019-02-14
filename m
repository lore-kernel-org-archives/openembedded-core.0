Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id A82327C36A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:13:41 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id s22so2792185pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=rQ/V+Z1YQZi9K+wCZb0l1ULffihAqm2DRy8b3lUdDyU=;
	b=L1wslxy2IXG7FnaIxALNlTFZvn6rmV16AUIVBh/BUQQbs24bgC/e/+21YG550flBy3
	gk95KN4g3YgffKJP9lHDcOrDeC8LABGEnBmRD+iPJkcbP23OYv6Am3w0RLJfQVELttDH
	s7bPkAQReATKcDgeebBeQapCuBObd6IrlLw0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=rQ/V+Z1YQZi9K+wCZb0l1ULffihAqm2DRy8b3lUdDyU=;
	b=MElpDmlrhut1rh2VMnT/IV9txxJIMSd4N5mtAAHukXTShCoKg1T9LK4qzXxnktrzXx
	wuZ8FnQAQaHyTqBW9fpYYsqvO0dOS59bHWSB6bpBOrAHJ7Txd4X7segy12uYqN8sy0Re
	WNkTmvqhawO22BYbOr/Eyj9DdhBBwGfda3K1d4d6wB3Ldi8E6L6nKRrdBOWYuqLRbtEn
	F6F2O+V+VGy51Ptn5sDq4LrgMrUa+eNZM/d6xs7saZGjz0Vi/S5ACnSAEZwnOs+PHAzF
	PN1zzYMoAVFybcJMKWWi4zHe6Npmw0dj6Gc6+WPvPSqn00SdnH7l73Fe9Hj3428tXYcj
	BUtQ==
X-Gm-Message-State: AHQUAuaz3znCcTJrsCmgY16764kL0Cna77tSiSS9XOP7r1Dk7Aps7D1Z
	I4mNNEkAHlB/3tB5vJrAepviIcXUNuk=
X-Google-Smtp-Source: AHgI3IY9IuSC8ETPGyDX/YiAGk6RZeF97rhTD5GzUEaW2nvv7CdF17H/qf58GBjT6EJNCSyw+asmjQ==
X-Received: by 2002:a63:f40e:: with SMTP id g14mr2775506pgi.326.1550135621708; 
	Thu, 14 Feb 2019 01:13:41 -0800 (PST)
Received: from [10.0.0.243] (c-67-189-24-112.hsd1.or.comcast.net.
	[67.189.24.112]) by smtp.gmail.com with ESMTPSA id
	g14sm4397731pfg.27.2019.02.14.01.13.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 01:13:40 -0800 (PST)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <03b301d4c2ed$7497f360$5dc7da20$@gmail.com>
	<CANNYZj_PY61tmw=JjP7PPqqSVJff6kd=rsv=daNscx9eSkNWSA@mail.gmail.com>
	<1634479.1jWiZZ8UfD@localhost.localdomain>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <6cc49be5-a9f3-bf38-2570-b12048dc4471@linuxfoundation.org>
Date: Thu, 14 Feb 2019 01:13:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1634479.1jWiZZ8UfD@localhost.localdomain>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW07'19
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
X-List-Received-Date: Thu, 14 Feb 2019 09:13:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The regular 3 hour update wasn't installed on the new server. I have 
repaired that and added the RRS updates as well..

The update has been run several times in testing and I'm curious if RRS 
has caught up as expected.

On 2/12/19 5:57 PM, Paul Eggleton wrote:
> Hi Alex
>
> On Wednesday, 13 February 2019 6:22:23 AM NZDT Alexander Kanavin wrote:
>> On Tue, 12 Feb 2019 at 17:10, <sjolley.yp.pm@gmail.com> wrote:
>>> The recipe reporting system integration with the layer index is available
>>> at: https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M3/ and the
>>> historical data has now been imported.
>> Sadly the new RRS still seems to be suffering from the 'outdated info'
>> problem. For example glibc, or python3 recipes have been updated to
>> latest versions, yet RRS still shows that they haven't been.
> We're reliant upon the layer index updating and it appears that's not working
> at the moment. I have asked Michael to look into it. Thanks for the report,
> I'll reply back here when things are sorted out.
>
> Cheers,
> Paul
>
-- 
Michael Halstead
Linux Foundation / SysAdmin


