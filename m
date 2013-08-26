Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 46C746B988;
	Mon, 26 Aug 2013 20:00:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7QK0A8v023302
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Aug 2013 16:00:11 -0400 (EDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 26 Aug 2013 13:00:10 -0700
Message-ID: <521BB3BF.4090502@windriver.com>
Date: Mon, 26 Aug 2013 15:59:59 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130826101859.6987E503D3@opal> <20130826195621.GT3544@jama>
In-Reply-To: <20130826195621.GT3544@jama>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : linux-yocto: introduce v3.10
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
X-List-Received-Date: Mon, 26 Aug 2013 20:00:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-26 03:56 PM, Martin Jansa wrote:
> On Mon, Aug 26, 2013 at 10:18:59AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 6dc46834c6edaf358c18b26e4304bc9e7413eb60
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6dc46834c6edaf358c18b26e4304bc9e7413eb60
>>
>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Date:   Fri Aug 23 14:08:20 2013 -0400
>>
>> linux-yocto: introduce v3.10
>>
>> Introduce the 3.10 kernel. This is based on the 3.10.9 upstream kernel
>> and replaces the 3.8 recipes, which will be removed once all reference
>> boards have been updated.
>>
>> 3.10 also the latest LTSI and will be updated with that content when it
>> becomes available.
>>
>> Other features of the 3.10 kernel include:
>>
>>    - refreshed -rt support
>>    - refreshed yaffs2, aufs3
>>    - cryptodev
>>    - bfs, edf, and OCF staged features
>>    - scrubbed and updated meta data for v3.10
>>    - improved tools support for meta data updates and queue maintenance
>>    - patch carry forward from all previous linux-yocto kernels and
>>      configuration.
>>
>> This kernel has been built and boot tested on all qemu machines and architectures.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   30 ++++++++++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   25 ++++++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   30 ++++++++++++++++++++
>>   3 files changed, 85 insertions(+), 0 deletions(-)
>
> This commit should introduce bc-native dependency at least in my
> minimalistic chroot for OE builds this is first linux-yocto kernel which
> is failing because of missing host bc.

Good catch. I do recall the switch to bc to remove dependencies on perl.
Obviously I have no machines without bc, so I never did trigger it.

I'll follow up with a commit shortly, unless someone beats me to it.

Bruce

>
> |   BC      kernel/timeconst.h
> | /bin/sh: bc: command not found
> | make[3]: *** [kernel/timeconst.h] Error 127
> | make[2]: *** [kernel] Error 2
> | make[2]: *** Waiting for unfinished jobs....
>


