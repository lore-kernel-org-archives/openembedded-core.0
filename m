Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFpzN-0007HH-F7
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:56:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 09:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127531309"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2012 09:47:36 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Apr 2012 09:47:36 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 00:47:34 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/3] xterm: port the recipe from OE and
	upgrade to v278
Thread-Index: AQHNE0ffRlyUWLsMmEyUJ5tWc6tLr5aMcAHA
Date: Thu, 5 Apr 2012 16:47:33 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFCEBD@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333642153.git.dexuan.cui@intel.com>
	<db6ed82ab474a1b521b8f9bcb14abee243ac63a9.1333642153.git.dexuan.cui@intel.com>
	<1567550.pQkNRWCquK@helios>
In-Reply-To: <1567550.pQkNRWCquK@helios>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] xterm: port the recipe from OE and upgrade to v278
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
X-List-Received-Date: Thu, 05 Apr 2012 16:56:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Paul Eggleton wrote on 2012-04-06:
> On Friday 06 April 2012 00:10:12 Dexuan Cui wrote:
>> The recipe is ported from OE:
>>=20
> http://git.openembedded.org/openembedded/tree/recipes/xorg-app/xterm_2
> 66.bb
>>=20
>> I upgraded it from v266 to v278.
>> I added LICENSE, LIC_FILES_CHKSUM and updated SRC_URI checksums.
>=20
> I think it's unfortunate we have to pull in xterm just for the sake of sh=
owing
> the qemu output - can we not use matchbox-terminal for this?
Thanks for the suggestion!
I suppose we could, but we need to fix bitbake as it uses /usr/bin/xterm
by hardcode...

> If we have to have it, Dexuan can you please compare this to the meta-oe
> xterm recipe as that is likely to be more up-to-date than the one in
> OE-Classic?
Ok, I'll investigate this.

Thanks,
-- Dexuan



