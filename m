Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A76062252
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 02:50:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s832oDmW012257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 19:50:13 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 2 Sep 2014 19:50:12 -0700
Message-ID: <540681EE.9050602@windriver.com>
Date: Wed, 3 Sep 2014 10:50:22 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<849bb79f1189ff09c1909101b50d3284cf5f6859.1409655125.git.Qi.Chen@windriver.com>
	<CAJTo0LYODrmCZQbXMmjAAykNS2rgkHjY5ZL_hKF0NAU5+zQDcQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYODrmCZQbXMmjAAykNS2rgkHjY5ZL_hKF0NAU5+zQDcQ@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 25/26] run-postinsts.service: remove redundant line
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
X-List-Received-Date: Wed, 03 Sep 2014 02:50:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2014 01:17 AM, Burton, Ross wrote:
> On 2 September 2014 11:54, Chen Qi <Qi.Chen@windriver.com> wrote:
>> The basic.target itself requires sysinit.target, so there's no
>> need to write this redundant line in the run-postinsts unit file.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
>> index 822327a..85a0439 100644
>> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
>> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
>> @@ -13,5 +13,4 @@ RemainAfterExit=No
>>   TimeoutSec=0
>>
>>   [Install]
>> -WantedBy=basic.target
>>   WantedBy=sysinit.target
> >From the commit message it sounds like you meant to remove
> sysinit.target.  What is correct?
>
> Ross
>
>

Removing 'WantedBy=basic.target' is correct.

As sysinit.target is required by basic.target, and run-postinsts.service 
is required by sysinit.target, then
run-postinsts.service has been in the dependency chain of basic.target.
So there's no need to write 'WantedBy=basic.target'.

Best Regards,
Chen Qi

