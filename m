Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1RM1Y8-0002j5-3t
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 18:58:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA3Hpkf2011545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Nov 2011 10:51:46 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 3 Nov 2011 10:51:46 -0700
Message-ID: <4EB2D4AD.4020005@windriver.com>
Date: Thu, 3 Nov 2011 13:51:41 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
	<4EB26B6B.7050600@linux.intel.com>
In-Reply-To: <4EB26B6B.7050600@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 17:58:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11-11-03 06:22 AM, Darren Hart wrote:
>
>
> On 11/03/2011 10:11 AM, Bruce Ashfield wrote:
>> Richard/Saul,
>>
>> Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes from TomZ.
>> These are destined for master and separate from any point updates to the 1.1
>> release.
>>
>
> So typically we try to push to master and pull back to the point
> releases. The linux-yocto infrastructure is a bit unique - how will you
> be presenting the stable update and the preempt-rt update (you mentioned
> below) for the point release?

We created the 3.0-1.1.x repo to gather point updates, so yes,
it is a variant on a branch and the same workflow. For changes
that are in both, it is a push and pull (i.e. 3.0.8) into that
repository. If it isn't destined for both, it goes into the 3.0
repo and never appears in the 3.0-1.1.x repository. But nothing
will appear in a point release that isn't already in master.

Cheers,

Bruce


>
> --
> Darren
>
>> In case anyone cares my -dev kernel also has these changes, and it will take
>> them to the latest kernel shortly.
>>
>> This also doesn't bump the preempt-rt branches, since they'll be updated
>> to the new -rt first, before taking the 3.0.x stable updates.
>>
>> Built and booted for all the qemu targets.
>>
>> cc: Tom Zanussi<tom.zanussi@intel.com>
>> cc: Darren Hart<dvhart@linux.intel.com>
>>
>> Cheers,
>>
>> Bruce
>>
>> The following changes since commit 9b76e6a2cfc5a4d779f3b06e3acc5ff7b8275470:
>>
>>    meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:28 +0000)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib zedd/kernel
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (1):
>>    linux-yocto_3.0: update base to v3.0.8 + meta config changes
>>
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
>>   2 files changed, 10 insertions(+), 10 deletions(-)
>>
>



