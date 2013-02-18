Received: from atl4mhob07.myregisteredsite.com ([209.17.115.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U7QnU-0008Oj-5y
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:30:26 +0100
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1IDECRP017657 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 08:14:12 -0500
Received: (qmail 8983 invoked by uid 0); 18 Feb 2013 13:14:12 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 18 Feb 2013 13:14:12 -0000
Message-ID: <51222923.8040104@topic.nl>
Date: Mon, 18 Feb 2013 14:14:11 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl> <5116A5DA.90500@topic.nl>
	<CA+chaQfz1S1H4240eArHGYEc8Dh=ghzyLYVm1Eu8JyBWbgWMvA@mail.gmail.com>
	<A551BDF323A45B48ACE6A404AA16A1C4127A434C@TOP-EX01.TOPIC.LOCAL>
	<20130210195919.GA3300@jama> <51220AAC.8080201@topic.nl>
	<CAJTo0LbTZWh7-S3i+GmcPHDoRaRTN6BUniBcoX5_=eE6j21AuQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbTZWh7-S3i+GmcPHDoRaRTN6BUniBcoX5_=eE6j21AuQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-core] How do I find out why are packages being rebuilt?
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
X-List-Received-Date: Mon, 18 Feb 2013 13:30:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2013 12:11 PM, Burton, Ross wrote:
> On 18 February 2013 11:04, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> I'm still having trouble with packages being needlessly rebuilt over and
>> over. The worst of all it qt4-embedded, it takes about an hour to build.
>> This is wasting a LOT of time.
>>
>> The classic OE never rebuilt a package until its version changed.
>
> oe-core uses checksums of dependencies to determine what to rebuild -
> so if a class you inherit changes it's populate_packages_prepend()
> then the package task will re-execute, or if a dependeny package
> rebuilds then your package will rebuild too.  If you're tracking
> oe-core master then this often means large rebuilds as there may have
> been changes to the base.bbclass or package.bbclass which obviously
> impacts everything, and the usual churn in the packages.
>
> bitbake-diffsigs will let you follow the signature differences that
> cause a rebuild up the tree to identify what has changed.

Change in oe-core I can live with. Things that puzzle me are that when I 
change the location of a bootloader data file in my local.conf, it 
suddenly decides to rebuild qt4-embedded. I also have two almost 
identical machines (same cpu, same kernel, just a few different plugs), 
and I cannot figure out why it builds two separate qt4 binaries.

So I want to diagnose that. I have no idea where to start.


