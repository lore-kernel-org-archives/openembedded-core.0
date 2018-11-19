Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 10718 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Nov 2018 23:29:55 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50077.outbound.protection.outlook.com [40.107.5.77])
	by mail.openembedded.org (Postfix) with ESMTP id 140D06C466
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 23:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fLQypajNGynxWfdS5hxnvdPGkgjlCTaHgVlD6lcbwiE=;
	b=JeXtG2bG5kmNqt1AFTo0HSv+jp6T4Qusb/jcAy4wfFLp9MH8VY6mjkoCeSkHsjY4YDpIJoZVKAdg/KmeHjQxkRs0uyoqR9UJFyI/n3Xz4Ek+qBK/MIwHCjWMQv2Spihegke0eU5RAQ7jESMdekhbWFd+sqi/ZRuc52Zxeva/Nw0=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4251.eurprd04.prod.outlook.com (52.135.131.25) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.33; Mon, 19 Nov 2018 09:56:35 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::891a:cab2:b71c:5651]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::891a:cab2:b71c:5651%2]) with mapi id 15.20.1339.021;
	Mon, 19 Nov 2018 09:56:35 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	Lukasz Majewski <lukma@denx.de>
Thread-Topic: [OE-core] [thud][PATCH] ppce500v2: remove spe *The PowerPC SPE
	support is split off to a separate powerpcspe port
Thread-Index: AQHUfV4NJ1zisrMUUUOsQ7S5buwl+KVSS5gAgAAKPgCAAAQQAIAEhz9g
Date: Mon, 19 Nov 2018 09:56:35 +0000
Message-ID: <DB7PR04MB5068B1F79EED7E9F1531147184D80@DB7PR04MB5068.eurprd04.prod.outlook.com>
References: <1542339582-13778-1-git-send-email-chunrong.guo@nxp.com>
	<6338fea41b758f901b90c9d378c50e824fb01593.camel@linuxfoundation.org>
	<20181116133124.14279e76@jawa>
	<79fd2ed2fc241bf2770b4e471d94cb024c313140.camel@linuxfoundation.org>
In-Reply-To: <79fd2ed2fc241bf2770b4e471d94cb024c313140.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4251;
	6:WkPFHUmsuTSzdhs3womfWKsioV/PSXyxpoNXGW+hAvt6kKSnrTNPy5MebIn2piSii7SW53Vbp4y0dGeKRwX27SrRww4sIJ10i4Rs62BN7CjfNLQDyov6GqH4+CgwPlADGzgR8dDO2X36dAVKgKDZqdPPVOMP9H+w5JlfjXOz7mEF30U43A8qM9d0oKUF0NMnauFh66Vhn625agHlr7DI6p224JUBz/mDzvOcfYNGQGa5uONqfkp/3aMZA6Qa553HAgEE2zsouTqli5BrgEyCuvIqopEe0x18SUqm60gstZANvYPZBhKwBJj9D+pKHj1kpar+NEMOHYqXJJ8sMD1JUav84Loz3Bn6iKRSBVZ0FjldMblj/B8arheSrcuIHEugzXbCWDfN/E1iMTyHObLoW4w+RUHFZ0X4k39vH0X0zdK6hP1ceDPu7hRGb0oawCdPjFNpj3zplH3Ru488HTJ3gg==;
	5:PMTSyhRK2SvKHyDafakZKKduznxz4h6wmeAuoISWItijo3qRY7n5PxAIe0pR7KabDJldFtVTMgHtFpgr0IfQ8v73xek2sbbl5wqh7wTWZNoAU+hLOwZfRTQlV1pXLfRapq+7VoGKDeXgazSFtRab8ft+QTeyxJ8tMunuDng+psw=;
	7:6mJDmY62Q7xua7ZMkUQIqf4DKzije4i9bGhH4GGDllr0RIHrejD+u3y7xHsJOC6prvL4/qEZtbkMCYb8otM9sX/wBtEtXz27EsUQrbLTUqjwW6s2BR0q7jv/MwW6yanx3kgAXhh8JKEXKLt6mBiIOQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e9259cd5-2a9b-461a-202d-08d64e054aab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4251; 
