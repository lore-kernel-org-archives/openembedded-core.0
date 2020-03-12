Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2EED861C20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 21:21:42 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m5so3706223pgg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=VbZXizUxszIca5+3mOCCPQMfmPOSalQtixfKZTuboIw=;
	b=Rsy37Fb2p4OeRAFuwZKUEWt4x/KOulm5+anNm8YokM71xSuVYAzo5vyNC2xMYA3u9C
	3ies4zxxCG1KT0fyZ5iRqnx8CHks8DPE0+1EsL/KzgGVLo+k3NqbrT1A86LdM6eOmS92
	BRCw1Oyxt9w0KzbmykunR8DLika0yGKpGI8Y5ICFSzl2p2GG05FXFLbgkBQN9jv1fPB0
	XzPp68p1nrC/A/QSEStQBxQ46MOA9amkEsoL49eHFvkfb5Hesx1hq5KDgXJlnpoytEQ2
	DNyqum+dxd8kPCPmOV7Gy7zoF983cJwmuAlWoC1EkTIqcoRTP3tdBHakfnqoWAfx6luR
	Y3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=VbZXizUxszIca5+3mOCCPQMfmPOSalQtixfKZTuboIw=;
	b=KGy0zguGxjSDfcOy2jE0bxYwlhJiDvyvDA932iMjVrYL13zRp941x6NA4wEThOlvJ8
	z98fryj9KE89ANu5GIGGC8V2b9Kjus6fAwnXPLNDjOhyWtVuD7QZQ6YJjhRVbcea6VyX
	O/iVGG7m6U33axLB62fY3WNZf2G6dr1q4imlI+Vo5mOtgGgyZgWraxkVWZZRKDBukJm5
	c5AAlPZ14ft9a0k81LrjiT+tGt1h5XJcSivYhD24+HdbClUSdxuXnDMR0D1aTxrt4w5I
	WQXC+Ej2+zJ6CPG06nFa7k9jfVRe32nqXZCWaUdM15NnCZJw29TIw9ryMlZqHKttplhB
	sFpw==
X-Gm-Message-State: ANhLgQ3ADPaIVmZyj27LaAJVkffuexMkVm2wU9lqbyjeGI9rAd9vq0fL
	yuaCldeCPTdHnS735N25vAQ=
X-Google-Smtp-Source: ADFU+vvGAs3fbFee2hfNGy4JLJa39q6EH5jHhgFQDtqlV/yDJXEyKwtOsZIC8fZReDlhKaQWnP1gQg==
X-Received: by 2002:a65:678f:: with SMTP id e15mr9652487pgr.21.1584048103198; 
	Thu, 12 Mar 2020 14:21:43 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:b971:4aa1:90b2:e851?
	([2601:202:4180:a5c0:b971:4aa1:90b2:e851])
	by smtp.gmail.com with ESMTPSA id
	v125sm3957222pfv.160.2020.03.12.14.21.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Mar 2020 14:21:42 -0700 (PDT)
To: Randy MacLeod <randy.macleod@windriver.com>, changqing.li@windriver.com,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1582781146-253903-1-git-send-email-changqing.li@windriver.com>
	<6830c57f-37de-dc1a-ba80-5a4217644060@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <411a9ec9-9426-4083-e232-48ae750846c2@gmail.com>
Date: Thu, 12 Mar 2020 14:21:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6830c57f-37de-dc1a-ba80-5a4217644060@windriver.com>
Subject: Re: [PATCH] qemu: fix CVE-2020-7039
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
X-List-Received-Date: Thu, 12 Mar 2020 21:21:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Randy,


On 3/12/20 1:53 PM, Randy MacLeod wrote:
> On 2020-02-27 12:25 a.m., changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>

This does not apply cleanly to current master.  it needs to be rebased (
suspect qemu: update Xen packages names for the xen-tools recipe). Do
know if it is in contrib branch some where so I he rebase myself?

- armin
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc                |  3 +
>>   .../qemu/qemu/CVE-2020-7039-1.patch                | 44
>> +++++++++++++++
>>   .../qemu/qemu/CVE-2020-7039-2.patch                | 59
>> ++++++++++++++++++++
>>   .../qemu/qemu/CVE-2020-7039-3.patch                | 64
>> ++++++++++++++++++++++
>>   4 files changed, 170 insertions(+)
>>   create mode 100644
>> meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
>>   create mode 100644
>> meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
>>   create mode 100644
>> meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
>>
>
> LGTM, I don't see it in master or master-next.
>
> NVD gives this defect a 'critical' score so it would be good to get
> it tested and merged.
> https://nvd.nist.gov/vuln/detail/CVE-2020-7039
>


