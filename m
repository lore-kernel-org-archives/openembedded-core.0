Return-Path: <niko.mauno@vaisala.com>
Received: from den-mailgw-01.vaisala.com (den-mailgw-01.vaisala.com
	[63.233.207.20])
	by mail.openembedded.org (Postfix) with ESMTP id 98C1D78980
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 13:59:19 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GzAAA2WJlah/Gax9VdGgEBAQEBAgEBA?=
	=?us-ascii?q?QEIAQEBAYJ8UYFKBAsoCo5hjDqCTYEWlWQDWwqFMAKDAjcVAQIBAQEBAQECAQI?=
	=?us-ascii?q?QAQEBCA0JCCgugjgkAYEBMQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAwI0NwECA0ABATgPAgEIGC4yJQIEAQwIAQGEfwMWA50hAosNAQG?=
	=?us-ascii?q?DFIMBAQEFhB4YgSWCIwiFJoYPgk42gVuDRoVtmmIJkHZ2jgkwkHgCAgICCQIRA?=
	=?us-ascii?q?QEHgS40gXUzGiODEoIiH4IHd4s0AYEXAQEB?=
X-IPAS-Result: =?us-ascii?q?A2GzAAA2WJlah/Gax9VdGgEBAQEBAgEBAQEIAQEBAYJ8UYF?=
	=?us-ascii?q?KBAsoCo5hjDqCTYEWlWQDWwqFMAKDAjcVAQIBAQEBAQECAQIQAQEBCA0JCCgug?=
	=?us-ascii?q?jgkAYEBMQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAwI?=
	=?us-ascii?q?0NwECA0ABATgPAgEIGC4yJQIEAQwIAQGEfwMWA50hAosNAQGDFIMBAQEFhB4Yg?=
	=?us-ascii?q?SWCIwiFJoYPgk42gVuDRoVtmmIJkHZ2jgkwkHgCAgICCQIRAQEHgS40gXUzGiO?=
	=?us-ascii?q?DEoIiH4IHd4s0AYEXAQEB?=
X-IronPort-AV: E=Sophos;i="5.47,412,1515481200"; d="scan'208";a="13229084"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=elISxwyrJgJ7BGP/RBgbK98f/8n3UFivzgjJHXFrk5I=;
	b=LxQGiOmKc2GIBJOqfNYVFtO5oA2dXJVOAxO9V17lzqsPHPbrQsFsHR9niatSCubajHq2X8jnQg0vThQJgCyxPmeOF5PcC1oUTad3X1vPSjcd4QnDEn4UbGI0QkZm7BTgFf/bgg/rK+TQh6Dr2wEqAmURad5HM/KmbNevSWeP2Po=
From: Mauno Niko <niko.mauno@vaisala.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] package_manager.py: Explicit complementary fail
Thread-Index: AQHTsLAJ/vh5qETvJ0Cps4RKTf96v6O6CVkAgALylYA=
Date: Fri, 2 Mar 2018 13:59:17 +0000
Message-ID: <a96ac7d4-946d-d299-e727-3a5095778675@vaisala.com>
References: <20180228162008.14197-1-niko.mauno@vaisala.com>
	<aff352ce-9c5a-c8bb-fa78-74951722d4f8@linux.intel.com>
In-Reply-To: <aff352ce-9c5a-c8bb-fa78-74951722d4f8@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0601MB2388;
	7:egKR3u8b+ceebIg77p6+dBvVPGqyB2h3YhBF1y2MmtUvT6ZwqF2fggABNhXY6YExDK3cxDxAYWqiYte8x+znEt5yD/Rwsq/c2YJ/x4sRqkoAy5xkBecyRNthk0v1oAn+XrJZtBx0zdDGVRPEbF2+r+eWorToUcpjGocikdLBV8QQ4XZkiArw8+y6RVkeQ/mv22gqfYwMg1eygrWmDN7msQHZXpyZFTdMS7FR25PjANpwniE+VG/gEu+aCtxZ2Wc/
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 046b17ee-71e5-42f7-8eec-08d58045ca34
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:AM5PR0601MB2388; 
x-ms-traffictypediagnostic: AM5PR0601MB2388:
x-microsoft-antispam-prvs: <AM5PR0601MB238859C2485892AF0B57872681C50@AM5PR0601MB2388.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231220)(944501240)(52105095)(93006095)(93001095)(10201501046)(3002001)(6041288)(20161123564045)(20161123558120)(20161123560045)(2016111802025)(20161123562045)(6043046)(6072148)(201708071742011);
	SRVR:AM5PR0601MB2388; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2388; 
x-forefront-prvs: 05991796DF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39850400004)(346002)(376002)(39380400002)(366004)(396003)(189003)(199004)(8936002)(8676002)(2501003)(5660300001)(26005)(3846002)(6486002)(81166006)(81156014)(53546011)(6506007)(6116002)(7736002)(102836004)(305945005)(110136005)(6436002)(53936002)(97736004)(14454004)(6246003)(316002)(105586002)(106356001)(6512007)(5250100002)(65956001)(65806001)(25786009)(68736007)(2950100002)(2900100001)(229853002)(64126003)(86362001)(2906002)(99286004)(65826007)(3660700001)(3280700002)(58126008)(66066001)(186003)(478600001)(31696002)(36756003)(31686004)(76176011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2388;
	H:AM5PR0601MB2531.eurprd06.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-microsoft-antispam-message-info: OGxlly0Z7yYAMGFb3rAjFu6dU6BZ7T9Avz+z9XriaACeHhXAn7sNO30hmjURtdzPLjzCycHpX5JtppEswp4/s6VuWUonn5ADm46OdXvuojGpzncyiI4VLoWG+WSx+m+apti24/FADyHdIN3y3gtzwSaCVKGgV8nqPZ+JQ4rCwz8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046b17ee-71e5-42f7-8eec-08d58045ca34
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2018 13:59:17.4927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2388
Subject: Re: [PATCH] package_manager.py: Explicit complementary fail
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
X-List-Received-Date: Fri, 02 Mar 2018 13:59:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <C15F8BEF7BA54E49B38E9A942D557BED@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On 02/28/2018 06:58 PM, Alexander Kanavin wrote:
> On 02/28/2018 06:20 PM, Niko Mauno wrote:
>>
>> Improve associated install() method behaviour in affected OpkgPM and
>> DpkgPM classes so that a problematic state of affairs becomes directly
>> obvious for bitbake user, resulting in shell output like:
>=20
> Does rpm need the same fix?

RpmPM's respective install() implementation deviates somewhat from it's Opk=
gPM, DpkgPM counterparts. It seems that rpm applies '--skip-broken' switch =
to dnf command which supposedly ignores just the conflicting packages in a =
given set, while installing all others.

The behaviour in opkg/dpkg case however seems to be, that in case of even s=
ingle conflicting package in a package set, the whole package set is silent=
ly left uninstalled. I performed a test against a reference image where the=
 issue manifests, and compared to rpm, opkg/dpkg-based SDK images lacked ov=
er half of target packages:

$ wc -l toolchain-target-manifest-*
  317 toolchain-target-manifest-deb
  317 toolchain-target-manifest-ipk
  653 toolchain-target-manifest-rpm

-Niko=

