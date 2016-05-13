Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 75A0E6018C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 20:59:24 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id zy2so10899338pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 13:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=J8CZl1k3yrcYUkXZLO+CK3kqjvhJtwODlu2Jj9rr/J0=;
	b=HICT9Oe2cEFvM6KaNtqPuoMZ1WPBuG28S3b0a8bbmh2ZxrMc4diPGiE1XPstEZRdQf
	WP8WJ5Phoj8ftQv4By29yymGfmlEvL0Fw5DT2Jeg4T0KjC4FphS8B8YVoWn3T+M+gGHg
	pPzf5Op7DHZMF6qxMXH10zs9X23Zf79MawDkosYzo1OADNZ5XjEpAvhm0J8YUaC9RjQj
	7ZNr0cSK6ewHVl9qR7BA365AYB21DSEBuk80Os7pmxNySfGLGjdVISy9AHf7Psg732rP
	T/ZTsgy7Sqp5/XmLzGWvcjeh4opxgPNZDeT+67y8i8YVuHt5tHuyTvKwArsNBDGfJGeg
	0uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=J8CZl1k3yrcYUkXZLO+CK3kqjvhJtwODlu2Jj9rr/J0=;
	b=dyHlAcQxP3nGJ/hkzkAEZzkc/rP29eaI3dbQgS3JZ/T2yOMRoGuVs+eTRxA6wFCvP+
	i8T1+Qiai0U/OnPOYez6SyyzuGjQC6T5j/hxgOk88V27gKzQdXAC6TQyClFV9Kw4G+JN
	t0LMwd76gILzBqElgK7KphkcdOaLbAKRSKvvmBoHsGUNaLhd61weLVa4JanI8VndGMoc
	Kuzjc+mvyY7dBdtQGjDKfxpZSvsfZ4vEDl1K0pnF4b11sVkCufzMRbkaUs7U0XLXRD3/
	uQfjaq7odj2qMpGDBQF/akFDgqKHtRFiITiDqdWpcCUmcbGLdf5ZZK1QiTAcjB/aF3wL
	zQhg==
X-Gm-Message-State: AOPr4FVD5Q1Q4/Crr4lSYcNWmH3sBFSGQT9PGMaRgd9N0Ri6dBNjM1k2Gdhi96BmiAqnlA==
X-Received: by 10.66.151.104 with SMTP id up8mr24699125pab.134.1463173164909; 
	Fri, 13 May 2016 13:59:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:c53a:7e08:2482:8461?
	([2601:202:4000:1239:c53a:7e08:2482:8461])
	by smtp.googlemail.com with ESMTPSA id
	u127sm29477465pfb.82.2016.05.13.13.59.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 13:59:23 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>, Joshua Lock
	<joshua.g.lock@intel.com>, Robert Yang <liezhi.yang@windriver.com>
References: <cover.1463054447.git.joshua.g.lock@intel.com>
	<20160512141645.GA2567@jama>
	<1463157281.9746.114.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5736402A.4030107@gmail.com>
Date: Fri, 13 May 2016 13:59:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1463157281.9746.114.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [fido][PATCH 0/1] Undo ABI breakage in OpenSSL
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
X-List-Received-Date: Fri, 13 May 2016 20:59:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 05/13/2016 09:34 AM, Richard Purdie wrote:
> On Thu, 2016-05-12 at 16:16 +0200, Martin Jansa wrote:
>> On Thu, May 12, 2016 at 01:06:33PM +0100, Joshua Lock wrote:
>>> The backported upgrade to OpenSSL 1.0.2h introduced a newer version
>>> of
>>> Debian's linker version-script which breaks the OpenSSL ABI.
>>> This isn't desirable for a stable release, thus the attached patch
>>> reverts
>>> the linker-version changes and simply adds the 2 new symbols
>>> required by
>>> 1.0.2h.
>>>
>>> Thanks to Martin Jansa for spotting the issue and suggesting a fix.
>>
>> Thanks for following it and getting it merged so quickly.
>>
>> It was already merged in fido, can we get the same to jethro (which
>> was
>> also recently upgraded to 1.0.2h)?
> 
> I'm hoping someone will give me a patch series which does this
> correctly for jethro. Its why I haven't taken the previous pull
> request.

I will spin one

- armin
> 
> Cheers,
> 
> Richard
> 
> 
> 

