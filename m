Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF0CF7F01D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 10:00:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6OA0QgV001935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jul 2019 03:00:26 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 24 Jul 2019 03:00:25 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190724023833.13718-1-Qi.Chen@windriver.com>
	<CAJTo0LYZ-hVc9VW=LuSCDo1L-0DVXpnPdKEdzqR54fVrsqMa1A@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <8e654160-bb32-59dc-0c35-1bcdfc3da2a3@windriver.com>
Date: Wed, 24 Jul 2019 18:13:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYZ-hVc9VW=LuSCDo1L-0DVXpnPdKEdzqR54fVrsqMa1A@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] container-image-busybox: add a reference container image
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
X-List-Received-Date: Wed, 24 Jul 2019 10:00:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2019 05:38 PM, Burton, Ross wrote:
> Are you aware of container-test-image.bb?  Curious what the point of this is.
>
> Ross

Yes. It exists in meta-selftest, having an empty /usr/bin/theapp, for 
the purpose of selftest.

I think we could have some reference image for container. So I added 
this small reference image, from which users could create container and 
use shell.

I expect it to be like busybox:glibc or busybox:musl in Docker Hub, with 
the major difference that we use symlinks to /bin/busybox.nosuid and 
/bin/busybox.suid while official ones use separate binaries.

Regards,
Chen Qi

> On Wed, 24 Jul 2019 at 03:39, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Add a small busybox based container image.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/images/container-image-busybox.bb | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>   create mode 100644 meta/recipes-core/images/container-image-busybox.bb
>>
>> diff --git a/meta/recipes-core/images/container-image-busybox.bb b/meta/recipes-core/images/container-image-busybox.bb
>> new file mode 100644
>> index 0000000000..a4d63b0eea
>> --- /dev/null
>> +++ b/meta/recipes-core/images/container-image-busybox.bb
>> @@ -0,0 +1,8 @@
>> +SUMMARY = "A small busybox based container image."
>> +LICENSE = "MIT"
>> +
>> +IMAGE_INSTALL = "busybox"
>> +IMAGE_LINGUAS = ""
>> +IMAGE_FSTYPES = "container"
>> +
>> +inherit core-image
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



