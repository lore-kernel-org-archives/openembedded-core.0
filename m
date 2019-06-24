Return-Path: <prvs=707896d6ab=alejandro.delcastillo@ni.com>
X-Greylist: delayed 1883 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Jun 2019 19:57:47 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 9B35B7E0D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 19:57:47 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5OJLABM018000; Mon, 24 Jun 2019 14:26:24 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp2056.outbound.protection.outlook.com [104.47.36.56])
	by mx0b-00010702.pphosted.com with ESMTP id 2t9j576m95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 24 Jun 2019 14:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6/v6V14D7kxY/qOjy7DkErLvYTO6snbtZodljv1m+vc=;
	b=d9lShNpMdzTuRpy/skgrHbWmUwo9cgB5mDE/X5Evz8yGQZSkf+4CeSi0l1oPjNC2ct6kHk4VfshgWShn2qB++bASeZ+cP+80Nado8cD9pQwELwIZmmvMAISa+XpjQ+v6Djfevc19Q8wKcoSd5NMNxAHeEyL2d1tw/4Ozv+m0QYI=
Received: from SN6PR04MB4221.namprd04.prod.outlook.com (52.135.71.147) by
	SN6PR04MB3854.namprd04.prod.outlook.com (52.135.81.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Mon, 24 Jun 2019 19:26:23 +0000
Received: from SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::749c:ad67:d220:a936]) by
	SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::749c:ad67:d220:a936%6]) with mapi id 15.20.2008.014;
	Mon, 24 Jun 2019 19:26:22 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [EXTERNAL] Re: [OE-core] [PATCH 1/2] opkg: upgrade to version
	0.4.1
Thread-Index: AQHVIiUAWxcRlwW3jEuiSoP2S4ktHqaa+u6AgBBGMIA=
Date: Mon, 24 Jun 2019 19:26:22 +0000
Message-ID: <c68e1269-05c8-a64f-8be4-a5bb33952c67@ni.com>
References: <20190613201701.31014-1-alejandro.delcastillo@ni.com>
	<20190613201701.31014-2-alejandro.delcastillo@ni.com>
	<31526320140c91a4d7fde587a5e475e2071c00e0.camel@linuxfoundation.org>
