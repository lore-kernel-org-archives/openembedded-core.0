Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TF0ip-0004Kq-PN
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 12:44:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Sep 2012 03:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,462,1344236400"; d="scan'208";a="224832804"
Received: from unknown (HELO [10.252.121.247]) ([10.252.121.247])
	by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2012 03:31:50 -0700
Message-ID: <505C4215.9080203@intel.com>
Date: Fri, 21 Sep 2012 13:31:49 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
	<a10d0e1b4dc0667b04f1cfa906378ce9094449ae.1348148406.git.laurentiu.palcu@intel.com>
	<1348222970.10108.48.camel@ted>
In-Reply-To: <1348222970.10108.48.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 5/6] SDK: relocate symlinks too
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
X-List-Received-Date: Fri, 21 Sep 2012 10:44:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/21/2012 01:22 PM, Richard Purdie wrote:
> On Thu, 2012-09-20 at 16:48 +0300, Laurentiu Palcu wrote:
>> The directory usr/libexec/ in the SDK sysroot contains the default
>> symlinks to the toolchain binaries and these, too, need to point to the
>> correct toolchain path.
>>
>> [YOCTO #3090]
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>  meta/classes/populate_sdk_base.bbclass             |    5 +++++
>>  .../adt-installer/scripts/adt_installer_internal   |    5 +++++
>>  2 files changed, 10 insertions(+)
> 
> I've merged this since it definitely improves the situation but I am
> left wondering if we shouldn't generate relative symlinks in the first
> place for the toolchain...
I suppose we can do that too and leave this patch as a safety in case
absolute symlinks appear (by mistake) anywhere in the SDK rootfs. It's
up to you.

Thanks,
Laurentiu
> 
> Cheers,
> 
> Richard
> 
> 
> 


