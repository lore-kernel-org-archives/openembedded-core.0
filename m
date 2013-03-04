Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UCRFC-0003xg-Pd for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 09:59:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2013 00:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,778,1355126400"; d="scan'208";a="270523765"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2013 00:43:09 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.15]) with mapi id
	14.01.0355.002; Mon, 4 Mar 2013 08:42:40 +0000
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] btrfs-tools: added PV to git package recipe
Thread-Index: AQHOFnZxWzbj580GUk+BAY7FnDp85piQx1UAgABs74CAAAN/AIAAST0AgAO4bLo=
Date: Mon, 4 Mar 2013 08:42:39 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3F2AF9E@IRSMSX102.ger.corp.intel.com>
References: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<1362141704.1055.56.camel@ted> <5130FD69.1020804@linux.intel.com>
	<CA+chaQewTJogM92pDtzTgQqz6f90U_F_57t8bQ0MfZx-J9h1rQ@mail.gmail.com>,
	<1362181576.11004.11.camel@ted>
In-Reply-To: <1362181576.11004.11.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] btrfs-tools: added PV to git package recipe
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
X-List-Received-Date: Mon, 04 Mar 2013 08:59:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've tried building the package after added the "0.20~rc1" tag for =0A=
PV. This format for the tag doesn't seem to be supported. I=0A=
get the following error:=0A=
 invalid tag value("^[A-Za-z0-9+._]+$") Version: Version: 0.20~rc1+git0+fdb=
6c0402337d9607c7a39155088eaf033742752=0A=
=0A=
Thanks,=0A=
Ema=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Richard Purdie [richard.purdie@=
linuxfoundation.org]=0A=
Sent: Saturday, March 02, 2013 1:46 AM=0A=
To: Martin Jansa=0A=
Cc: oe-core layer; Patches=0A=
Subject: Re: [OE-core] [PATCH v2] btrfs-tools: added PV to git package reci=
pe=0A=
=0A=
On Fri, 2013-03-01 at 20:24 +0100, Martin Jansa wrote:=0A=
> I don't think 0.20~rc1 sorts lower then 0.20 at least in opkg world:=0A=
>=0A=
>=0A=
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.20~rc1 '<=3D'=0A=
> 0.20 && echo "Y"=0A=
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.20-rc1 '<=3D'=0A=
> 0.20 && echo "Y"=0A=
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.19+0.20~rc1=0A=
> '<=3D' 0.20 && echo "Y"=0A=
> Y=0A=
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.19+0.20-rc1=0A=
> '<=3D' 0.20 && echo "Y"=0A=
> Y=0A=
=0A=
Just to follow up, I added this support to opkg itself back in 2008:=0A=
=0A=
http://code.google.com/p/opkg/source/detail?spec=3Dsvn40&r=3D40=0A=
=0A=
It would be nice to finally be able to start using it!=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=
=0A=
=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=0A=


