Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QHnen-0001gO-0i
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 03:47:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 May 2011 18:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,317,1301900400"; d="scan'208";a="430784662"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.142])
	([10.238.154.142])
	by azsmga001.ch.intel.com with ESMTP; 04 May 2011 18:44:28 -0700
Message-ID: <4DC200FB.6040005@intel.com>
Date: Thu, 05 May 2011 09:44:27 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304515719.git.ke.yu@intel.com>
	<BANLkTik0nb-ZsqLCnAoXzRr6BLKBUk3cew@mail.gmail.com>
In-Reply-To: <BANLkTik0nb-ZsqLCnAoXzRr6BLKBUk3cew@mail.gmail.com>
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Thu, 05 May 2011 01:47:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-5-4 23:39, Bruce Ashfield wrote:
> On Wed, May 4, 2011 at 10:05 AM, Yu Ke<ke.yu@intel.com>  wrote:
>> From: Yu Ke<ke.yu@intel.com>
>>
>> move the SRCREV from poky-default-revisions.inc to its corresponding recipe,
>> in this case, those non poky distro can also use its SRCREV.
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>   Branch: kyu3/srcrev-recipe
>>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/srcrev-recipe
>>
>> Thanks,
>>     Yu Ke<ke.yu@intel.com>
>> ---
>>
>>
>> Yu Ke (1):
>>   poky-default-revisions: move the SRCREV to recipe file
>>
>>   meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |    1 +
>>   .../recipes-graphics/clutter/table_git.bb          |    1 +
>>   meta-demoapps/recipes-graphics/clutter/tidy_git.bb |    1 +
>
> <snip>
>
>>   meta/recipes-kernel/blktrace/blktrace_git.bb       |    2 +
>>   meta/recipes-kernel/dtc/dtc_git.inc                |    2 +
>>   .../kern-tools/kern-tools-native_git.bb            |    1 +
>>   .../linux-firmware/linux-firmware_git.bb           |    1 +
>>   .../linux-libc-headers-yocto_git.bb                |    1 +
>>   .../recipes-kernel/linux/linux-yocto-stable_git.bb |   12 ++
>>   meta/recipes-kernel/linux/linux-yocto_git.bb       |   14 ++\
>
> Would it be possible to get direct cc on changes to the linux-yocto
> recipes ? I didn't expect this and it is causing me a bit of pain at
> the moment. A direct cc' would have helped, since I would have
> preferred to stage the change in with my other items.
>
> Bruce

Get it, will CC you next time for linux-yocto changes.

Regards
Ke


