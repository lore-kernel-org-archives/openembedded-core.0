Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0214560974
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 10:40:27 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2013 03:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="246088859"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2013 03:40:27 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.3]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.127]) with mapi id
	14.03.0123.003; Fri, 24 May 2013 11:40:23 +0100
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 4/7] libsoup-2.4: Update from 2.42.1 to 2.43.1
Thread-Index: AQHOWF+FHWukpArHDEC7viBulytr9ZkUAQMAgAABxwCAAB9p0A==
Date: Fri, 24 May 2013 10:40:24 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3022AB2D0@IRSMSX105.ger.corp.intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<f0b5620742216d1c7edaf721b5be599fb8c1a044.1369386157.git.ionutx.radu@intel.com>
	<CAJTo0La4fnedhZLWVTGruWSbP_MhOLa5WFW1_6-0KJrCMp_4_Q@mail.gmail.com>
	<2891613.OHSbzUYamb@helios>
In-Reply-To: <2891613.OHSbzUYamb@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] libsoup-2.4: Update from 2.42.1 to 2.43.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 May 2013 10:40:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Friday, May 24, 2013 12:36 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Burton, Ross; Radu, IonutX; Saul Wold; Ciobanu, Emilia Maria Silvia
> Subject: Re: [OE-core] [PATCH 4/7] libsoup-2.4: Update from 2.42.1 to 2.4=
3.1
>=20
> On Friday 24 May 2013 10:30:00 Burton, Ross wrote:
> > NACK.  libsoup is GNOMEy, so odd minor versions indicate development
> > releases.  Stick with 2.42.x until 2.44.x appears.
>=20
> Could we just add some logic to distrodata.bbclass so that we don't get
> reports of needing to upgrade to these unstable releases?

We thought about this situation. Because for different packages, the=20
development  versions have their own naming convention, the solution
was to hardcode each case individually.

For the moment, when a maintainer finds such a package, he/she should=20
update the  upstream_tracking.inc file with the flag NO_UPGRADE_REASON
set to "Development Version" or any relevant message and the CHECK_DATE
to the moment when the check was done.

Thanks,
Ema

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

