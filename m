Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3993A77A98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:10:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2N3AWEi014238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Mar 2017 20:10:32 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 22 Mar 2017 20:10:31 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1490174366.git.Qi.Chen@windriver.com>
	<afcb3771cf109ba4d11e81a79eaadef62f9437a3.1490174366.git.Qi.Chen@windriver.com>
	<1490178423.13980.168.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <884b927a-25d1-7719-da24-ab93d1425be1@windriver.com>
Date: Thu, 23 Mar 2017 11:11:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1490178423.13980.168.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.201]
Subject: Re: [PATCH 1/1] runqemu-gen-tapdevs: fix file path in example
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
X-List-Received-Date: Thu, 23 Mar 2017 03:10:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/22/2017 06:27 PM, Richard Purdie wrote:
> On Wed, 2017-03-22 at 17:23 +0800, Chen Qi wrote:
>> Fix the path in example so that '/usr/bin/tunctl' could be found under
>> this path.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/runqemu-gen-tapdevs | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
>> index 9e5e5b9..994efd0 100755
>> --- a/scripts/runqemu-gen-tapdevs
>> +++ b/scripts/runqemu-gen-tapdevs
>> @@ -29,7 +29,7 @@ usage() {
>>   	echo " is the number of tap devices to create (0 to remove all)"
>>   	echo " is the path to the build system's native sysroot"
>>   	echo "e.g. $ bitbake qemu-helper-native -c addto_recipe_sysroot"
> If we change this, you also need to change the above to remove -c
> addto_recipe_sysroot.
>
> Cheers,
>
> Richard

Thanks. V2 has been sent.

Best Regards,
Chen Qi

>> -	echo "$ sudo $0 1000 1000 4 tmp/work/x86_64-linux/qemu-helper-native/*/recipe-sysroot-native/"
>> +	echo "$ sudo $0 1000 1000 4 tmp/sysroots-components/x86_64/qemu-helper-native/"
>>   	exit 1
>>   }
>>   
>> -- 
>> 1.9.1
>>


