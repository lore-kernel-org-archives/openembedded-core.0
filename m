Return-Path: <cbugot@sierrawireless.com>
X-Greylist: delayed 12890 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 Mar 2018 14:39:34 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0050.outbound.protection.outlook.com [104.47.34.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5078F60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=SierraWirelessInc.onmicrosoft.com; s=selector1-sierrawireless-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pHKjg8vQMOeM/AyRa4fol3LobgzBrMMLhMhWM5s62xo=;
	b=zIXTwoJ/0chUdB5uM++uroY8UTW9jEOvAQ6ozUqFfLmzxWgKYiSujkjvHBQq8GGcN/EmeuDVLgIs8WIdMCPggpRNgqMw4bjzdWdDB5WpkdcK4WfM/c6ahMyeqtZx0Ot5jEbPqhkDn29GYlUcpyuhrKnUE6FZ0k2a8RLJDvXew+k=
Received: from CY1PR02MB1152.namprd02.prod.outlook.com (10.163.15.154) by
	CY1PR02MB1229.namprd02.prod.outlook.com (10.163.16.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.567.14; Mon, 12 Mar 2018 11:04:44 +0000
Received: from CY1PR02MB1152.namprd02.prod.outlook.com ([10.163.15.154]) by
	CY1PR02MB1152.namprd02.prod.outlook.com ([10.163.15.154]) with mapi id
	15.20.0548.021; Mon, 12 Mar 2018 11:04:44 +0000
From: Cuero Bugot <cbugot@sierrawireless.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: uninative and recipe parsing
Thread-Index: AdO56yridq5aeM3RTjmoDMuix3K+qA==
Date: Mon, 12 Mar 2018 11:04:44 +0000
Message-ID: <CY1PR02MB11526A4DDADFB7EF5D6019EAA3D30@CY1PR02MB1152.namprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.14.163.134]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB1229;
	7:L5eCxDcceBx2G/VMsEYuZTaxzexE1ejrQ9J7GMZuFZMiBicT3KwruHk+I4zQDQSk5UO0GCvRcykp7yMOCCNCnYiIiiF0MVUn7dfEjnkISsOwJ/xsr/jvECBfZQ83Z0VdGee0TSqCFd7k6RklXxi0uU1XWQtcq/kH9LO7kZV7ZhbgEwoPfjl7mwdDTgjJd77iw+PtTlaCFatWSQ+79yY/Vj1exIxed5+9L11/QWvgbwHol4HY+9MFnfwCSAuMdCgI
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 139efc15-385d-40e2-4c6b-08d588090fc2
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR02MB1229; 
x-ms-traffictypediagnostic: CY1PR02MB1229:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=cbugot@sierrawireless.com; 
x-microsoft-antispam-prvs: <CY1PR02MB12293067907B13F7F8E0B5B4A3D30@CY1PR02MB1229.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231220)(944501244)(52105095)(10201501046)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1229; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1229; 
x-forefront-prvs: 06098A2863
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(366004)(376002)(39380400002)(396003)(39860400002)(53754006)(199004)(189003)(478600001)(86362001)(33656002)(8936002)(59450400001)(186003)(102836004)(77096007)(26005)(305945005)(53936002)(7736002)(3660700001)(55236004)(105586002)(6506007)(5660300001)(55016002)(6916009)(7696005)(99286004)(9686003)(5640700003)(74316002)(3280700002)(6436002)(316002)(68736007)(2900100001)(2906002)(66066001)(81166006)(25786009)(3480700004)(14454004)(97736004)(2501003)(3846002)(2351001)(6116002)(106356001)(81156014)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1229;
	H:CY1PR02MB1152.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: sierrawireless.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: N624n5UN1jVLCaCF368qJhwJrumXZWcwpRGoWdzF7cMZpzPnqCtGA5oTRAJuC2GhNrvykQ9BKe0QPccEIQd9ZuQ6974HuK3006aWTdstDITqM4rZkgnpshYsatjhtd5NU67w5BxG1l9ROokHsuql9z19UkPw7WsbX8RR9HqScWAXdlakIT/8sYta4p8V+uYqALtMNWLeX1XKb9D+ZhWbOpdTYeuIrln8ZuJEixW0Ac62eMUYnxRjEd1R/2gmgzeMREr7hzgmjf0JK+yk7UhjPZtDIXpXdYQSdk92ODjsitB9iPhUVu+kvl2HM2Mkf4psv4SW+sdPpbUXrNAaZN86HQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: sierrawireless.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139efc15-385d-40e2-4c6b-08d588090fc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2018 11:04:44.0768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 08059a4c-2486-43dd-89e3-3a747e0dcbe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1229
Subject: uninative and recipe parsing
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
X-List-Received-Date: Mon, 12 Mar 2018 14:39:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

When you add several layers, recipe parsing can take a (very) long time. In=
 our case it takes more than a couple minutes [1]. Fortunately it is suppos=
ed to happens once, except when you use uninative (poky's default) where it=
 happens twice (the two first times you build).
I think this is not an intentional behavior so I dug it a little bit and he=
re is what I found:

When inheriting meta/classes/uninative.bbclass, it registers 2 functions on=
 build events: one to fetch the uninative tarball (at bb.event.BuildStarted=
) and the other one to set variables in the datastore (at bb.event.ConfigPa=
rsed).
The function that set the variables [2] to the datastore first check that t=
he uninative blob is in the build tree, so even though it is supposed to ha=
ppen at recipe parsing, the variable are only really set when the build rea=
lly start (bb.event.BuildStarted), after the recipes have been parsed!

So I think there is bug in the current behavior as:
	* Either the uninative variables are not important for the recipe parsing,=
 and then they should be added in BB_HASHCONFIG_WHITELIST
	* Or the variables should matter for the recipe parsing so they should be =
set before the parsing and not in between parsing and build.

I assumed the later, so a simple fix is to register the two functions on th=
e same event: bb.event.ConfigParsed.

Note: We are currently using pyro, but I checked that the master branch sho=
uld exhibit the same behavior (same code).

[1]: it matters to us as we are doing Continuous Integration and do clean b=
uilds (with sstate cache) on every pull requests and master branch commits.=
 The automatic test full cycle take about 20 minutes. We launch 2 bitbake c=
ommands during that process. Parsing recipe take about 2-4 minutes, which i=
s significant enough when trying to reduce the waiting and parallel builds/=
tests.
[2]: the uninative changed variables are: NATIVELSBSTRING, SSTATEPOSTUNPACK=
FUNCS

Proposed patch:

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclas=
s
index a410647..5713bb8 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -9,7 +9,7 @@ UNINATIVE_TARBALL ?=3D "${BUILD_ARCH}-nativesdk-libc.tar.bz=
2"
 UNINATIVE_DLDIR ?=3D "${DL_DIR}/uninative/"
=20
 addhandler uninative_event_fetchloader
-uninative_event_fetchloader[eventmask] =3D "bb.event.BuildStarted"
+uninative_event_fetchloader[eventmask] =3D "bb.event.ConfigParsed"
=20
 addhandler uninative_event_enable
 uninative_event_enable[eventmask] =3D "bb.event.ConfigParsed"


