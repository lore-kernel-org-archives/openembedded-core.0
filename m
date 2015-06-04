Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id A2B48757C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 17:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 50EEF601437
Message-ID: <55708797.7030102@collabora.co.uk>
Date: Thu, 04 Jun 2015 18:15:03 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1432207476-32627-1-git-send-email-Martin.Jansa@gmail.com>
	<20150604084805.GF2376@jama>
In-Reply-To: <20150604084805.GF2376@jama>
Subject: Re: [fido][PATCH] squashfs-tools: build and install unsquashfs as well
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
X-List-Received-Date: Thu, 04 Jun 2015 17:15:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/15 09:48, Martin Jansa wrote:
> On Thu, May 21, 2015 at 01:24:36PM +0200, Martin Jansa wrote:
>> * it's useful for debugging corrupt squashfs images from mksquashfs
>
> ping

Thanks, this is queued in my fido-next branch[1] pending an autobuilder run.

Regards,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

>
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
>> index d36f0fe..19d555e1 100644
>> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
>> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
>> @@ -27,11 +27,12 @@ SPDX_S = "${WORKDIR}/squashfs${PV}"
>>   EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
>>
>>   do_compile() {
>> -        oe_runmake mksquashfs
>> +	oe_runmake mksquashfs unsquashfs
>>   }
>>   do_install () {
>>           install -d ${D}${sbindir}
>>           install -m 0755 mksquashfs ${D}${sbindir}/
>> +	install -m 0755 unsquashfs ${D}${sbindir}/
>>   }
>>
>>   ARM_INSTRUCTION_SET = "arm"
>> --
>> 2.4.1
>>
>


