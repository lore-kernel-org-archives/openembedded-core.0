Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46B27792C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:01:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N713mX011626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Aug 2018 00:01:03 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 23 Aug 2018 00:01:02 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1534839945-264601-1-git-send-email-changqing.li@windriver.com>
	<6a033e614294a00b39049b54f4dc35a138a26c8d.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <20c94e42-ddfa-d068-741c-6b56159b9a8e@windriver.com>
Date: Thu, 23 Aug 2018 15:00:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <6a033e614294a00b39049b54f4dc35a138a26c8d.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] flac: patch for CVE-2017-6888
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
X-List-Received-Date: Thu, 23 Aug 2018 07:01:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/23/2018 02:47 PM, Richard Purdie wrote:
> On Tue, 2018-08-21 at 16:25 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../flac/flac/CVE-2017-6888.patch                  | 36
>> ++++++++++++++++++++++
>>   meta/recipes-multimedia/flac/flac_1.3.2.bb         |  4 ++-
>>   2 files changed, 39 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-multimedia/flac/flac/CVE-2017-
>> 6888.patch
>>
>> diff --git a/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
>> b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
>> new file mode 100644
>> index 0000000..0977f30
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
>> @@ -0,0 +1,36 @@
>> +From 43ecb6431077ff54e9df27f71737e6e96d6c039f Mon Sep 17 00:00:00
>> 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Tue, 21 Aug 2018 14:46:43 +0800
>> +Subject: [PATCH] From 5f47b63e9c971e6391590caf00a0f2a5ed612e67 Mon
>> Sep 17
>> + 00:00:00 2001 From: Erik de Castro Lopo <erikd@mega-nerd.com> Date:
>> Sat, 8
>> + Apr 2017 18:34:49 +1000 Subject: [PATCH] stream_decoder.c: Fix a
>> memory leak
>> +
>> +Leak reported by Secunia Research.
>> +
>> +Upstream-Status: Backport[https://git.xiph.org/?p=flac.git;a=commit;
>> +                 h=4f47b63e9c971e6391590caf00a0f2a5ed612e67]
>> +
>> +Update patch to version 1.3.2
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> This patch is missing a CVE: header.
>
> Please don't resend as I've just tweaked the patch in -next to add it
> as I don't want to have to go through another round of testing for it.
>
> Cheers,
>
> Richard

Thanks.

Sandy
>

-- 
BRs

Sandy(Li Changqing)
+861084778653


