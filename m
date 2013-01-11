Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtgtH-0000A7-3r
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 16:51:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jan 2013 07:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,452,1355126400"; d="scan'208";a="245240755"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2013 07:36:14 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.13]) with mapi id
	14.01.0355.002; Fri, 11 Jan 2013 15:35:59 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>, "Wold, Saul" <saul.wold@intel.com>
Thread-Topic: [OE-core] [PATCH V2] connman: upgrade to 1.10
Thread-Index: AQHN72JVsCnwMsz9GEep0c4GIwYYz5hDAuWAgAA7fwCAAP7ZAIAABlNg
Date: Fri, 11 Jan 2013 15:35:59 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DCF13@IRSMSX102.ger.corp.intel.com>
References: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LaWTPXh9Ph+LFMK+44t3T+TN-uZXXEwJg7yoOmcUZCL1A@mail.gmail.com>
	<1357862392.4072.3.camel@ted> <1357917120.4072.73.camel@ted>
In-Reply-To: <1357917120.4072.73.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] connman: upgrade to 1.10
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
X-List-Received-Date: Fri, 11 Jan 2013 15:51:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Richard, Saul,

Which versions of connman upgrade patches were used? V2 or V3?

Also, does the issue will be present with V3 also?

Regards,
Cristian


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Friday, January 11, 2013 5:12 PM
To: Burton, Ross
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V2] connman: upgrade to 1.10

On Thu, 2013-01-10 at 23:59 +0000, Richard Purdie wrote:
> On Thu, 2013-01-10 at 20:26 +0000, Burton, Ross wrote:
> > On 10 January 2013 18:42, Cristian Iorga <cristian.iorga@intel.com> wro=
te:
> > > 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
> > >     - adapted to the new version
> > >
> > > 0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
> > >     - patch removed (it is included in the new version)
> > >
> > > inet-fix-ip-cleanup-functions.patch: added
> > >     - fix for ip cleanup functions
> > >
> > > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> >=20
> > Also document the point of connman-conf.
> >=20
> > > diff --git a/meta/conf/machine/include/qemu.inc=20
> > > b/meta/conf/machine/include/qemu.inc
> > > index 5d59a7f..41fe552 100644
> > > --- a/meta/conf/machine/include/qemu.inc
> > > +++ b/meta/conf/machine/include/qemu.inc
> > > @@ -10,6 +10,8 @@ XSERVER ?=3D "xserver-xorg \
> > >
> > >  MACHINE_FEATURES =3D "apm alsa pcmcia bluetooth irda usbgadget scree=
n"
> > >
> > > +MACHINEOVERRIDES .=3D ":qemu"
> > > +
> >=20
> > Please submit this as a separate patch, it's effectively unrelated to c=
onnman.
>=20
> Please don't use "qemu", use something like qemuall or allqemu since I=20
> have some thoughts about how this might interact with the qemu class,=20
> most involving the word "badly" ;-).

Saul included this change in MUT on the autobuilders. I've just lost a load=
 of time wondering why we had an odd world autobuilder failure:

http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/439/=
steps/shell_43/logs/stdio

This override patch was why :(.

Cheers,

Richard


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


