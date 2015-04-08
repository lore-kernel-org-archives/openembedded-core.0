Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0095.outbound.protection.outlook.com [207.46.100.95])
	by mail.openembedded.org (Postfix) with ESMTP id 4E29660089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 14:58:57 +0000 (UTC)
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) by
	BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.130.23; Wed, 8 Apr 2015 14:43:52 +0000
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) by
	BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) with
	mapi id 15.01.0130.020; Wed, 8 Apr 2015 14:43:52 +0000
From: "Krishnanjanappa, Jagadeesh"
	<Jagadeesh.Krishnanjanappa@caviumnetworks.com>
To: Anders Darander <anders@chargestorm.se>
Thread-Topic: [OE-core] [PATCH] dpkg: add triplet entry to fix build error for
	armeb
Thread-Index: AQHQcgIZoYdv0Oj7kkij1m6fP1XFzp1DMFoi
Date: Wed, 8 Apr 2015 14:43:52 +0000
Message-ID: <1428504230941.43152@caviumnetworks.com>
References: <1428500004-9535-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>,
	<20150408134320.GB8848@ad.chargestorm.se>
In-Reply-To: <20150408134320.GB8848@ad.chargestorm.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [111.93.218.67]
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1144;
x-microsoft-antispam-prvs: <BY1PR0701MB11447F23378E7E032E77A7548EFC0@BY1PR0701MB1144.namprd07.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(164054003)(377454003)(50986999)(19580395003)(66066001)(2950100001)(92566002)(77156002)(46102003)(86362001)(2900100001)(62966003)(19580405001)(117636001)(87936001)(2656002)(99286002)(54356999)(102836002)(110136001)(36756003)(106116001)(122556002)(76176999)(40100003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1144;
	H:BY1PR0701MB1144.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BY1PR0701MB1144; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0701MB1144; 
x-forefront-prvs: 0540846A1D
MIME-Version: 1.0
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2015 14:43:52.1108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1144
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: add triplet entry to fix build error for armeb
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
X-List-Received-Date: Wed, 08 Apr 2015 14:59:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>Drop INC_PR from this patch.
>There's no INC_PR in the .inc file, and besides that, we're not touching
>PR at all, unless we're really forced to.

Yes, there is no INC_PR defined in dpkg.inc file.
The intention was if anyone wants to update dpkg.inc file in future, they
can define INC_PR in dpkg.inc file and then the updated INC_PR value=20
will be reflected in recipe file. I felt this would help to track changes i=
n
dpkg application build.

However, I have sent Patch v2 with INC_PR, PR removed.

Thanks,
Jagadeesh
_____________________________________
From: Anders Darander <anders@chargestorm.se>
Sent: Wednesday, April 8, 2015 7:13 PM
To: Krishnanjanappa, Jagadeesh
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] dpkg: add triplet entry to fix build error f=
or armeb

* Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>=
 [150408 15:33]:

> 2. Added INC_PR to PR to have an updated value, when INC_PR is defined
>    in dpkg.inc file

Drop INC_PR from this patch.
There's no INC_PR in the .inc file, and besides that, we're not touching
PR at all, unless we're really forced to.

Cheers,
Anders

--
Anders Darander
ChargeStorm AB / eStorm AB=

