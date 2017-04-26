Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 115D972FC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 19:50:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Apr 2017 12:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,255,1488873600"; d="scan'208";a="1123814278"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga001.jf.intel.com with ESMTP; 26 Apr 2017 12:50:52 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 26 Apr 2017 12:50:49 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.213]) by
	ORSMSX153.amr.corp.intel.com ([169.254.12.150]) with mapi id
	14.03.0319.002; Wed, 26 Apr 2017 12:50:49 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/4] Reproducible binaries
Thread-Index: AQHSve/H0RnFKsoUjUy3r4mWvWsL7aHW3z0A//+V67OAAUWMAIAAHehwgACMewCAAAt5AP//nTrg
Date: Wed, 26 Apr 2017 19:50:49 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61194DECB@ORSMSX112.amr.corp.intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
	<20170426074212.GB3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
	<CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
	<20170426183306.GF3258@jama>
In-Reply-To: <20170426183306.GF3258@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
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
X-List-Received-Date: Wed, 26 Apr 2017 19:50:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> I wasnted to say "passing the seed value" through some separate variable
> which is easy to override from somewhere else.
>=20
> e.g.
> export PRELINK_TIMESTAMP=3D`git log -1 --pretty=3D%ct `
>=20
> in image-prelink.bbclass:prelink_image() is a bit difficult to override.
>=20

I think it is best to keep all reproducible build related variables gathere=
d together,=20
so bitbake.conf seems like a natural place (same place as the variable BUIL=
D_REPRODUCIBLE_BINARIES),
i.e something like:

PRELINK_TIMESTAMP ??=3D`git log -1 --pretty=3D%ct `

A single "general purpose" fallback timestamp variable (not specific to pre=
linking) would be my
preference. Unfortunately, the timestamps may need to come in various diffe=
rent formats...


