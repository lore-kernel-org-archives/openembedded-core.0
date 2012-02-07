Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1RuhLI-0007vb-VJ
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 10:28:05 +0100
Received: by werc1 with SMTP id c1so5458134wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 01:20:03 -0800 (PST)
Received: by 10.216.135.15 with SMTP id t15mr8526833wei.3.1328606402925;
	Tue, 07 Feb 2012 01:20:02 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s8sm22053996wiz.8.2012.02.07.01.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 01:20:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <20120207070631.GA3893@jama.jama.net>
Date: Tue, 7 Feb 2012 10:20:01 +0100
Message-Id: <A2BDCAC6-74B7-4942-9941-79A8D0306847@beagleboard.org>
References: <9c76056351fe4e2b9537729ffca3b4506b720513.1328135056.git.dvhart@linux.intel.com>
	<4F2AE4E8.3080809@linux.intel.com>
	<4F2AFBF7.8010307@linux.intel.com> <1405123.nGGmjXUAYO@helios>
	<4F306968.9000902@linux.intel.com>
	<20120207070631.GA3893@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [pull-sys940x 2/4] ranpwd: Add ranpwd recipe
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
X-List-Received-Date: Tue, 07 Feb 2012 09:28:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 feb. 2012, om 08:06 heeft Martin Jansa het volgende geschreven:

> On Mon, Feb 06, 2012 at 03:59:36PM -0800, Joshua Lock wrote:
>> On 06/02/12 08:17, Paul Eggleton wrote:
>>> On Thursday 02 February 2012 13:11:19 Joshua Lock wrote:
>>>> Apologies. I'm wrong here. It was PRIORITY which we agreed to drop.
>>>=20
>>> It's worth noting however, at the same time PRIORITY removal was =
discussed it
>>> was acknowledged that SECTION was questionable. Logical grouping of
>>> recipes/packages is a useful thing but coming up with groupings that =
are
>>> meaningful in all contexts is hard :(
>>=20
>> Glad to know my recollection isn't wildly off the mark.
>>=20
>> I noticed that there are similar, yet different, SECTION values being=20=

>> used. If we opt to keep SECTION I wonder if we should try and=20
>> standardise/sanitise it?
>=20
> If there is standardised SECTION variable why not use
> recipes-${SECTION}/foo_1.0.bb as we already have couple of recipe-*
> directories and it's sometimes hard to decide to which directory
> something belongs.
>=20
> Or other way around, standartise recipes-* directories and let bitbake
> decide SECTION from it (like it does for PV and PN).

Can we move this discussion to the oe-core list please?=


