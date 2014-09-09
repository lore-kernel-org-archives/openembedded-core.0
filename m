Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1E2471388
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 14:46:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s89EkdZ3010109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Sep 2014 07:46:39 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Sep 2014 07:46:39 -0700
Message-ID: <540F12D0.3080900@windriver.com>
Date: Tue, 9 Sep 2014 09:46:40 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>	<1410227590-14190-2-git-send-email-akuster808@gmail.com>
	<1410249927.19272.42.camel@ted>
In-Reply-To: <1410249927.19272.42.camel@ted>
Subject: Re: [[PATCH] qemuppc64: add machine
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
X-List-Received-Date: Tue, 09 Sep 2014 14:46:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/14, 3:05 AM, Richard Purdie wrote:
> On Mon, 2014-09-08 at 18:53 -0700, Armin Kuster wrote:
>> override USER_CLASSES as prelink does not currently
>> work on ppc64
>> ---
>>   meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta/conf/machine/qemuppc64.conf
>>
>> diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
>> new file mode 100644
>> index 0000000..86916e5
>> --- /dev/null
>> +++ b/meta/conf/machine/qemuppc64.conf
>> @@ -0,0 +1,16 @@
>> +#@TYPE: Machine
>> +#@NAME: qemu PPC 64 Emulator setup
>> +#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
>> +
>> +require conf/machine/include/qemu.inc
>> +DEFAULTTUNE ?= "ppc64p6"
>> +require conf/machine/include/tune-power6.inc
>> +
>> +#prelink broken
>> +USER_CLASSES = "buildstats image-mklibs "
>
> This is horrible. Can we somehow blacklist qemuppc64 in the prelink
> class itself?
>
> USER_CLASSES_remove = "prelink"
>
> would be better than overriding the users choice like above...

I keep asking people who have access to the PPC 64 systems to investigate and 
help debug this.

I don't expect it will be difficult to figure out, but I simply don't have 
access to this architecture to try.

There is a YP bug, 1331 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=1331).

So please, if you can help diagnose what is going wrong, I'd really like to fix 
this.

--Mark

> Cheers,
>
> Richard
>
>> +KERNEL_IMAGETYPE = "vmlinux"
>> +
>> +IMAGE_FSTYPES = "ext2 ext3"
>> +
>> +SERIAL_CONSOLE ?= "ttyS0"
>> --
>> 1.9.1
>>
>
>


