Return-Path: <mvader@victronenergy.com>
X-Greylist: delayed 7181 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Oct 2016 00:18:23 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0131.outbound.protection.outlook.com [104.47.2.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9806059F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 00:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6m5fiLa8XoJhgyN5TOxUwezA9ZE7uaAom+cuGZ0LbAw=;
	b=7HTK8TIrM9twPCgUzy9tQQJ0ISWEg2ydPziUDEzPHqYEVaDL8gJad+0akzyG/Mb3iJm3RtulrlURTGEirHIxCKkNQRKL19548+e465F8GsXfNtwzsG4sauQTidpY4oakg7lfe3sFbj3gOnBjNKxwcKcRvxVUe/g2Gi6oPeDHuuA=
Received: from HE1PR07MB1436.eurprd07.prod.outlook.com (10.169.122.22) by
	HE1PR07MB1436.eurprd07.prod.outlook.com (10.169.122.22) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.659.11; Mon, 10 Oct 2016 21:45:59 +0000
Received: from HE1PR07MB1436.eurprd07.prod.outlook.com ([10.169.122.22]) by
	HE1PR07MB1436.eurprd07.prod.outlook.com ([10.169.122.22]) with mapi id
	15.01.0659.020; Mon, 10 Oct 2016 21:45:59 +0000
From: Matthijs Vader <mvader@victronenergy.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: udev/mount.sh: use lazy umount
Thread-Index: AQHSIz+wVRMDCoxUMU2R8V6b7otjQg==
Date: Mon, 10 Oct 2016 21:45:59 +0000
Message-ID: <F0D56DD8-329C-40A5-B003-250DB3BB81A3@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mvader@victronenergy.com; 
x-originating-ip: [145.132.107.233]
x-ms-office365-filtering-correlation-id: 4f8cd09d-babf-4a35-b835-08d3f156d30b
x-microsoft-exchange-diagnostics: 1; HE1PR07MB1436;
	7:/t75ykggzhsuaDCiqHr0aA7/Z2RlU/KTHFzsQGDOJitXLw7+67rJzEoT97VhrunhEBCw2BzcZBEeiNwpvabUZzfLzyOUGvKcyIlzhM4Jhka6qhk/Bdx3KUXM/XKry+HkyHGxdejJ5vH0zExTNCFIS4DbD7ueX+wN+BUOSwSSviPZ72yeghVsIuOjT0/zs6wa8mwOZsqF+Sqj9K/L8NsnTvDaKIwGZCpzk+d3lvs9i0Abwn+4arM+hZD9lmIAdVfWNzzpPFE//WzyYelTCX3Tq+d72tnQym/OcvQU7G5pBPres0D5xs2ZxOD8d9mHRivj8xRwMGckCjpmo2JwEIn6tP0mC4xclUbcqX7Aia0tnsc=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR07MB1436;
x-microsoft-antispam-prvs: <HE1PR07MB1436307C9D6401B3121537EAC5DB0@HE1PR07MB1436.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6043046)(6042046);
	SRVR:HE1PR07MB1436; BCL:0; PCL:0; RULEID:; SRVR:HE1PR07MB1436; 
