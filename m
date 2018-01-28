Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0089.outbound.protection.outlook.com
	[104.47.37.89])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5AA71A18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=t877xjFF4JUhUAFKHlYucdp3p2DYY/5CDm0T0COtitw=;
	b=oEQ/lILeIpuT3xqTNhUJitNzDvU6t8W8Cbh9lM6ED1ymPrkQa7poIwsAerOzKNd8dW7cX31aCQZYtSt66uLmI0OumCVXa+RXCwI611tDUenkrOh5WMh6TrIPyrniCGEtvxAnMhTHfyWre4eEI/pF0nnwMPGgGnQcSYlrEXcGIks=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB1944.namprd02.prod.outlook.com (10.166.109.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Sun, 28 Jan 2018 17:59:02 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0428.025; Sun, 28 Jan 2018 17:59:02 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: akuster808 <akuster808@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Yocto Project, Spectre and Meltdown
Thread-Index: AQHTjr6G9035m9uNU0avbzZdNA66WqOH/E0AgAAFwMCAAGdsgIAAHGIAgAEddCA=
Date: Sun, 28 Jan 2018 17:59:02 +0000
Message-ID: <BY2PR02MB34720A90F59340CA5819DC9B9E60@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1516102686.29722.267.camel@linuxfoundation.org>
	<1517070952.756.40.camel@linuxfoundation.org>
	<BY2PR02MB347BCA749C4415BE91A11E3B9E70@BY2PR02MB347.namprd02.prod.outlook.com>
	<1517094397.756.44.camel@linuxfoundation.org>
	<0ff82cae-aeee-ae80-76e6-3672a1180b04@gmail.com>
In-Reply-To: <0ff82cae-aeee-ae80-76e6-3672a1180b04@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB1944;
	7:dE+/5HcOy+bU/Xp2Hqp3RaX1+7pd3m/De8R4XQARDAqQtcJna5Yqtc2aoz4lyGje3bGqKYzAlg4IcRwLanaZFBOzj9FCY89tILXaGrKRp//1AK4aS9ndc9HixmNXzvjfJPpP+VgM4JSoT+ByPUGUAm181Me/UVvFJ4i/vPhClDRv/QRXeHVYdp/sGB5GryUZhBYyx+jIs1ozSbehCLNLdhmoPDPtaBfipgJ9SF+EJUNf3nf5SDOG4wuX47z7Z6aE
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 818c3c76-7128-44a9-4d69-08d56678d088
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB1944; 
x-ms-traffictypediagnostic: BY2PR02MB1944:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-microsoft-antispam-prvs: <BY2PR02MB1944FAD0123C67BD8A01BBF7B9E60@BY2PR02MB1944.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(85827821059158)(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(3231101)(2400081)(944501161)(10201501046)(93006095)(93001095)(6055026)(6041288)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BY2PR02MB1944; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1944; 
x-forefront-prvs: 05669A7924
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(366004)(396003)(39850400004)(39380400002)(199004)(189003)(13464003)(377424004)(53546011)(7696005)(2950100002)(8676002)(81166006)(76176011)(6506007)(55016002)(66066001)(81156014)(106356001)(53936002)(2906002)(99286004)(6436002)(9686003)(74316002)(5660300001)(86362001)(26005)(186003)(59450400001)(305945005)(77096007)(14454004)(25786009)(105586002)(97736004)(102836004)(7736002)(6246003)(72206003)(39060400002)(8936002)(478600001)(33656002)(93886005)(229853002)(316002)(3846002)(6116002)(68736007)(2900100001)(110136005)(3660700001)(3280700002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1944;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: T4eVuiGf7pNgoLO7UYU2KPIHMFtj85HGRpY5g2hiNG5ONKu9jM99GBP9YDiC20KkhuI2GGkMzNBoiUkYoW/uoA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818c3c76-7128-44a9-4d69-08d56678d088
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2018 17:59:02.1307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1944
Subject: Re: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Sun, 28 Jan 2018 17:59:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYWt1c3RlcjgwOCBbbWFp
bHRvOmFrdXN0ZXI4MDhAZ21haWwuY29tXQ0KPiBTZW50OiBTYXR1cmRheSwgSmFudWFyeSAyNywg
MjAxOCA0OjQ4IFBNDQo+IFRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz47IE1hbmp1a3VtYXIgSGFydGhpa290ZQ0KPiBNYXRoYSA8TUFOSlVLVU1A
eGlsaW54LmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBZb2N0byBQcm9q
ZWN0LCBTcGVjdHJlIGFuZCBNZWx0ZG93bg0KPiANCj4gDQo+IA0KPiBPbiAwMS8yNy8yMDE4IDAz
OjA2IFBNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gPiBPbiBTYXQsIDIwMTgtMDEtMjcgYXQg
MTY6NTkgKzAwMDAsIE1hbmp1a3VtYXIgSGFydGhpa290ZSBNYXRoYSB3cm90ZToNCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJv
dW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+Pj4gW21haWx0bzpvcGVuZW1iZWRkZWQt
Y29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZg0KPiA+Pj4gT2Yg
UmljaGFyZCBQdXJkaWUNCj4gPj4+IFNlbnQ6IFNhdHVyZGF5LCBKYW51YXJ5IDI3LCAyMDE4IDg6
MzYgQU0NCj4gPj4+IFRvOiBvcGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPj4+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gWW9jdG8g
UHJvamVjdCwgU3BlY3RyZSBhbmQgTWVsdGRvd24NCj4gPj4+DQo+ID4+PiBPbiBUdWUsIDIwMTgt
MDEtMTYgYXQgMTE6MzggKzAwMDAsIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiA+Pj4+IEkganVz
dCB3YW50ZWQgdG8gZ2l2ZSBwZW9wbGUgYW4gdXBkYXRlIG9uIHdoZXJlIHRoZSBwcm9qZWN0IHN0
YW5kcw0KPiA+Pj4+IHdpdGggdGhlc2UgaXNzdWVzLg0KPiA+Pj4gTWFzdGVyIG5vdyBjb250YWlu
cyBnY2MgYW5kIGtlcm5lbCBmaXhlcyAoaW4gbGludXgteW9jdG8pLiBtZXRhLQ0KPiA+Pj4geW9j
dG8tIGJzcCB1cGRhdGVzDQo+ID4+PiBhcmUgc3RpbGwgcGVuZGluZy4NCj4gPj4+DQo+ID4+PiBy
b2Nrby1uZXh0IGFsc28gaGFzIHRob3NlIGZpeGVzIGFuZCBpcyB1bmRlcmdvaW5nIHRlc3Rpbmcg
d2hpY2ggaWYNCj4gPj4+IGl0IHBhc3Nlcywgd2lsbCBnZXQgcHVzaGVkIHRvIHJvY2tvLg0KPiA+
Pj4NCj4gPj4gSSBzZWUgdGhhdCByb2Nrby1uZXh0IGJyYW5jaCBpcyB1cGdyYWRpbmcgdGhlIEdD
QyB2ZXJzaW9uIHRvIDcuMyBmcm9tDQo+ID4+IDcuMiAsIGlzIHRoZXJlIGEgcmVhc29uIHRvIGRv
IHNvPw0KPiA+PiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHdlIHdvdWxkIGJhY2tw
b3J0IHRoZSBzZWN1cml0eSBmaXhlcw0KPiA+PiB0byA3LjIgdmVyc2lvbi4NCj4gPiBBcyBLaGVt
IHJlcGxpZWQsIHRoaXMgaXMgdGhlIHN0YWJsZSBnY2Mgc2VyaWVzIGFuZCBnY2MgcmVtYXBwZWQg
dGhlaXINCj4gPiB2ZXJzaW9uaW5nIHNjaGVtZSBhIHdoaWxlIGJhY2sgdG8gbWVhbiB0aGF0IDcu
MyBpcyBhIHBvaW50IHJlbGVhc2Ugb2YNCj4gPiB0aGUgNyBzZXJpZXMuDQo+ID4NCj4gPiBJJ20g
b2YgdGhlIHZpZXcgdGhhdCB0aGUgZ2NjIHRlYW0ga25vdyBhIGxvdCBtb3JlIGFib3V0IHdoaWNo
IHBhdGNoZXMNCj4gPiBzaG91bGQgYmUgYmFja3BvcnRlZCB0byBhIHN0YWJsZSBzZXJpZXMgYW5k
IGhhdmUgYSBiZXR0ZXIgc2tpbGxzZXQgYW5kDQo+ID4ga25vd2xlZGdlIGJhc2UgdG8ga25vdyBo
b3cgdG8gYXBwbHkgcGF0Y2hlcyBvbnRvIHRoZSBvbGRlciB2ZXJzaW9ucw0KPiA+IHRoYW4gd2Ug
ZG8uIEFzIHN1Y2ggSSBiZWxpZXZlIHRoYXQgNy4zIGlzIHRoZSByaWdodCBhcHByb2FjaCBmb3Ig
cm9ja28uDQo+IA0KPiBBZ3JlZWQuDQoNCkkgdGhvdWdodCBpdCBpcyBhIGJpZyB1cGdyYWRlIGlu
IHN1YnNlcXVlbnQgdXBncmFkZSwgaGVuY2UgbXkgcXVlc3Rpb24uDQoNCj4gDQo+ID4NCj4gPiBE
byB5b3UgaGF2ZSBhIHJlYXNvbiB0byBiZWxpZXZlIHdlIHNob3VsZCBkbyBzb21ldGhpbmcgZWxz
ZT8NCg0KV2UgaGF2ZSByZWxlYXNlZCBhIHJvY2tvIGJhc2VkIGRpc3RyaWJ1dGlvbiwgbXkgZmVh
ciBvZiBjaGFuZ2luZyA3LjItPjcuMyBpbiBzdWJzZXF1ZW50IHVwZ3JhZGUgY3ljbGUgbWlnaHQg
cmVzdWx0IGluIHF1aXRlIHNvbWUgZXh0ZW5zaXZlIHRlc3RpbmcgYWNyb3NzIGFsbCBwcm9kdWN0
IHJhbmdlcyBhbmQgYXBwbGljYXRpb24gZGV2ZWxvcG1lbnQgb2YgdG9wLiBUaGlzIG1pZ2h0IHJl
c3VsdCBpbiBxdWl0ZSBzb21lIGNodXJuLCBoZW5jZSB0aGUgcXVlc3Rpb24uICANCg0KVGhhbmtz
LA0KTWFuanUNCg0K

