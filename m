Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8964076054
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 01:17:24 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c22-v6so730038pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 18:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2xHFPQF8cUvgG7rsluNsAa6DP+AMBy6n5MPiF6zqiao=;
	b=tbz6VLkNuXxuOHkhOocqnwlcaRcCl/sBAtY9Iuytcoof3+3eDJCBGiKHGlpDlqo5T7
	dMtv0HN6K8trJ0eHDi/qVcRbc1u06Nusv36wscBg5APHiCp20ZWfrDfGusic4tFAA9jH
	g1PCRQtBk95iK7q4E9zMr27pFerV4cXdMYD44OpJK4UBH5uPEdas/+3pjuz84kQeW0a6
	tkn7YKJtT3scgrUNg64saw+AvBqysOncAGdeq03JGtKMCzsyMPs4Sg39jbnsgGrwWsRf
	67lVtUIkv5IpNIb6Mtes51yPMzOBLQUhPUVAba5VYrUtYT/tZNODg/aiWmyZ1sQncEk2
	VfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=2xHFPQF8cUvgG7rsluNsAa6DP+AMBy6n5MPiF6zqiao=;
	b=KzrXfBxvWJvdwvN3fHrlv7RYUCPfZsUJHsCtZ+WmIaCM9rO2onchsGODlQnDj9tzwD
	LsuggZxYfqOUGm83AZNs2BmwJIbS0vAdv96HWnOVfayKpy1lhEmQqDA/agGyt7lVUOXI
	8udUrwwl5Bn/Q3sgchQfs1zlYpDUa8z0wY7E3eULU/34cKfmWJdlntH12DiwRWyEC0t/
	rB799tM3CwtrRWVzEE17UMhkriy0A2K1gCVowt2U86Xrr9xFIOwHqu2vAi9PSk/rJqAP
	6opq62M4g6aRRNzowe0ARLI2kDVnRPN2zifDTghqZ5sT2W+eUySxK1ITLHWkcXz0CZ82
	1dsA==
X-Gm-Message-State: APt69E3/rSdaWzRmBsHeTtSeF9QH8k+kO1Yb1/SjfCdvvPajdw8ubkXy
	SSKJi5OVksPHFm0tdyIb7u2I1h3o
X-Google-Smtp-Source: ADUXVKIs7ZqZSEwKjbGuVtbHLdOUq0p3RLjIPw/gA+RFWrDfbJKRq8qBzfxceQ3p2eYEbCWfQpY9Xw==
X-Received: by 2002:a63:7847:: with SMTP id
	t68-v6mr16652920pgc.329.1529457445381; 
	Tue, 19 Jun 2018 18:17:25 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	o66-v6sm1162302pfi.157.2018.06.19.18.17.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 18:17:24 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1529328356-10653-1-git-send-email-akuster808@gmail.com>
	<7878cafe90bb5d01e33569bd05ed8c08719c2ad9.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8d2ad577-6a94-d641-1554-fd476649a099@gmail.com>
Date: Tue, 19 Jun 2018 18:17:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <7878cafe90bb5d01e33569bd05ed8c08719c2ad9.camel@linuxfoundation.org>
Subject: Re: [V5][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Wed, 20 Jun 2018 01:17:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/19/2018 08:13 AM, Richard Purdie wrote:
> On Mon, 2018-06-18 at 06:25 -0700, Armin Kuster wrote:
>> LIC_FILES_CHKSUM changed do to updated year
>>
>> removed:
>> dont-test-on-host.patch, no longer implemented
>> drop use-python3-and-fix-install-lib-path.patch, they added the
>> ability to pass in lib dir loctions
>> drop bind-confgen-build-unix.o-once.patch, fix included in update
>>
>> Refresh other patches:
>> add python3 flag for PACKAGECONFIG to pull in python
>> add new config option --with-eddsa=
>>
>> [v2]
>> Remove python3 in default PACKACKECONFIG
>> include https://patchwork.openembedded.org/patch/148257/
>> Because of the newly added dependency on meta-python, the python(3)
>> packageconfig is no longer "default-on".
>>
>> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
>>
>> [v3]
>> Made formating and spelling changes per Martin
>>
>> [v4]
>> Minor typo fixes
>> cleanup python3 support
> Something in -next is causing dhcp to fail to compile:
>
> http://errors.yoctoproject.org/Errors/Details/180628/
> http://errors.yoctoproject.org/Errors/Details/180624/
> http://errors.yoctoproject.org/Errors/Details/180635/
> http://errors.yoctoproject.org/Errors/Details/180619/
>
> probably the bind upgrade...

thanks for the info.

-armin
>
> Cheers,
>
> Richard


