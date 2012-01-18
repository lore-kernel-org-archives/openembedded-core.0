Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RnKWQ-0000X9-RX
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 02:41:07 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 17:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57471018"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 17:33:28 -0800
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 17 Jan 2012 17:33:27 -0800
Received: from orsmsx105.amr.corp.intel.com ([169.254.4.248]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.13]) with mapi id
	14.01.0355.002; Tue, 17 Jan 2012 17:33:27 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/5] bdwgc: new recipe for autogen
Thread-Index: AQHM1VcBUBzdc4w0406ji+Trwlz3apYRuTsA//+c71CAAAFYkA==
Date: Wed, 18 Jan 2012 01:33:26 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0128F67C@ORSMSX105.amr.corp.intel.com>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<CAMKF1sriceDbz_scyB-TthDOWEzK+t9i0wgEJ_No=v_NF18JjA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0128E66B@ORSMSX105.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0128E66B@ORSMSX105.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] bdwgc: new recipe for autogen
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
X-List-Received-Date: Wed, 18 Jan 2012 01:41:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Kamble, Nitin A
> Sent: Tuesday, January 17, 2012 5:29 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/5] bdwgc: new recipe for autogen
>=20
> Khem,
> Here was the configure error:
> | configure: error: Package requirements (bdw-gc) were not met:
> |
> | No package 'bdw-gc' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables BDW_GC_CFLAGS
> | and BDW_GC_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | ERROR: oe_runconf failed
>=20
> Nitin
>=20
And it is being used in this c file: libguile/threads.c

Thanks,
Nitin

>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> > Khem Raj
> > Sent: Tuesday, January 17, 2012 3:23 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 1/5] bdwgc: new recipe for autogen
> >
> > On Tue, Jan 17, 2012 at 12:30 PM,  <nitin.a.kamble@intel.com> wrote:
> > > This recipe is needed by guile.
> > > And guile is needed for autogen.
> >
> > is this really needed by guile. if yes what part of guide need it ?
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


