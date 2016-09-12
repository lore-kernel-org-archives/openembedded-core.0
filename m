Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 188957665F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:05:02 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 0608825F1ED54;
	Mon, 12 Sep 2016 16:04:48 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 12 Sep 2016 16:04:51 +0100
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1473340457-31797-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<e0f721cd-96d5-e3a5-b060-83bb467d1784@gmail.com>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <80ff7e99-39ac-dd8f-ecfc-632860f06863@imgtec.com>
Date: Mon, 12 Sep 2016 16:04:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <e0f721cd-96d5-e3a5-b060-83bb467d1784@gmail.com>
X-Originating-IP: [192.168.154.45]
Subject: Re: [PATCH] valgrind: MIPS: Make toolchain basename generic
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
X-List-Received-Date: Mon, 12 Sep 2016 15:05:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 09/08/2016 04:45 PM, akuster808 wrote:
>
>
> On 09/08/2016 06:14 AM, Zubair Lutfullah Kakakhel wrote:
>> For the hard float case, COMPATIBLE_HOST should be set to ".*-linux"
>> since OE can support multiple distro layers, not just poky.
>>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>
> is this good for Krogoth too? it has the same version.

Yes. But we'd also need this commit from master

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb?id=d7268e9bbae93455a591bb4f73bfe4bf76497a1b

They can both be squashed into one commit.

Thanks,
ZubairLK

>
> - armin
>>
>> ---
>> Pointed out by Andre McCurdy but patch v1 had already been accepted
>> and applied.
>> ---
>>   meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> index 3d49131..42fd27f 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> @@ -39,8 +39,8 @@ COMPATIBLE_HOST_armv5 = 'null'
>>   COMPATIBLE_HOST_armv6 = 'null'
>>
>>   # valgrind doesn't like mips soft float
>> -COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mips-poky-linux", d)}"
>> -COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mipsel-poky-linux", d)}"
>> +COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
>> +COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
>>
>>   inherit autotools ptest
>>
>

