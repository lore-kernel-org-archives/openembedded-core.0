Return-Path: <prvs=12000eacd9=alejandro.delcastillo@ni.com>
X-Greylist: delayed 12429 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Oct 2019 23:06:58 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id D07707F9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 23:06:58 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OJZP28012526; Thu, 24 Oct 2019 14:39:49 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp2052.outbound.protection.outlook.com [104.47.41.52])
	by mx0a-00010702.pphosted.com with ESMTP id 2vt9s8fb5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2019 14:39:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Lm0WXan1DnZ2F7mcW7hTh9cyjc+KKRFuFB+WnsSyMb/9VqemYoByx45zXeDWcyWeIqBStmsLZYnBassF/oEmOl9EQc6ca86tS8I7+i3H7CvsjP5zeFC/KukLVfNsrm7Eb+Vtnm+B99Jna8IvyLVtv8gcGcvQMLByn1u3mapGa3v5hCmUJXQn6qvCPPjW048nrP7oEOUDgUPkRGcpuJS3Lm1IQtsCyM4fVPcbmao9B12Qvc7Gj64+sFCFzafpe3ISybXItTqLf0eh4GG9Pqx/VqLlZqjaZ2D1tN0a7yo+wA3rjRo7v1lfpqbMYMULnRcJ+Q+VaPoHyQFwAvYho5sRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gN88IEgpthqgLYvdfS935cqkcFLfnle67PX/AsgqKGc=;
	b=bkZVqvUXlDf+RwwI4n1n0YDPJPdpWTFESQMD2zD74Uz7wNjFEqtG7Blzl/REwUV5P2SKUBDAUOzDeZnCYWlVOkrox4QDclGCxIFQ5UWwPeDZDQQBO1JgjRPi7XK2O3KcZUws2sOv4UGZBB2nI4VXBTszBeJVGxoIxqJyJCR/+q/oA1XXsh6Vi7LJ01zAkoupa3PrntVGAtIEsqHoS4QyZp0aqyD6GL/KfwFdf+bo2n/Z0mWWFB+QZzTMPZHCb4zq/JjFOQQf5K3pkYe+PmYjCuyFG/I/JzV/utpymKx2hiMjXKteYchNY06EgaoRg7X4c9iqiXTlBjbMhFRzSg/nVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com;
	dkim=pass header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gN88IEgpthqgLYvdfS935cqkcFLfnle67PX/AsgqKGc=;
	b=pHkAN8j8wSDno7723DLhDjllUnDASsOeIM18CrM6a+SzwbahPG7E9O1soFBC5Jql3ou++hQRzo4QpnGKCs7jMaUE1nhvaVBghEMWIJ09FSEdfUy0hDwW12tIS5EZARmUNAG4GQjKtGT8PrWbpfX9PwjOzSGg4Rgm133BGdzIdXg=
Received: from MWHPR0401MB3658.namprd04.prod.outlook.com (10.167.163.20) by
	MWHPR0401MB3593.namprd04.prod.outlook.com (10.167.162.160) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.22; Thu, 24 Oct 2019 19:39:47 +0000
Received: from MWHPR0401MB3658.namprd04.prod.outlook.com
	([fe80::b930:8014:da3b:898a]) by
	MWHPR0401MB3658.namprd04.prod.outlook.com
	([fe80::b930:8014:da3b:898a%6]) with mapi id 15.20.2347.030;
	Thu, 24 Oct 2019 19:39:47 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: "opkg-devel@googlegroups.com" <opkg-devel@googlegroups.com>, Yann
	CARDAILLAC <yann.cardaillac@smile.fr>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [EXTERNAL] [opkg-devel] [yocto][PATCH][opkg] bug 13528 add SPDX
	id to opkg
