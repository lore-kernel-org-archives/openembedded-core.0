Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1TRu17-0000ps-Pq
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Oct 2012 02:12:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Oct 2012 16:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="238814264"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2012 08:26:07 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2D0A02C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:26:06 -0700 (PDT)
Message-ID: <508AAB82.5030005@linux.intel.com>
Date: Fri, 26 Oct 2012 18:25:54 +0300
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
Organization: Intel OTC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121022 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
	<040de77b972b11336e88c593cf2a7571977347db.1351261721.git.mihaix.lindner@linux.intel.com>
	<3432214.SFZEzFPHYM@helios>
In-Reply-To: <3432214.SFZEzFPHYM@helios>
Subject: Re: [PATCH 1/2] lsb_release: add sanity to avoid Unknown
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
X-List-Received-Date: Sat, 27 Oct 2012 00:12:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2012 05:44 PM, Paul Eggleton wrote:
> On Friday 26 October 2012 17:37:17 Mihai Lindner wrote:
>> Check for lsb_release command (package name should be lsb-release for
>> most package managers) to avoid "Unknown" Linux distributions, untested
>> distro warnings and "Unknown" dir in ./sstate-cache/
>> Also add lsb-release in host's software needs, Fedora and CentOS for now.
>>
>> Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
>> ---
>>   documentation/poky.ent      | 4 ++--
>>   meta/classes/sanity.bbclass | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/documentation/poky.ent b/documentation/poky.ent
>> index 8e0af71..ae8e70e 100644
>> --- a/documentation/poky.ent
>> +++ b/documentation/poky.ent
>> @@ -50,8 +50,8 @@
>>   <!ENTITY OE_INIT_FILE "oe-init-build-env">
>>   <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "awk wget git-core diffstat unzip
>> texinfo build-essential chrpath"> <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL
>> "awk make wget tar bzip2 gzip python unzip perl patch diffutils diffstat
>> git -cpp gcc gcc-c++ eglibc-devel texinfo chrpath ccache">
>> +cpp gcc gcc-c++ eglibc-devel texinfo chrpath ccache lsb-release">
>>   <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath
>> make wget diffstat texinfo python-curses"> <!ENTITY
>> CENTOS_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip python unzip
>> perl patch diffutils diffstat git -cpp gcc gcc-c++ glibc-devel texinfo
>> chrpath">
>> +cpp gcc gcc-c++ glibc-devel texinfo chrpath lsb-release">
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 3806bc5..f0cc11c 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -2,7 +2,7 @@
>>   # Sanity check the users setup for common misconfigurations
>>   #
>>
>> -SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip
>> gawk chrpath wget cpio" +SANITY_REQUIRED_UTILITIES ?= "bzip2 chrpath cpio
>> diffstat gawk git gzip lsb_release makeinfo patch tar wget"
>>
>>   python check_bblayers_conf() {
>>       bblayers_fn = os.path.join(d.getVar('TOPDIR', True),
>> 'conf/bblayers.conf')
>
> I don't particularly like this, because on some distros LSB comes as one
> package which pulls in a whole bunch of unnecessary things for a headless
> server. I think we need an alternative fix for this for the cases where
> lsb_release is not available.
>
> Cheers,
> Paul
>

You're right Paul. Thanks.
Please ignore this patch.

2/2 should still apply though.

Cheers,

-- 
Mihai Lindner


