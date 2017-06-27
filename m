Return-Path: <sona.sarmadi@enea.com>
X-Greylist: delayed 5537 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Jun 2017 08:44:08 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0118.outbound.protection.outlook.com [104.47.2.118])
	by mail.openembedded.org (Postfix) with ESMTP id 946C27780A;
	Tue, 27 Jun 2017 08:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Enea.onmicrosoft.com; 
	s=selector1-enea-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JFXckUgnvWdnHoWyne9o10Ssr4gKBG7alv+0ZgYbsew=;
	b=quVtSxSVZpMJDprLr3kd5ScvcpJATkC1YnAIAGxnUsUIa6nWeZO/OgXkuCarFpRs/bC0RlCs9M1Y8J/0kJhNTDeU77c1Lrqriig8oAbBQhrRfqulRgQTmmBaycyJTVqneD9WM/O5TPmjvwr2VsSZC0dYBl9QP6b/CYYFQD+90PY=
Received: from AM2PR07MB0484.eurprd07.prod.outlook.com (10.160.31.147) by
	AM2PR07MB0529.eurprd07.prod.outlook.com (10.160.31.22) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.5; Tue, 27 Jun 2017 07:11:50 +0000
Received: from AM2PR07MB0484.eurprd07.prod.outlook.com
	([fe80::9c2:270a:4054:743e]) by AM2PR07MB0484.eurprd07.prod.outlook.com
	([fe80::9c2:270a:4054:743e%17]) with mapi id 15.01.1220.010;
	Tue, 27 Jun 2017 07:11:50 +0000
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
Thread-Index: AQHS6OhRLc5XXR7t1kKiCxKNz0DW5qI4UKAQ
Date: Tue, 27 Jun 2017 07:11:50 +0000
Message-ID: <AM2PR07MB04844576892B2CFFD3057ACFE6DC0@AM2PR07MB0484.eurprd07.prod.outlook.com>
References: <1497868738.24449.41.camel@linuxfoundation.org>
In-Reply-To: <1497868738.24449.41.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=none action=none
	header.from=enea.com;
x-originating-ip: [192.36.1.252]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM2PR07MB0529;
	20:iyzAwP5Rb6l/Yk9B2qNujR8dT4bRsgh+pooM5GfZpcPjFstUUBfvc7c0POvDOfUqN13221BWSau8fUzWy32fiiU83HwgOfKSqFzjQ2KaXitCMkg3RxmTEUA6iMW6rU04mnbsJ0ADQNyStfICIHB6KRfavGPCE+xcCKthcJZPt1A=
x-ms-office365-filtering-correlation-id: a55cacba-b9ff-4cad-b3b7-08d4bd2bc832
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095);
	SRVR:AM2PR07MB0529; 
x-ms-traffictypediagnostic: AM2PR07MB0529:
x-microsoft-antispam-prvs: <AM2PR07MB05296F853E5968CF9A84C2B0E6DC0@AM2PR07MB0529.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(76373721406558)(236129657087228)(192374486261705)(48057245064654)(167848164394848)(209349559609743)(256282310955234);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(3002001)(6041248)(20161123562025)(20161123560025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM2PR07MB0529; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM2PR07MB0529; 
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39830400002)(39400400002)(39410400002)(53754006)(377454003)(7696004)(2950100002)(81166006)(8676002)(53546010)(5250100002)(66066001)(4326008)(8936002)(74316002)(2900100001)(305945005)(229853002)(86362001)(189998001)(345774005)(25786009)(5660300001)(76176999)(54356999)(53936002)(14454004)(3846002)(102836003)(2906002)(9686003)(6306002)(50986999)(966005)(38730400002)(6246003)(6116002)(33656002)(6436002)(230783001)(6506006)(3660700001)(478600001)(55016002)(99286003)(3280700002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM2PR07MB0529;
	H:AM2PR07MB0484.eurprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: enea.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2017 07:11:50.4998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8cdaed89-c47e-40b8-90b5-f28ad2c3fdca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR07MB0529
Subject: Re: OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Tue, 27 Jun 2017 08:44:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry that the fix/workaround for this vulnerability was not discussed publ=
ically.=20
This vulnerability was reported by a user privately/encrypted. Yocto Securi=
ty team;=20
Sona, Michael Halstead and Richard handled this off-list. We decided that w=
e provide
a quick fix/workaround before we make this vulnerability public and then ch=
ange/
improve it later if necessary.=20
=20
> I suspect this has been missed by some people so I want to spell it out. =
We
> have our first CVE in OE-Core itself.

We have received a CVE from Mitre for this vulnerability, but they have cha=
nged=20
our description of vulnerability of some unknown reason :) we have requeste=
d an
update/correction (see below) but they haven't changed the description yet:=
=20
=20

From: CVE Request [mailto:CVE-Request@mitre.org]=20
Sent: Monday, June 19, 2017 12:09 PM
To: Sona Sarmadi <sona.sarmadi@enea.com>
Subject: CVE Request 349461 for Update Published CVE=20

Thank you for your submission. It will be reviewed by a CVE Assignment Team=
 member.
=20
You have requested an update to the following published CVE:  CVE-2017-9731
=20
=20
Changes, additions, or updates to your request can be sent to the CVE Team =
by replying directly to this email.
=20
Please do not change the subject line, which allows us to effectively track=
 your request.
=20
CVE Assignment Team=20
M/S M300, 202 Burlington Road, Bedford, MA 01730 USA=20
[A PGP key is available for encrypted communications at=20
http://cve.mitre.org/cve/request_id.html]

Thanks all for your help with this vulnerability.
//Sona


