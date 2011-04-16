Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke@linux.intel.com>) id 1QAxKm-0004Fz-Gm
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 06:42:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 21:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910380537"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 21:38:42 -0700
Received: from [10.255.29.31] (kyu3-mobl3.ccr.corp.intel.com [10.255.29.31])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6F0656A4482;
	Fri, 15 Apr 2011 21:38:39 -0700 (PDT)
Message-ID: <4DA91D50.8060102@linux.intel.com>
Date: Sat, 16 Apr 2011 12:38:40 +0800
From: Yu Ke <ke@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302846043.git.ke.yu@intel.com>	<38033f4ff7f7cd735acf7d2e11ba078f4c2aafb6.1302846043.git.ke.yu@intel.com>
	<4DA87578.4080809@linux.intel.com>
In-Reply-To: <4DA87578.4080809@linux.intel.com>
Subject: Re: [PATCH 4/9] mesa: upgrade to 7.10.2
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
X-List-Received-Date: Sat, 16 Apr 2011 04:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011/4/16 0:42, Saul Wold wrote:
> On 04/14/2011 10:44 PM, Yu Ke wrote:
>> From: Yu Ke<ke.yu@intel.com>
>>
>> - also remove the talloc-removal.patch because it is already
>>    included in this version
>>
>> Signed-off-by: Yu Ke<ke.yu@intel.com>
>> ---
>>   .../distro/include/preferred-xorg-versions.inc     |    2 +-
>>   .../mesa/files/talloc-removal.patch                |15571 
>> --------------------
>>   .../mesa/{mesa-dri_7.10.bb =>  mesa-dri_7.10.2.bb}  |    7 +-
>>   .../{mesa-xlib_7.10.bb =>  mesa-xlib_7.10.2.bb}     |    7 +-
>>   4 files changed, 7 insertions(+), 15580 deletions(-)
>>   delete mode 100644 
>> meta/recipes-graphics/mesa/files/talloc-removal.patch
>>   rename meta/recipes-graphics/mesa/{mesa-dri_7.10.bb =>  
>> mesa-dri_7.10.2.bb} (85%)
>>   rename meta/recipes-graphics/mesa/{mesa-xlib_7.10.bb =>  
>> mesa-xlib_7.10.2.bb} (68%)
>>
> Ke,
>
> I noticed other patches for both the 7.10.2 version and GIT version in 
> the mesa-dri directory.  Also is there a reason we are carrying around 
> older versions of mesa-dri?
>
> I am looking at the overall clean state of things as we move forward.
>
> Thanks
>     Sau!

Thanks for pointing it out. Yes, I will add Upstream-Status tag to those 
patches. The old versions 7.8.2 is kept for GPLv3 talloc workaround, The 
other old 7.5 and 7.7 version is just legacy recipe from poky. These old 
recipes can be removed safely.  I will make patch to remove it.

BTW, I notice this mesa upgrade patch is already in your staging branch 
(http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/log/?h=distro/stage), 
so should I make a incremental patch base on this, or make a V3 mesa 
upgrade patch base on master branch?

Regards
Ke


