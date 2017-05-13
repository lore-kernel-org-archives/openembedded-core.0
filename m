Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 118B360268
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 00:17:47 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u26so8575640pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 17:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=FMEnfOrLBUemBHhIBvq5TeUBzj4XQ6bed4FMlid/PKg=;
	b=Ns5DPUr4l+ksSNPx5BzfIRcEvqAGPmqoUOZNc6fw6a6O5FWFUTZvx99NW0XreXYXbY
	Vnlrx2g2Zozh2WUzKvRE+dyBVpgvXbFnVig3ExEDcUiZfS/96c/wRUgTGW7tM7fYEuue
	/s2V2dMtpVA76ZrfxS7aZutTC6527SlH3AnIwOLYtsB+4PVCUvzncCzqNBiLqDEgNvbv
	Ju2ZxIwxitf03fvmTOP58QwzuLDryiPeEJz4tBodgwLFJqsfXJbfClCfTE6YDLZNVaS6
	QuuCFrNzH8mytmALMqRhsWIij17FqeVGGx7AovGUzub+8qDEgo77WlHZnasd4Y5/0Cg6
	7Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FMEnfOrLBUemBHhIBvq5TeUBzj4XQ6bed4FMlid/PKg=;
	b=VPSy/X68OpEWdn0FAkUllwOBUb92mT1JHVKhfyA4Uu6kkoXUL2swFjd1QnzBDQ5cDk
	y9mB4FgxDNBFKbkkhxQ2UmbMo7D1kxme29JeucJk795vDHtjwE3vl9IN40cN1JUbLaiU
	8cLpaaUm6DopiBl+P0y0h6MQHRyLpWvlEDUC6S3UowcJl1VGwFRJ5Dl/HhRP+WLAb4Ng
	HcJXr/DQm3BGzyFuz5CnSPvDnfU9S51Oz1zE+Wq5tJZc5ELJfnvseh5DwCbtqCZfR2Sq
	E8BCPA0aZgUUHCzkKY9FZ1qaHz9z/U8whgk+ZWBBFln28X7ZZ4zclY2Pp12iGd3xmN2w
	WyGg==
X-Gm-Message-State: AODbwcDLYW03mPdDB14RL8jEq3CSWJF0PX2qWwujqN/vrd/U/ZixXiMr
	zqJjJVWKMaadhQ==
X-Received: by 10.98.66.214 with SMTP id h83mr7315814pfd.182.1494634669214;
	Fri, 12 May 2017 17:17:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d10f:9fa4:a642:832?
	([2601:202:4001:9ea0:d10f:9fa4:a642:832])
	by smtp.gmail.com with ESMTPSA id
	y68sm8166827pfi.13.2017.05.12.17.17.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 17:17:48 -0700 (PDT)
To: openembedded-core@lists.openembedded.org,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
	<CAMKF1sqvc3YsrMNxkyv1ZHXF82Uy1hYRUL4sduaayYcf1Le5_g@mail.gmail.com>
	<655290B7709079438B7932553958E60D16D2C9F2@ESS-EX01.essvote.corp.local>
	<CAMKF1sr8ZypyM4mk=s1-W9oajRr952x7iVe9L8eDu-Hddthzpg@mail.gmail.com>
	<8016a95d-823d-835f-6db9-230079ce5026@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <065f1a59-3410-ffe0-29d9-df7e90186263@gmail.com>
Date: Fri, 12 May 2017 17:17:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <8016a95d-823d-835f-6db9-230079ce5026@linux.intel.com>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Sat, 13 May 2017 00:17:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2017 12:44 AM, Alexander Kanavin wrote:
> On 05/11/2017 12:08 AM, Khem Raj wrote:
>> On Wed, May 10, 2017 at 1:48 PM, Davis, Michael
>> <michael.davis@essvote.com> wrote:
>>> I think most of the major distros have either switched or are in the 
>>> process
>>> this year.
>>>
>>
>> are there some info on the policy decisions of other distros ?
>> we should try to follow the suite then
>
> Both Fedora and Debian default to 1.1 in their upcoming versions. 1.0 
> is provided only as a legacy package. So same as here.
I recommend members of the Yocto project to chime in as most are 
commercial entities and may have reasons they want Poky to stay on an 
LTS openssl version. OE can decide to do something different. That 
should be possible. Is this an OE TSC issue??

- armin


>
> Alex
>


