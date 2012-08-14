Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T1FhK-0007so-MF
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 13:54:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 04:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="180473910"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2012 04:42:00 -0700
Message-ID: <502A3A08.8020506@intel.com>
Date: Tue, 14 Aug 2012 14:44:08 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
	<20120814112542.GA3444@ad.chargestorm.se>
In-Reply-To: <20120814112542.GA3444@ad.chargestorm.se>
Subject: Re: [PATCH] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 14 Aug 2012 11:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/14/2012 02:25 PM, Anders Darander wrote:
> * Radu Moisan <radu.moisan@intel.com> [120814 11:01]:
>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>   .../B921600.patch                                  |    0
>>   .../busybox-appletlib-dependency.patch             |    0
>>   .../busybox-mkfs-minix-tests_bigendian.patch       |    0
>>   .../busybox-udhcpc-no_deconfig.patch               |   37 +++++++++-----------
>>   .../{busybox-1.19.4 => busybox-1.20.2}/defconfig   |    0
> Are there no changes to the configuration file? I.e. new and removed
> options?
None that I know about, I've took a quick look over the changelog but 
nothing cought my eye. I you find anything, just point it out and I'll 
deep dive on it.

radu