Thread-Index: AQHViOjAlVrmRtBbWkenM5UCYmJ5G6dqM8AA
Date: Thu, 24 Oct 2019 19:39:47 +0000
Message-ID: <0d017fc3-b00b-cfeb-2b35-267b894e7d25@ni.com>
References: <CAA984JWqcX5oDhumXYBom+ZyxD+bo7oGmTzLx_tXejvPaR1UKQ@mail.gmail.com>
In-Reply-To: <CAA984JWqcX5oDhumXYBom+ZyxD+bo7oGmTzLx_tXejvPaR1UKQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR01CA0007.prod.exchangelabs.com (2603:10b6:805:b6::20)
	To MWHPR0401MB3658.namprd04.prod.outlook.com
	(2603:10b6:301:79::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df87c5f7-c268-456a-f886-08d758b9ed4f
x-ms-traffictypediagnostic: MWHPR0401MB3593:
x-ms-exchange-purlcount: 11
x-microsoft-antispam-prvs: <MWHPR0401MB3593BBAECB6EE76438433590866A0@MWHPR0401MB3593.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(136003)(396003)(366004)(376002)(189003)(199004)(14454004)(229853002)(3846002)(6116002)(6246003)(6486002)(561944003)(76176011)(256004)(71200400001)(71190400001)(52116002)(102836004)(26005)(53546011)(6506007)(386003)(31696002)(7736002)(31686004)(305945005)(486006)(186003)(446003)(11346002)(86362001)(2906002)(99286004)(2616005)(2201001)(476003)(5660300002)(66446008)(64756008)(45080400002)(66556008)(66476007)(36756003)(6436002)(66946007)(4326008)(81156014)(66066001)(81166006)(8676002)(478600001)(25786009)(110136005)(8936002)(966005)(316002)(6306002)(2501003)(6512007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR0401MB3593;
	H:MWHPR0401MB3658.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PYdN1YIJoDdgBPEo1qiPD8BIO9VBubekDGN0kJNBIK8k5DfJvp2e0+zEmhpqTirAkBmj6YZeIPWRQyJ2RoVD8zCeQYUqNqPuFBInrdc41s4d7RovNn+P0nrUYXpZ1bVuhPoPdUmyashTVnMa3AWvH98UE07QFcG11YPYiyOsGlA5Gjx446heiVy/lXmFZwIZyZrLTr+BR7so18wY19ay+XUaezNjxxXu3CD0E9X+yqjookM73piqdoMrdpB+yLKh0Lmn7adCojSDDNRB2FY827gx1hC7tbcSpl1pUxpZ7fHg9SezkU+P5Z9c54EWa10v4dbM2G0FFVyYi7vhD6E3QBy68qrHgjL+t4++Ok8i0w5/WwXI+3VZVtU2jj4JTD+lOloscdOa58BGbJTsw1DGZzixoTTeUUeuwZCM3YaOiOhCQFlcOQRk/aayZiEfiMiLMXOOhrwZA9mraMq/e8S5+z0L9X3TfI5tF9s5MoQxHOA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df87c5f7-c268-456a-f886-08d758b9ed4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 19:39:47.2038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJ0LUVCG/q7/8UA718z/pTktUiTpGxDvKgloK/Pc2KfeyA29W1uBaGrlGVtxPoovEO4wNckbsog5YSuyM32PPqA+Fae8aEws8tBnA0ZenPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0401MB3593
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_11:2019-10-23,2019-10-24 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
	phishscore=0 mlxscore=0 clxscore=1011 impostorscore=0 malwarescore=0
	suspectscore=0 spamscore=0 mlxlogscore=999 classifier=spam adjust=30
	reason=mlx scancount=1 engine=8.12.0-1908290000
	definitions=main-1910240184
Cc: Romain Naour <romain.naour@smile.fr>
Subject: Re: [opkg-devel] [yocto][PATCH][opkg] bug 13528 add SPDX id to opkg
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
X-List-Received-Date: Thu, 24 Oct 2019 23:06:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <320DA9440F965143907245FC4C1AE5BC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgWWFubiwNCg0KVGhhbmtzIGFnYWluIGZvciBhZGRpbmcgdGhlIGhlYWRlcnMuIFlvdXIgcGF0
Y2ggbG9va3MgZ29vZCwgZXhjZXB0IGZvcg0Kb25lIGxpbmUgdGhhdCBoYXMgYSBkdXBsaWNhdGVk
IGhlYWRlcjoNCg0KL2NvcmUvMjZfcHJlZmVyX2FyY2hfdG9fdmVyc2lvbi5weQ0KaW5kZXggMGEw
ZDY2Yi4uODI5MzRjMSAxMDA3NTUNCi0tLSBhL3Rlc3RzL2NvcmUvMjZfcHJlZmVyX2FyY2hfdG9f
dmVyc2lvbi5weQ0KKysrIGIvdGVzdHMvY29yZS8yNl9wcmVmZXJfYXJjaF90b192ZXJzaW9uLnB5
DQpAQCAtMSw0ICsxLDUgQEANCi0jISAvdXNyL2Jpbi9lbnYgcHl0aG9uMw0KKyMhIC91c3IvYmlu
L2VudiBweXRob24zIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQorIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQogICMNCg0KY291bGQgeW91IHNl
bmQgYSB2Mj8gcmVnYXJkaW5nIG00IGZpbGVzLCBJIGxvb2tlZCBhcm91bmQgYSBiaXQgYW5kIA0K
ZGlkbid0IGZpbmQgcHJvamVjdCBhZGRpbmcgU1BEWCBpZGVudGlmaWVycyB0byB0aGVtLi4uLg0K
DQpDaGVlcnMsDQoNCkFsZWphbmRybw0KDQpPbiAxMC8yMi8xOSA5OjU1IEFNLCBZYW5uIENBUkRB
SUxMQUMgd3JvdGU6DQo+IEhpLA0KPiANCj4gSSdtIHdvcmtpbmcgb24gYnVnIDogDQo+IGh0dHBz
Oi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTM1MjggDQo+IDxo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qu
b3JnL3Nob3dfYnVnLmNnaT9pZD0xMzUyOF9fOyFmcVdKY25sVGtqTSE0RFZEOWxQMlVkQ0Y1VWVk
SThKLVhqaFFRdXlEaG1BaUxhT1hrOE9XNUtNQ0ZSekcyQVNQX0JkcnhudkJuQ25iMFR5WU5RJD4N
Cj4NCj4gIEkndmUgYSBmaXJzdCBwYXRjaCBwcm9wb3NhbC4gTm90ZSB0aGF0IEkgZGlkbid0IGtu
ZXcgd2hhdCB0byBkbyB3aXRoDQo+ICBtNC9ncGdtZS5tNCB0aGUgbGljZW5zZSBoZWFkZXIgc2Vl
bXMgcHJldHR5IHdlaXJkIHRvIG1lLi4uDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gLS0gU01JTEUg
DQo+IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL3d3dy5zbWlsZS5ldS9fXzsh
ZnFXSmNubFRrak0hNERWRDlsUDJVZENGNVVlZEk4Si1YamhRUXV5RGhtQWlMYU9YazhPVzVLTUNG
UnpHMkFTUF9CZHJ4bnZCbkNuZmJEQ0hZdyQ+DQo+DQo+ICAyMCBydWUgZGVzIEphcmRpbnMgOTI2
MDAgQXNuacOocmVzLXN1ci1TZWluZQ0KPiANCj4gICpZYW5uIENBUkRBSUxMQUMqIEluZ8Opbmll
dXIgU3lzdMOobWVzIEVtYmFycXXDqXMNCj4gDQo+IGVtYWlsIHlhbm4uY2FyZGFpbGxhY0BzbWls
ZS5mciA8bWFpbHRvOnlhbm4uY2FyZGFpbGxhY0BzbWlsZS5mcj4gdXJsDQo+IGh0dHA6Ly93d3cu
c21pbGUuZXUgDQo+IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL3d3dy5zbWls
ZS5ldV9fOyFmcVdKY25sVGtqTSE0RFZEOWxQMlVkQ0Y1VWVkSThKLVhqaFFRdXlEaG1BaUxhT1hr
OE9XNUtNQ0ZSekcyQVNQX0JkcnhudkJuQ21WOVI0alBBJD4NCj4gDQo+IA0KPiANCj4gVHdpdHRl
ciANCj4gPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3R3aXR0ZXIuY29tL0dy
b3VwZVNtaWxlX187IWZxV0pjbmxUa2pNITREVkQ5bFAyVWRDRjVVZWRJOEotWGpoUVF1eURobUFp
TGFPWGs4T1c1S01DRlJ6RzJBU1BfQmRyeG52Qm5Da3EtbUZ6Y3ckPg0KPiAgRmFjZWJvb2sgDQo+
IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL3Nt
aWxlb3BlbnNvdXJjZV9fOyFmcVdKY25sVGtqTSE0RFZEOWxQMlVkQ0Y1VWVkSThKLVhqaFFRdXlE
aG1BaUxhT1hrOE9XNUtNQ0ZSekcyQVNQX0JkcnhudkJuQ2s4THhXMDhBJD4NCj4gIExpbmtlZElu
IA0KPiA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vd3d3LmxpbmtlZGluLmNv
bS9jb21wYW55L3NtaWxlX187IWZxV0pjbmxUa2pNITREVkQ5bFAyVWRDRjVVZWRJOEotWGpoUVF1
eURobUFpTGFPWGs4T1c1S01DRlJ6RzJBU1BfQmRyeG52Qm5DazUtM3kwOHckPg0KPiAgR2l0aHVi
IA0KPiA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9TbWls
ZS1TQV9fOyFmcVdKY25sVGtqTSE0RFZEOWxQMlVkQ0Y1VWVkSThKLVhqaFFRdXlEaG1BaUxhT1hr
OE9XNUtNQ0ZSekcyQVNQX0JkcnhudkJuQ2xFT3hVem9BJD4NCj4gDQo+IA0KPiANCj4gDQo+IA0K
PiBlY28gUG91ciBsYSBwbGFuw6h0ZSwgbidpbXByaW1leiBjZSBtYWlsIHF1ZSBzaSBjJ2VzdCBu
w6ljZXNzYWlyZQ0KPiANCj4gLS0gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlv
dSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlDQo+ICBHcm91cHMgIm9wa2ctZGV2ZWwiIGdy
b3VwLiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3ANCj4gcmVjZWl2aW5n
IGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvDQo+IG9wa2ctZGV2ZWwrdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSANCj4gPG1haWx0bzpvcGtnLWRldmVsK3Vuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb20+LiBUbyB2aWV3IHRoaXMNCj4gZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZp
c2l0IA0KPiBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvb3BrZy1kZXZlbC9DQUE5
ODRKV3FjWDVvRGh1bVhZQm9tJTJCWnl4RCUyQmJvN29HbVR6THhfdFhlanZQYVIxVUtRJTQwbWFp
bC5nbWFpbC5jb20NCj4gIA0KPiA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
Z3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9vcGtnLWRldmVsL0NBQTk4NEpXcWNYNW9EaHVtWFlC
b20qMkJaeXhEKjJCYm83b0dtVHpMeF90WGVqdlBhUjFVS1EqNDBtYWlsLmdtYWlsLmNvbT91dG1f
bWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9Zm9vdGVyX187SlNVbCFmcVdKY25sVGtqTSE0RFZEOWxQ
MlVkQ0Y1VWVkSThKLVhqaFFRdXlEaG1BaUxhT1hrOE9XNUtNQ0ZSekcyQVNQX0JkcnhudkJuQ243
YmV6OFRnJD4uDQoNCi0tDQo+IA0KQ2hlZXJzLA0KDQpBbGVqYW5kcm8NCg==

