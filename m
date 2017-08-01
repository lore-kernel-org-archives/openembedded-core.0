Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B27F6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 20:30:02 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 83so4052833pgb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 13:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=NuQ638aZpwtVo59Rg4qLAX/eSYgvmjQ1flR0WdEA3bQ=;
	b=bQnCLhchvaGQAwJfUcdy3rt+7Cc5cnByMsFj5tfZqoJXOu0+Vx6mWPOaJ5UpG9DUhD
	0KYyzS33MXo07gib/aU4aqx7kXzdnvTeg8LqGOIRPkqqMEQ5azvV0Y+gL8tkROpA0tK8
	/fXYJOpVJ+SNgzkPGALYOoJGrgY9fg+ygVpZkQhQWpAQO7uguFyR1EUFU8BLuIBDgBw5
	Xrzgij9IAetMl8tQhqTxudF/ml9lsJirkwb1O7QSEo9jH55uhx01ehCJoobMmKgIks+P
	459kaL70Wkkhk04GYRv/xSMNkvBLtQydzuHFBP78WuXSRWF+RWzZimCxhhCWxjUq8aSW
	y3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NuQ638aZpwtVo59Rg4qLAX/eSYgvmjQ1flR0WdEA3bQ=;
	b=QmZkLIU5tiU2FF/fZdzG593GIDdF3WYSaut0JqUfmwh8B7FoUQJn+MbHNq/nXWT8xo
	HRH+8uH0dNv3HtQslfy53nPQ0tWoIb8HhSxLK7C+zRg7bK1aYeavmScGH0MHLawxGOWQ
	G1bzKSPs+uVtLJKHk7zlus/O8UgxSITT+2hi+G1sTxFBC2Yrw1EOUI7y7TgVdkWnajeH
	vGx3yqjrJ40Jfp+jsbxOSpgdUVKCLxqt4sBjKQaa8lPN3S3jp7sLMBwIjFWLKU2dVJ1J
	qINjuWgh3awixVAz1MMIBfEP9CGQcyGn67+4HCktNUabv4YlpTxPmFSlAUkUK35Catop
	A3qw==
X-Gm-Message-State: AIVw1122ZIroug7PiP7LPa6KYvfy0jmFPJr2574Z6b9G+j0dJ3c0JwNq
	HEBo9GUMQrmApA==
X-Received: by 10.99.51.142 with SMTP id z136mr20244650pgz.275.1501619403789; 
	Tue, 01 Aug 2017 13:30:03 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	e131sm25307468pfc.93.2017.08.01.13.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 13:30:02 -0700 (PDT)
To: Ian Arkver <ian.arkver.dev@gmail.com>, Anton Novikov
	<a.novikov@yadro.com>, openembedded-core@lists.openembedded.org
References: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
	<9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <4a2dc4e3-7291-ad72-838c-c54a907312e6@gmail.com>
Date: Tue, 1 Aug 2017 13:30:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCHv2] (morty) Arch Linux build fixes
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
X-List-Received-Date: Tue, 01 Aug 2017 20:30:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/01/2017 02:50 AM, Ian Arkver wrote:
> On 21/06/17 10:05, Anton Novikov wrote:
>> [3 patch attachments]

only one patch is missing

"fix case fallthrough and printf overflow warnings"

the others I already had from other back ports. all are in my 
akuster/morty-next.

- armin
>
> Any word on getting these patches applied to Morty? Is anything blocking
> them? Maybe they need resubmitted as individual patches?
>
> They do seem to apply cleanly on the current tip of morty
> (7d5822bf4c) and do fix various automake and gcc7 host build failures.
>
> Regards,
> Ian


