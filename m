Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TyJH0-00021K-7G
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 10:39:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2013 01:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,528,1355126400"; d="scan'208";a="194630317"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2013 01:23:30 -0800
Message-ID: <5100FD91.2030508@intel.com>
Date: Thu, 24 Jan 2013 11:23:29 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1358857085-16549-1-git-send-email-wd@denx.de>
	<50FEBA91.7060804@windriver.com>
In-Reply-To: <50FEBA91.7060804@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_base.bbclass: Allow installation of ix86 SDK on x86_64 host
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
X-List-Received-Date: Thu, 24 Jan 2013 09:39:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/22/2013 06:13 PM, Mark Hatle wrote:
> On 1/22/13 6:18 AM, Wolfgang Denk wrote:
>> > Commit c04f5435 "populate_sdk_base.bbclass: use SDK_ARCH instead
>> > of SDKMACHINE" prevents not only the installation of 64 bit SDK
>> > configurations on 32 bit hosts (which indeed cannot work), but also
>> > the legitimate installation of a 32 bit SDK on a 64 bit host.
>> >
>> > Fix this.
>> >
>> > While there, also make sure we use the same patterns ("i[3-6]86" resp.
>> > "x86[-_]64" to get unified strings for both INST_ARCH and SDK_ARCH.
> As far as I am aware, this is intentional.  For various SDK items 
> pseudo/libpseudo may be used.  On a 32-bit SDK, only a 32-bit pseudo/libpseudo 
> is available.  This will prevent it from working with any host system binaries 
> that are x86_64.
> 
> If you don't care, the "workaround" is to use setarch and install it by telling 
> the system you are an ix86 target.
> 
> --Mark
> 
>> > 
Hi Mark,

There was a discussion on the yocto mailing list about this:
https://lists.yoctoproject.org/pipermail/yocto/2013-January/013889.html

Also, a bug filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3770

It turns out that people would like to be able to install 32-bit SDKs on
64-bit machines. Provided they have the 32-bit libraries in place.

Thanks,
Laurentiu


