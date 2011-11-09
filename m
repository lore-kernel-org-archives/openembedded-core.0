Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RODhx-0007H2-VF
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 20:21:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2011 11:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72954584"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga002.jf.intel.com with ESMTP; 09 Nov 2011 11:14:57 -0800
Message-ID: <4EBAD131.1040000@linux.intel.com>
Date: Wed, 09 Nov 2011 11:14:57 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320799787.git.josh@linux.intel.com>
	<dd949a69e2e7c9379caf5bb6162259c4f2584ea5.1320799787.git.josh@linux.intel.com>
	<8EF5D367-6159-471F-8F2C-F3FA3216F05D@dominion.thruhere.net>
In-Reply-To: <8EF5D367-6159-471F-8F2C-F3FA3216F05D@dominion.thruhere.net>
Subject: Re: [PATCH 2/3] classes/[gnome|gnomebase|mime]: enhance gnome related classes
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
X-List-Received-Date: Wed, 09 Nov 2011 19:21:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/11/11 01:27, Koen Kooi wrote:
> 
> Op 9 nov. 2011, om 01:53 heeft Joshua Lock het volgende geschreven:
> 
>> This patch pulls in the gnome related classes from oe-core which
>> adds extra packaging rules and functionality whilst modularising things
>> so that one can get a subset of gnome functionality without adding a lot
>> of extra dependencies.
>>
>> These aren't an exact copy of the classes from meta-openembedded, notable
>> differences are:
>> * gnome.bbclass - I dropped the BBCLASSEXTEND
> 
> It looks that will break a number of things in meta-oe, why was it dropped?

Richard didn't want us to add native variants of everything that uses
the gnome class.
At least in the short term it should be easy enough to keep meta-oe's
gnome.bbclass where the BBCLASSEXTEND is still set.

Whether you'd want to keep that or instead set BBCLASSEXTEND in the
required places feels like a policy decision for meta-oe.

>> * mime.bbclass:
>>  - updated coding style
>>  - use which to find update-mime-database program rather than hard coded
>>  - fix typo in populate_packges_append such that it's actually called
> 
> Will it drag in the shared-mime-info-data package you created automatically now?
> 
> Also, do you have matching patches to update meta-oe now that these things are heading into oe-core?

I have not, I wanted to see what the feedback on this series was.
Particularly the BBCLASSEXTEND bit as above.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


