Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6C16561517
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:46:09 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so211954pll.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 07:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=I8H68lhaXd0HgG8dhGy6/J5Vz/L2oct/wiiYaVLyq/I=;
	b=TGJKRga2YlBCOJ9lZymliVTNK7Wujiv2yCSAtz+jvvgI4DmUxWmjrOXK03MxEgQ/aU
	f9Nd5J3goJU/rC4BjDpEeNLtqU8KrqizprY3xRDF1GDqwf4sYZZBdO0lx+xt3Zwxzw/X
	eEKFOv2vawtpdYJZ/vs/NcEx2UZ7qYWR5Zh31w29rmKbK8LJ1B/r979bpxjuf98MD1nr
	28+gtlwkMCMMRnc9pSozSjz28j+Go0H6slxzz6NWZFDuBeCvgmpU9+/XHwRmir8w5GAO
	XJ152bOcvQLTcH5niFLHRecP303FjKic+E/W7aAoKXJ2+4MrquOrWKSIag2GOHVAc06P
	t6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=I8H68lhaXd0HgG8dhGy6/J5Vz/L2oct/wiiYaVLyq/I=;
	b=jyqWIV6XYNx8SH+rnoFDa0Gf5BVLowVdtz2238fhEXu4cJmNEPyO5Sjri2jUbzlGOm
	NDK4qmHcBZ/m72/hZRZmFh165dIfIj5vTBUA1w2u8mR2bgfHtekwFMF3Gi9JorjxQbDV
	0z9kYrA9pBvVVvvEQuyJLOBJBHiwvT68DHoGy5Iu57ZbE61oVDmN6jVry9WgpKVSpucN
	zvfBC84fkMOGp0uJ5g3KdPpK/F6V+F6aQWZKKjcEUY2GGQu6xz+/cSMSTC5uOzcMQccC
	2EVM8F5pcoGBSQ/lXzhrmR8pw/L7olHKu6f3oloreMwh0GPREidCug3tiXdSPOCLB9gK
	R3Gg==
X-Gm-Message-State: APjAAAVOUgCPYbe9/JWCIR5ujj/+Ar0/S1VfgsQ4V0PhnmaMOvkFM1X9
	vqBYifDZG58OgRJADf3ioic=
X-Google-Smtp-Source: APXvYqzLOsVwnxCG34zBDxLhiQy+kwL0sdyjTTXDSdM4SMalsL/ONzRT7fv01P80sjsiZi1ew5sC3w==
X-Received: by 2002:a17:902:7b86:: with SMTP id
	w6mr25693252pll.317.1582127170687; 
	Wed, 19 Feb 2020 07:46:10 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:103:47a6:6829:8136?
	([2601:202:4180:a5c0:103:47a6:6829:8136])
	by smtp.gmail.com with ESMTPSA id ev5sm273086pjb.4.2020.02.19.07.46.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 19 Feb 2020 07:46:10 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	"chet.ramey@case.edu" <chet.ramey@case.edu>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"De.Huo@windriver.com" <De.Huo@windriver.com>,
	"preid@electromag.com.au" <preid@electromag.com.au>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
	<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
	<de449babe3c4352a19928a05b569e7ca09cd89a1.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c0c877fa-9d36-1019-0785-5c984970629e@gmail.com>
Date: Wed, 19 Feb 2020 07:46:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <de449babe3c4352a19928a05b569e7ca09cd89a1.camel@linuxfoundation.org>
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Wed, 19 Feb 2020 15:46:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/18/20 7:49 AM, Richard Purdie wrote:
> On Tue, 2020-02-18 at 15:43 +0000, Mittal, Anuj wrote:
>> On Tue, 2020-02-18 at 15:35 +0000, Richard Purdie wrote:
>>> On Tue, 2020-02-18 at 10:28 -0500, Chet Ramey wrote:
>>>> On 2/17/20 9:46 PM, Huo, De wrote:
>>>>>  I applied the patch to fix CVE defect CVE-2019-18276.
>>>> That's not exactly an answer to the question of who produced the
>>>> patch.
>>>> If that patch is the one causing failures when it's applied,
>>>> doesn't it
>>>> make sense to go back to the person who produced it and ask them
>>>> to
>>>> update it if necessary?
>>> Its likely a general CVE patch where both configure and
>>> configure.ac
>>> are patched. For OE, we can drop the configure part since we
>>> reautoconf
>>> the code. Its therefore the OE port of the patch which is likely at
>>> fault.
>>>
>>> Someone just needs to remove that section of the patch.
>> There are other issues with this patch which should also be fixed I
>> think. It has been marked as a Backport while it is not one. The
>> patch
>> includes changes that are irrelevant to the CVE. And, it should have
>> gone to master first.
> I shall await guidance from you/Armin then.

We should revert the commit. Ill send a patch.

- Armin
>
> Cheers,
>
> Richard
>


