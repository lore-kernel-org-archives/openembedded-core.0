Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8F41671388
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 15:16:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2014 08:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,458,1406617200"; d="scan'208";a="585679544"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2014 08:14:11 -0700
Received: from irsmsx109.ger.corp.intel.com (163.33.3.23) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 3 Sep 2014 16:14:08 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.112]) by
	IRSMSX109.ger.corp.intel.com ([169.254.13.200]) with mapi id
	14.03.0195.001; Wed, 3 Sep 2014 16:14:08 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, "Musat, GeorgeX L"
	<georgex.l.musat@intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] oeqa/utils/logparser.py: results based
	log parser utility
Thread-Index: AQHPxrAGpDT/g5GKu0yuSxTHIsvUppvvcPeAgAAUWnA=
Date: Wed, 3 Sep 2014 15:14:07 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B23C4BF9C@IRSMSX103.ger.corp.intel.com>
References: <1409663439-1725-1-git-send-email-georgex.l.musat@intel.com>
	<CAJTo0Lbmrc5w2WfzMFkjNW4xHbAfjmbeeUZJwmThDXdN=iNVgA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbmrc5w2WfzMFkjNW4xHbAfjmbeeUZJwmThDXdN=iNVgA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oeqa/utils/logparser.py: results based log parser utility
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
X-List-Received-Date: Wed, 03 Sep 2014 15:16:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Burton, Ross
> Sent: Wednesday, September 03, 2014 5:59 PM
> To: Musat, GeorgeX L
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH 1/2] oeqa/utils/logparser.py: results based=
 log
> parser utility
>=20
> On 2 September 2014 14:10, Lucian Musat <georgex.l.musat@intel.com>
> wrote:
> > +sys.path.insert(0,
> > +os.path.abspath(os.path.join(os.path.dirname(__file__), '..',
> > +'meta/lib'))) import oeqa.utils.ftools as ftools
>=20
> Doesn't that add .../poky/meta/lib/oeqa/meta/lib to the search path, whic=
h
> doesn't make any sense.  You shouldn't need to mess with the path to impo=
rt
> a sibling module.
>=20
> Ross


Yes, that should be removed. It stayed over from when this was a standalone=
 script. Please remove this and just use 'import ftools' .

Regards,
Corneliu

