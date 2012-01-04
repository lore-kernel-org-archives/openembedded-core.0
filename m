Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RiFCi-0003wg-2u
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:59:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 16:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102894623"
Received: from edwin-gen.sh.intel.com (HELO [10.239.36.111]) ([10.239.36.111])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 16:52:22 -0800
Message-ID: <4F03A2A3.80408@intel.com>
Date: Wed, 04 Jan 2012 08:51:47 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1325145929.git.edwin.zhai@intel.com>
	<4F0395C0.4020805@linux.intel.com>
In-Reply-To: <4F0395C0.4020805@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Bug fixes
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
X-List-Received-Date: Wed, 04 Jan 2012 00:59:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2012 07:56 AM, Saul Wold wrote:
> On 12/29/2011 12:09 AM, edwin.zhai@intel.com wrote:
>> From: Zhai Edwin<edwin.zhai@intel.com>
>>
>> All,
>> Patch of gnome-keyring to fix gsettings-data-convert seg fault,
>> modified according to Saul's comments.
>> Another patch of matchbox-wm to remove the dependence between window
>> manager and X session.
>>
>> The following changes since commit
>> 6a1b5c28f22bb07a0b7102eb88441d05768ec52e:
>>
>> self-hosted-image: Add builder user and mini X (2011-12-29 10:42:07
>> +0800)
>>
>> are available in the git repository at:
>> git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2
>>
>>
>> Zhai Edwin (2):
>> gnome-keyring: fix gsettings_data_convert seg fault
>
> Merged this one to OE-Core
>
>> matchbox-wm: Remove x-session-manager handling
>>
> We need a little more explaintion about why you are removing the U-A
> code from the matchbox-wm?

matchbox-wm should not handles x-session, or else it conflict with 
mini-x-session. i.e. mini-x-session set x-session to mini-X, then 
matchbox-wm overrides it as matchbox-session. Without matchbox-session 
installed, mini-X fail start.

I have tested this patch and found no regression...


>
> Thanks
> Sau!
>
>
>> meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb | 12 ++++++++++--
>> .../matchbox-wm/matchbox-wm_1.2.bb | 9 ++-------
>> .../matchbox-wm/matchbox-wm_git.bb | 9 ++-------
>> 3 files changed, 14 insertions(+), 16 deletions(-)
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>



