Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 285DD73237
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 05:29:03 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so24029157pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 22:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=oQ9g/Q1hdP/PYZv4NX68TUpNZwmRco8VB5fsVpsSur4=;
	b=h0lIKSR9YuE3/t+GVN9ZCl0hgR0a0QnyjhiREhBm6blpX01XoB/W+/QrX3dLz2jxmo
	WeZB6ApTyNp2cZppp0xxpJtbhdeC4ISPrw2btSxojvU3WTkV6oI330kaWEFhkPrfl9jp
	mP93/AAxs+3ksUlJaoiR0qUh93vh2KAy1faWNbDxYMrTyAEcM7P0JzAESJjU0uDGFHmJ
	ps/gCj70RnvS1L1oaceCDRw67TQi3FmTFKKOKH7sRXgJ0NqUhWW4q3vdU4er5jIUwBJC
	JgvO67Lm8n9vEQKG8TnxTDoaX4DWKNBaI6Ojx6c1+2w5DXJ/tazXRDhLq2RQl6wZF3Kv
	Df9g==
X-Received: by 10.66.62.163 with SMTP id z3mr39487323par.12.1437802143511;
	Fri, 24 Jul 2015 22:29:03 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:1991:e433:f69c:a8f7?
	([2601:202:4000:1239:1991:e433:f69c:a8f7])
	by smtp.googlemail.com with ESMTPSA id
	dd3sm17642106pad.45.2015.07.24.22.29.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jul 2015 22:29:01 -0700 (PDT)
Message-ID: <55B31E95.2010906@gmail.com>
Date: Fri, 24 Jul 2015 22:28:53 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1437232180.git.akuster808@gmail.com>
	<1437723284.821.143.camel@linuxfoundation.org>
In-Reply-To: <1437723284.821.143.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/25] Dizzy next for .3
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
X-List-Received-Date: Sat, 25 Jul 2015 05:29:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/24/2015 12:34 AM, Richard Purdie wrote:
> On Sat, 2015-07-18 at 08:16 -0700, Armin Kuster wrote:
>> Please consider these for the 1.7.3 release
>>
>> The following changes since commit 5f0d25152bac2d3798663a4ebfdd2df24060f153:
>>
>>    openssl: upgrade to 1.0.1p (2015-07-15 15:25:43 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-nex
>
> We ran dizzy through the autobuilder as we have an opportunity to roll a
> 1.7.3 release soon. The result was:
>
> https://autobuilder.yoctoproject.org/main/tgrid
> or more specifically:
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1b492dfcdd692fe9440a1711812a1bb60ac741e5
>
> which looks to me to largely be gcc5 issues on the host, particularly
> Fedora22. There was also a bug occurred in build-appliance which has
> been resolved in master/fido.
>
> We therefore need to decide whether to backport the gcc5 host fixes back
> to 1.7.3 or whether we have to disable autobuilders in order to be able
> to build it...

I found the answer on 
https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

"The primary focus for stable branches is bugfixing, security updates, 
and making sure that builds on recently released Ubuntu, Fedora, and 
OpenSUSE distros work"

so we should back port the gcc5 host fixes. Is that something I need to ?

thanks for asking,

Kind regards and Mahalo,
Armin

>
> Cheers,
>
> Richard
>

