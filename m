Return-Path: <ernst.sjostrand@verisure.com>
X-Greylist: delayed 1903 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Mar 2020 14:10:51 UTC
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
	[62.209.51.218])
	by mail.openembedded.org (Postfix) with ESMTP id AA253619C2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 14:10:51 +0000 (UTC)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	023DTfYE018227; Tue, 3 Mar 2020 14:39:08 +0100
Received: from eur05-am6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
	by mx08-00271601.pphosted.com with ESMTP id 2yh20c5sbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 03 Mar 2020 14:39:08 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=i9MZmrYFTYBPWZV/ofevDMC+4vExkOVavkXpAiKvwdf0Aofo+TYr0NvUZOq63DekCjm3dZxpyAY0lWWMPAtdR8DAO8fD+Xp86XNnrFGriiYyi6JZw1x/vfO0alya/L/xwpC9HBeEL5ChfftFiqqhI4UDtnP5v4kwIEYUpjBTUT58xA2Hm6U9zMy6s8jFjv/nkBFkwpfh+UuX7JC/Ii/+eo0QraeO/wn0hHJ5SlgYc6LG8H2EdKeZDqRRfZKkdfVRoRmCc1yodrY5nINmytFlXk7NDYnxz67UaMlgrYWOwh2sC0Kk1v5/ZCgWl7YWct9C3RWMkCjjbkjoPhN0obAtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qmZ2M10XOvqB85IuP6fmvv2g73cYKRt+Mxgv7Ldm6xU=;
	b=mnSIrmL+a/MVMfdmn29OLDJHNChy1fHoshWtrY7owwZ7L3g+0kA5nbCh4al3ySVoc3MK5SwBc1bmf1DwS2kMWPMGx5BTXliC0ZcjO09f5sLVVYtRRHdtk9HmgbE6L+AOpsczlMa3e5DxPzEU0zUhN5KGQnZuPld/KjusEmuH85t6N6RPlsTscfS9TClkfI+FYkOGRDRNxBOucqKeM2Y03xCEivjBSGtlhaXMNqjLnKbgIsB85Q7VQuoc4R17bD15rTXq9xacMwnK06Gx3FpmiIHbr2WfK/3dGfPQEVLDP3ksRe7dWdBpp3yoHhlSV4jCFOJDtjA/ZXf/si2nHhMrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=verisure.com;
	dmarc=pass action=none header.from=verisure.com; 
	dkim=pass header.d=verisure.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=verisure.onmicrosoft.com; s=selector1-verisure-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qmZ2M10XOvqB85IuP6fmvv2g73cYKRt+Mxgv7Ldm6xU=;
	b=e7D38ur01rHHOcskHCmr3SC+uix2Wnp9sXnCvzJ2146R2FmbKzm66WW9BBIYJRMJ4QXXU/4TVI+/MMZE5IXpUm8rD/4+PaSixCR+HJ4I+V0MI5tRRqSjHn7+0CpLS1EDKOSYgX+xMkNQqToKEMfDHjHlCuzJGIWQcEcLfhQSmRg=
Received: from AM0PR10MB2324.EURPRD10.PROD.OUTLOOK.COM (20.177.110.217) by
	AM0PR10MB2291.EURPRD10.PROD.OUTLOOK.COM (20.177.110.97) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.18; Tue, 3 Mar 2020 13:39:05 +0000
Received: from AM0PR10MB2324.EURPRD10.PROD.OUTLOOK.COM
	([fe80::512e:e941:72be:3fb6]) by
	AM0PR10MB2324.EURPRD10.PROD.OUTLOOK.COM
	([fe80::512e:e941:72be:3fb6%7]) with mapi id 15.20.2772.019;
	Tue, 3 Mar 2020 13:39:05 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?= <ernst.sjostrand@verisure.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] systemd: Fix service file for race issues
