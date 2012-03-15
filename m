Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8D99-0005UU-Rv
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:03:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 08:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121332704"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 08:53:03 -0700
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 15 Mar 2012 08:53:02 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.154]) with mapi id
	14.01.0355.002; Thu, 15 Mar 2012 08:53:02 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/8] python: fix install when libdir is not
	"lib"
Thread-Index: AQHNAk+0kuYt965Ny06M0uScCbELvZZrIA8AgABih2A=
Date: Thu, 15 Mar 2012 15:53:02 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C01376622@ORSMSX106.amr.corp.intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<1b743bf3864539a8ce1902a269a5cec7d50dba1b.1331776832.git.nitin.a.kamble@intel.com>
	<4F615B1E.1060004@opendreambox.org>
In-Reply-To: <4F615B1E.1060004@opendreambox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] python: fix install when libdir is not "lib"
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
X-List-Received-Date: Thu, 15 Mar 2012 16:03:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Andreas Oberritter
> Sent: Wednesday, March 14, 2012 8:00 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 5/8] python: fix install when libdir is
> not "lib"
>=20
> Hello Nitin,
>=20
> On 15.03.2012 03:02, nitin.a.kamble@intel.com wrote:
> > --- a/meta/recipes-devtools/python/python_2.7.2.bb
> > +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> > @@ -20,7 +20,7 @@ SRC_URI +=3D "\
> >    file://setup_py_skip_cross_import_check.patch \
> >    file://add-md5module-support.patch \
> >    file://host_include_contamination.patch \
> > -  file://sys_platform_is_now_always_linux2.patch \
>=20
> did you remove this one by accident?
>=20
> Regards,
> Andreas
>=20
Andreas,
Yes, it was an accident. I will correct it. Thanks for catching.

Nitin


