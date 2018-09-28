Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 144891 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 29 Sep 2018 07:17:53 UTC
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00126.outbound.protection.outlook.com [40.107.0.126])
	by mail.openembedded.org (Postfix) with ESMTP id E5109799A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qbOwpJ4ZOh/mHjCAOwSSya+8L6Y/Nfo4AJc0ktfNrFE=;
	b=5h3XG0n6yIXh5Ajxwpr8Ui7fgE2diV5bFxhG0NbBrmKwp4gwX//X2DvepyczVcJHqzqFkbVOgdjZw9RXPc7XXHXB7Zyw7OwqF9kvRqJZYRbPmeCIrtdFXumdqSM2zxGssnFZiHsmpUekqluJijz/DSeR7G6Xs8Oht56q/fGWBzs=
Received: from AM0PR0702MB3634.eurprd07.prod.outlook.com (52.133.50.150) by
	AM0PR0702MB3747.eurprd07.prod.outlook.com (52.133.51.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1185.16; Fri, 28 Sep 2018 19:30:19 +0000
Received: from AM0PR0702MB3634.eurprd07.prod.outlook.com
	([fe80::a46d:3f25:d1f3:1c13]) by
	AM0PR0702MB3634.eurprd07.prod.outlook.com
	([fe80::a46d:3f25:d1f3:1c13%4]) with mapi id 15.20.1185.019;
	Fri, 28 Sep 2018 19:30:19 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] python3: move sqlite files into
	python-sqlite
Thread-Index: AQHUV0U4HMFBBU8rNEycc+yDCQkKUaUGFNSA
Date: Fri, 28 Sep 2018 19:30:19 +0000
Message-ID: <eb05ed27-3f55-d45c-42e8-1c96cfafa639@victronenergy.com>
References: <20180928160616.6672-1-ross.burton@intel.com>
In-Reply-To: <20180928160616.6672-1-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
x-originating-ip: [2001:1c01:3b04:4900:68b7:73cd:e4f8:d09b]
x-clientproxiedby: AM3PR04CA0137.eurprd04.prod.outlook.com (2603:10a6:207::21)
	To AM0PR0702MB3634.eurprd07.prod.outlook.com
	(2603:10a6:208:25::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM0PR0702MB3747;
	6:hiHlDNjYhTZclgEF64fyQQ6j+9hc3+ZNzfdldFLbaAvnyuVqqg9O2eRCFVxLmodY7SGn/8WwFFNV1n/2I2GH80IPsNmV/DpFVYIA8R+ct8f84QkkcnzXCzRnpyWC/lPRIdkK1AO6R1f145KZZ0siOa/+RIkPFNz5gLAd49VQ/qF8tvDkWqgoiZlZGT60azAQ0uIj0Odgr1geAIJf8svOzzr0Td6+e/0Yap41nCyrnytF5LFA+BaO6JtasAO3IifasA4lvrnn3Mln3hzru4ZFaZOawN9VZTw5UzuTRx9LbPJMnFpWU3pStWZ5oUOaZmLr/pcfQw9N7DL9vqOgBqwNmnfLBL/lP/HWzzEwm6yiOfQ0YW/tSiF5wMUttA2FiNhY5Ewy9C5IKmyy+dILOihaCoUPEd8db7Tp84rTUQXQ+MAkxVaw/98lcetnolu/qyYGwLrVS5Qch0U313a8c3Prug==;
	5:Qt1jdE4SEpILXCbiI1xt2qwSTu0buAP/vyasHICB691m8zKTWlUiVAPV6iqlfMr8kVuOClWGGopdwDDNdAdKLgpS9VDh26ElPnuMJlA8rNdZNzIakJ1EE8R6uiK1Yy5dD9f6YQWNJTpOEiZK5Qlyld2EKd7szNvES4WyVvBEr/4=;
	7:KdKYtSivzoEh+AM3RQQlL/u5QMg65sc9RAD2i/KIBMyIUkBfgLA83JePQGVH/2o0m+0+G0gEUZ/OTcJhsCSUXtrPAocDtapCtZm33U5pOcF2Hzy6ZWQGTtBzjXIqr81oqQbHtMNF6CXUGGq4JnpBN5jqd3VIabCpGURLj1l/OrOw7E8SReMxCVYF+y270+mf5MsqMptrAwW9IKWTfimUB2DPXWvFGNyfK5u8PkbKRSYriqDS9jBZOri9C+WmEgBd
x-ms-office365-filtering-correlation-id: 5ad62206-b739-4396-f4d2-08d62578d337
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR0702MB3747; 
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3747:|AM0PR0702MB3747:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-microsoft-antispam-prvs: <AM0PR0702MB374799C267E42F74C45C73C1C0EC0@AM0PR0702MB3747.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(228905959029699);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991041);
	SRVR:AM0PR0702MB3747; BCL:0; PCL:0; RULEID:;
	SRVR:AM0PR0702MB3747; 
