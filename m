Return-Path: <gtertych@cisco.com>
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 10B3D7F990
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2199; q=dns/txt; s=iport;
	t=1573200478; x=1574410078;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=MMChD7dMCUvLavX/02lahErH6uNf7NBZ5/Fhq2s3F2U=;
	b=iwL3Rw3gY17rlS0sKCLguBg6GBoI2KggJEmB2u8DvQrAXpqlJ0NPk1Uq
	G854x1jpjKNsexWEsPIFutpis3x26cXB6uqoHdaBF1AYtPOUGVP8kjeRp
	G0KaBYHrZHlm+D39bBK+GatauZOlV5bTKudq+oMWgvMbEUS/zMo2FKY8Q g=;
IronPort-PHdr: =?us-ascii?q?9a23=3Ap/Nj7R119H2pORi6smDT+zVfbzU7u7jyIg8e44?=
	=?us-ascii?q?YmjLQLaKm44pD+JxKGt+51ggrPWoPWo7JfhuzavrqoeFRI4I3J8RVgOIdJSw?=
	=?us-ascii?q?dDjMwXmwI6B8vQBlH2NuL7ZCwSF8VZX1gj9Ha+YgBY?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AUAAB+IcVd/5hdJa1lGgEBAQEBAQE?=
	=?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFsAwEBAQELAYFKUAWBRCAECyqHbwOLAoJel36?=
	=?us-ascii?q?BLoEkA1QJAQEBDAEBGBUCAQGEQAKEDiQ2Bw4CAwsBAQQBAQECAQUEbYU3AQu?=
	=?us-ascii?q?FUQEBAQECAQERLgEBMgUBBAsCAQgRBAEBLygKHQgCBA4FCBqFRwMOIAGnPwK?=
	=?us-ascii?q?BOIhggieCfgEBBYUKGIIXCRSBIgGMExiBQD+BV4IXNT6ERQKDQIIKIox+iG9?=
	=?us-ascii?q?giDePBwqCJJAPhU2ZdC2OGZltAgQCBAUCDgEBBYFZDCaBWHAVO4JsUBEUkDa?=
	=?us-ascii?q?Dc4pTdIEoj04BAQ?=
X-IronPort-AV: E=Sophos;i="5.68,280,1569283200"; d="scan'208";a="359758859"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	08 Nov 2019 08:07:57 +0000
Received: from XCH-ALN-003.cisco.com (xch-aln-003.cisco.com [173.36.7.13])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id xA881F9V022853
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2019 08:01:15 GMT
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by XCH-ALN-003.cisco.com
	(173.36.7.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 8 Nov 2019 02:01:14 -0600
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-rtp-002.cisco.com
	(64.101.210.229) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 8 Nov 2019 03:01:14 -0500
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (64.101.32.56) by
	xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Fri, 8 Nov 2019 03:01:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=DeoUl0GRLv9Y9K57xZ6bemNfsJJbiOcWK57iwCqxmJpIlPAU0zWaEHMP31OcHjsARYIhv5hMUZXGHFsNzCKWI6O48z+kumBZkYXIj63EO5V5VCOIDa+5/L4QfVJFP+CdWTAvheX9r2GPT2jmGyp8BSaI6yWx6QsETiq+XSBtgTlpfUXcVfVzklK5CKC/wc7qVwaC9418xfK9kFHjRbWGB/08m4bmzNlP33regeOaiXDUh3dcawvkB4zjuIDEuaC0iJ9ziu2FvXwc+Q5O5Ag3B0ZtTwSqb/7QBSQv5H4godDmkASgDBYJN2RLlQ8hwhyZEj8dINUtPerUKpDG6bhctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gu6zsau+ZzRJ1PME/+BtNhEcspI5n5+kajyXX+769e0=;
	b=cyRmWFsk00jHoBwX3mmR/Bld79xZFI1bwuv91rX3EcOSINjRPPbSL3nQFHViwzCaiyi1rDkllrpnZFXn8VNJZgzJJdbXzEGJHJos8oqlfc5490hwo8IfK0APPniXK3pJ6EsHcJpLUtOlphNBrLHqtEqZiWzdI6kUMFm//R0xSAUTS8/Lclq/pqIYklHNj16vAkxdWXepXMCzxsMZCKrtOJmgriCox4hqWa/wdClnnR5A55gNw+FkxGzW4Bz0S1MvP+6YOIdEb2MlEI8sjlNcnfIxEawtiavKgTi6AEukHy50WzdlCcQvEg1SboTPYFoHirYJdnI+jQglsuNCoF2KfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com; 
	dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gu6zsau+ZzRJ1PME/+BtNhEcspI5n5+kajyXX+769e0=;
	b=VZaPzs+jLOFYcM1GB2L+RAiZCuWr9JPHP8tTq1SsjpexpnEdbTFCYqEoVwpTmaqBzNPlAN7PbTsOG3sjN0Lo3asm5CWcR5AvqSLSLWOPssdt2SklSkNEFpbWWEwfpl2S3aCvqRDUka9ADsGz5Ufh50dCLeITO+dBxZyhFTjWx2A=
Received: from MWHPR11MB1918.namprd11.prod.outlook.com (10.175.54.17) by
	MWHPR11MB2031.namprd11.prod.outlook.com (10.169.236.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Fri, 8 Nov 2019 08:01:11 +0000
Received: from MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4]) by
	MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4%11]) with mapi id 15.20.2430.020;
	Fri, 8 Nov 2019 08:01:11 +0000
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe
Thread-Index: AQHVkINrSPE3wsUkS0qsZp7uiCiFxqd2LdcAgATq/miABdsOvw==
Date: Fri, 8 Nov 2019 08:01:11 +0000
Message-ID: <MWHPR11MB1918F843883870FDEE02E629C27B0@MWHPR11MB1918.namprd11.prod.outlook.com>
References: <20191101071043.16558-1-gtertych@cisco.com>,
	<CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>,
	<MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=gtertych@cisco.com; 
