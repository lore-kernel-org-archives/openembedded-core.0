Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9827E612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 12:52:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r69Cq5vM000061
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2013 05:52:06 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 05:52:04 -0700
Message-ID: <51DC0771.9060406@windriver.com>
Date: Tue, 9 Jul 2013 20:52:01 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
	<626ac2f7b8f351240a6eae4a75a632914eb28207.1373372649.git.hongxu.jia@windriver.com>
	<20130709124205.GU3288@jama>
In-Reply-To: <20130709124205.GU3288@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] nspr-native: add version 4.10
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
X-List-Received-Date: Tue, 09 Jul 2013 12:52:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2013 08:42 PM, Martin Jansa wrote:
> On Tue, Jul 09, 2013 at 08:30:36PM +0800, Hongxu Jia wrote:
>> It is required by nss-native.
> Shouldn't the subject say something like
> nspr: add native version
Agree, I will modify the title.

Thanks
Hongxu


> or is there some other version of nspr-native?


>> [YOCTO #4096]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-support/nspr/nspr_4.10.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/nspr/nspr_4.10.bb b/meta/recipes-support/nspr/nspr_4.10.bb
>> index 3936d67..fcecb95 100644
>> --- a/meta/recipes-support/nspr/nspr_4.10.bb
>> +++ b/meta/recipes-support/nspr/nspr_4.10.bb
>> @@ -173,3 +173,5 @@ FILES_${PN} = "${libdir}/lib*.so"
>>   FILES_${PN}-dev = "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgconfig \
>>                   ${includedir}/* ${datadir}/aclocal/* "
>>   FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
>> +
>> +BBCLASSEXTEND = "native"
>> -- 
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


