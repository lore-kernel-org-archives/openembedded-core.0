Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RXhXu-0005jR-83
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 00:02:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Dec 2011 14:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83727555"
Received: from unknown (HELO [10.7.199.147]) ([10.7.199.147])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2011 14:55:15 -0800
Message-ID: <4EDD4BD2.7010703@linux.intel.com>
Date: Mon, 05 Dec 2011 14:55:14 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1322853315.git.josh@linux.intel.com>
	<1323125404.25960.107.camel@ted>
In-Reply-To: <1323125404.25960.107.camel@ted>
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
X-List-Received-Date: Mon, 05 Dec 2011 23:02:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/12/11 14:50, Richard Purdie wrote:
> On Fri, 2011-12-02 at 11:20 -0800, Joshua Lock wrote:
>> NOTE: this requires a patch I sent to the BitBake list[1] to error cleanly,
>> otherwise you'll see a Python backtrace and the build fail...
>>
>> Per some discussion on the list recently this patch sets BB_STRICT_CHECKSUM
>> in the default-distrovars.inc so that missing checksums in recipes raises an
>> error.
>>
>> Cheers,
>> Joshua
> 
> What's the state of master? If I merge this, how badly do things
> explode?

Let me run a universe fetchall and get back to you...

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


