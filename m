Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TxDAT-00040q-3T
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 09:55:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jan 2013 00:40:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,505,1355126400"; d="scan'208";a="276273272"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2013 00:40:19 -0800
Message-ID: <50FD0088.5080403@intel.com>
Date: Mon, 21 Jan 2013 10:47:04 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
	<50FCBCB7.8060201@linux.intel.com>
	<CAJTo0LYU0-1EEZfE8LdTDSmGmgprHbmZ-g00O-8+Qv1MmcaQTg@mail.gmail.com>
	<20130121091942.5a6c5a82@e6520eb>
In-Reply-To: <20130121091942.5a6c5a82@e6520eb>
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 08:55:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 01/21/2013 10:19 AM, Eric Bénard wrote:
> Hi Ross,
>
> Le Mon, 21 Jan 2013 08:08:32 +0000,
> "Burton, Ross" <ross.burton@intel.com> a écrit :
>
>> The autobuilder hit this last night:
>>
>> ERROR: Multiple .bb files are due to be built which each provide udev
>> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-core/udev/udev_182.bb
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-core/systemd/systemd_196.bb).
>>
>> Which I realised would happen not long after hitting send.   I'll sort this too.
>>
> we had the same problem in meta-oe's denzil branch.
>
> The workaround is here :
> http://patches.openembedded.org/patch/41669/
> http://patches.openembedded.org/patch/41667/
> http://patches.openembedded.org/patch/41671/
>
> What should work in OE-Core when using systemd is :
> PREFERRED_PROVIDER_udev = "systemd"
This is addressed in [PATCH 2/10] & [PATCH 5/10], it should not require 
specifically setting the PREFERRED_PROVIDER_udev

Radu


