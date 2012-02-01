Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rsjb1-0002kq-KY
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 00:28:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2012 15:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119336691"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2012 15:20:15 -0800
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 1 Feb 2012 15:20:12 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.31]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.146]) with mapi id
	14.01.0355.002; Wed, 1 Feb 2012 15:20:05 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/8] gmp: upgrade from 5.0.2 to 5.0.3
Thread-Index: AQHM4SxvqQE86Fv4NUKqqpB6fHzOSJYpHicA//+PM9A=
Date: Wed, 1 Feb 2012 23:20:11 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C012FB236@ORSMSX106.amr.corp.intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<c960e8c29574bd5b5ca6649394468169ec264854.1328133261.git.nitin.a.kamble@intel.com>
	<CAMKF1srmsx1KQ_3Y4===JVFaOHaPMt7nyanjymD=yF+ksQO9JQ@mail.gmail.com>
In-Reply-To: <CAMKF1srmsx1KQ_3Y4===JVFaOHaPMt7nyanjymD=yF+ksQO9JQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 2/8] gmp: upgrade from 5.0.2 to 5.0.3
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
X-List-Received-Date: Wed, 01 Feb 2012 23:28:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Wednesday, February 01, 2012 2:03 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 2/8] gmp: upgrade from 5.0.2 to 5.0.3
>=20
> On Wed, Feb 1, 2012 at 1:55 PM,  <nitin.a.kamble@intel.com> wrote:
> >
> > Removed sh4-asmfix.patch as it is not needed with the newer code.
>=20
> has it been applied upstream ? or is there any other reason that fixes
> the underlying problem.
The code the patch is patching is restructured in the new version, and look=
ing at the patch it is not needed anymore.

Nitin


>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


