Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.673.1607120350317782551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 14:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T8J1PaAl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4MJ6ZP006170;
	Fri, 4 Dec 2020 16:19:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607120346;
	bh=FYbaGcAymvPujiqKLKJAbZAQf4kGPWUA2hUA7M4OT8Y=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=T8J1PaAl5EPX9ymsTeDny+PET2oxLElc7AXPoMCOX4UKIle5DMWw7wDC1YnJisPYG
	 kynXK2EX7tY/NhTXoJa92uIjtKywNdFomkSDyf9AwAe3CH5AQ7FHm8K0gN42xGSNWX
	 QzAYmbFnnoerL7LfDnkd2yMgWT/hZxVFsd5bYrRU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4MJ6fj032439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Dec 2020 16:19:06 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 16:19:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 16:19:05 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4MJ5nL024366;
	Fri, 4 Dec 2020 16:19:05 -0600
Subject: Re: [OE-core] [RFC]Backport of a patch from master to dunfell
To: Steve Sakoman <steve@sakoman.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <8a9e9b68-8fc3-824e-a6aa-7556945cea59@ti.com>
 <CAOSpxdZFBi_3aOMUkzGR3juc_xfNb1EeMV6-oXmvEV2LEkw1JQ@mail.gmail.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <e75ef924-e626-1f7c-790a-a02a8179e432@ti.com>
Date: Fri, 4 Dec 2020 16:19:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdZFBi_3aOMUkzGR3juc_xfNb1EeMV6-oXmvEV2LEkw1JQ@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Steve

Awesome thanks!

The 3 patches will fix our issues

Dan

On 12/4/20 4:18 PM, Steve Sakoman wrote:
> I sent a pull request yesterday for a series that includes this patch.
>
> Richard will probably merge it to dunfell in the next day or two.
>
> Steve
>
> On Fri, Dec 4, 2020 at 11:30 AM Dan Murphy via lists.openembedded.org
> <dmurphy=ti.com@lists.openembedded.org> wrote:
>> Hello
>>
>> How do we get this patch below backported to dunfell?
>>
>> https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?h=gatesgarth&id=d9e327063f63193186822d958706081d64ec8139
>>
>> We at TI are seeing similar issues with Dunfell and cryptodev modules on
>> 5.10 builds.
>>
>> Dan
>>
>>
>>
>> 
>>
