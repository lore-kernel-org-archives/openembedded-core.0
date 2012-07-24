Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StdUw-0002MQ-NM
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 13:41:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jul 2012 04:30:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172464150"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 24 Jul 2012 04:30:25 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.87]) with mapi id
	14.01.0355.002; Tue, 24 Jul 2012 12:30:20 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/5] telepathy-glib: upgrade to ver. 0.19.4
Thread-Index: AQHNaY2syosXcGCJ/EirfiEX5H/DQ5c4S00w
Date: Tue, 24 Jul 2012 11:30:20 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1617489A@IRSMSX102.ger.corp.intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
	<1343108218-7108-2-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LbP6AhnPAUjxQ7i8Gjgxjvz-wA2Yv6cFdMb6481xd_wJg@mail.gmail.com>
In-Reply-To: <CAJTo0LbP6AhnPAUjxQ7i8Gjgxjvz-wA2Yv6cFdMb6481xd_wJg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] telepathy-glib: upgrade to ver. 0.19.4
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
X-List-Received-Date: Tue, 24 Jul 2012 11:41:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Ross, Saul, all,


Previously, an update to telepathy-glib 0.19.2 was in our yocto recipes, so=
 updating to 0.19.4 seems like an obvious choice.
This is the status with a lot of stuff we are delivering.
I am in the process of updating gstreamer, and I have received recommendati=
on to update the entire gstreamer stack to unstable versions, because we ar=
e many versions behind while being on the stable branch.
To be honest, I don't know how to proceed on gstreamer.
Please advise.

Thanks,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Burton, Ross
Sent: Tuesday, July 24, 2012 2:15 PM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH 1/5] telepathy-glib: upgrade to ver. 0.19.4

On 24 July 2012 06:36, Cristian Iorga <cristian.iorga@intel.com> wrote:
>  rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb=20
> =3D> telepathy-glib_0.19.4.bb} (80%)

I only just noticed that we're shipping the development series of telepathy=
-glib, which is a bold statement.  Telepathy follows the GNOME versioning, =
so even=3Drelease, odd=3Ddevelopment.  For telepathy, development really ca=
n mean it -- new interfaces and aggressively increased dependencies are qui=
te likely.  Once 0.20 is released it's probably best to stick with stable r=
eleases.

Ross

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


