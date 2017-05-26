Return-Path: <carol.zhu@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0075.outbound.protection.outlook.com [104.47.2.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2E37820F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 01:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RtItYehqy/E6ob9vPTgWCMKJVPoQrtqzD45p/Jdns3M=;
	b=U0fR5fkbzbROkT9NkzhPnc/ADzIRvOH5ko6wGisOpXLvJVJFAor5Wu65Zo78NxTe9XGIo7DPlMBb88UcKVaJGhrB00tmf4kyQl9xHmEBYPMITmClPOitcL4SSkeGYconU+lYAS7Nvw5izApM2WpwmdxeB++Mp1c4aSDx1hH0PjE=
Received: from AM5PR0401MB2674.eurprd04.prod.outlook.com (10.169.246.8) by
	AM5PR0401MB2676.eurprd04.prod.outlook.com (10.169.246.10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Fri, 26 May 2017 01:56:21 +0000
Received: from AM5PR0401MB2674.eurprd04.prod.outlook.com
	([fe80::34e0:a42:f88f:964b]) by
	AM5PR0401MB2674.eurprd04.prod.outlook.com
	([fe80::34e0:a42:f88f:964b%15]) with mapi id 15.01.1101.022;
	Fri, 26 May 2017 01:56:21 +0000
From: Carol Zhu <carol.zhu@nxp.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad
	patches for pyro
Thread-Index: AQHS0844U/+c/1wJLEicd+Td+KLKpKIE80eAgADqgVA=
Date: Fri, 26 May 2017 01:56:21 +0000
Message-ID: <AM5PR0401MB2674C8508629E9A0834B5D8BE9FC0@AM5PR0401MB2674.eurprd04.prod.outlook.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LYms47eMVfYR8cfFn0+j6UhV_ODNdjzb-HqJ6gC=MNY2w@mail.gmail.com>
In-Reply-To: <CAJTo0LYms47eMVfYR8cfFn0+j6UhV_ODNdjzb-HqJ6gC=MNY2w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.158.241.86]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2676;
	7:XOTqFdwwioExF2exbK9ND4LAHMxNC6+b9X7BFQOfO6WHRQOEFl0tQ5JCsDuZW86LyjWR7grAQ8MTlVacHUiJi8fLeaInSM9DSueF5IxcxBZrnoqdwZVSAHhxV2T6QrXvOO/wHuzikOmaOl2+h/pMPX5C9hrDi5zW4BI7H7rihk4cTfpfQ/u5FWfDmbFYizXO7lUfwWcIC4uBOl0Cms8rbs8lq9ypQpYp+eaOewW80R5OC0iM0wZlflLTvR4XEVFLZtuC33rUFO/g6YP863sQhu/W/hWjLHSqIJZsGxxfFKo6/FWcazbOctq7+XuoROEgeCBlRfyylN2FRmDzfT0VTA==
x-ms-traffictypediagnostic: AM5PR0401MB2676:
x-ms-office365-filtering-correlation-id: 5d0a7fe7-5532-473c-8cc6-08d4a3da685b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2676; 
x-microsoft-antispam-prvs: <AM5PR0401MB2676F1A8875A2A7E449EF678E9FC0@AM5PR0401MB2676.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(21748063052155)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6055026)(6041248)(20161123560025)(20161123555025)(20161123558100)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148);
	SRVR:AM5PR0401MB2676; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0401MB2676; 
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39850400002)(39410400002)(39400400002)(39860400002)(39450400003)(39840400002)(377454003)(24454002)(5250100002)(66066001)(33656002)(50986999)(76176999)(86362001)(54356999)(14454004)(6306002)(236005)(81166006)(9326002)(99286003)(54896002)(8676002)(9686003)(55016002)(6436002)(6506006)(8936002)(110136004)(7736002)(5660300001)(74316002)(38730400002)(6246003)(3846002)(102836003)(4326008)(3280700002)(790700001)(2906002)(53936002)(3660700001)(6916009)(25786009)(189998001)(19609705001)(53546009)(2900100001)(7696004)(2950100002)(229853002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2676;
	H:AM5PR0401MB2674.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2017 01:56:21.3059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2676
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad patches for pyro
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
X-List-Received-Date: Fri, 26 May 2017 01:56:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0401MB2674C8508629E9A0834B5D8BE9FC0AM5PR0401MB2674_"

--_000_AM5PR0401MB2674C8508629E9A0834B5D8BE9FC0AM5PR0401MB2674_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KVGhlc2UgYXJlIGJhY2twb3J0cyBmcm9tIDEuMTEgb3IgZWFybGllci4NCkFu
ZCBJIHdhcyB0b2xkIHRoYXQgTWF4aW4gaXMgY3VycmVudGx5IHdvcmtpbmcgb24gdXBncmFkaW5n
IHRoZSBHU3RyZWFtZXIgc3RhY2sgdG8gMS4xMi4NClNvIEkgYW0gdHJ5aW5nIHRvIHVwc3RyZWFt
IHRoZW0gZm9yIHB5cm8gYXMgdGhlc2UgcHJvYmFibHkgZG8gbm90IG1ha2Ugc2Vuc2UgZm9yIG1h
c3Rlci4NCg0KDQoNCkIuUi4NCkNhcm9sDQoNCkZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJv
c3MuYnVydG9uQGludGVsLmNvbV0NClNlbnQ6IFRodXJzZGF5LCBNYXkgMjUsIDIwMTcgNzo1MyBQ
TQ0KVG86IENhcm9sIFpodSA8Y2Fyb2wuemh1QG54cC5jb20+DQpDYzogT0UtY29yZSA8b3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gW3B5cm9dW1BBVENIIDAvNl0gQWRkIHNvbWUgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIHBh
dGNoZXMgZm9yIHB5cm8NCg0KDQpPbiAyMyBNYXkgMjAxNyBhdCAxNTowOCwgWXVxaW5nIFpodSA8
Y2Fyb2wuemh1QG54cC5jb208bWFpbHRvOmNhcm9sLnpodUBueHAuY29tPj4gd3JvdGU6DQotQWRk
IHNvbWUgZW5oYW5jZW1lbnRzIGZvciBxbWxnbHNyYw0KIFNvbWUgY29tbW9uIGZlYXR1cmVzIGZv
ciBxbWxnbHNyYyBhcmUgYWRkZWQgdG8gbWFrZSBhcHAgZGV2ZWxvcG1lbnQgbXVjaCBlYXNpZXIu
DQoNCi1BZGQgc29tZSBlbmhhbmNlbWVudHMgZm9yIGdzdHBsYXllcg0KIFNvbWUgZ3N0cGxheWVy
IEFQSSBlbmhhbmNlbWVudHMgYXJlIGFkZGVkIHRvIG1ha2UgaXQgbXVjaCBlYXNpZXIgZm9yIHVz
ZXJzIHRvIHVzZS4NCiBXaXRob3V0IHRoZXNlIEFQSSBlbmhhbmNlbWVudHMsIHNvbWUgZmVhdHVy
ZXMgbWF5IG5vdCBiZSByZWFsaXplZA0KIChsaWtlIGFjY3VyYXRlIHNlZWssIHZpZGVvIHNpbmsg
Y29uZmlndXJhdGlvbikgd2hlbiB1c2luZyBnc3RwbGF5ZXIgQVBJLg0KIFNvIGl0IHdvdWxkIGJl
IGJldHRlciBpZiB0aGV5IGNhbiBiZSBwaWNrZWQuDQoNCi1GaXggYSBtZW1vcnkgbGVhayBpc3N1
ZSBpbiBnbHVwbG9hZCwgd2hpY2ggaXMgY29tbW9uDQoNCldoeSBhcmUgdGhlc2UgZm9yIFB5cm8g
b25seT8NCg0KUm9zcw0K

--_000_AM5PR0401MB2674C8508629E9A0834B5D8BE9FC0AM5PR0401MB2674_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
5a6L5L2TOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOWui+S9kyI7DQoJ
cGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJUaW1lcyBOZXcgUm9tYW4iLHNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7
bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVu
ZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0
eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJs
aW5lO30NCnAubXNvbm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25vcm1hbDANCgl7bXNv
LXN0eWxlLW5hbWU6bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdp
bi1yaWdodDowaW47DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6
MGluOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IlRpbWVzIE5ldyBSb21hbiIs
c2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVw
bHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4
dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250
LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6
ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMjVpbiAxLjBpbiAxLjI1aW47fQ0KZGl2
LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYg
Z3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0i
MTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86
c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEi
IC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3Jk
U2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgUm9zcyw8c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYi
PjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1z
ZXJpZiI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
VGhlc2UgYXJlIGJhY2twb3J0cyBmcm9tIDEuMTEgb3IgZWFybGllci4gPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5BbmQgSSB3YXMgdG9sZCB0aGF0IE1heGluIGlzIGN1cnJl
bnRseSB3b3JraW5nIG9uIHVwZ3JhZGluZyB0aGUgR1N0cmVhbWVyIHN0YWNrIHRvIDEuMTIuPG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5TbyBJIGFtIHRyeWluZyB0byB1cHN0
cmVhbSB0aGVtIGZvciBweXJvIGFzIHRoZXNlIHByb2JhYmx5IGRvIG5vdCBtYWtlIHNlbnNlIGZv
ciBtYXN0ZXIuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj5CLlIuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5DYXJvbDxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVv
dDssc2Fucy1zZXJpZiI+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJy
aSZxdW90OyxzYW5zLXNlcmlmIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWls
eTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNh
bnMtc2VyaWYiPiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo8
YnI+DQo8Yj5TZW50OjwvYj4gVGh1cnNkYXksIE1heSAyNSwgMjAxNyA3OjUzIFBNPGJyPg0KPGI+
VG86PC9iPiBDYXJvbCBaaHUgJmx0O2Nhcm9sLnpodUBueHAuY29tJmd0Ozxicj4NCjxiPkNjOjwv
Yj4gT0UtY29yZSAmbHQ7b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZn
dDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBbcHlyb11bUEFUQ0ggMC82XSBB
ZGQgc29tZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQgcGF0Y2hlcyBmb3IgcHlybzxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiAyMyBNYXkgMjAxNyBhdCAxNTowOCwg
WXVxaW5nIFpodSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNhcm9sLnpodUBueHAuY29tIiB0YXJnZXQ9
Il9ibGFuayI+Y2Fyb2wuemh1QG54cC5jb208L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4N
CjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0ND
IDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2lu
LXJpZ2h0OjBpbiI+DQo8ZGl2IGlkPSI6MnBvIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi1BZGQg
c29tZSBlbmhhbmNlbWVudHMgZm9yIHFtbGdsc3JjPGJyPg0KJm5ic3A7U29tZSBjb21tb24gZmVh
dHVyZXMgZm9yIHFtbGdsc3JjIGFyZSBhZGRlZCB0byBtYWtlIGFwcCBkZXZlbG9wbWVudCBtdWNo
IGVhc2llci48YnI+DQo8YnI+DQotQWRkIHNvbWUgZW5oYW5jZW1lbnRzIGZvciBnc3RwbGF5ZXI8
YnI+DQombmJzcDtTb21lIGdzdHBsYXllciBBUEkgZW5oYW5jZW1lbnRzIGFyZSBhZGRlZCB0byBt
YWtlIGl0IG11Y2ggZWFzaWVyIGZvciB1c2VycyB0byB1c2UuPGJyPg0KJm5ic3A7V2l0aG91dCB0
aGVzZSBBUEkgZW5oYW5jZW1lbnRzLCBzb21lIGZlYXR1cmVzIG1heSBub3QgYmUgcmVhbGl6ZWQ8
YnI+DQombmJzcDsobGlrZSBhY2N1cmF0ZSBzZWVrLCB2aWRlbyBzaW5rIGNvbmZpZ3VyYXRpb24p
IHdoZW4gdXNpbmcgZ3N0cGxheWVyIEFQSS48YnI+DQombmJzcDtTbyBpdCB3b3VsZCBiZSBiZXR0
ZXIgaWYgdGhleSBjYW4gYmUgcGlja2VkLjxicj4NCjxicj4NCi1GaXggYSBtZW1vcnkgbGVhayBp
c3N1ZSBpbiBnbHVwbG9hZCwgd2hpY2ggaXMgY29tbW9uPG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KV2h5IGFy
ZSB0aGVzZSBmb3IgUHlybyBvbmx5PzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5Sb3NzPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_AM5PR0401MB2674C8508629E9A0834B5D8BE9FC0AM5PR0401MB2674_--
