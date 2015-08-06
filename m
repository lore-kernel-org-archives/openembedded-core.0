Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D63560167
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 06:37:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t766bDNs000221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Aug 2015 23:37:13 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 23:37:13 -0700
Message-ID: <55C30097.3050504@windriver.com>
Date: Thu, 6 Aug 2015 14:37:11 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1438670283.git.liezhi.yang@windriver.com>
	<0354ab95e1c3afd9ac708ee063c2d2c2f51d5801.1438670283.git.liezhi.yang@windriver.com>
	<988FE418-5570-4756-84FA-3E7907B7633E@gmail.com>
In-Reply-To: <988FE418-5570-4756-84FA-3E7907B7633E@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] tcmode-default.inc: update BINUVERSION
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
X-List-Received-Date: Thu, 06 Aug 2015 06:37:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 08/06/2015 11:53 AM, Khem Raj wrote:
>
>> On Aug 3, 2015, at 11:40 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> meta/conf/distro/include/tcmode-default.inc |    2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>> index 0abf803..c08fe24 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>>
>> GCCVERSION ?= "4.9%"
>> SDKGCCVERSION ?= "${GCCVERSION}"
>> -BINUVERSION ?= "2.25"
>> +BINUVERSION ?= "2.25%”
>
> squash this into binutils upgrade patch

Thanks, updated in the repo:
   git://git.openembedded.org/openembedded-core-contrib rbt/PU

// Robert

>
>> GDBVERSION ?= "7.9%"
>> GLIBCVERSION ?= "2.21"
>> UCLIBCVERSION ?= "0.9.33+git%"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

