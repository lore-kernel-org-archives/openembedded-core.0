Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2yS-0004IN-Ci
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:34:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 08:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="239540183"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2012 08:10:31 -0700
Message-ID: <508804E7.8050604@linux.intel.com>
Date: Wed, 24 Oct 2012 08:10:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1350898411.git.ross.burton@intel.com>
	<5086E7B1.2090702@linux.intel.com>
In-Reply-To: <5086E7B1.2090702@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add Xorg driver ABI dependencies
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
X-List-Received-Date: Wed, 24 Oct 2012 15:34:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2012 11:53 AM, Saul Wold wrote:
> On 10/22/2012 02:37 AM, Ross Burton wrote:
>> Hi,
>>
>> The xserver driver ABIs frequently change and as such are versioned.
>> It's
>> entirely possible to build an image with an Xserver with ABI 13 but
>> drivers
>> using ABI 11, and in this situation the server won't load the
>> modules.  These
>> ABI versions have no relationship to the package version so the existing
>> dependencies can't be made stricter.
>>
>> The solution Debian (and probably others) take is to add versioned
>> Provides to
>> the server, and dependencies on those provides in the drivers.  Then
>> ABI version
>> mismatches become package dependencies errors and are caught at image
>> construction time, not boot time.
>>
>> Ross
>>
>> The following changes since commit
>> caba9cbfce09f19eb27f4c6615c0c5c48e1a2952:
>>
>>    kernel.bbclass: add kernel-modules to PACKAGES (2012-10-19 23:06:26
>> +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib ross/xorg
>>
>> for you to fetch changes up to 4bb20610fa08a2daf71f59b42929181500345e75:
>>
>>    insane: add a check for Xorg driver ABI dependencies (2012-10-22
>> 09:26:20 +0100)
>>
>> ----------------------------------------------------------------
>> Ross Burton (3):
>>        xserver-xorg: add runtime provides for the driver ABI version
> Merged into OE-Core
>>        xorg-driver: add xserver driver ABI dependencies
> Not merged yet.
>
Merged into OE-Core

Thanks
	Sau!
>>        insane: add a check for Xorg driver ABI dependencies
>>
> Merged into OE-Core
>
> Thanks
>      Sau!
>>   meta/classes/insane.bbclass                        |   20
>> ++++++++++++++-
>>   .../xorg-driver/xorg-driver-common.inc             |   17 +++++++++++-
>>   .../xorg-driver/xorg-driver-input.inc              |    4 +++
>>   .../xorg-driver/xorg-driver-video.inc              |    3 +++
>>   .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   27
>> +++++++++++++++++++-
>>   5 files changed, 68 insertions(+), 3 deletions(-)
>>
>> Ross Burton (3):
>>    xserver-xorg: add runtime provides for the driver ABI version
>>    xorg-driver: add xserver driver ABI dependencies
>>    insane: add a check for Xorg driver ABI dependencies
>>
>>   meta/classes/insane.bbclass                        |   20
>> ++++++++++++++-
>>   .../xorg-driver/xorg-driver-common.inc             |   17 +++++++++++-
>>   .../xorg-driver/xorg-driver-input.inc              |    4 +++
>>   .../xorg-driver/xorg-driver-video.inc              |    3 +++
>>   .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   27
>> +++++++++++++++++++-
>>   5 files changed, 68 insertions(+), 3 deletions(-)
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