Thread-Index: AQHV8VxpXMP222LwZ0GxqFbEr3a+hag2332A
Date: Tue, 3 Mar 2020 13:39:05 +0000
Message-ID: <16815724bf55f5e740b3725b6e092fd5a348fc0c.camel@verisure.com>
References: <20200303130504.714554-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200303130504.714554-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.246.105.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33a01d5c-9fb6-41e6-f26b-08d7bf783e50
x-ms-traffictypediagnostic: AM0PR10MB2291:
x-microsoft-antispam-prvs: <AM0PR10MB22916099BBC3B70CB7B5B38E94E40@AM0PR10MB2291.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(189003)(199004)(110136005)(6486002)(5660300002)(2616005)(81156014)(8936002)(85202003)(186003)(6512007)(8676002)(81166006)(76116006)(498600001)(6506007)(91956017)(36756003)(66946007)(71200400001)(4744005)(66556008)(26005)(66476007)(85182001)(66446008)(86362001)(2906002)(64756008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR10MB2291;
	H:AM0PR10MB2324.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: verisure.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eGY0aB/ZCeu6jsi/B/j7bUJkRwPb80a4/2QvTyIRCfKVJQWPzeyiLe3veMIFXauDYL0PZxVHkAN5p6qD4pBt1S6+G6X3hAUs57XU/hS3yEm+FAtl+GalvWIGQAmRiXbVrZ8tRHrOmNgGNh57q77CuYveauQqqpYRVqxQ9B7d2gIamjIvM9itPMO/JdAltwHPUpHogHN1L9yGgGLcYZY20Gw1ZExHADlj2tdLxNBZ3BpxuRbOCcgsOJzvLy9WSHo9DccwF1Qco0fTzeqI8LbFdRockFYPBBYEWtKXYNJToTMBt38c0U1wIdrXGqfav10cvgs0sL8hW0by6NHofMYFTcMIBsp3Kx+bZDDyZWcN12xBwHrWyOUJyPhHDvuBybbyQLUpk3rnATThTYZlqJjj1SG+GdRtDng5xPOO+8fEpSxRPhlCCWpOANzLOAONaolT
x-ms-exchange-antispam-messagedata: B9LBJnO4jjnQfOQdONBfreSVldidCpg5frH/YFTjzzlcpqmoV9gpUTVYAKqx062Q44GGB4Ne6ZGhJDXrko2svRjOs5eEojhIXm99/1JQQ5KkCNnfO9K+1PURLlfy/5mOA63HKtQrYXuDtPy1VW2kLQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: verisure.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a01d5c-9fb6-41e6-f26b-08d7bf783e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 13:39:05.6978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMNCXt7iELJOxaVbDeVIGWSV02uKtADaW60ybTfSdg+pkje6HzsI+VzgPZKS4KvANmKNJw83O/mF6m1EB9RY2B1HLGALG/mc7eEj0wNm/L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2291
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-03-03_04:2020-03-03,
	2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 mlxlogscore=999
	priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1011
	malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2003030103
Subject: Re: [PATCH] systemd: Fix service file for race issues
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
X-List-Received-Date: Tue, 03 Mar 2020 14:10:52 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_16815724bf55f5e740b3725b6e092fd5a348fc0ccamelverisureco_"

--_000_16815724bf55f5e740b3725b6e092fd5a348fc0ccamelverisureco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVhaCBpdCdzIGV4YWN0bHkgbGlrZSB0aGF0LCBiZWVuIGJpdHRlbiBieSB0aGF0IGJlZm9yZS4N
Cg0KUmVnYXJkcw0KLy9Fcm5zdA0KDQp0aXMgMjAyMC0wMy0wMyBrbG9ja2FuIDEzOjA1ICswMDAw
IHNrcmV2IFJpY2hhcmQgUHVyZGllOg0KDQpJdCBzZWVtcyB0aGlzIHNlcnZpY2UgbmVlZHMgYm90
aCBSZXF1aXJlczogYW5kIEFmdGVyOiBhY2NvcmRpbmcgdG8gdGhlIGRlZmluaXRpb25zDQoNCmlu
IHRoZSBzeXN0ZW1kIGRvY3MsIGVsc2Ugd2Ugc2VlIGJvb3QgcmFjZSBmYWlsdXJlcy4NCg0KDQpT
aWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8DQoNCjxtYWlsdG86cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4NCg0KcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zw0KDQo+DQoNCi0tLQ0KDQogbWV0YS9yZWNpcGVzLWNvcmUvcHNwbGFzaC9maWxlcy9wc3BsYXNo
LXN5c3RlbWQuc2VydmljZSB8IDEgKw0KDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQoNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3BzcGxhc2gvZmlsZXMvcHNwbGFz
aC1zeXN0ZW1kLnNlcnZpY2UgYi9tZXRhL3JlY2lwZXMtY29yZS9wc3BsYXNoL2ZpbGVzL3BzcGxh
c2gtc3lzdGVtZC5zZXJ2aWNlDQoNCmluZGV4IDI0OWFhNTQwMzk0Li40ZTE4OTgwYmIyNyAxMDA2
NDQNCg0KLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvcHNwbGFzaC9maWxlcy9wc3BsYXNoLXN5c3Rl
bWQuc2VydmljZQ0KDQorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9wc3BsYXNoL2ZpbGVzL3BzcGxh
c2gtc3lzdGVtZC5zZXJ2aWNlDQoNCkBAIC0yLDYgKzIsNyBAQA0KDQogRGVzY3JpcHRpb249U3Rh
cnQgcHNwbGFzaC1zeXN0ZW1kIHByb2dyZXNzIGNvbW11bmljYXRpb24gaGVscGVyDQoNCiBEZWZh
dWx0RGVwZW5kZW5jaWVzPW5vDQoNCiBBZnRlcj1zeXN0ZW1kLXN0YXJ0LnNlcnZpY2UNCg0KK0Fm
dGVyPXBzcGxhc2gtc3RhcnQuc2VydmljZQ0KDQogUmVxdWlyZXM9cHNwbGFzaC1zdGFydC5zZXJ2
aWNlDQoNCiBSZXF1aXJlc01vdW50c0Zvcj0vcnVuDQoNCg0KDQotLQ0KDQoyLjI1LjANCg0K

--_000_16815724bf55f5e740b3725b6e092fd5a348fc0ccamelverisureco_
Content-Type: text/html; charset="utf-8"
Content-ID: <B29F9EE58B202146B3C946572BC0EBE7@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keSBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0OyBkaXJlY3Rpb246bHRyOyI+DQo8ZGl2PlllYWggaXQncyBleGFj
dGx5IGxpa2UgdGhhdCwgYmVlbiBiaXR0ZW4gYnkgdGhhdCBiZWZvcmUuPC9kaXY+DQo8ZGl2Pjxi
cj4NCjwvZGl2Pg0KPGRpdj5SZWdhcmRzPC9kaXY+DQo8ZGl2Pi8vRXJuc3Q8L2Rpdj4NCjxkaXY+
PGJyPg0KPC9kaXY+DQo8ZGl2PnRpcyAyMDIwLTAzLTAzIGtsb2NrYW4gMTM6MDUgJiM0MzswMDAw
IHNrcmV2IFJpY2hhcmQgUHVyZGllOjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5
bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij4NCjxwcmU+SXQgc2VlbXMgdGhpcyBzZXJ2aWNlIG5lZWRzIGJvdGggUmVx
dWlyZXM6IGFuZCBBZnRlcjogYWNjb3JkaW5nIHRvIHRoZSBkZWZpbml0aW9uczwvcHJlPg0KPHBy
ZT5pbiB0aGUgc3lzdGVtZCBkb2NzLCBlbHNlIHdlIHNlZSBib290IHJhY2UgZmFpbHVyZXMuPC9w
cmU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+U2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUg
Jmx0OzwvcHJlPg0KPGEgaHJlZj0ibWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmciPg0KPHByZT5yaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPC9wcmU+DQo8
L2E+DQo8cHJlPiZndDs8L3ByZT4NCjxwcmU+LS0tPC9wcmU+DQo8cHJlPiBtZXRhL3JlY2lwZXMt
Y29yZS9wc3BsYXNoL2ZpbGVzL3BzcGxhc2gtc3lzdGVtZC5zZXJ2aWNlIHwgMSAmIzQzOzwvcHJl
Pg0KPHByZT4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCYjNDM7KTwvcHJlPg0KPHByZT48
YnI+PC9wcmU+DQo8cHJlPmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9wc3BsYXNoL2Zp
bGVzL3BzcGxhc2gtc3lzdGVtZC5zZXJ2aWNlIGIvbWV0YS9yZWNpcGVzLWNvcmUvcHNwbGFzaC9m
aWxlcy9wc3BsYXNoLXN5c3RlbWQuc2VydmljZTwvcHJlPg0KPHByZT5pbmRleCAyNDlhYTU0MDM5
NC4uNGUxODk4MGJiMjcgMTAwNjQ0PC9wcmU+DQo8cHJlPi0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3BzcGxhc2gvZmlsZXMvcHNwbGFzaC1zeXN0ZW1kLnNlcnZpY2U8L3ByZT4NCjxwcmU+JiM0Mzsm
IzQzOyYjNDM7IGIvbWV0YS9yZWNpcGVzLWNvcmUvcHNwbGFzaC9maWxlcy9wc3BsYXNoLXN5c3Rl
bWQuc2VydmljZTwvcHJlPg0KPHByZT5AQCAtMiw2ICYjNDM7Miw3IEBAPC9wcmU+DQo8cHJlPiBE
ZXNjcmlwdGlvbj1TdGFydCBwc3BsYXNoLXN5c3RlbWQgcHJvZ3Jlc3MgY29tbXVuaWNhdGlvbiBo
ZWxwZXI8L3ByZT4NCjxwcmU+IERlZmF1bHREZXBlbmRlbmNpZXM9bm88L3ByZT4NCjxwcmU+IEFm
dGVyPXN5c3RlbWQtc3RhcnQuc2VydmljZTwvcHJlPg0KPHByZT4mIzQzO0FmdGVyPXBzcGxhc2gt
c3RhcnQuc2VydmljZTwvcHJlPg0KPHByZT4gUmVxdWlyZXM9cHNwbGFzaC1zdGFydC5zZXJ2aWNl
PC9wcmU+DQo8cHJlPiBSZXF1aXJlc01vdW50c0Zvcj0vcnVuPC9wcmU+DQo8cHJlPiA8L3ByZT4N
CjxwcmU+LS0gPC9wcmU+DQo8cHJlPjIuMjUuMDwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8L2Js
b2NrcXVvdGU+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_16815724bf55f5e740b3725b6e092fd5a348fc0ccamelverisureco_--
