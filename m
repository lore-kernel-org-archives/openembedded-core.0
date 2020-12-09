Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2570.1607546952268107455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 12:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VB8xqwDs;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9Kn9OX102318;
	Wed, 9 Dec 2020 14:49:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607546949;
	bh=rt8njm+DG6PPUNQ6iSu3BZdjsuHLkJOPCoahHYI/OR8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=VB8xqwDsj60L6htuiwFtDCD+2R15jETC/4CBqg++4gQmdwuTr8jHNxRCYnrIP9b3n
	 IJ+/NNr7IO+YIX5NSjZ72lwRoaXrphNH2V8HQL0NEElAckZv6b59igc8NbUAE3JS1Q
	 Z1hE4X7sQ8qY70oB3vhmawfyZ8SlI8TLzKrOWGI8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9Kn9u8108709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Dec 2020 14:49:09 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 14:49:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 14:49:08 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9Kn8cs066776;
	Wed, 9 Dec 2020 14:49:08 -0600
Subject: Re: [OE-core] [dunfell] [PATCH 2/2] lz4: upgrade 1.9.2 -> 1.9.3
To: Steve Sakoman <steve@sakoman.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Patches and
 discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
References: <20201209192111.21817-1-dmurphy@ti.com>
 <20201209192111.21817-2-dmurphy@ti.com>
 <CAOSpxdbceaaD4NKn34zwb73+jP1Y9ra7UwYi82LNL-KmPLGs5g@mail.gmail.com>
 <95a23893-b7ea-68b3-18ab-f11cd2209a19@ti.com>
 <CAOSpxdZeotQV7wy-oYS1qbbWnKxyUohYb4_5mn2iq9-o3jQ64Q@mail.gmail.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <2c2f75e6-1331-6ec4-9193-ccc6b7958c12@ti.com>
Date: Wed, 9 Dec 2020 14:49:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdZeotQV7wy-oYS1qbbWnKxyUohYb4_5mn2iq9-o3jQ64Q@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Steve

On 12/9/20 2:23 PM, Steve Sakoman wrote:
> On Wed, Dec 9, 2020 at 10:03 AM Dan Murphy <dmurphy@ti.com> wrote:
>> Steve
>>
>> No it has some enhancements.
> If it has enhancements then it probably isn't appropriate for LTS, we
> should stick with 1.9.2
OK
>
>> I was not sure if we wanted to use the dev
>> branch as opposed to the release branch.
> Is 1.9.2 available in the release branch?  If so then that seems to be
> appropriate.

It is only in the dev branch not in release which seems a bit weird.

Dan

