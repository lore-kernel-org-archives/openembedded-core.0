Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 3644 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 May 2017 19:36:03 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0108.outbound.protection.outlook.com [104.47.34.108])
	by mail.openembedded.org (Postfix) with ESMTP id 67AEF71D7F
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bxA9yKu1aUXZPqHOKYbtSaR32gnjBKFGFh0CGwExcK8=;
	b=Lai8/ay+emPOEdTYvkkLekHFEjB4mFur/3p24c8W60Kzwlb3QQtWy/OJahOgJTquC3cSa15Xgu7ys3EleSjSMd5i8Q/xsfY8rQ39I/k7FJSRH7RTxyh7z6k+CeLFLnYwl/XUVs7c8jSXR6tbS/sQ2VjdSVuqE84vS8BNTPP6Pgc=
Received: from BN6PR05MB2946.namprd05.prod.outlook.com (10.173.18.143) by
	BN6PR05MB2945.namprd05.prod.outlook.com (10.173.18.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.8; Tue, 16 May 2017 18:01:17 +0000
Received: from BN6PR05MB2946.namprd05.prod.outlook.com ([10.173.18.143]) by
	BN6PR05MB2946.namprd05.prod.outlook.com ([10.173.18.143]) with mapi id
	15.01.1101.009; Tue, 16 May 2017 18:01:17 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: eudev: opkg not automatically upgrading from udev to eudev
Thread-Index: AdLOYlpqF6Ic/6aPRBO/lUJuMAsISg==
Date: Tue, 16 May 2017 18:01:17 +0000
Message-ID: <BN6PR05MB29463641747B05CF02AB8AEBBBE60@BN6PR05MB2946.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=melinkcorp.com;
x-originating-ip: [98.100.91.242]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR05MB2945;
	7:yEBG+vXppz0TfAC/if1Vsj9nlv8WOzbcQfdDp21RFekSQTOYq+ms0lIfu1rMtmQZRACVoSN6Yfobo4uNdByIWSjQnqy20ZvfQlbvSkS07Z/t3s7J4NvtQ5T/4W9w2j5Hyl4PyRhajx/PhWMuMQsyt1ytBDkeDCw5adGi0alByPCzcwWw7PfMk4BsMvWVedenm684k0D0HLX7KFceKI4Cc3AOPyb3kM8jBeIJWiqOHlvLNLD3tIdSbFM9a5Sz3CAiqMtSh731uRSHLNjTl07v1/zDzFU00jMtKDGJspni701iDCqL0AY+IyZvVAyF0teKAJDsI+Z1A91Bfr6bphMHGw==
x-ms-traffictypediagnostic: BN6PR05MB2945:
x-ms-office365-filtering-correlation-id: 27e482d4-4574-40f0-6b2f-08d49c858cdf
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:BN6PR05MB2945; 
x-microsoft-antispam-prvs: <BN6PR05MB2945B64B5E36A22535E41852BBE60@BN6PR05MB2945.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123558100)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148);
	SRVR:BN6PR05MB2945; BCL:0; PCL:0; RULEID:; SRVR:BN6PR05MB2945; 
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39400400002)(39410400002)(39830400002)(110136004)(38730400002)(3280700002)(6916009)(7696004)(2351001)(6506006)(66066001)(3846002)(8936002)(189998001)(77096006)(2501003)(33656002)(99286003)(6436002)(25786009)(81166006)(55016002)(6116002)(8676002)(5640700003)(102836003)(9686003)(86362001)(7736002)(5660300001)(3660700001)(478600001)(53936002)(54356999)(2906002)(74316002)(2900100001)(122556002)(50986999)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR05MB2945;
	H:BN6PR05MB2946.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2017 18:01:17.1365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB2945
Subject: eudev: opkg not automatically upgrading from udev to eudev
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
X-List-Received-Date: Tue, 16 May 2017 19:36:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have an image based on core-image-minimal that uses sysvinit for init and=
 opkg for package management.  I am doing some upgrade testing and I see an=
 issue with eudev.  I am testing upgrading an image that was built under di=
zzy to my latest image built under morty.  I'm first testing that all the c=
orrect packages and new dependencies are correctly being identified for upg=
rade by running "opkg update; opkg upgrade --download-only" from the comman=
d line and comparing what is in the opkg cache directory with what was avai=
lable.  All packages except eudev and udev-cache are being downloaded for u=
pgrade.

I ran the opkg upgrade again with the -V4 option for additional debug outpu=
t  Here's what I saw in one section regarding udev:

pkg_hash_fetch_best_installation_candidate: Best installation candidate for=
 udev:
pkg_hash_fetch_best_installation_candidate: apkg=3Dudev nprovides=3D2.
pkg_hash_fetch_best_installation_candidate: Adding eudev to providers.
pkg_hash_fetch_best_installation_candidate: Adding udev to providers.
pkg_hash_fetch_best_installation_candidate: eudev arch=3Darmv5e arch_priori=
ty=3D41 version=3D3.2.
pkg_hash_fetch_best_installation_candidate: udev arch=3Darm926ejste arch_pr=
iority=3D51 version=3D182.
pkg_hash_fetch_best_installation_candidate: Candidate: udev 182.
pkg_hash_fetch_best_installation_candidate: 2 matching pkgs for apkg=3Dudev=
:
pkg_hash_fetch_best_installation_candidate: eudev 3.2 armv5e
pkg_hash_fetch_best_installation_candidate: udev 182 arm926ejste
opkg_upgrade_pkg: Comparing visible versions of pkg udev:
        182-r9.9 is installed
        182-r9.9 is available
        0 was comparison result
opkg_upgrade_pkg: Package udev (182-r9.9) installed in root is up to date.

I'm assuming the problem is that udev is version 182 and eudev is version 3=
.2 and that opkg doesn't think udev needs to be upgraded.  Is there an RDEP=
ENDS that needs to be added somewhere so opkg sees that it needs to upgrade=
 udev to eudev?

Thanks,
Bryan