x-forefront-prvs: 0091C8F1EB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(7916002)(199003)(189002)(5660300001)(7736002)(7846002)(110136003)(5002640100001)(86362001)(2501003)(450100001)(19617315012)(2906002)(15975445007)(87936001)(8676002)(8936002)(82746002)(81166006)(81156014)(77096005)(36756003)(6916009)(83716003)(2900100001)(106116001)(106356001)(105586002)(54356999)(2351001)(229853001)(6116002)(3846002)(102836003)(122556002)(19580395003)(586003)(68736007)(101416001)(97736004)(189998001)(92566002)(107886002)(11100500001)(50986999)(3660700001)(16236675004)(33656002)(10400500002)(3280700002)(7906003)(66066001)(104396002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR07MB1436;
	H:HE1PR07MB1436.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2016 21:45:59.9153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB1436
Subject: udev/mount.sh: use lazy umount
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
X-List-Received-Date: Tue, 11 Oct 2016 00:18:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F0D56DD8329C40A5B003250DB3BB81A3victronenergycom_"

--_000_F0D56DD8329C40A5B003250DB3BB81A3victronenergycom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCnVtb3VudCB3aWxsIGZhaWwgaWYgdGhlcmUgYXJlIHByb2Nlc3NlcyBhY2Nlc3Npbmcg
ZmlsZXMgYXQgdGhlIGRldmljZSwgdXNlIGxhenkgdW1vdW50IHRvIGF2b2lkIHRoaXMgcHJvYmxl
bS4NCg0KSSBmb3VuZCB0aGlzIHBhdGNoIFsxXSBhIGxvbmcgbG9uZyB0aW1lIGFnbywgYnV0IGRv
bid0IHNlZSBpdCBpbiBtYXN0ZXIgbm93Lg0KDQpBbnkgcmVhc29uIHdoeSBpdCB3YXMgbm90IGFj
Y2VwdGVkPyBJcyB0aGVyZSBhbnkgaGFybSBpbiB1c2luZyBsYXp5IHVtb3VudD8NCg0KSSBrbm93
IHRoYXQgaXQgaXMgbm90IGEgMTAwJSBzb2x1dGlvbiwgYW5kIHRoYXQgaXQgaXMgYmVzdCB0byBt
YWtlIHRoZSB1c2VyIHRyaWdnZXIgYW4gdW1vdW50IGJlZm9yZSB0YWtpbmcgYSBjYXJkIG91dC4g
QnV0IHRoYXQgd2lsbCBub3QgYmUgZG9uZSBldmVyeSB0aW1lLg0KDQpBbmQgd2l0aG91dCBsYXp5
IHVubW91bnQsIHRoZSBkZXZpY2Ugd2lsbCBuZXZlciBiZSB1bm1vdW50ZWQsIGNhdXNpbmcgdGhl
IG5leHQgbW91bnQgKHRyaWdnZXJlZCBieSBhbiBpbnNlcnQpIHRvIGZhaWwgYXMgd2VsbC4NCg0K
U2VlIGFsc28gdGhlIGRpc2N1c3Npb24gb24gb3VyIG93biBpc3N1ZSB0cmFja2VyIFsyXS4NCg0K
WzFdIGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3BpcGVybWFpbC9vcGVuZW1iZWRkZWQt
ZGV2ZWwvMjAxMC1KdW5lLzA2NjI0MS5odG1sDQoNClsyXSBodHRwczovL2dpdGh1Yi5jb20vdmlj
dHJvbmVuZXJneS92ZW51cy9pc3N1ZXMvNTkNCg0KQmVzdCByZWdhcmRzLA0KDQpNYXR0aGlqcw0K

--_000_F0D56DD8329C40A5B003250DB3BB81A3victronenergycom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C26644D9CE573146BAAE230C79801D9E@VICTRONENERGY.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGRpcj0iYXV0byI+DQo8
ZGl2PkhpLDwvZGl2Pg0KPGRpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiYSgy
NTUsIDI1NSwgMjU1LCAwKTsiPjxicj4NCjwvc3Bhbj48L2Rpdj4NCjxkaXY+PHNwYW4gc3R5bGU9
ImJhY2tncm91bmQtY29sb3I6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMCk7Ij51bW91bnQgd2lsbCBm
YWlsIGlmIHRoZXJlIGFyZSBwcm9jZXNzZXMgYWNjZXNzaW5nIGZpbGVzIGF0IHRoZSBkZXZpY2Us
IHVzZSBsYXp5IHVtb3VudCB0byBhdm9pZCB0aGlzIHByb2JsZW0uPC9zcGFuPjwvZGl2Pg0KPGRp
dj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiYSgyNTUsIDI1NSwgMjU1LCAwKTsi
Pjxicj4NCjwvc3Bhbj48L2Rpdj4NCjxkaXY+SSBmb3VuZCB0aGlzIHBhdGNoIFsxXSBhIGxvbmcg
bG9uZyB0aW1lIGFnbywgYnV0IGRvbid0IHNlZSBpdCBpbiBtYXN0ZXIgbm93LjwvZGl2Pg0KPGRp
dj48YnI+DQo8L2Rpdj4NCjxkaXY+QW55IHJlYXNvbiB3aHkgaXQgd2FzIG5vdCBhY2NlcHRlZD8g
SXMgdGhlcmUgYW55IGhhcm0gaW4gdXNpbmcgbGF6eSB1bW91bnQ/PC9kaXY+DQo8ZGl2Pjxicj4N
CjwvZGl2Pg0KPGRpdj5JIGtub3cgdGhhdCBpdCBpcyBub3QgYSAxMDAlIHNvbHV0aW9uLCBhbmQg
dGhhdCBpdCBpcyBiZXN0IHRvIG1ha2UgdGhlIHVzZXIgdHJpZ2dlciBhbiB1bW91bnQgYmVmb3Jl
IHRha2luZyBhIGNhcmQgb3V0LiBCdXQgdGhhdCB3aWxsIG5vdCBiZSBkb25lIGV2ZXJ5IHRpbWUu
PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5BbmQgd2l0aG91dCBsYXp5IHVubW91bnQs
IHRoZSBkZXZpY2Ugd2lsbCBuZXZlciBiZSB1bm1vdW50ZWQsIGNhdXNpbmcgdGhlIG5leHQgbW91
bnQgKHRyaWdnZXJlZCBieSBhbiBpbnNlcnQpIHRvIGZhaWwgYXMgd2VsbC48YnI+DQo8YnI+DQpT
ZWUgYWxzbyB0aGUgZGlzY3Vzc2lvbiBvbiBvdXIgb3duIGlzc3VlIHRyYWNrZXIgWzJdLjwvZGl2
Pg0KPGRpdj48YnI+DQpbMV0mbmJzcDs8YSBocmVmPSJodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWRldmVsLzIwMTAtSnVuZS8wNjYyNDEuaHRtbCI+
aHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1kZXZl
bC8yMDEwLUp1bmUvMDY2MjQxLmh0bWw8L2E+PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRp
dj5bMl0mbmJzcDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdmljdHJvbmVuZXJneS92ZW51
cy9pc3N1ZXMvNTkiPmh0dHBzOi8vZ2l0aHViLmNvbS92aWN0cm9uZW5lcmd5L3ZlbnVzL2lzc3Vl
cy81OTwvYT48L2Rpdj4NCjxkaXY+PGJyPg0KPGRpdj5CZXN0IHJlZ2FyZHMsDQo8ZGl2Pjxicj4N
CjxkaXY+TWF0dGhpanM8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwv
aHRtbD4NCg==

--_000_F0D56DD8329C40A5B003250DB3BB81A3victronenergycom_--
