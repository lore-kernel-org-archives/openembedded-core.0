Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 957C8779DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 16:43:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Apr 2017 09:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,255,1488873600"; d="scan'208";a="1140486116"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2017 09:43:53 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 26 Apr 2017 09:43:53 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.213]) by
	ORSMSX113.amr.corp.intel.com ([169.254.9.59]) with mapi id
	14.03.0319.002; Wed, 26 Apr 2017 09:43:53 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/4] Reproducible binaries
Thread-Index: AQHSve/H0RnFKsoUjUy3r4mWvWsL7aHW3z0A//+V67OAAUWMAIAAHehw
Date: Wed, 26 Apr 2017 16:43:52 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
	<20170426074212.GB3258@jama>
In-Reply-To: <20170426074212.GB3258@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Wed, 26 Apr 2017 16:43:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> But not for 2 different builds with slightly modified metadata (e.g.
> just because top commit is different in whatever build repository you're
> running from even when it doesn't have any effect in your image), right?
>=20

This may be addressed in the future. Presently, the goal is to ensure that =
if we
use identical repositories we get identical results. This should not depend
on the time/date, build folder or even Linux distro. By identical results
I mean binary identical comparison of the resulting "deploy" folders.
(images, packages, licenses). So for example, there should be no binary dif=
ferences=20
between the two images of core-image-minimal.rootfs.ext4.
In your case (slightly different repos), the difference would be presented=
=20
as different time stamps for /etc/version and /etc/timestamp only.


> So it doesn't fix the files-in-image.txt differences as described in:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5866
>=20

Eventually it will. There is still ways to go and this patch set is just th=
e first
kick at the can.



