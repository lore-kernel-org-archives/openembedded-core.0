Return-Path: <Aditya.Tayade@kpit.com>
X-Greylist: delayed 48849 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Jun 2019 06:16:13 UTC
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380084.outbound.protection.outlook.com [40.107.138.84])
	by mail.openembedded.org (Postfix) with ESMTP id D02EA7C603
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GW+1ryAJsU4j0l6IyItaK+6A7odWJs+dDbldsFKzG/0=;
	b=LgbT2c4uvY9lF1Vu7tRYHZtfgq61BBz2qqBbiPn+c6uJs2FCki33uvEKphmUmmLT0NqVdams3JCCe7hanTBkfFGsn7O/WEv0/8anLSTXodMbezMmvxWo0SQ2tSY6hfTLZswHJl1Orq4iZvOFSjiWsk3JhWOoKACIHIKyR8rNePk=
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM (10.174.216.146) by
	BMXPR01MB2277.INDPRD01.PROD.OUTLOOK.COM (52.133.135.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1943.22; Mon, 3 Jun 2019 16:42:02 +0000
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::e8c8:902c:82ec:579d]) by
	BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::e8c8:902c:82ec:579d%5]) with mapi id 15.20.1943.018;
	Mon, 3 Jun 2019 16:42:02 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [poky][meta][PATCH] package_manager.py: handle renamed packages
	for PACKAGE_EXCLUDE with opkg
