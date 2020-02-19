Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF456606AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 20:39:43 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id m13so562647pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 12:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=I0ReKhCtnZlsaXPdTg2LGIL6Sgg8B8Vspf2Q8i1+xak=;
	b=XM+eAM5ya6VJ6y1WwwZQ/dSSxaLtthULxyoD87hMI+wI++AfF52UsclVRuTgAzUrr2
	3Sj9E3M8Mw9vxysI8wrZE0mPXKUZXvryx3Zl7XOKUieTF5+PyXG35YagK9S5vwM01LNA
	2e+zd9ZCObwoco+EX1fBEZXlj4JNXIVhV3/NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=I0ReKhCtnZlsaXPdTg2LGIL6Sgg8B8Vspf2Q8i1+xak=;
	b=EIQ5OnyuFdxWcFqKJNL2wn317S84NtCWNg98vIydwNf40SNUFcENjS+WrYj/O5M6QM
	/5I/JOhzOviKK8s2Izr1UTw75OcGGmqRxocXSsL5rgo7lK1okUYuedl4Gvwp4bN9gX6K
	Rx38Ius81zovlK+0PuVgodtR6rCfI8ql1jqSURCr6Z3VVgf6jyOIjgS8vGRjzU6ozfjE
	XpM31gVsq8uge5VAiETMIX/x0KojiT2PUxQdtj0RZCHSwtPnVmf3lBFfhAYjbQ6larsp
	l9gFVgaR7leK+PApvpT5TpWrozkHpQvmhIJKdxrxNVQj4lMTKfJMHREIJTvVUA2LxIbd
	Zz9g==
X-Gm-Message-State: APjAAAXt4ZMIYx+1tviSQKHUH2nuijENfGLNX4+OMF7ag9Ym1zFv7zSA
	5xXelpKyFcq+cdKDpF+0LXAqV6k4PnTsKBl/mrwQPQA3pGONch+UlLzR0P50xJUPjIYm5p/cFpj
	c6QXJw5rryFH+8YpBm0bbwMJYJ50cYpU8WFDqBW/GR4YG7pI8Cy2Bm7yXH2LkdPaTjpX+p+PlmY
	Tpy0ZIBR5Hoke4he7aOleJJp8xIo4=
X-Google-Smtp-Source: APXvYqxhnZNS6JZIEWrpsP2lHnLQydPYi0kjkH3oudlrBsVuZ0U72jIy05eTFDe9uAPZ4+yykbWr8A==
X-Received: by 2002:a17:902:7203:: with SMTP id
	ba3mr26903305plb.249.1582144784429; 
	Wed, 19 Feb 2020 12:39:44 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id u1sm480338pfn.133.2020.02.19.12.39.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 19 Feb 2020 12:39:43 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200219003801.15549-1-scott.branden@broadcom.com>
	<e84e99dbbc52c6ef7d0dda22f1c5c386855e98a7.camel@linuxfoundation.org>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <4ddfcc5b-0a9c-bddf-445f-ea4fcd9381ca@broadcom.com>
Date: Wed, 19 Feb 2020 12:39:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e84e99dbbc52c6ef7d0dda22f1c5c386855e98a7.camel@linuxfoundation.org>
Subject: Re: [meta-oe][PATCH v3] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Wed, 19 Feb 2020 20:39:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Sorry,  I will compile test when making simple changes suggested by 
others from now.
New version being submitted.

On 2020-02-19 8:30 a.m., Richard Purdie wrote:
> On Tue, 2020-02-18 at 16:38 -0800, Scott Branden via Openembedded-core wrote:
>> Add devlink support to iproute2 recipe.
>>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   .../iproute2/iproute2.inc                     | 34 +++++++++++++------
>>   1 file changed, 23 insertions(+), 11 deletions(-)
>>
> Doesn't build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1822
>
> (and a ton more)
>
> Cheers,
>
> Richard
>


