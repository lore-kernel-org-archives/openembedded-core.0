Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RciNR-00041B-S3
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:55:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2011 10:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89184045"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO [10.7.199.156])
	([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 10:48:54 -0800
Message-ID: <4EEF8714.70001@linux.intel.com>
Date: Mon, 19 Dec 2011 10:48:52 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1323991540.git.josh@linux.intel.com>
	<eec8014c76be16e9a58c34f5a448231a74abd445.1323991540.git.josh@linux.intel.com>
	<CAMKF1soSb-Gh+UD-aZe31cGm=+nQY2SXk-GfRwW3Er35N0z7yQ@mail.gmail.com>
In-Reply-To: <CAMKF1soSb-Gh+UD-aZe31cGm=+nQY2SXk-GfRwW3Er35N0z7yQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] udev: fix LICENSE fields to be SPDX compliant
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
X-List-Received-Date: Mon, 19 Dec 2011 18:55:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 15/12/11 23:36, Khem Raj wrote:
> 
> 
> On Thursday, December 15, 2011, Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>> wrote:
>> Additionally I'm not sure where the LGPL license came from, the COPYING
>> file and Fedora both say GPL v2 or later so drop the LGPL entry for now.

Of course, the LGPL is for libudev!

>>
>> Signed-off-by: Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>>
>> ---
>>  meta/recipes-core/udev/udev-new.inc |    2 +-
>>  meta/recipes-core/udev/udev.inc     |    4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/udev/udev-new.inc
> b/meta/recipes-core/udev/udev-new.inc
>> index eac7903..769d54a 100644
>> --- a/meta/recipes-core/udev/udev-new.inc
>> +++ b/meta/recipes-core/udev/udev-new.inc
>> @@ -2,7 +2,7 @@ SUMMARY = "/dev/ and hotplug management daemon"
>>  DESCRIPTION = "udev is a daemon which dynamically creates and removes
> device nodes from \
>>  /dev/, handles hotplug events and loads drivers at boot time."
>>  HOMEPAGE =
> "http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html"
>> -LICENSE = "GPLv2+ & LGPLv2.1+"
>> +LICENSE = "GPL-2.0+"
>>  LICENSE_${PN} = "GPLv2+
> 
> Why two notations for Gpl v2 above

Good catch, thanks!

I'll get an updated patch series out.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