x-ms-traffictypediagnostic: DB7PR04MB4251:
x-microsoft-antispam-prvs: <DB7PR04MB42516AB91CCD33998E1B6F1184D80@DB7PR04MB4251.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(250305191791016)(22074186197030)(183786458502308)(264703809997249)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231415)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DB7PR04MB4251; BCL:0; PCL:0; RULEID:; SRVR:DB7PR04MB4251; 
x-forefront-prvs: 08617F610C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(366004)(136003)(376002)(346002)(13464003)(199004)(189003)(53754006)(99286004)(26005)(305945005)(186003)(256004)(66066001)(71190400001)(14454004)(71200400001)(93886005)(966005)(316002)(110136005)(54906003)(446003)(7736002)(53546011)(6506007)(76176011)(2501003)(74316002)(102836004)(14444005)(6116002)(68736007)(55016002)(6306002)(478600001)(97736004)(33656002)(9686003)(6436002)(7696005)(2906002)(2900100001)(3846002)(8936002)(106356001)(229853002)(81166006)(81156014)(8676002)(6246003)(53936002)(86362001)(4001150100001)(25786009)(5660300001)(476003)(105586002)(4326008)(11346002)(486006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4251;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: hJI/AY89O9Wd4KCP9Cd28KNE+DgDRbhroqv8jqBpzKOP44Mwnl158qUwKDvIdwpHezaIqdfdSL4x1AbLjdj6wKx/ZBI3GDYPfvBiTltebzoqS6xhSqWbVejiZs9cLQIxsCU9arY1GM1Bxvp2aMBuiLqg0lFtxeC1QDZAYLdHi2CB70IhZLOsu1qqa9ZoVyZp5vQCuPL1KQnVWvRZEHLfdDl+J4LTv9djSprBTbGwZ0+qjRw9Ll+2lSL/wfmZtLQCXS51CYihyFjRLkzYlUo0wmoZi0L2dzNZSICDceBqY7fvRtGlbucfDlKeTsBFT6Kd6nNcMpd+rAEIjukr7LCYsDTGdolN3+GqgA6kOMyUBnc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9259cd5-2a9b-461a-202d-08d64e054aab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2018 09:56:35.3567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4251
Cc: Wolfgang Denk <wd@denx.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] ppce500v2: remove spe *The PowerPC SPE support is split off to a separate powerpcspe port
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
X-List-Received-Date: Mon, 19 Nov 2018 23:29:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpIZWxsbyBhbGwsDQpQbGVhc2UgcmV2aWV3IGdjYyBjaGFuZ2VzIGFib3V0IGlzc3VlLg0KaHR0
cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9nY2MvZ2NjLTgvY2hhbmdlcy5odG1sDQpodHRwczov
L2djYy5nbnUub3JnL21sL2djYy8yMDE4LTA0L21zZzAwMTAyLmh0bWwNCg0KdGhhbmtzDQpjaHVu
cm9uZw0KDQoNCg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiByaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPiANClNlbnQ6IDIwMTjlubQxMeaciDE25pelIDIwOjQ2DQpUbzogTHVrYXN6IE1hamV3
c2tpIDxsdWttYUBkZW54LmRlPg0KQ2M6IEMuci4gR3VvIDxjaHVucm9uZy5ndW9AbnhwLmNvbT47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IFdvbGZnYW5nIERlbmsg
PHdkQGRlbnguZGU+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFt0aHVkXVtQQVRDSF0gcHBjZTUw
MHYyOiByZW1vdmUgc3BlICpUaGUgUG93ZXJQQyBTUEUgc3VwcG9ydCBpcyBzcGxpdCBvZmYgdG8g
YSBzZXBhcmF0ZSBwb3dlcnBjc3BlIHBvcnQNCg0KT24gRnJpLCAyMDE4LTExLTE2IGF0IDEzOjMx
ICswMTAwLCBMdWthc3ogTWFqZXdza2kgd3JvdGU6DQo+IEhpIFJpY2hhcmQsDQo+IA0KPiA+IFdo
YXQgZG9lcyAiVGhlIFBvd2VyUEMgU1BFIHN1cHBvcnQgaXMgc3BsaXQgb2ZmIHRvIGEgc2VwYXJh
dGUgDQo+ID4gcG93ZXJwY3NwZSBwb3J0IiBtZWFuPw0KPiA+IA0KPiA+IFRoYXQgZ2NjIHN1cHBv
cnQgaXMgYmVpbmcgZHJvcHBlZCBhbmQgaXRzIGdvaW5nIHNvbWV3aGVyZSBzZXBhcmF0ZT8NCj4g
PiANCj4gPiBUaGF0IHdlJ3JlIGRyb3BwaW5nIHNwZSBzdXBwb3J0IGZyb20gT0U/DQo+IA0KPiBJ
IGRvIGhvcGUgTk9ULg0KPiANCj4gVGhlcmUgYXJlIHN0aWxsIHNvbWUgdXNlcnMgb2YgdGhvc2Ug
U1BFIFNvQ3MuIFBsZWFzZSBkbyBub3QgcmVtb3ZlIGl0IA0KPiBmcm9tIE9FLg0KDQpJIHdvdWxk
IGhpZ2hsaWdodCB0aGF0IFlvY3RvIFByb2plY3QgYW5kIE9FIGdldCB2ZXJ5IGxpdHRsZSBzdXBw
b3J0IGZvciBhbnl0aGluZyBQb3dlclBDIHJlbGF0ZWQgYW5kIHRoYXQgdXBzdHJlYW0gZ2NjIGhh
dmUgYWxyZWFkeSByZW1vdmVkIHBhcnRzIG9mIHRoZSBTUEUgc3VwcG9ydC4gV2Ugd2lsbCBsaWtl
bHkgZW5kIHVwIGhhdmluZyB0byBmb2xsb3cgd2hhdCBnY2MgZG9lcywgd2UgaGF2ZSBhIGhhY2sg
aW4gcGxhY2Ugbm93IGJ1dCBpdCB3b24ndCBsYXN0IGFub3RoZXIgZ2NjIG1ham9yIHZlcnNpb24g
dXBncmFkZS4NCg0KU28gaWYgeW91IG9yIHlvdXIgY3VzdG9tZXJzIGNhcmUgYWJvdXQgU1BFIG9y
IFBvd2VyUEMgaW4gZ2VuZXJhbCwgd2UgcmVhbGx5IG5lZWQgdG8gc2VlIG1vcmUgc3VwcG9ydCBh
dCB0aGUgWW9jdG8gUHJvamVjdCBhZHZpc29yeSBib2FyZCB0byBjb250aW51ZSB0byBrZWVwIGl0
IGFzIGEgZmlyc3QgY2xhc3MgY2l0aXplbi4NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg0K

