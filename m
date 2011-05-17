Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QMNl0-00011k-7B
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 19:08:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2011 09:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2861280"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 09:56:55 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 17 May 2011 09:56:55 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Tue, 17 May 2011 09:56:54 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Tue, 17 May 2011 09:56:53 -0700
Thread-Topic: [poky] GCC 4.6.0 on ARM?
Thread-Index: AcwUGx/+0YIwjbB8RSCltYo8Se7MfwAl3RUg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D8AB690D@orsmsx504.amr.corp.intel.com>
References: <4DB99F31.4000308@mlbassoc.com>
	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBEAA2C.1020601@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0101@orsmsx504.amr.corp.intel.com>
	<4DCA6C60.6050203@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0328@orsmsx504.amr.corp.intel.com>
	<4DCAADC0.9030106@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D8A2E4FE@orsmsx504.amr.corp.intel.com>
	<4DD1A942.7060400@mlbassoc.com>
In-Reply-To: <4DD1A942.7060400@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Tue, 17 May 2011 17:08:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Gary Thomas [mailto:gary@mlbassoc.com]
> Sent: Monday, May 16, 2011 3:46 PM
> To: Kamble, Nitin A
> Cc: Khem Raj; Poky Project; Patches and discussions about the oe-core
> layer
> Subject: Re: [poky] GCC 4.6.0 on ARM?
>=20
> On 05/16/2011 03:26 PM, Kamble, Nitin A wrote:
> > Gary,
> >   I tried with qemuarm machine in the yocto tree. And I find the usb
> devices are working when compiled with gcc 4.6.0
>=20
> Can you try it on the beagleboard?
>=20
> Also, it's not that the USB device isn't found, rather no devices
> connected to
> the USB bus are discovered.
>=20

Gary,
  I don't have a beagle board to try out. If you can put some debug printks=
 in the code to figure out what is happening in there. And for qemuarm mach=
ine the mouse(touchpad) and keyboards are working.

Thanks,
Nitin



