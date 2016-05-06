Return-Path: <bartlomiej.kucharczyk@nokia.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0127.outbound.protection.outlook.com [157.56.112.127])
	by mail.openembedded.org (Postfix) with ESMTP id C580472DC4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fvGOScKf3vBZwANOKk5e0VezxPjzbDcnttFvlt4sLZg=;
	b=A2t5Ny6HwQTkgoGP90FkIDnO8BaxNahhfVtg1qfyCXp01gL4StIaI4Lgynuf4+l6XexU9md9hB0ialI9+tJIkKxgQT0uEwlvgY5nw2CBZudUz0+cr/8XZL39Gil0I1UbNAVhJQB1od3Coi8cayBnina7UqyOBFQ64YmZedYo/uA=
Received: from AM3PR07MB228.eurprd07.prod.outlook.com (2a01:111:e400:8819::20)
	by AM3PR07MB225.eurprd07.prod.outlook.com (2a01:111:e400:8819::17)
	with Microsoft SMTP Server (TLS) id 15.1.485.9;
	Fri, 6 May 2016 13:32:18 +0000
Received: from AM3PR07MB228.eurprd07.prod.outlook.com
	([fe80::7d44:8a68:cdaa:ca98]) by AM3PR07MB228.eurprd07.prod.outlook.com
	([fe80::7d44:8a68:cdaa:ca98%18]) with mapi id 15.01.0485.011;
	Fri, 6 May 2016 13:32:18 +0000
From: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>
To: EXT Richard Purdie <richard.purdie@linuxfoundation.org>, "EXT Christopher
	Larson" <clarson@kergoth.com>
Thread-Topic: [OE-core] How to force BitBake to track dependency to
	METADATA_REVISION?
Thread-Index: AdGm/HmzYSUtO8YdRD+Yb3Ba5Zji7AAJprIAABatTAAAAcpCAAAFgGnA
Date: Fri, 6 May 2016 13:32:18 +0000
Message-ID: <AM3PR07MB2283A59FECB71A5D04EF498F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
References: <DBXPR07MB23993DC9B9946851B629E21F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
	<CABcZANniNW9XRsATUvu=D0nSMWh2paEWPED2xZRjo2z6VBKvBg@mail.gmail.com>
	<AM3PR07MB22889D01AF1F38A1664FBB3F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
	<1462531762.21674.135.camel@linuxfoundation.org>
In-Reply-To: <1462531762.21674.135.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=none action=none
	header.from=nokia.com;
x-originating-ip: [131.228.2.18]
x-ms-office365-filtering-correlation-id: 9b55c415-bdf3-493b-96e5-08d375b2d84e
x-microsoft-exchange-diagnostics: 1; AM3PR07MB225;
	5:5lL1Xq/QmsXGTk0NnE5N5D0MrnlgC5jN+viOjXxhNiFJ4D3zktfwqq1o062YJqWPiJgEl+RBLVBPTh6rQHolS3B3Tgnxw15UqHjImfotTFi4a3RapJ1Fle/rjCznUSUnSRdPn1KO+7xZAun6039Otg==;
	24:0DeBWFJeuOISH+klFIW7tP/CnOFIG4GXnIHZQPyoWCYh0SXOnGf4vgdFeUPAvKfTlFpkGl+Cd5pNHcnctOT6gQ7TfLu9ojWkrUihq/USAJI=;
	7:wCiQp1VSHV/p4EOZzA6G3yUDSwVWIcfVF4Io47nXwnMBT/UU7MITB8+HP7g+tZlzGtesYNupm888AAxZsctlrkD/raXUkxcz6jMNt52gv6gq3vm+jqxTsIYGm/EpdNFJnhX2hXUQWLlsK2949l30snj6wU2do/pFJXZzvBtG5I1cFZd0fR0awWM2n8xPC4jP
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR07MB225;
x-microsoft-antispam-prvs: <AM3PR07MB22520046D3365A52D031FF1F97D0@AM3PR07MB225.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:AM3PR07MB225; BCL:0; PCL:0; RULEID:; SRVR:AM3PR07MB225; 
x-forefront-prvs: 09347618C4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(81166005)(86362001)(5008740100001)(2906002)(586003)(2900100001)(2950100001)(102836003)(74316001)(33656002)(3846002)(4326007)(66066001)(1220700001)(87936001)(6116002)(189998001)(54356999)(50986999)(76176999)(11100500001)(92566002)(5250100002)(9686002)(5004730100002)(5003600100002)(8936002)(93886004)(3660700001)(5002640100001)(76576001)(3280700002)(5001770100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR07MB225;
	H:AM3PR07MB228.eurprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2016 13:32:18.1466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR07MB225
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to force BitBake to track dependency to METADATA_REVISION?
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
X-List-Received-Date: Fri, 06 May 2016 13:32:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBUaGUgcHJvYmxlbSBpcyBwcm9iYWJseSB0aGUgY2FjaGUuIEl0IGhhcyBubyBrbm93bGVkZ2Ug
b2Ygd2hlbiBpdCBuZWVkcw0KPiB0byByZXBhcnNlIHRvIHNlZSBpZiB0aGlzIHZhbHVlIGhhcyBj
aGFuZ2VkLiBJZiB5b3Ugc2V0IEJCX0RPTlRfQ0FDSEUgPQ0KPiAiMSIgaW4gdGhlIHJlY2lwZSwg
ZG9lcyB0aGF0IGhlbHA/DQoNClllcyEgVGhhdCBoZWxwcy4NClRoYW5rcyBmb3IgdGhvc2UgaGlu
dHMhDQoNCldoYXQgQkJfRE9OVF9DQUNIRSBkb2VzIGV4YWN0bHk/IEkgZm91bmQgaXQgdW5kb2N1
bWVudGVkLiA7LSkNCkkgdW5kZXJzdGFuZCB0aGlzIGlzIGNvbmZpZyBjYWNoZSwgbm90IHRoZSAn
c3N0YXRlIGNhY2hlJy4NCg0KQmFydGVrDQo=

