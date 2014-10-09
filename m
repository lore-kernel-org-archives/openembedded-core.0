Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EEDAF65D58
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 22:44:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Oct 2014 15:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="397876191"
Received: from mesiment-mobl3.amr.corp.intel.com (HELO [10.219.4.58])
	([10.219.4.58])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2014 15:35:27 -0700
Message-ID: <54370F4B.7030207@linux.intel.com>
Date: Thu, 09 Oct 2014 17:42:19 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1412712030-12657-1-git-send-email-anibal.limon@linux.intel.com>	<54344EC9.2040303@opendreambox.org>	<54346DFB.8030802@linux.intel.com>	<5434799B.7020503@opendreambox.org>	<54357BB2.6090405@linux.intel.com>
	<54358935.30909@opendreambox.org>
In-Reply-To: <54358935.30909@opendreambox.org>
Subject: Re: [PATCH] busybox: fix upgrade problem with deb packages
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
X-List-Received-Date: Thu, 09 Oct 2014 22:44:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Andreas,

Now i'm testing dpkg-ua changes, my first impressions are,

Some work in order to use dpkg-ua version instead of opkg-utils (default),
files meta/conf/layer.con and 
meta/recipes-core/packagegroups/packagegroup-self-hosted.bb.

Currently isn't created symlinks for tools in target image.

Comments?

Best regards.


On 08/10/14 13:57, Andreas Oberritter wrote:
> On 08.10.2014 20:00, Aníbal Limón wrote:
>> On 07/10/14 18:39, Andreas Oberritter wrote:
>>> On 08.10.2014 00:49, Aníbal Limón wrote:
>>>> I reviewed the patches and looks good, only i have a comment
>>>> in this file,
>>>>
>>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/dora&id=a5f18409d1bf2877f898b902cafc317cbf7462e4
>>>>
>>>>
>>>>
>>>> I didn't know if the same apply for rpm and ipk.
>>> I guess so. I'm pretty certain that opkg behaves just like dpkg in this
>>> regard. I never used rpm, though.
>>>
>>> To reproduce the problem, boot an image containing busybox, but not
>>> bash. Then install bash and deinstall it again. Deinstallation fails,
>>> resulting in a dangling symlink (/bin/sh -> /bin/bash).
>>>
>>>> There are a lot of patches,  Do you have a plan to port them to master?
>>>>
>>>> I can help with that.
>>> I'd like to, but I won't have time to do any testing with master during
>>> the next weeks. I could rebase my patches onto master and provide a tree
>>> for you to test. Or you could cherry-pick whatever patches you like and
>>> submit them to the mailing list after testing. Most patches should apply
>>> without changes, but those touching rootfs_deb.bbclass and
>>> package_deb.bbclass will need some porting. What do you think?
>> I think we need to port these patches in small changes in order to do
>> a good review,
> I already rebased all patches today, and just pushed it to this untested
> branch:
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/master
>
>> I propose,
>>
>> 1. dpkg update-alternatives offline
>> 2. apt-get upgrade version
>> 3. another minor changes like pkg-config
>>
>> Makes sense?
> OK. Here are some topic branches:
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/dpkg-ua
> http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/apt
> http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/dpkg-misc
>
> Regards,
> Andreas


