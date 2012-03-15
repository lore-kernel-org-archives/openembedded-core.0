Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8DIU-0007Xv-4C
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:13:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 09:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121336879"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 09:03:44 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 15 Mar 2012 09:03:43 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.199]) with mapi id
	14.01.0355.002; Thu, 15 Mar 2012 09:03:43 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 7/8] gcc: remove the 64bithack patch
Thread-Index: AQHNAk+zyQ01G+x9uEG/yXflna3B1pZrfIoAgAAHwrA=
Date: Thu, 15 Mar 2012 16:03:42 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C01376643@ORSMSX106.amr.corp.intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<9152da8c4a5a72705532722a11a3bfdaa0fe4787.1331776832.git.nitin.a.kamble@intel.com>
	<1331800242.18586.70.camel@ted>
In-Reply-To: <1331800242.18586.70.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 7/8] gcc: remove the 64bithack patch
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
X-List-Received-Date: Thu, 15 Mar 2012 16:13:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Thursday, March 15, 2012 1:31 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 7/8] gcc: remove the 64bithack patch
>=20
> On Wed, 2012-03-14 at 19:02 -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > and bump PR
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-4.6.inc             |    1 -
> >  meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   68 -----------
> ----------
> >  2 files changed, 0 insertions(+), 69 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
>=20
>=20
> As far as I can tell whilst this will make multilib work on the target
> device, since you've removed this patch, the actual -cross toolchains
> used for multilib builds will be broken since they may or may not look
> in the correct libdir?
>=20
> Cheers,
>=20
> Richard
>=20

Hi Richard,
  This is not an issue. do_gcc_multilib_setup() is always configuring the g=
cc multilib files. For cross gcc recipes it is only using DEFAULTTUNE while=
 for target it is using DEFAULTTUNE & MULTILIB_VARIENTS. Also in my testing=
 cross gcc recipes did not have any such issues.

Thanks,
Nitin



