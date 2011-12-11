Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZpx7-0005bK-Oq
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 21:24:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2011 12:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94976753"
Received: from unknown (HELO [10.255.12.46]) ([10.255.12.46])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2011 12:17:55 -0800
Message-ID: <4EE50FF3.7010202@linux.intel.com>
Date: Sun, 11 Dec 2011 12:17:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323554268.git.sgw@linux.intel.com>
	<71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>
	<1323587119.8919.4.camel@mattotaupa>
In-Reply-To: <1323587119.8919.4.camel@mattotaupa>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH 3/5] self-hosted: Add ext2 utilites and perl-pod for building
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Dec 2011 20:24:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2011 11:05 PM, Paul Menzel wrote:
> Dear Saul,
>
>
> Am Samstag, den 10.12.2011, 14:01 -0800 schrieb Saul Wold:
>> Add self-hosted-host-tools for non-build related tools
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   meta/recipes-core/tasks/task-self-hosted.bb |   54 +++++++++++++++-----------
>>   1 files changed, 31 insertions(+), 23 deletions(-)
>>
>> diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
>> index b3a68b4..b9bdd21 100644
>> --- a/meta/recipes-core/tasks/task-self-hosted.bb
>> +++ b/meta/recipes-core/tasks/task-self-hosted.bb
>> @@ -3,7 +3,7 @@
>>   #
>>
>>   DESCRIPTION = "Create Basic Image Tasks"
>> -PR = "r1"
>> +PR = "r2"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> @@ -14,6 +14,7 @@ PACKAGES = "\
>>       task-self-hosted-sdk \
>>       task-self-hosted-extended \
>>       task-self-hosted-graphics \
>> +    task-self-hosted-host-tools \
>>       "
>>
>>   ALLOW_EMPTY = "1"
>> @@ -23,13 +24,26 @@ RDEPENDS_task-self-hosted = "\
>>       task-self-hosted-sdk \
>>       task-self-hosted-extended \
>>       task-self-hosted-graphics \
>> +    task-self-hosted-host-tools \
>> +    "
>> +
>> +RDEPENDS_task-self-hosted-host-tools = "\
>> +    e2fsprogs \
>> +    dhcp-client \
>> +    genext2fs \
>> +    hdparm \
>> +    iptables \
>> +    kernel-module-tun \
>> +    kernel-module-iptable-raw \
>> +    kernel-module-iptable-nat \
>> +    kernel-module-iptable-mangle \
>> +    kernel-module-iptable-filter \
>> +    mc \
>> +    screen \
>>       "
>
> […]
>
> I find this patch quite hard to review, since it reorders the
> variables(?). Is there a trick to review this or are two separate
> patches better.
>
No trick, just moved a couple of items that where in the wrong place 
from one task to the host-tools task.

> Could you also please check your pull request script to send
>
>      <openembedded-core@lists.openembedded.org>
>
> instead of
>
>      <openembedded-core@openembedded.org>
>
> and therefore answering to all messages are sent twice to the list.
>
Sure, not sure why that would be happening.

Sau!

>
> Thanks,
>
> Paul
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