Thread-Index: AQHVGitErRR2fRUjWEe1+YbANDQ8Mw==
Date: Mon, 3 Jun 2019 16:42:01 +0000
Message-ID: <1559580099-29530-1-git-send-email-Aditya.Tayade@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0055.eurprd09.prod.outlook.com
	(2603:10a6:802:28::23) To BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:11::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [115.112.39.238]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d15f3378-4a5d-4a55-28de-08d6e8426709
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BMXPR01MB2277; 
x-ms-traffictypediagnostic: BMXPR01MB2277:
x-microsoft-antispam-prvs: <BMXPR01MB22778B9925748F42FE03DC7591140@BMXPR01MB2277.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(396003)(366004)(136003)(376002)(346002)(39860400002)(199004)(189003)(478600001)(72206003)(14454004)(25786009)(4326008)(86362001)(3846002)(6116002)(2351001)(53936002)(36756003)(6506007)(55236004)(5640700003)(6436002)(8936002)(6486002)(5660300002)(66066001)(7736002)(8676002)(81156014)(81166006)(6512007)(50226002)(102836004)(305945005)(52116002)(386003)(68736007)(26005)(186003)(99286004)(54906003)(6916009)(476003)(2616005)(486006)(66556008)(66476007)(73956011)(66946007)(66446008)(2501003)(256004)(14444005)(66574012)(316002)(2906002)(71190400001)(71200400001)(64756008)(21314003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB2277;
	H:BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:3; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZAEfCnJMaMdCTu/oMd0UR612LNcf4OECDNcs6FKN4+NPSEFDvHbYkiw9PtcRMWTMNiof6/PPmqdTfNzE0oK7L/ACDujtMLEnaOQr+DES0pWLA75vtZrB4mMVoiUM45R+LYXxgJL3Z5iCp9lrjDK9Iv/ipgK3+FrCn2WV5+s93Rvx2ARKBekutV7j47urckhcFMFeqgGVKgP+isZZGiaIn7RA8rUe9jt3FjMY+2Mdabbs6LSkJsJEred0sELVYm6dl6KOEOQSDubGmens7WsSJPHn4Gb8rCUfn4UxLo7t+bRj4XTmPMz9I/+Eq+z6tqUNEaMe+N8G0tWzph30+zw6AAKGUSMTp6zRtL6EyJST67GIhO6Pb+P8mDNS1hePya+wwAGvTTHdZBXhKlp00cNIzcfh1CcSJI9raXetM5/P77w=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15f3378-4a5d-4a55-28de-08d6e8426709
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 16:42:01.8426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adityat3@kpit.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2277
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Michael Ho <Michael.Ho@bmw.de>
Subject: [poky][meta][PATCH] package_manager.py: handle renamed packages for PACKAGE_EXCLUDE with opkg
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
X-List-Received-Date: Tue, 04 Jun 2019 06:16:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogTWljaGFlbCBIbyA8TWljaGFlbC5Ib0BibXcuZGU+DQoNClRoZSBQQUNLQUdFX0VYQ0xV
REUgdmFyaWFibGUgaXMgdXNlZCB0byBwYXNzIGEgbGlzdCBvZiBwYWNrYWdlcyB0byBiZQ0KZm9y
YmlkZGVuIGZyb20gaW5zdGFsbGF0aW9uIHdpdGggb3BrZy4gVGhpcyBsaXN0IGhvd2V2ZXIgZG9l
cyBub3QgYWNjb3VudA0Kbm9ybWFsbHkgZm9yIHRoZSByZW5hbWluZyBvZiBwYWNrYWdlcyB3aGlj
aCBjYW4gb2NjdXIgKGZvciBleGFtcGxlIHdoZW4gdGhlDQpkZWJpYW4gYmJjbGFzcyBpcyBlbmFi
bGVkLCBwYWNrYWdlcyB3aXRoIGxpYnMgYXJlIHJlbmFtZWQgZnJvbSB4eHggdG8gbGlieHh4KQ0K
YW5kIHNvIGV4cGVjdGVkIGV4Y2x1ZGVkIHBhY2thZ2VzIGFyZSBub3QgYmxvY2tlZC4NCg0KUmF0
aGVyIHRoYW4gdGVkaW91c2x5IG1haW50YWluaW5nIHRoZSBQQUNLQUdFX0VYQ0xVREUgdmFyaWFi
bGUgdG8gaGFuZGxlDQpyZW5hbWVkIHBhY2thZ2VzIHRoYXQgY2FuIGR5bmFtaWNhbGx5IGNoYW5n
ZSwgbW92ZSB0aGUgZXhwYW5zaW9uIG9mIHRoZQ0KdmFyaWFibGUgZnJvbSBwYXJzaW5nIHRpbWUg
dG8gcnVuIHRpbWUgc28gaXQgY2FuIHVzZSB0aGUgcGtnZGF0YSBkaWN0aW9uYXJpZXMNCnRvIGFk
ZCBhdXRvbWF0aWNhbGx5IGFueSByZW5hbWVkIHBhY2thZ2VzLg0KDQpVcHN0cmVhbS1TdGF0dXM6
IFBlbmRpbmcNCg0KU2lnbmVkLW9mZi1ieTogTWljaGFlbCBIbyA8TWljaGFlbC5Ib0BibXcuZGU+
DQpTaWduZWQtb2ZmLWJ5OiBBZGl0eWEuVGF5YWRlIDxBZGl0eWEuVGF5YWRlQGtwaXQuY29tPg0K
LS0tDQogbWV0YS9jbGFzc2VzL3BhY2thZ2VfaXBrLmJiY2xhc3MgfCAgMSAtDQogbWV0YS9saWIv
b2UvcGFja2FnZV9tYW5hZ2VyLnB5ICAgfCAxNSArKysrKysrKysrKysrKysNCiAyIGZpbGVzIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21l
dGEvY2xhc3Nlcy9wYWNrYWdlX2lway5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2VfaXBr
LmJiY2xhc3MNCmluZGV4IGQxYjMxN2IuLmZhNzE4NjkgMTAwNjQ0DQotLS0gYS9tZXRhL2NsYXNz
ZXMvcGFja2FnZV9pcGsuYmJjbGFzcw0KKysrIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2VfaXBrLmJi
Y2xhc3MNCkBAIC0xMiw3ICsxMiw2IEBAIE9QS0dCVUlMRENNRCA/Pz0gJ29wa2ctYnVpbGQgLVog
eHogLWEgIiR7WFpfREVGQVVMVFN9IicNCg0KIE9QS0dfQVJHUyArPSAiLS1mb3JjZV9wb3N0aW5z
dGFsbCAtLXByZWZlci1hcmNoLXRvLXZlcnNpb24iDQogT1BLR19BUkdTICs9ICIke0BbJycsICct
LW5vLWluc3RhbGwtcmVjb21tZW5kcyddW2QuZ2V0VmFyKCJOT19SRUNPTU1FTkRBVElPTlMiKSA9
PSAiMSJdfSINCi1PUEtHX0FSR1MgKz0gIiR7QFsnJywgJy0tYWRkLWV4Y2x1ZGUgJyArICcgLS1h
ZGQtZXhjbHVkZSAnLmpvaW4oKGQuZ2V0VmFyKCdQQUNLQUdFX0VYQ0xVREUnKSBvciAiIikuc3Bs
aXQoKSldWyhkLmdldFZhcigiUEFDS0FHRV9FWENMVURFIikgb3IgIiIpLnN0cmlwKCkgIT0gIiJd
fSINCg0KIE9QS0dMSUJESVIgPSAiJHtsb2NhbHN0YXRlZGlyfS9saWIiDQoNCmRpZmYgLS1naXQg
YS9tZXRhL2xpYi9vZS9wYWNrYWdlX21hbmFnZXIucHkgYi9tZXRhL2xpYi9vZS9wYWNrYWdlX21h
bmFnZXIucHkNCmluZGV4IDA2ZmViNGQuLmNhNjZiZGYgMTAwNjQ0DQotLS0gYS9tZXRhL2xpYi9v
ZS9wYWNrYWdlX21hbmFnZXIucHkNCisrKyBiL21ldGEvbGliL29lL3BhY2thZ2VfbWFuYWdlci5w
eQ0KQEAgLTExNjAsNiArMTE2MCwyMSBAQCBjbGFzcyBPcGtnUE0oT3BrZ0Rwa2dQTSk6DQogICAg
ICAgICBzZWxmLmRlcGxveV9sb2NrX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5kZXBsb3lfZGly
LCAiZGVwbG95LmxvY2siKQ0KICAgICAgICAgc2VsZi5vcGtnX2NtZCA9IGJiLnV0aWxzLndoaWNo
KG9zLmdldGVudignUEFUSCcpLCAib3BrZyIpDQogICAgICAgICBzZWxmLm9wa2dfYXJncyA9ICIt
LXZvbGF0aWxlLWNhY2hlIC1mICVzIC10ICVzIC1vICVzICIgJSAoc2VsZi5jb25maWdfZmlsZSwg
c2VsZi5kLmV4cGFuZCgnJHtUfS9pcGt0ZW1wLycpICx0YXJnZXRfcm9vdGZzKQ0KKw0KKyAgICAg
ICAgIyBIYW5kbGUgZXhjbHVkZWQgcGFja2FnZXMgaGVyZSByYXRoZXIgdGhhbiBhdCBwYXJzaW5n
IHRpbWUgc28gd2UgY2FuIGV4cGFuZCBvdXQgdGhlDQorICAgICAgICAjIFBBQ0tBR0VfRVhDTFVE
RVMgYXQgdGhlIHJ1bnRpbWUgbW9tZW50IHdoZW4gcGtnZGF0YSBpcyBhdmFpbGFibGUNCisgICAg
ICAgIGRlZiBvcGtnX2V4Y2x1ZGVfYXJncyhwa2dfZXhjbHVkZXMpOg0KKyAgICAgICAgICAgIHJl
bWFwcGVkX3BrZ19leGNsdWRlcyA9IFtdDQorICAgICAgICAgICAgZm9yIHBrZyBpbiBwa2dfZXhj
bHVkZXM6DQorICAgICAgICAgICAgICAgIHBrZ19kYXRhID0gb2UucGFja2FnZWRhdGEucmVhZF9z
dWJwa2dkYXRhKHBrZywgZCkNCisgICAgICAgICAgICAgICAgcmVuYW1lX2tleSA9ICJQS0dfe30i
LmZvcm1hdChwa2cpDQorICAgICAgICAgICAgICAgIGlmIHBrZ19kYXRhIGFuZCByZW5hbWVfa2V5
IGluIHBrZ19kYXRhIGFuZCBwa2dfZGF0YVtyZW5hbWVfa2V5XSAhPSBwa2c6DQorICAgICAgICAg
ICAgICAgICAgICByZW1hcHBlZF9wa2dfZXhjbHVkZXMuYXBwZW5kKHBrZ19kYXRhW3JlbmFtZV9r
ZXldKQ0KKyAgICAgICAgICAgIHBrZ19leGNsdWRlcy5leHRlbmQocmVtYXBwZWRfcGtnX2V4Y2x1
ZGVzKQ0KKyAgICAgICAgICAgIHBrZ19leGNsdWRlcy5zb3J0KCkNCisgICAgICAgICAgICByZXR1
cm4gIiAtLWFkZC1leGNsdWRlICIgKyAiIC0tYWRkLWV4Y2x1ZGUgIi5qb2luKHBrZ19leGNsdWRl
cykNCisNCisgICAgICAgIHNlbGYub3BrZ19hcmdzICs9IG9wa2dfZXhjbHVkZV9hcmdzKChkLmdl
dFZhcigiUEFDS0FHRV9FWENMVURFIikgb3IgIiIpLnNwbGl0KCkpDQogICAgICAgICBzZWxmLm9w
a2dfYXJncyArPSBzZWxmLmQuZ2V0VmFyKCJPUEtHX0FSR1MiKQ0KDQogICAgICAgICBpZiBwcmVw
YXJlX2luZGV4Og0KLS0NCjIuNy40DQoNClRoaXMgbWVzc2FnZSBjb250YWlucyBpbmZvcm1hdGlv
biB0aGF0IG1heSBiZSBwcml2aWxlZ2VkIG9yIGNvbmZpZGVudGlhbCBhbmQgaXMgdGhlIHByb3Bl
cnR5IG9mIHRoZSBLUElUIFRlY2hub2xvZ2llcyBMdGQuIEl0IGlzIGludGVuZGVkIG9ubHkgZm9y
IHRoZSBwZXJzb24gdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQuIElmIHlvdSBhcmUgbm90IHRoZSBp
bnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUgbm90IGF1dGhvcml6ZWQgdG8gcmVhZCwgcHJpbnQs
IHJldGFpbiBjb3B5LCBkaXNzZW1pbmF0ZSwgZGlzdHJpYnV0ZSwgb3IgdXNlIHRoaXMgbWVzc2Fn
ZSBvciBhbnkgcGFydCB0aGVyZW9mLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIG1lc3NhZ2UgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGFsbCBj
b3BpZXMgb2YgdGhpcyBtZXNzYWdlLiBLUElUIFRlY2hub2xvZ2llcyBMdGQuIGRvZXMgbm90IGFj
Y2VwdCBhbnkgbGlhYmlsaXR5IGZvciB2aXJ1cyBpbmZlY3RlZCBtYWlscy4NCg==

