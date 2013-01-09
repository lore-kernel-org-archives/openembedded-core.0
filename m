Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tswtb-00035V-T5
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 15:44:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jan 2013 06:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,438,1355126400"; d="scan'208";a="274856733"
Received: from costin-desktop (HELO [10.237.105.152]) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2013 06:29:32 -0800
Message-ID: <50ED7EF9.5080308@intel.com>
Date: Wed, 09 Jan 2013 16:30:17 +0200
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1357721541.git.constantinx.musca@intel.com>
	<441976458177570ed317fb6a8687c8eab8667cf8.1357721541.git.constantinx.musca@intel.com>
	<1357739128.13022.81.camel@ted>
In-Reply-To: <1357739128.13022.81.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] gcc: remove the 64bithack patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 14:44:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 03:45 PM, Richard Purdie wrote:
> On Wed, 2013-01-09 at 11:00 +0200, Constantin Musca wrote:
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.7.inc             |  1 -
>>   meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch | 63 -----------------------
>>   2 files changed, 64 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch
> Does removing this break multilib builds? For example, with different
> libdir layouts?
I think it's going to break other multilib builds. The solution is to 
keep the 64bithack.patch for setting the default multilib options.  The 
3/3 patch can be used without PATCH 2/3.
> Note that gcc has a shared source tree so patches cannot by applied in
> say the cross case when we need this yet not in the target case when we
> probably don't want it. We need to make a patch which works in all
> cases.
The other gcc variants (e.g. gcc-cross) are configured using 
--disable-multilib as option and they will not be influenced if we 
modify the multilib files.
>
> Cheers,
>
> Richard
>
>

Cheers,
Constantin


