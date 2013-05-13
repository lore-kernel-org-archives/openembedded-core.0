Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UbtX3-0001YC-Nn
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 16:15:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2013 06:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,662,1363158000"; d="scan'208";a="336796519"
Received: from sorvi.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2013 06:55:55 -0700
Message-ID: <5190F0EA.1090807@linux.intel.com>
Date: Mon, 13 May 2013 16:55:54 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120801 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
	<20130513133924.GB3187@jama>
In-Reply-To: <20130513133924.GB3187@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 14:15:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 13.05.2013 16:39, Martin Jansa wrote:
> On Mon, May 13, 2013 at 03:49:12PM +0300, Jukka Rissanen wrote:
>> Hi,
>>
>> v2:
>> - removed the DISTRO_FEATURES as suggested by Ross,
>>    now PACKAGECONFIG is used instead in connman.inc
>> - all generic vpn files are placed into connman-vpn package
>>    and vpn plugins rdepend on it
>>
>> v1:
>> this patchset enables OpenVPN, vpnc, L2TP and PPTP VPN
>> technogies in ConnMan and fixes this bug
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4456
>>
>>
>> Cheers,
>> Jukka
>>
>>
>> Jukka Rissanen (5):
>>    connman: Add VPN support
>>    connman: Add OpenVPN support
>>    connman: Add vpnc support
>>    connman: Add L2TP support
>>    connman: Add PPTP support
>
> I think that 2-5 are missing
>
> PACKAGES =+ "${PN}-vpn-foo"
>

The individual vpn plugin packages were created and added to distro 
without a problem even if they were not in PACKAGES.
But I can certainly send another version that adds these.

Cheers,
Jukka