x-originating-ip: [2001:420:c0c0:1001::d2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cd8ba6a-da00-436d-5821-08d76421d21f
x-ms-traffictypediagnostic: MWHPR11MB2031:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB20319A46725398BAB74069DDC27B0@MWHPR11MB2031.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(52536014)(2351001)(99286004)(55016002)(186003)(46003)(6506007)(6916009)(7696005)(76176011)(102836004)(305945005)(81166006)(4326008)(8676002)(81156014)(53546011)(7736002)(316002)(8936002)(2501003)(446003)(11346002)(5660300002)(33656002)(478600001)(107886003)(6116002)(66946007)(2906002)(74316002)(486006)(9686003)(71200400001)(476003)(14454004)(71190400001)(6246003)(66446008)(86362001)(91956017)(64756008)(229853002)(66556008)(14444005)(66476007)(76116006)(5640700003)(25786009)(6436002)(256004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB2031;
	H:MWHPR11MB1918.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fGfyfYxt87iRl7UZse13itV2iOID9Yz2XBD0MCEjeurReXCIIP7TmuuMAF9OvbiLBc2msIHzef9DDAkAdwgy5erBG2rM0MG5nlEmzbDik9D8BCi3TF5fW2FS+h7gk96yYdFrO4aKx9tNn0wvx6tIcmpMkSN3d7e3tkX3s8cbbOA/ei8iMZzufc8lYHsdE0FFGKdMxGtuzocVJ0CVMgaTFKlLiRuB2CwMRP5Ls4OLJiZjPf2rhZM/nr/HQvNBWWnp+YujTzIf/v5EXyWO4k5oy+nbUHdz3wMIcNkOfDEMNUBSCXd7MELkJ4/D2t85RF3bL+dQLKZaSXiS/bgyT34Jv85DQje6WW0WPmaiEmq3if4wm2J/x+3vB5D1CMg/kfgdsZlSGvvG6bLDvh4bLfFv+0m8CEiOh4PdBBlC/ZYJE5E/xzHdtcJhtCILeTFm/1B1
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd8ba6a-da00-436d-5821-08d76421d21f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 08:01:11.6753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCEsg8zizLS/+Nb97ElF3vUjJqgYh73hHIebz0Eui6eezqHwhVGyYAAu7XI1snFeSgtA4fJiJ0fJs0tJWcdl+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.13, xch-aln-003.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] archiver: avoid empty incfile in ar_recipe
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
X-List-Received-Date: Fri, 08 Nov 2019 08:07:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
ping=0A=
=0A=
________________________________________=0A=
From: Grygorii Tertychnyi (gtertych) <gtertych@cisco.com>=0A=
Sent: Monday, November 4, 2019 17:09=0A=
To: Andrei Gherzan; openembedded-core@lists.openembedded.org=0A=
Cc: xe-linux-external(mailer list)=0A=
Subject: Re: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe=
=0A=
=0A=
Andrei,=0A=
=0A=
From: Andrei Gherzan <andrei@gherzan.ro>=0A=
Sent: Friday, November 1, 2019 13:28=0A=
To: Grygorii Tertychnyi (gtertych); openembedded-core@lists.openembedded.or=
g=0A=
Cc: xe-linux-external(mailer list)=0A=
Subject: Re: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe=
=0A=
=0A=
>> do_ar_recipe fails on perf recipe on line:=0A=
>>=0A=
>> include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.in=
c', '', d)}=0A=
>>=0A=
>> 1. "${...}" part expands into empty string=0A=
>> 2. bb.utils.which() takes empty string and returns first directory name =
from bbpath=0A=
=0A=
> This doesn't sound sane. If the include directive has no argument,=0A=
> incfile should end up None. That's what the code "assumes" at this=0A=
=0A=
I agree.=0A=
=0A=
> point. I would fix it either at the regex expression level or=0A=
> stripping the matched string. I reckon the former makes more sense=0A=
> (.*).=0A=
=0A=
Not sure I understand. Archiver class does not interpret "include" directiv=
e.=0A=
It just parses text files. The regular expression looks correct:=0A=
=0A=
These lines:=0A=
=0A=
440         elif include_re.match(line):=0A=
441             incfile =3D include_re.match(line).group(1)=0A=
=0A=
put "${...}" _string_ into "incfile" variable. So, "incfile" is not None at=
 this stage.=0A=
Then,=0A=
=0A=
443             incfile =3D d.expand(incfile)=0A=
=0A=
Now "incfile" is empty and nobody checks it.=0A=
=0A=
444             incfile =3D bb.utils.which(bbpath, incfile)=0A=
=0A=
Now "incfile" is set to first directory name in BBPATH (wrong behavour?)=0A=
=0A=
445             if incfile:=0A=
446                 shutil.copy(incfile, outdir)=0A=
=0A=
Exception here: "incfile" is directory, not a file.=0A=
=0A=
--=0A=
Grygorii=0A=

