Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SoeGd-0002ZJ-1s
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:30:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6AHJG4Z002106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2012 10:19:16 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 10 Jul 2012 10:19:16 -0700
Message-ID: <4FFC6403.7070702@windriver.com>
Date: Tue, 10 Jul 2012 13:18:59 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1341933187.git.bruce.ashfield@windriver.com>
	<4FFC63CA.9070007@linux.intel.com>
In-Reply-To: <4FFC63CA.9070007@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] linux-yocto: perf, unionfs, yaffs2 fixes
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
X-List-Received-Date: Tue, 10 Jul 2012 17:30:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-10 01:18 PM, Saul Wold wrote:
> On 07/10/2012 10:11 AM, Bruce Ashfield wrote:
>> Saul,
>>
>> Here are the SRCREV updates to activate Tom's mips perf fix (3.2
>> and 3.4).
>>
>> For 3.4, we also have a yaffs2 and unionfs fix.
>>
> Bruce, Tom:
>
> Can you generate a single patch set that contains both the kernel update
> and any perf recipe changes. That will avoid any further confusion.

At this point, I'd rather not. My changes are complete with perf +
other fixes in a consolidated pull .. and I'm juggling my own set
of integrations.

I'm honestly not seeing the complexity.

Cheers,

Bruce

>
> Thanks
> Sau!
>
>> Cheers,
>>
>> Bruce
>>
>> The following changes since commit
>> 029e3cea52f86438a1d6868020b8888b5c93d623:
>>
>> bitbake: fetch2/wget: Use FETCHCMD_wget to provide the commandline and
>> options (2012-07-10 14:25:38 +0100)
>>
>> are available in the git repository at:
>> git://git.pokylinux.org/poky-contrib zedd/kernel
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (2):
>> linux-yocto/3.2: perf: fix mips build
>> linux-yocto/3.4: perf, unionfs and yaffs2 fixes
>>
>> meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb | 4 ++--
>> meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb | 4 ++--
>> meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb | 2 +-
>> meta/recipes-kernel/linux/linux-yocto_3.2.bb | 12 ++++++------
>> meta/recipes-kernel/linux/linux-yocto_3.4.bb | 12 ++++++------
>> 5 files changed, 17 insertions(+), 17 deletions(-)
>>
>



