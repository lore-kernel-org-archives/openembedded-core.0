Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A552565C5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 02:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4928vsh001334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 May 2016 19:08:57 -0700 (PDT)
Received: from server.local (147.11.118.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 8 May 2016 19:08:56 -0700
To: akuster808 <akuster808@gmail.com>, <richard.purdie@linuxfoundation.org>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
	<572E676E.1070400@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <6ea0237e-9c62-458f-ec03-d6321f2b3941@windriver.com>
Date: Sun, 8 May 2016 22:08:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <572E676E.1070400@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11][master][krogoth] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 09 May 2016 02:09:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-07 6:08 PM, akuster808 wrote:
> On 5/4/16 10:53 AM, Bruce Ashfield wrote:
>> Hi all,
>>
>> The following is a consolidated set of changes for the 4.1, 4.4 linux-yocto
>> kernel, as well as the kern-tools.
>>
>> All of these are bug fixes, minor configuration changes or -stable updates.
>> I've had most of them queued since before the 2.1 release, but was waiting
>> for the dust to settle before sending them out.
>
> I pulled this in to Krogoth for prelim testing. I will wait for them to
> hit master before adding to a pull request.

perfect.

Bruce

>
> thanks,
> armin
>>
>> These are all appropriate for master and krogoth.
>>
>> Build (and boot) tested on qemu*, all arches.
>>
>> Bruce
>>
>> The following changes since commit f7b520878babbaa7527151f22c031ae160512753:
>>
>>   poky: Switch to post release name/version (2016-04-29 07:58:46 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib zedd/kernel
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (11):
>>   linux-yocto/uvesafb: print error message when task timeout occurs
>>   linux-yocto/4.4: sched/cgroup: Fix/cleanup cgroup teardown/init
>>   kern-tools: handle directories with, or without, trailing /
>>   kernel-yocto: allow branch auditing to be suspended
>>   linux-yocto/4.1: update to v4.1.22
>>   linux-yocto/4.1: make ltsi content available
>>   linux-yocto/4.4: BXT mmc fixes + PUNIT, tubropower, and telemetry
>>     backport
>>   linux-yocto/4.4: skylake configuration
>>   linux-yocto/4.4: broxton enablement and refactoring
>>   linux-yocto/4.4: bump to v4.4.8
>>   linux-yocto-rt/4.1: update to rt23
>>
>>  meta/classes/kernel-yocto.bbclass                  | 23 +++++++++++++---------
>>  .../kern-tools/kern-tools-native_git.bb            |  2 +-
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  4 ++--
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  4 ++--
>>  meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 +++++++++----------
>>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 18 ++++++++---------
>>  9 files changed, 45 insertions(+), 39 deletions(-)
>>
>


