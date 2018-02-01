Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 664 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Feb 2018 11:47:35 UTC
Received: from den-mailgw-01.vaisala.com (den-mailgw-01.vaisala.com
	[63.233.207.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA7647859E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 11:47:35 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FwAQCB+3Jah7C0x9VcGgEBAQEBAgEBA?=
	=?us-ascii?q?QEIAQEBAYJsU2lmBAsoCo5ujG+CTZkAA1wKG4EThA0CgwQUAQEBAQEBAQECAQI?=
	=?us-ascii?q?QAQEBCA0JCCgkC4I4IoEEMAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQMCLwU3AQVAAQE4DwIBCBguMiUCBA0IAQGKGQMWA55xAosNAQG?=
	=?us-ascii?q?DFIMKAQEFhDEYg0UIhGeFfYMFhSKFfKQoiBmOTJM6k24Bg08CAgICCQIRAQEHg?=
	=?us-ascii?q?Tw2gXMzGiOCfAmCPQ8QDIIGeIsyAYEWAQEB?=
X-IPAS-Result: =?us-ascii?q?A2FwAQCB+3Jah7C0x9VcGgEBAQEBAgEBAQEIAQEBAYJsU2l?=
	=?us-ascii?q?mBAsoCo5ujG+CTZkAA1wKG4EThA0CgwQUAQEBAQEBAQECAQIQAQEBCA0JCCgkC?=
	=?us-ascii?q?4I4IoEEMAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQM?=
	=?us-ascii?q?CLwU3AQVAAQE4DwIBCBguMiUCBA0IAQGKGQMWA55xAosNAQGDFIMKAQEFhDEYg?=
	=?us-ascii?q?0UIhGeFfYMFhSKFfKQoiBmOTJM6k24Bg08CAgICCQIRAQEHgTw2gXMzGiOCfAm?=
	=?us-ascii?q?CPQ8QDIIGeIsyAYEWAQEB?=
X-IronPort-AV: E=Sophos;i="5.46,443,1511852400"; d="scan'208";a="12857603"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lua5wUQRRRDH9fGLKC17acqTawz9xIom1qXfhcjA5g8=;
	b=RzIBD5HkMutnf+l45dHybZPneqNpYyRPOC6wTKohmnUvbc95BHFAt/BGBXmxY2VdSbKIPQ0aZVDJX1r2cN/emVkeMOC4TPuSbBPGMKptNeL1goGzlTutQyvs0BTg8xRIyC6j6oQDIlzp6xgwV1AOU2IfGOnLAlcrEOHvhdSa9uk=
From: Mauno Niko <niko.mauno@vaisala.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Re: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
Thread-Index: AQHTmSlASyci83RRv0+Ikqe/0thGUg==
Date: Thu, 1 Feb 2018 11:36:19 +0000
Message-ID: <8812d964-49f1-b18f-751a-bcdffac028c0@vaisala.com>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
	<48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
	<32b564ff-9cad-370f-48b1-389bf69e2ffb@linux.intel.com>
In-Reply-To: <32b564ff-9cad-370f-48b1-389bf69e2ffb@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0601MB2289;
	7:qFY0Gmbf//6tv0UEdK4g4sKi93EDINkIMXt0aq+p1r7r+EsXH2ZNShcooEyw+rWWUym7ZtekVsm5H4zEi+jr1GxkcARaDDPU+wqhNjj+Fn3BuGqhi2a4t7ZziOUyP5tz9bFnptGuAaUiqy+ZW5hbXEnNbAv4eDZSXp5bINSI6nnxJAOe11nVuFPKZzwGulA3HCe/DLQrrMyGVQnRkI6SakhrzNdkOD0MfXDn2Z+S+ffnCpQH8zUf0qhbHVvOYE8f
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 7b638bae-d7fc-4e20-3414-08d56968031a
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:AM5PR0601MB2289; 
x-ms-traffictypediagnostic: AM5PR0601MB2289:
x-microsoft-antispam-prvs: <AM5PR0601MB2289692431085DEA8C537C9581FA0@AM5PR0601MB2289.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231101)(2400082)(944501161)(10201501046)(3002001)(6041288)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(2016111802025)(6043046)(6072148)(201708071742011);
	SRVR:AM5PR0601MB2289; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2289; 
x-forefront-prvs: 0570F1F193
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(396003)(39850400004)(376002)(346002)(189003)(199004)(6512007)(6116002)(105586002)(25786009)(5640700003)(2906002)(97736004)(3846002)(229853002)(5660300001)(83506002)(65826007)(6486002)(3660700001)(6436002)(2950100002)(53936002)(58126008)(99286004)(2351001)(186003)(316002)(6246003)(6916009)(86362001)(2900100001)(31696002)(106356001)(26005)(53546011)(3280700002)(7736002)(36756003)(478600001)(31686004)(66066001)(65806001)(2501003)(8676002)(81166006)(81156014)(14454004)(68736007)(93886005)(64126003)(102836004)(76176011)(5250100002)(6506007)(8936002)(305945005)(65956001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2289;
	H:AM5PR0601MB2531.eurprd06.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-microsoft-antispam-message-info: H8S1S9HFoIITk27ZUaewhn8YFwS/wGQ+qeTuy1qZ5QaxJah7Wl6G39kIwIi53HlA1KJCSYk6WPUELVglGIJpnA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b638bae-d7fc-4e20-3414-08d56968031a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2018 11:36:19.1888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2289
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Thu, 01 Feb 2018 11:47:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <F277486C810B3349A416B3F36AC3FCB5@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On 01/30/2018 04:20 PM, Alexander Kanavin wrote:
> On 01/30/2018 09:07 AM, Khem Raj wrote:
>=20
>>> I disagree. Expanding HOSTTOOLS just to cater to the needs of a=20
>>> single recipe is not optimal, IMO.
>>
>> alternative are
>> build time dep on coreutils-native.
>> fix uboot script to not use comm
>> do not invoke check-config.sh at all.
>>
>> none of them are any better.
>=20
> Before we can declare that, we need to look what comm is actually used=20
> for during build, and why its absence is not a problem and doesn't cause=
=20
> errors.
>=20
> Consider also that using comm from host may break reproducibility, if=20
> absence or presence of comm on the host results in a different output=20
> from the build.

My patch initially did add coreutils-native to u-boot DEPENDS.

Should I resubmit it? (did not apply due to mismatch in recipe filename (ve=
rsion))=

