Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC1D73C55
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 02:09:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2Q29wSJ014122
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Mar 2015 19:09:58 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 25 Mar 2015 19:09:57 -0700
Message-ID: <55136A7E.70002@windriver.com>
Date: Thu, 26 Mar 2015 10:10:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1427263291.git.Qi.Chen@windriver.com>
	<4493f45f7db4274425f6eee908543f82b63dd6e5.1427263291.git.Qi.Chen@windriver.com>
	<551254FE.7070709@gmail.com>
In-Reply-To: <551254FE.7070709@gmail.com>
X-Originating-IP: [128.224.162.236]
Subject: Re: [PATCH 1/1] systemd: fix SULOGIN path
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
X-List-Received-Date: Thu, 26 Mar 2015 02:10:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/25/2015 02:26 PM, Jonathan Liu wrote:
> On 25/03/2015 5:03 PM, Chen Qi wrote:
>> Fix SULOGIN path so that rescue.service doesn't use `sulogin' from 
>> the sysroot
>> part of the build on host, which would lead to errors like below when 
>> booting
>> into rescue mode.
>>
>>      /bin/sh: 
>> /buildarea2/chenqi/poky/build-systemd/tmp/sysroots/x86_64-linux/sbin/sulogin: 
>> not found
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd_219.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb 
>> b/meta/recipes-core/systemd/systemd_219.bb
>> index f2d3c13..843e30b 100644
>> --- a/meta/recipes-core/systemd/systemd_219.bb
>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>> @@ -123,6 +123,7 @@ do_configure_prepend() {
>>       export AR="${HOST_PREFIX}gcc-ar"
>>       export RANLIB="${HOST_PREFIX}gcc-ranlib"
>>       export KMOD="${base_bindir}/kmod"
>> +    export SULOGIN="${base_sbindir}/sulogin"
>>       if [ -d ${S}/units.pre_sed ] ; then
>>           cp -r ${S}/units.pre_sed ${S}/units
>>       else
> Wasn't this already fixed by:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/systemd/systemd_219.bb?id=8e19349b696d4a3e8576ba64e935cf3a43bc7940 
> ?
>
> Regards,
> Jonathan
>
>

Yes, you are right.
I didn't notice it.
Please ignore this patch.
I've updated my repo to the latest one.

Thanks,
Chen Qi

