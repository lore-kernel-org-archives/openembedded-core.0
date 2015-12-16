Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 019A76E64A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:49:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2015 07:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,437,1444719600"; d="scan'208";a="14298501"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.48]) ([10.219.5.48])
	by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2015 07:49:52 -0800
To: Matt Madison <matt@madison.systems>
References: <1449422732-12975-1-git-send-email-matt@madison.systems>
	<56704DFF.9070804@linux.intel.com>
	<CAGgRHJqibg_vCYzFp_nQktE4kEcMYe1SMWrz=UH0Up0Q2vuXmg@mail.gmail.com>
	<567092CA.2040600@linux.intel.com>
	<CAGgRHJptKNTkhDi5s9F1S821PG5apBDtW4mG7anGqA84m5d7kw@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56718862.80803@linux.intel.com>
Date: Wed, 16 Dec 2015 09:50:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJptKNTkhDi5s9F1S821PG5apBDtW4mG7anGqA84m5d7kw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Debian multilib packaging fixes
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
X-List-Received-Date: Wed, 16 Dec 2015 15:49:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Matt,

I tried to do again without your patches and the problem appears, seems
to be an older problem.

Regards,
	alimon

On 12/16/2015 07:31 AM, Matt Madison wrote:
> On Tue, Dec 15, 2015 at 2:23 PM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>> Hi Matt,
>>
>> Trying to build core-image-sato with qemux86-64 and multilib enabled an
>> errors appear (see attached log), next the config.
> 
> OK, yep, I can reproduce this.  I'll investigate further.
> 
> Thanks,
> -Matt
> 
> 
>>
>> MACHINE ??= "qemux86-64"
>>
>> IMAGE_INSTALL_append = " lib32-connman"
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>> PACKAGE_CLASSES ?= "package_deb"
>> EXTRA_IMAGE_FEATURES = "debug-tweaks package-management"
>>
>> Kind regards,
>>         alimon
>>
>>
>> On 12/15/2015 01:28 PM, Matt Madison wrote:
>>> On Tue, Dec 15, 2015 at 9:29 AM, Aníbal Limón
>>> <anibal.limon@linux.intel.com> wrote:
>>>> Hi Matt,
>>>>
>>>> I'm starting to look at your patches, in what arches/combinations you
>>>> test the patches?
>>>
>>> I've been working on a BSP layer for the jetson-tx1, which is
>>> aarch64/armv7a-hf, so that's what I've been testing with.  The BSP
>>> defs are in https://github.com/madisongh/meta-tegra.
>>>
>>> Thanks,
>>> -Matt
>>>
>>>
>>>>
>>>> Kind regards,
>>>>         alimon
>>>>
>>>>
>>>> On 12/06/2015 11:25 AM, Matt Madison wrote:
>>>>> I ran into sevearl issues while trying to build an ARM multilib rootfs
>>>>> using Debian packaging.  After several go-rounds, it looked like the
>>>>> cleanest solution was to tweak how DPKG_ARCH gets constructed and
>>>>> to have the DpkgPM class in oe/package_manager.py use that variable
>>>>> to locate multilib variants (similar to RpmPM).  I also took the
>>>>> liberty of expanding the Debian architecture mappings so the names
>>>>> align better with what's documented on the Debian wiki, for those
>>>>> cases where a direct mapping is possible.
>>>>>
>>>>> Matt Madison (2):
>>>>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>>>>     function
>>>>>   package_manager.py: fixes for multilib deb packaging builds
>>>>>
>>>>>  meta/classes/cross-canadian.bbclass |  2 +-
>>>>>  meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++----------
>>>>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>>>>  3 files changed, 37 insertions(+), 17 deletions(-)
>>>>>

