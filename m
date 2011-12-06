Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RXkdw-00055j-Am
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 03:20:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 18:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,302,1320652800"; d="scan'208";a="82547233"
Received: from unknown (HELO [10.255.12.192]) ([10.255.12.192])
	by azsmga001.ch.intel.com with ESMTP; 05 Dec 2011 18:13:40 -0800
Message-ID: <4EDD7A54.5070707@linux.intel.com>
Date: Mon, 05 Dec 2011 18:13:40 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1322853315.git.josh@linux.intel.com>
	<1323125404.25960.107.camel@ted> <4EDD4BD2.7010703@linux.intel.com>
In-Reply-To: <4EDD4BD2.7010703@linux.intel.com>
Subject: Re: [PATCH 0/1] Make missing checksums an error
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
X-List-Received-Date: Tue, 06 Dec 2011 02:20:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/12/11 14:55, Joshua Lock wrote:
> On 05/12/11 14:50, Richard Purdie wrote:
>> On Fri, 2011-12-02 at 11:20 -0800, Joshua Lock wrote:
>>> NOTE: this requires a patch I sent to the BitBake list[1] to error cleanly,
>>> otherwise you'll see a Python backtrace and the build fail...
>>>
>>> Per some discussion on the list recently this patch sets BB_STRICT_CHECKSUM
>>> in the default-distrovars.inc so that missing checksums in recipes raises an
>>> error.
>>>
>>> Cheers,
>>> Joshua
>>
>> What's the state of master? If I merge this, how badly do things
>> explode?
> 
> Let me run a universe fetchall and get back to you...

Two recipes in oe-core require checksums adding, puzzles and
omap3-sgx-modules - a v2 of this request with those patches is incoming.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


