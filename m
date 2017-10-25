Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 024966FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 04:40:17 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u138so20016464wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 21:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=dioH+PrpsJ93lB1QN7lkf2vnllPU0arl2Fd2Ga2z7JE=;
	b=YqEiJx8zLV2WwsaarZ3F9NCxojLaxLlXBUcrR9Al/KoqjGX5HiWfDbcyB2okmljwaH
	UJOKBROwptsV8AfxfiGqkK8obxXiGAsfmYQ5YXRx1KZwDxqmyL53XrBy+KlwajJc8DM5
	OxkQRgswdCis0kAvmEtq64mK67Wi9ZphKJVJ8gzmegWXeYWHvYfAZNBeQD2XIZbiz+ZV
	Es0HOJ4S4XFJ1gYswMLG42Cqx5xO3QVwsGCP50XWUQdOMZIXcchhbcs8AUd3z8ANZVuY
	pu/akHV6cKwXTIqaiFpitik+LJ8bZ9FD7OKk2R198bi0fEGwiYThW2werKHKw0s0R3JN
	/lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dioH+PrpsJ93lB1QN7lkf2vnllPU0arl2Fd2Ga2z7JE=;
	b=eig20kCPPL4E1LNEtoLImDJHWmLp+xKD4/JQoC//fbUAZOCHhdXgiGlW6YzchHJF2A
	caJmK54Iu7gn+jNdTACXzHmFhLM68/C98o+r7wyRj83CrSiHhDmVZpu837GZMWX3h70a
	GEqbdnVZu1Sw6fbxmqjURODVQDse+S0EG8CFkx4von/rv7j5YSpyAZNSGYDgp8OcA7Ss
	QBUXPWPGylsu11hJHnAzHpoyHdVMsP0a1dEwBClULlBg39a9J2OP7c/dIVyVLBVvE4RD
	W9rb+OPPlPeVreABhToCjVvYIQ0G7/VG0v5nbiarH8SthPjz0Pi1V2t91ktfe3YEIMP6
	aExA==
X-Gm-Message-State: AMCzsaXzehdLZhbJmyhzgQLIuYdK89RkDT12McdPf1u7AE/VNN8LO2LO
	2pfdjGgVdedsidkUa84p/6CIrQ==
X-Google-Smtp-Source: ABhQp+QvY2EW4JunkUqu+ONLkWO7P0FZ3zpv9aHTsHI5GGRBItuaopHmzwQlg7Buw0u1u4pn4EOB3w==
X-Received: by 10.28.181.2 with SMTP id e2mr328426wmf.81.1508906418514;
	Tue, 24 Oct 2017 21:40:18 -0700 (PDT)
Received: from [10.253.10.43] ([62.168.35.105])
	by smtp.gmail.com with ESMTPSA id
	t43sm2166049wrc.74.2017.10.24.21.40.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 21:40:17 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
References: <1508744693-248151-1-git-send-email-li.zhou@windriver.com>
	<f4cc1dae-2111-1d0f-9b39-01e77acb6583@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e64a026c-95dd-9ade-b274-514e7d687a7b@gmail.com>
Date: Tue, 24 Oct 2017 21:40:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <f4cc1dae-2111-1d0f-9b39-01e77acb6583@linux.intel.com>
Subject: Re: [PATCH] curl: Security Advisory - curl - CVE-2017-1000254
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
X-List-Received-Date: Wed, 25 Oct 2017 04:40:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/23/2017 03:29 AM, Alexander Kanavin wrote:
> On 10/23/2017 10:44 AM, Li Zhou wrote:
>> Porting patch from <https://github.com/curl/curl/commit/
>> 5ff2c5ff25750aba1a8f64fbcad8e5b891512584> to solve CVE-2017-1000254.
>
> It's better to update to latest version (7.56) instead of backporting
> patches, please do that.

Then these should be stagged for Rocko. Work has been done.

- Armin
>
> Alex


