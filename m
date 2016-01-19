Return-Path: <Jian.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFCF60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 03:13:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0J3DJuX002972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 18 Jan 2016 19:13:19 -0800
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 18 Jan 2016 19:13:18 -0800
To: Richard Purdie <rpurdie@rpsys.net>
References: <1452754008-158464-1-git-send-email-jian.liu@windriver.com>
	<1452881834.27999.0.camel@rpsys.net>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <569DA992.4030806@windriver.com>
Date: Tue, 19 Jan 2016 11:12:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452881834.27999.0.camel@rpsys.net>
X-Originating-IP: [128.224.162.169]
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-libc-headers: set ALLOW_EMPTY
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
X-List-Received-Date: Tue, 19 Jan 2016 03:13:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月16日 02:17, Richard Purdie wrote:
> On Thu, 2016-01-14 at 14:46 +0800, Jian Liu wrote:
>> If setting IMAGE_INSTALL += "linux-libc-headers", do_rootfs will
>> cause
>> error.
>>    ERROR: linux-libc-headers not found in the base feeds
>>
>> This is because that there is no linux-libc-headers.rpm generated.
> There is no point in generating an empty package just for the sake of
> it. Surely you just shouldn't put that in IMAGE_INSTALL?
>
> Cheers,
>
> Richard

Yes, I submit this patch just considering that someone who is not 
familiar with yocto may be confused
by this behavior. There is linux-libc-headers bb file so IMAGE_INSTALL 
+= "linux-libc-headers" is taken for
granted.

This is really not a bug and it is just a usage problem.

Thanks!

//Jian

>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>>
>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc
>> -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc
>> -headers.inc
>> index 2ba6ed5..403360b 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (=
>> ${EXTENDPKGV})"
>>   
>>   INHIBIT_DEFAULT_DEPS = "1"
>>   DEPENDS += "unifdef-native"
>> +
>> +ALLOW_EMPTY_${PN} = "1"


