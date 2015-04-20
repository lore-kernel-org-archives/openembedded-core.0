Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFA365CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 07:33:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K7XZmL025904
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Apr 2015 00:33:35 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.14]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0224.002;
	Mon, 20 Apr 2015 00:33:34 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/2] linux-firmware: fix the mess of licenses
Thread-Index: AQHQeP3nJ5OnVGYOIEimzDzU/8FPX51VhMSg
Date: Mon, 20 Apr 2015 07:33:34 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF0D2A540@ALA-MBA.corp.ad.wrs.com>
References: <cover.1428891074.git.jackie.huang@windriver.com>
	<3157820.pKsNW7iWxA@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3157820.pKsNW7iWxA@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] linux-firmware: fix the mess of licenses
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
X-List-Received-Date: Mon, 20 Apr 2015 07:33:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Friday, April 17, 2015 7:02 PM
> To: Huang, Jie (Jackie)
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/2] linux-firmware: fix the mess of licens=
es
>=20
> Hi Jackie,
>=20
> On Monday 13 April 2015 10:17:19 jackie.huang@windriver.com wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > linux-firmware includes many firmwares and each firmware has their own
> > license, previously the LICENSE is set to "Proprietary" and some
> > firmware is split out to separate package such as
> > linux-firmware-radeon and LICENSE_linux-firmware-radeon is set to
> > "Firmware-radeon", but there is no license file in the common-licenses,=
 so we got a lot warnings
> like:
> >
> > WARNING: The license listed Firmware-radeon was not in the licenses
> > collected for linux-firmware
> >
> > These include adding the missing license files and re-orgnize the
> > codes to fix the warnings and avoid the mess.
>=20
> So doing this cleanup is good, thanks; but I was wondering if we needed a=
n alternative approach for
> linux-firmware. Most of the licenses in it aren't in any way common, and =
new ones will be added
> from time to time, requiring us to not only update the recipe (probably u=
navoidable) but also add
> the licenses to the common license directory. Is there any way we could m=
ake it so we at least only
> have to update the recipe and dispense with the need to add a bunch of co=
mmon license files that
> are only applicable to linux-firmware?

Maybe we can keep those linux-firmware licenses in the recipe directory ins=
tead of COMMON_LICENSE_DIR
and add LICENSE_PATH +=3D "${COREBASE}/meta/ recipes-kernel/linux-firmware/=
files"?

Thanks,
Jackie

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