x-forefront-prvs: 0809C12563
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(396003)(346002)(376002)(199004)(189003)(6116002)(58126008)(110136005)(7736002)(476003)(102836004)(256004)(478600001)(68736007)(14454004)(76176011)(2906002)(6506007)(25786009)(46003)(305945005)(53546011)(64126003)(34290500001)(386003)(52116002)(186003)(316002)(2616005)(99286004)(6246003)(11346002)(446003)(486006)(71190400001)(31686004)(71200400001)(105586002)(106356001)(97736004)(65826007)(2501003)(5250100002)(5660300001)(81166006)(2900100001)(6486002)(8676002)(36756003)(8936002)(81156014)(86362001)(65806001)(6436002)(65956001)(31696002)(53936002)(229853002)(6512007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR0702MB3747;
	H:AM0PR0702MB3634.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: FtyZRrBMSewlF1U0lU5pARRxetwh59ZKrLON+o8ZAS+2LLRnoWPaMUVUveURNFwNPP63q1/RooUKyTSBp0Gvp4FzrEgB89nCHJ8dXy0iIVIjyd1V2coVM8uR1Pjge1jpvXmSFfVtbi90c/U/0cV7SILHtfX8KpopemHkJfQPk9otNxwfQSW/j0Tqnr5CGDzwepj44tHB1nDprkBS6aaW8WLrax2w+PjZ8hVtJNpzHrxQ/IJeak0g5SwHdBy4PsTK0oFaRvzlwVVBaZSOGTT0PndTaUYgeGFrTHeI14MqyLfF44+LGi59+H6A4NGYYaNyOkmHGP1rI9hCl/0sfsG6WZimFhEd0JdwwjCrRW6VPNA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad62206-b739-4396-f4d2-08d62578d337
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2018 19:30:19.4430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0702MB3747
X-Microsoft-Exchange-Diagnostics: 1; AM0PR0702MB3747;
	23:WkB9PPT66X9Z/KPg9Lv+chMeJC+bIPWo64+EIDew12AU5irdYtTlAAX1Xlghe2R6IqDWtTfA2A3r9Jm64nE3PrAqyo/0rkYQi4XTYGcpy0kVwhvgul32+GLLX00JOYI3s/oTqYCjyXSSAldOx8HJWw==
X-OriginatorOrg: victronenergy.com
Subject: Re: [PATCH 1/3] python3: move sqlite files into python-sqlite
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
X-List-Received-Date: Sat, 29 Sep 2018 07:17:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <61C2888FFE897F4C8672D9F387401DAB@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64

VGhhbmtzIFJvc3MsDQoNCmJ1aWxkIHRlc3RlZCB0aGlzIGFuZDoNCg0KcGFja2FnZXMtc3BsaXQv
cHl0aG9uLXNxbGl0ZTMvdXNyL2xpYi9weXRob24yLjcvc3FsaXRlMy8gbm93IGNvbnRhaW5zIA0K
X19pbml0X18ucHkNCg0KdGVzdCBlbmQgdXAgaGVyZToNCnBhY2thZ2VzLXNwbGl0L3B5dGhvbi10
ZXN0cy91c3IvbGliL3B5dGhvbjIuNy9zcWxpdGUzL3Rlc3QvDQoNClNvIHNvbHZlZCBhZmFpYWMs
DQoNClJlZ2FyZHMsDQpKZXJvZW4NCg0KDQpPbiAwOS8yOC8yMDE4IDA2OjA2IFBNLCBSb3NzIEJ1
cnRvbiB3cm90ZToNCj4gc3FsaXRlMy9fX2luaXRfXy5weSB3YXMgYWNjaWRlbnRhbGx5IGluY2x1
ZGVkIGluIHB5dGhvbjMtbWlzYy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zL3B5dGhvbjMtbWFuaWZlc3QuanNvbiB8IDkgKystLS0tLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9weXRob24zLW1hbmlm
ZXN0Lmpzb24gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvcHl0aG9uMy1t
YW5pZmVzdC5qc29uDQo+IGluZGV4IDUzOWI3OTY3YjU5Li5mOTIyNTYxMzY4ZCAxMDA2NDQNCj4g
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL3B5dGhvbjMtbWFuaWZl
c3QuanNvbg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvcHl0
aG9uMy1tYW5pZmVzdC5qc29uDQo+IEBAIC05OTQsMTQgKzk5NCw5IEBADQo+ICAgICAgICAgICBd
LA0KPiAgICAgICAgICAgImZpbGVzIjogWw0KPiAgICAgICAgICAgICAgICIke2xpYmRpcn0vcHl0
aG9uJHtQWVRIT05fTUFKTUlOfS9saWItZHlubG9hZC9fc3FsaXRlMy4qLnNvIiwNCj4gLSAgICAg
ICAgICAgICIke2xpYmRpcn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS9zcWxpdGUzL2RiYXBpMi5w
eSIsDQo+IC0gICAgICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vc3Fs
aXRlMy9kdW1wLnB5Ig0KPiArICAgICAgICAgICAgIiR7bGliZGlyfS9weXRob24ke1BZVEhPTl9N
QUpNSU59L3NxbGl0ZTMiDQo+ICAgICAgICAgICBdLA0KPiAtICAgICAgICAiY2FjaGVkIjogWw0K
PiAtICAgICAgICAgICAgIiR7bGliZGlyfS9weXRob24ke1BZVEhPTl9NQUpNSU59L3NxbGl0ZTMv
X19weWNhY2hlX18iLA0KPiAtICAgICAgICAgICAgIiR7bGliZGlyfS9weXRob24ke1BZVEhPTl9N
QUpNSU59L3NxbGl0ZTMvX19weWNhY2hlX18vZGJhcGkyLioucHljIiwNCj4gLSAgICAgICAgICAg
ICIke2xpYmRpcn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS9zcWxpdGUzL19fcHljYWNoZV9fL2R1
bXAuKi5weWMiDQo+IC0gICAgICAgIF0NCj4gKyAgICAgICAgImNhY2hlZCI6IFtdDQo+ICAgICAg
IH0sDQo+ICAgICAgICJzdHJpbmdvbGQiOiB7DQo+ICAgICAgICAgICAic3VtbWFyeSI6ICJQeXRo
b24gc3RyaW5nIEFQSXMgW2RlcHJlY2F0ZWRdIiwNCg0K