In-Reply-To: <31526320140c91a4d7fde587a5e475e2071c00e0.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0701CA0032.namprd07.prod.outlook.com
	(2603:10b6:803:2d::12) To SN6PR04MB4221.namprd04.prod.outlook.com
	(2603:10b6:805:30::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bbfbd7f-0ebf-4b6d-6452-08d6f8d9d75f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:SN6PR04MB3854; 
x-ms-traffictypediagnostic: SN6PR04MB3854:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SN6PR04MB3854425950622D56D5BB57B886E00@SN6PR04MB3854.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(346002)(396003)(136003)(376002)(24433001)(189003)(199004)(8936002)(6506007)(81156014)(81166006)(6246003)(6116002)(3846002)(86362001)(68736007)(8676002)(53936002)(31696002)(110136005)(6486002)(6436002)(6306002)(6512007)(2501003)(2616005)(476003)(99286004)(73956011)(66446008)(66946007)(36756003)(5660300002)(478600001)(102836004)(71200400001)(305945005)(71190400001)(186003)(31686004)(229853002)(26005)(316002)(66476007)(25786009)(66066001)(52116002)(2906002)(446003)(14454004)(7736002)(14444005)(966005)(256004)(11346002)(486006)(386003)(76176011)(53546011)(64756008)(66556008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB3854;
	H:SN6PR04MB4221.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JBtR8hFL/VQ+ezTTQQtUK0R0gmqF0AXdfaSbGPeRDZEYLG32Mvw00zMo+4cZZuU8UVahCzGoyof8yMrQzxrr77eXuCuHGUlO/mbH7A/I3RX04FjlTpC4ZWu9M88PDaHLvN1gzLr6pWubO5rFG06HsaBJytjwER/XXbl83RIRBclBu5CnTkmaTjO1Yyn+pCI8DBrzWk1PRkllNP755UDMWfOmw/5bYdv3sP0Sr8dRdx/Mg/SnLWBt852pvMSCiCBs8pEgk4rxMpUAIc98MbDsgkm1ixacqODG6cJ3gzut5fLvqR+MaQTBFPM4kEtcgDQ+i2CJ3ZRrSQtuSo0sflfx3pugizCx90mppa1Rz5kg1BIio0N7XEpKsgCgfpAVcJisxBrnTTuWKWNt9p2xapm92Jru1by7m+qYCofhyZZg4NM=
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbfbd7f-0ebf-4b6d-6452-08d6f8d9d75f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 19:26:22.7766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alejandro.delcastillo@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3854
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906240154
Subject: Re: [PATCH 1/2] opkg: upgrade to version 0.4.1
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
X-List-Received-Date: Mon, 24 Jun 2019 19:57:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FD71E8674CB6C45AF977DA7D7F9381C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCk9uIDYvMTQvMTkgNTo1NCBBTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+IE9uIFRodSwg
MjAxOS0wNi0xMyBhdCAxNToxNyAtMDUwMCwgQWxlamFuZHJvIGRlbCBDYXN0aWxsbyB3cm90ZToN
Cj4+IC0gRHJvcCAwMDAxLWxpYm9wa2ctYWRkLWFkZC1pZ25vcmUtcmVjb21tZW5kcy1vcHRpb24u
cGF0Y2gNCj4+IC0gRHJvcCAwMDAxLW9wa2ctYWRkLXRhcmdldC1mb3ItdGVzdHN1aXRlLWluc3Rh
bGxhdGlvbi5wYXRjaA0KPj4gLSBEcm9wIDAwMDEtcmVncmVzcy1pc3N1ZTcyLnB5LXJlc29sdmUt
cGF0aHMtYmVmb3JlLWNvbXBhcmlzaW9uLnBhdGNoDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQWxl
amFuZHJvIGRlbCBDYXN0aWxsbyA8YWxlamFuZHJvLmRlbGNhc3RpbGxvQG5pLmNvbT4NCj4+IC0t
LQ0KPj4gICAuLi5wa2ctYWRkLWFkZC1pZ25vcmUtcmVjb21tZW5kcy1vcHRpb24ucGF0Y2ggfCAy
NTkgLS0tLS0tLS0tLS0tLS0tLQ0KPj4gLS0NCj4+ICAgLi4uZGQtdGFyZ2V0LWZvci10ZXN0c3Vp
dGUtaW5zdGFsbGF0aW9uLnBhdGNoIHwgIDQzIC0tLQ0KPj4gICAuLi4ucHktcmVzb2x2ZS1wYXRo
cy1iZWZvcmUtY29tcGFyaXNpb24ucGF0Y2ggfCAgMzEgLS0tDQo+PiAgIC4uLi9vcGtnL3tvcGtn
XzAuNC4wLmJiID0+IG9wa2dfMC40LjEuYmJ9ICAgICB8ICAgNyArLQ0KPj4gICA0IGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzM4IGRlbGV0aW9ucygtKQ0KPj4gICBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZy8wMDAxLWxpYm9wa2ctYWRk
LQ0KPj4gYWRkLWlnbm9yZS1yZWNvbW1lbmRzLW9wdGlvbi5wYXRjaA0KPj4gICBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZy8wMDAxLW9wa2ctYWRkLQ0K
Pj4gdGFyZ2V0LWZvci10ZXN0c3VpdGUtaW5zdGFsbGF0aW9uLnBhdGNoDQo+PiAgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtnLzAwMDEtcmVncmVzcy0N
Cj4+IGlzc3VlNzIucHktcmVzb2x2ZS1wYXRocy1iZWZvcmUtY29tcGFyaXNpb24ucGF0Y2gNCj4+
ICAgcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnL3tvcGtnXzAuNC4wLmJiID0+IG9w
a2dfMC40LjEuYmJ9DQo+PiAoODclKQ0KPiANCj4gVW5mb3J0dW5hdGVseSB0aGlzIGRvZXNuJ3Qg
cXVpdGUgYnVpbGQ6DQo+IA0KPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIv
dXJsP3U9aHR0cHMtM0FfX2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmdfdHlwaG9vbl8tMjNf
YnVpbGRlcnNfNjVfYnVpbGRzXzcwNiZkPUR3SUNhUSZjPUlfMFl3b0t5N3o1TE1UVmR5TzZZQ2lF
MnV6STFqalpadUlQZWxjU2ppeEEmcj13TmNyTDJha1JuNmpmeGhIYUthdlVySkJfQzlKQU1YdHlu
akxkOFp6Z1hRJm09bENYOEZaOWVYZURzdmVhUlNFdE5EblQ5MW5fTHRSMTVJSmdxdktZb0JjdyZz
PUdYX01XalRaM1N5N1BIQnMyck5BMFh4TExNT3FROUlYekVtcUg2QlVoQXcmZT0NCj4gDQo+IEVS
Uk9SOiBvcGtnLTFfMC40LjEtcjAgZG9fcGFja2FnZTogRmF0YWwgZXJyb3JzIG9jY3VycmVkIGlu
IHN1YnByb2Nlc3NlczoNCj4gQ29tbWFuZCAnWydhcm0tcG9reS1saW51eC1nbnVlYWJpLW9iamNv
cHknLCAnLS1vbmx5LWtlZXAtZGVidWcnLCAnL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9i
ZWFnbGVib25lL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcnRleGE4aGYtbmVvbi1wb2t5LWxpbnV4
LWdudWVhYmkvb3BrZy8xXzAuNC4xLXIwL3BhY2thZ2UvdXNyL2xpYi9vcGtnL3B0ZXN0L3Rlc3Rz
L2xpYm9wa2dfdGVzdCcsICcvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2JlYWdsZWJvbmUv
YnVpbGQvYnVpbGQvdG1wL3dvcmsvY29ydGV4YThoZi1uZW9uLXBva3ktbGludXgtZ251ZWFiaS9v
cGtnLzFfMC40LjEtcjAvcGFja2FnZS91c3IvbGliL29wa2cvcHRlc3QvdGVzdHMvLmRlYnVnL2xp
Ym9wa2dfdGVzdCddJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAxDQo+IFN1YnByb2Nl
c3Mgb3V0cHV0OmFybS1wb2t5LWxpbnV4LWdudWVhYmktb2JqY29weTovaG9tZS9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL2JlYWdsZWJvbmUvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29ydGV4YThoZi1u
ZW9uLXBva3ktbGludXgtZ251ZWFiaS9vcGtnLzFfMC40LjEtcjAvcGFja2FnZS91c3IvbGliL29w
a2cvcHRlc3QvdGVzdHMvbGlib3BrZ190ZXN0OiBmaWxlIGZvcm1hdCBub3QgcmVjb2duaXplZA0K
PiANCj4gRVJST1I6IG9wa2ctMV8wLjQuMS1yMCBkb19wYWNrYWdlOg0KPiBFUlJPUjogb3BrZy0x
XzAuNC4xLXIwIGRvX3BhY2thZ2U6IEZ1bmN0aW9uIGZhaWxlZDogc3BsaXRfYW5kX3N0cmlwX2Zp
bGVzDQo+IA0KPiBUaGlzIG1pZ2h0IG9ubHkgYmUgYW4gaXNzdWUgb24gbm9uLUlBIG1hY2hpbmVz
Pw0KDQpUdXJucyBvdXQgdGhhdCB0aGUgb3BrZyB0ZXN0IHN1aXRlIGhhcyBhIGhhbmRtYWRlIE1h
a2VmaWxlLiBTbyB3aGVuIHRoZSANCnJlbGVhc2UgdGFyYmFsbCB3YXMgY3JlYXRlZCAobWFrZSBk
aXN0KSwgaXQgaW5jb3JyZWN0bHkgY3JlYXRlZCBhIA0KTWFrZWZpbGUuaW4gd2hpY2ggaXMgZ2Vu
ZXJhdGluZyBhIGJvZ3VzIGJpbmFyeSBvbiB0aGUgdGVzdHMgZm9sZGVyLCANCndoaWNoIGlzIGNh
dXNpbmcgdGhlIHFhIGVycm9yLg0KDQpGb3IgdGhlIG5leHQgb3BrZyByZWxlYXNlLCBJIHdhbnQg
dG8gaW50ZWdyYXRlIHRoZSBBVFMgaW50byBhdXRvbWFrZSwgc28gDQppdCBjYW4gcGxhY2Ugbmlj
ZSB3aXRoIG90aGVyIHRvb2xzLiBGb3Igbm93LCBJIGFtIGdvaW5nIHRvIGFkZCBjb2RlIHRvIA0K
cmVtb3ZlIHRoZSBib2d1cyBiaW5hcmllcy4NCg0KdjIgY29taW5nIHNob3J0bHkNCg0KLS0gDQpD
aGVlcnMsDQoNCkFsZWphbmRybw0K

