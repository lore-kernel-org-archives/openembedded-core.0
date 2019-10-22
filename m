Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 758676C0E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 06:32:34 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n14so15836769ljj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 23:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=Kdu1wjvYC2H4rVrmUZNSKXJo1KnaVQ+oaFanAlwJc2s=;
	b=r3KjDnxSYcAPR8s7n1FveLSWCBY1Bfg/e5TRkHeYlRqflSLKS31QjZG7IBhWzAYPoa
	uqAxUriWShLRqL/aOOhvmk73AjVVR5vKGPbXDDQUZYSrWZm9VGaxiTUcHxAubPfBwtZn
	XbPjJ3YKN7el+897TYgwiaMX4JtSrvX7SBz0KuXJ/3luMvcgl7tTFdJ98zc3HR6MH3o0
	EMtRKDa33w78x3heZ6Sy7V8MLSsQqFL7rwPVyAgJV6/kOviIQC1zW39Iev69MMEapjrP
	9BGclID0kjmBeYF+p7/9HisC1jvZzrSJa+ULDiTIk1zUiFgaQK+ktkFhZfE+dS8J11vU
	i9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Kdu1wjvYC2H4rVrmUZNSKXJo1KnaVQ+oaFanAlwJc2s=;
	b=G5tIWAcAxn6T5vUIxjEE8ozfvL4HqpUF7098D9Z2jjPU60PHxmpp9/QRaE7RigOuEr
	gK3LdnrWzDcgDM+4qxGEVDj0AvZnYcARCPzjnZAr07HJikp4LBV2qe3bJhM/oxxly4GY
	QaL226Lfp/ADawfCnW0ZlNGzpOfnfQtWcUTo2QZZ7OS76QWjYBDsgZdMdErG94UhO5gW
	dpzu0ClvMHnzBD3HDM6TEhyDjx9E18G8FGqsb7OqvkWYYLCceejv8NNyjYm41+IQJ9sT
	6/43h8VogOfFpQR4vSgQ8pqXS92wmxcYJ8XPVxU+jgcQCpY6LXapaiYiNM0BHZUOWbq1
	vGLA==
X-Gm-Message-State: APjAAAWMXCAr1IU9omvEYjh2ZnK/qRG+e0NbmV4JmCXoedGtjDI0HFhE
	0amcZwLx5Iecjvm0tA13M+I=
X-Google-Smtp-Source: APXvYqwpeBeaQaYO4Qo1L5XH0gfqaylKFPcRPbj4lQIr4Pz46flxZd38GwAx+bnFEikNAEF02OB9Mw==
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr17353632ljm.243.1571725954811;
	Mon, 21 Oct 2019 23:32:34 -0700 (PDT)
Received: from [192.168.51.73] ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id a7sm3592347ljn.4.2019.10.21.23.32.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 21 Oct 2019 23:32:33 -0700 (PDT)
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
	openembedded-core@lists.openembedded.org,
	Joshua Watt <JPEW.hacker@gmail.com>
References: <20190204031153.1348-1-jacob.kroon@gmail.com>
	<CAJdd5GbA3MJ9KpbY81EkqfUvGwa8jZD7F8u-f+48NvKX9X+hsA@mail.gmail.com>
	<b69b9906-0ab0-3d7d-7cc1-99dafbb37528@kernel.crashing.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <55271782-4edd-6591-3d5a-12bd071a0940@gmail.com>
Date: Tue, 22 Oct 2019 08:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b69b9906-0ab0-3d7d-7cc1-99dafbb37528@kernel.crashing.org>
Subject: Re: [PATCH v2] base-passwd: Add kvm group
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
X-List-Received-Date: Tue, 22 Oct 2019 06:32:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joshua, Mark,

>> In general, I don't think we should be "patching in" users and groups
>> like this to base-passwd. If upstream doesn't have them, they need to
>> be added through the normal useradd.bbclass mechanism so that users of
>> useradd-staticids can choose what ID they get mapped to.
>>
>> Is it possible to revert this and add the kvm group via the useradd.bbclass?
>>
>>>
>>>    udevd[<pid>]: specified group 'kvm' unknown
> 
> As for this particular patch, why is adding a specific KVM group required?
> Unless something is hardcoded in KVM to use group '47', a regular system type
> useradd call should be done instead.  This would avoid the problem that Joshua
> is experiencing.
> 

The groups "shutdown" and "input" were already patched in in the same 
way, so I figured that was the way to do it. But it sounds like you're 
pointing out that we can drop those three patches, and instead use 
useradd.bbclass in base-passwd recipe ? Sounds like a nice cleanup.

Cheers,
Jacob

