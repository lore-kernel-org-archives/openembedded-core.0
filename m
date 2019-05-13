Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id D460A7C7A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 16:56:37 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id x15so6758019pln.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=zOEIS2vsRBZQtZVUpRdmXqBa2UPpM1lHklGm1w43KAk=;
	b=OfkyAvXjLekoNWqx2y1wmt21VbwlWH3eiVimk6LdEdkV02QZGLftbWsjKGq16iUp+U
	yNw5tQuXiyTZA7JMLPfbr0HCKbnPRHSicRpcwe88Z/JQ8ZUCcdX/ic4+lz31Ouznu9Wv
	aEsbs3ugP9OAiaTFo2u4pGBDYJoETc1kML3tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=zOEIS2vsRBZQtZVUpRdmXqBa2UPpM1lHklGm1w43KAk=;
	b=iAbchjfXP2e5v8U9+yELUIN++puYVKeEsbtyHFwI+aOdnkJcnEmdaN6F5zqtikThMB
	PVdaXw9wamEKlUP+kHb6wRwKZkaoqU4lvPxqcy3J7IKJ44gx3AYarQ2VjmU0uyMcaPfT
	l/O7bFtW0RzwUrDU5pSxF3r1IYwiQp/gZsg62c60FN1iyknT110zLONvOHG+2hogmCBO
	zAiCAmGR5yXAX9m7nz42FTH1A+m2nrY04xWRPOb9bC9N3euMDoPz19FvyFP2dM0OTTlL
	LKIb6JRA15y6pZ+Ze1WUBvhLPwK/SNkv3tA9ZLrJHKxynlTLZanunft4SWIeEQ3fHdEL
	36PA==
X-Gm-Message-State: APjAAAUXb7aFpVtKpG6Reo7YQVrxyYzo99K+aLcuptRu9B/Ysf8+Rmpr
	MIHslTKVa9muOHIg2Ev176jbuWvspkQ=
X-Google-Smtp-Source: APXvYqwutK8pDWRRvrHICCdvdPIRHUJIs7Hfui1+4i4S5Ll9T2cx8Qy7CCSsiVO7En786pn2DeJctQ==
X-Received: by 2002:a17:902:b492:: with SMTP id
	y18mr27258155plr.96.1557766598421; 
	Mon, 13 May 2019 09:56:38 -0700 (PDT)
Received: from [10.0.0.244] (c-67-189-24-112.hsd1.or.comcast.net.
	[67.189.24.112]) by smtp.gmail.com with ESMTPSA id
	79sm13119872pfz.144.2019.05.13.09.56.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 09:56:37 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <e86cf937-5734-fc36-cd94-fad9b0155059@gmail.com>
	<65432636-c595-ed39-28f3-efb7a0d565da@gmail.com>
	<bf12fd00-e786-25dc-4b10-056ce5adffb4@windriver.com>
	<20190513074620.GA14282@localhost>
	<24c5b8fb-38eb-acb0-3e2a-97e63df0e8d9@windriver.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Openpgp: preference=signencrypt
Autocrypt: addr=mhalstead@linuxfoundation.org; prefer-encrypt=mutual; keydata=
	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
	6RA=
Organization: Linux Foundation
Message-ID: <59838dfa-09d6-2789-f096-5fefe89f48b7@linuxfoundation.org>
Date: Mon, 13 May 2019 09:56:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <24c5b8fb-38eb-acb0-3e2a-97e63df0e8d9@windriver.com>
Subject: Re: [yocto] patchwork
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
X-List-Received-Date: Mon, 13 May 2019 16:56:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/13/19 1:59 AM, Mark Hatle wrote:
> On 5/13/19 10:46 AM, Adrian Bunk wrote:
>> On Mon, May 13, 2019 at 10:32:48AM +0300, Mark Hatle wrote:
>>> On 5/12/19 9:04 PM, akuster808 wrote:
>>>> ok, so no Admins. This is unexceptionable.
>>>>
>>>> OE TSC and Board, I believe its your time to get involved.
>>> I've not used patchwork before, do you know who originally configured it?  Was
>>> it Paul Eggleton, or Richard, or?  If I have an idea who was originally
>>> responsible, I'm pretty sure we can figure out a handoff plan to someone else.
>> http://git.yoctoproject.org/cgit/cgit.cgi/patchwork/
> No I mean who set it up for OE (or the YP) to use.  I don't even know at this
> point whose infrastructure the component runs on.  If I had that I'd know to
> start with either Tom or Michael.
>
> --Mark

I set the OE Patchwork up with Jose Lamego's help and maintain that
server now.


>>> --Mark
>> cu
>> Adrian
>>
-- 
Michael Halstead
Linux Foundation / SysAdmin


