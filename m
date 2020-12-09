Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1918.1607544215645249664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 12:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OaodkfsD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9K3WcF087618;
	Wed, 9 Dec 2020 14:03:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607544212;
	bh=qoi3YoJyVYPq1gm+8Z6Z929JKjNTocqAzmPMTuW1+Pc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=OaodkfsDbGb0i2qAYjJ3xZMWUtCTLHqJyfA2z7hIyVdM2EAcOC7l91acdAKwU+9JH
	 EDO1DbNAXpnBc06MB8rKP+6YcqaM191bZ8VFiNb58XBelXPauBduntG7iON6AVTD7A
	 LKQLBinIsmV9HBlp5alemRxG39OAqqlOklBtWfLY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9K3W85100610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Dec 2020 14:03:32 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 14:03:32 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 14:03:32 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9K3WTu063938;
	Wed, 9 Dec 2020 14:03:32 -0600
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
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <95a23893-b7ea-68b3-18ab-f11cd2209a19@ti.com>
Date: Wed, 9 Dec 2020 14:03:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdbceaaD4NKn34zwb73+jP1Y9ra7UwYi82LNL-KmPLGs5g@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Steve

No it has some enhancements. I was not sure if we wanted to use the dev 
branch as opposed to the release branch.

Dan


On 12/9/20 1:55 PM, Steve Sakoman wrote:
> Hi Dan,
>
> I already have the first patch of this series in testing.  Is version
> 1.9.3 a bug fix only release?
>
> Steve
>
> On Wed, Dec 9, 2020 at 9:21 AM Dan Murphy via lists.openembedded.org
> <dmurphy=ti.com@lists.openembedded.org> wrote:
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} (90%)
>>
>> diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
>> similarity index 90%
>> rename from meta/recipes-support/lz4/lz4_1.9.2.bb
>> rename to meta/recipes-support/lz4/lz4_1.9.3.bb
>> index 455d2a5141f0..00f2dd32fedd 100644
>> --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
>> +++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
>> @@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
>>
>>   PE = "1"
>>
>> -SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
>> +SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
>>
>> -SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
>> +SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
>>              file://run-ptest \
>>              "
>>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>> --
>> 2.29.2
>>
>>
>> 
>>
