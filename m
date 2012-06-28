Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SkINV-0001jF-KZ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 19:19:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2012 10:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161867788"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2012 10:08:41 -0700
Message-ID: <4FEC8F99.9080100@linux.intel.com>
Date: Thu, 28 Jun 2012 10:08:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340876879-3690-1-git-send-email-jackie.huang@windriver.com>
	<1340876879-3690-2-git-send-email-jackie.huang@windriver.com>
	<F7D3BA9A-464D-4DC2-BD70-84D2D10FBF16@dominion.thruhere.net>
	<10317249.W4Cacltz0J@helios>
In-Reply-To: <10317249.W4Cacltz0J@helios>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] ruby: Add ruby 1.9.3 recipe
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
X-List-Received-Date: Thu, 28 Jun 2012 17:19:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2012 09:24 AM, Paul Eggleton wrote:
> On Thursday 28 June 2012 18:02:47 Koen Kooi wrote:
>> Op 28 jun. 2012, om 11:47 heeft<jackie.huang@windriver.com>
> <jackie.huang@windriver.com>  het volgende geschreven:
>>> From: Jackie Huang<jackie.huang@windriver.com>
>>>
>>> Took ruby 1.8.7 from OE and updated to 1.9.3-p194.
>>> Most of the 1.9.3 patches originate from ruby-1.9.3.194-10.1.fc17.src.rpm
>>
>> Is ruby something that belongs into oe-core?
>
> I was thinking the same thing - it's not something that everyone needs, so
> really it doesn't belong there IMHO.
>
> Where it should go is another question. If we would expect to add lots of
> supplementary ruby recipes in future then perhaps its own layer would be
> appropriate; otherwise I guess it can go into meta-oe.
>
Agreed, oe-core is not the right place, meta-oe would be right place to 
start, it is upgrading a recipe from OE-Classic.

Sau!

> Cheers,
> Paul
>


