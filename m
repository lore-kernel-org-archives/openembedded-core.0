Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SH8Yc-00055k-JU
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 08:58:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Apr 2012 23:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="86816338"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Apr 2012 23:49:17 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 8 Apr 2012 23:49:17 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Mon, 9 Apr 2012 14:48:58 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Do we have a package that installs the kernel
	headers and config into the target?
Thread-Index: Ac0UH5sGlZsuvcTWTNSj8hhUp7EH6AB/Ii+Q
Date: Mon, 9 Apr 2012 06:48:57 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFF56B@SHSMSX102.ccr.corp.intel.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F042758F7@NAEMMAIL01.na.leapfrog.com>
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F042758F7@NAEMMAIL01.na.leapfrog.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
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
X-List-Received-Date: Mon, 09 Apr 2012 06:58:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Daniel Lazzari wrote on 2012-04-07:
>>> On 04/05/2012 09:41 PM, Cui, Dexuan wrote:
>> Surely, the "standard" way is: we should write a recipe to
>> cross-compile and install the driver. But this is difficult to the
>> students:
>> 1) They're not familiar with Poky at all, and actually the downloaded
>> wifi driver's code here seems indeed complex.
>>=20
>> 2) The students only have limited time so they intend to spend
>> most of the time on things that could make them win a prize or
>> money. :-)
>> So this actually makes Yocto less appealing to them though the
>> goal of Yocto is making developing on embedded easy...
>>=20
>>> That said, there are valid use cases, but I don't consider this a
>>> particularly high priority at the moment. I'm happy to hear other
>>> thoughts on why this should be bumped in prio though.
>> Currently I have suggested them that they should manually copy
>> The kernel headers and .config into the target.
>> Hope this can work around the issue for them.
>=20
> Any chance the students could cross compile the wifi module using
> an external toolchain?
We could try this.
But even I didn't try this before, so this needs efforts to find it out.

Thanks,
-- Dexuan




