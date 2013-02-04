Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2J8c-0007BZ-0c
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 11:18:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 02:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="286233193"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2013 02:03:07 -0800
Message-ID: <510F875B.9070903@intel.com>
Date: Mon, 04 Feb 2013 12:03:07 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
	<510F8388.2030809@topic.nl>
In-Reply-To: <510F8388.2030809@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Mon, 04 Feb 2013 10:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/04/2013 11:46 AM, Mike Looijmans wrote:
> On 02/04/2013 10:26 AM, Laurentiu Palcu wrote:
>> > Hi,
>> >
>> > Re-generating applications' cache every time the system is rebooted is not a
>> > very efficient process for an embedded device. Usually, the cache directory is
>> > used by applications to store data resulting from time consmuming I/O or
>> > calculation. So, this patchset will take out /var/cache from tmpfs.
> What if you have a READONLY rootfs? This patch will "break" those 
> devices I think.
> 
> 

Not necessarily. We are trying to have all postinstalls run on host, so
we don't have to do any postinstall activity on target. Any cache
generated during postinstall, will be generated at do_rootfs time. Then,
we can deploy the image with the cache already in place.

Also, on a RO rootfs, there is really no need to update the cache since
the cached files do not really change. Hence, the cache created on host
should, in theory, be valid.

If the above logic is missing anything, feel free to correct me.

Thanks,
Laurentiu


