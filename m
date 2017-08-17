Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB2D277822
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 03:12:01 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t80so1382817pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 20:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aNHurnFrJ6pZS8yC07allTPo+nI1LIoi0MFW6aIIzVs=;
	b=CGqoFIDtWdNiZTClgVE4m51ny6NNrgjorU2C2cs2uP/TUiN/wLFf2XARP1tlW3NmB5
	ynaBjBm1eIxNd8Hsixi5/ZAbwAuAjfZg85B0jVU2ZAUGmUbtwci3ZHfFLJ/gNu/s1xvu
	jodvfuQM7ftAiJn50/1J1hXVUDijywQX3Hf6yu2NJbOfQoSZ6dr9caPsPVL4aSOlj2dd
	z6LsO6QjR9yd3q5d1WLp5EUvUXRYODsIc/F2haATs3qUTS1Z/dh/8aC23nkpQJkzqxya
	pU2maHiytCfjP6rKTzNEggsUXqhf6dSdBshdb0H9hwM5RcVTDmuj31Osa7uJ8MmTbFS0
	fEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=aNHurnFrJ6pZS8yC07allTPo+nI1LIoi0MFW6aIIzVs=;
	b=DbSn/ry1Z6/zeLudMOWGAuANgzXzkIits9dcqGKQ99m+bC7+sN+JFsY0RDRm9R23WG
	l60PjHf7FYHRuh7yt30qeRQsXXgB1xvwb78vRdXKDxSSD04dJyS3mI4DGfe41pMWGS6G
	oud+yQduc7enrbf8b/RdcDxPJ6FtvWnZqjpGJ1ZO5xPRgHVTtR9JCz/5ZffEhViGqol3
	NkUn/3HxvaBe/8VEC0TxxJilPU8M92oQ4N3IZ6abgoyEMcOqGkCFVWijpqd43IVayB4c
	PAZDH8hq1EiALSttfsq31vfJfX+zqnMyFtPFTnYAvYd/KCRLimpQWZCX1w0+Fmw0Q26O
	H4QA==
X-Gm-Message-State: AHYfb5i7MKbxUSX6MPpE0NJ30IeFO6NfGSXcq3p5l4iCInk19wMTt9ah
	O2BkBwbp6vcNrnsWyns=
X-Received: by 10.84.229.136 with SMTP id c8mr4291456plk.351.1502939522786;
	Wed, 16 Aug 2017 20:12:02 -0700 (PDT)
Received: from Khems-MacBook-Pro.local ([2601:646:8882:b8c:f933:597:7ef9:8139])
	by smtp.gmail.com with ESMTPSA id
	j65sm4090720pgc.36.2017.08.16.20.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 20:12:02 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170814032418.3936-1-raj.khem@gmail.com>
	<20170814032418.3936-2-raj.khem@gmail.com>
	<1502870987.13978.87.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <85203dc0-70e1-bfda-6dd8-c614021b562c@gmail.com>
Date: Wed, 16 Aug 2017 20:12:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <1502870987.13978.87.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/3] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Thu, 17 Aug 2017 03:12:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 8/16/17 1:09 AM, Richard Purdie wrote:
> On Sun, 2017-08-13 at 20:24 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>>  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> I think this breaks on x32:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/1183/steps/BuildImages/logs/stdio
> 

Its not a usual target I build. I will see I can reproduce it.
Otherwise, I will send a v2 where I will disable llvmpipe for x32 in mesa.

> Cheers,
> 
> Richard
> 

