Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TvHOE-0000Hv-MX
	for Openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 02:02:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Jan 2013 16:45:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="247361701"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by orsmga001.jf.intel.com with ESMTP; 15 Jan 2013 16:46:35 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.5]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.35]) with mapi id
	14.01.0355.002; Tue, 15 Jan 2013 16:46:35 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] xf86-video-modesetting: new recipe for
	gma500
Thread-Index: AQHN81jYfP0N8BeEYE+6EAJUHfhwDZhLoymA//97vMA=
Date: Wed, 16 Jan 2013 00:46:35 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C3F0B78B7@ORSMSX106.amr.corp.intel.com>
References: <cover.1358278958.git.nitin.a.kamble@intel.com>
	<8738a6efd777d20d444fc9b149ce75498b21202b.1358278958.git.nitin.a.kamble@intel.com>
	<50F5F6A3.4060101@linux.intel.com>
In-Reply-To: <50F5F6A3.4060101@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xf86-video-modesetting: new recipe for gma500
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
X-List-Received-Date: Wed, 16 Jan 2013 01:02:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > +++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.b
> > +++ b
> > @@ -0,0 +1,8 @@
> > +require xorg-driver-video.inc
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd8cbd99fff773f92e844948f74ef0df8"
> > +
> This seems to be wrong relative the actual version.

Yes, I missed to push that change in the commit. I am sending another pull =
request with one additional commit soon.

Thanks,
Nitin



