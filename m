Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2361D6FAC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 15:14:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 May 2014 08:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,919,1392192000"; d="scan'208";a="547166907"
Received: from msegurah-mobl4.amr.corp.intel.com (HELO [10.254.42.19])
	([10.254.42.19])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2014 08:14:15 -0700
User-Agent: Microsoft-MacOutlook/14.4.1.140326
Date: Tue, 27 May 2014 08:15:25 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <CFA9F9E5.93CF3%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] ddimage: Support Mac OS
References: <cover.1400815619.git.dvhart@linux.intel.com>
	<113fcfb0c3c5533605e87538cd873c4ff90abcfc.1400815619.git.dvhart@linux.intel.com>
	<353D7623-F316-46C6-9F83-3D59DF30F7AD@dominion.thruhere.net>
In-Reply-To: <353D7623-F316-46C6-9F83-3D59DF30F7AD@dominion.thruhere.net>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ddimage: Support Mac OS
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
X-List-Received-Date: Tue, 27 May 2014 15:14:26 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 5/24/14, 7:44, "Koen Kooi" <koen@dominion.thruhere.net> wrote:

>
>Op 23 mei 2014, om 06:28 heeft Darren Hart <dvhart@linux.intel.com> het
>volgende geschreven:
>
>> Update the ddimage script to allow it to work on Mac OS too. The biggest
>> difference is sysfs vs diskutil and in the syntax of the stat command
>> between Mac OS and Linux, unfortunately. Workarounds using ls, cut, and
>> columns got really fragile really quickly. Relying on stat and switching
>> on uname seemed the more robust solution.
>> 
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> ---
>> scripts/contrib/ddimage | 25 ++++++++++++++++++++-----
>> 1 file changed, 20 insertions(+), 5 deletions(-)
>> 
>> diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
>> index 93ebeaf..b66d0dd 100755
>> --- a/scripts/contrib/ddimage
>> +++ b/scripts/contrib/ddimage
>> @@ -1,7 +1,8 @@
>> #!/bin/sh
>> 
>> -#BLACKLIST_DEVICES="/dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde"
>> -BLACKLIST_DEVICES="/dev/sda"
>> +# Default to avoiding the first two disks on typical Linux and Mac OS
>>installs
>> +# Better safe than sorry :-)
>> +BLACKLIST_DEVICES="/dev/sda /dev/sdb /dev/disk1 /dev/disk3"
>
>s/disk3/disk2/

Bah, indeed. Local change snuck through in my patch. Thanks. Will correct.


-- 
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation




