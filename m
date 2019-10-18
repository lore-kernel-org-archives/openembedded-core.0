Return-Path: <prvs=1194d61036=alejandro.delcastillo@ni.com>
X-Greylist: delayed 1055 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Oct 2019 18:16:20 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 541D66BCD6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 18:16:20 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9IHvOmi007890; Fri, 18 Oct 2019 12:58:33 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54])
	by mx0b-00010702.pphosted.com with ESMTP id 2vkbt1ba0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 18 Oct 2019 12:58:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TRZftxNqD35RIQXidlC2rvg+ZEDMTeW3Xr+Q4Rr5VQ3x5ZYy7+RNTiyQ2Ip3TwRTHcjj0FskGmRJqqE5SAbweTgTUNKGKm1WroZiQxZYo2ITgfX2FcHZgP8HTfx1QTGb2VUspuaZsSEOsgud+esf1NDAe4YpITZ6Fz3GcaP2WHqYlfJptYXTx9UrIj+V1vTJPQygnsWm/RarLE/8x6vSkdxMppdit+vI/fbDONZMyRtdHNgGC5MJbTr2CPfr2DHnVST3fdFyzaMPjq7vnnbMfAkJifKjtXbkcWQrPEjrDUm6k34PprSQUR2Dz9MA0iHanN/MuIGDSnAQO3T33S/Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rMS/KilYCzplGJV53t3iaMyrRKNeIp7Y6dpzxiBoxII=;
	b=Qpzwi8lq57stlXvDMNafAfxotkB02tjdM3zLyerX6sGJ5KXumSn61MFLtSBGyy7o/nzYtiqewFqg9eIQM/kBPc9ld6wje0bvblGuiwCAyoQjm6CBi0beIOuoz9ZaNGnRbLy7WYVU0J/c8u8SnpoUPtv9+8CMjMoieOhATyqWy9LAmSVh0T1qFEs4tgV3tlmzOcdpJahluGFFFIfcIXbdhnHRFLqiIkVJBmaLPowtwQswGhbl+Rsw5qFhbuP/gHLjMuT+bl3V6eQQZ+cuwbuR4jNOk3LVkL8zgUHfn2IpBPPoA2WfWX8iZU5ppA2Ar3azAtAcg1sVtpM9BAbF6/52Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com;
	dkim=pass header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rMS/KilYCzplGJV53t3iaMyrRKNeIp7Y6dpzxiBoxII=;
	b=F6elff2LW60iiJGp3DAs7NbMtPaIQ7uwYGxKh38gwnbX73IjgIvq5ioTknRndbswGnNrnJARkCFCzt0r7J/8cDv5M05+7uqlhiDRQa1IKBBSE8Rha4jcMAmdgabfW29V7KphOD9A+T+KgUQWozaQl87tfwu4amEFekmAC6vewf8=
Received: from DM6PR04MB4219.namprd04.prod.outlook.com (20.176.78.18) by
	DM6PR04MB5356.namprd04.prod.outlook.com (20.178.26.161) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Fri, 18 Oct 2019 17:58:31 +0000
Received: from DM6PR04MB4219.namprd04.prod.outlook.com
	([fe80::5527:4a9d:4a82:79d2]) by
	DM6PR04MB4219.namprd04.prod.outlook.com
	([fe80::5527:4a9d:4a82:79d2%3]) with mapi id 15.20.2347.024;
	Fri, 18 Oct 2019 17:58:31 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: Denys Dmytriyenko <denis@denix.org>, akuster808 <akuster808@gmail.com>
Thread-Topic: [EXTERNAL] Re: [OE-core] [thud][PATCH] Revert "OpkgPM: use
	--add-ignore-recommends to process BAD_RECOMMENDATIONS"
Thread-Index: AQHVhRqo6T1cx5p9s0eMf81pYgjEqKdfNdyAgAALX4CAAW/agA==
Date: Fri, 18 Oct 2019 17:58:31 +0000
Message-ID: <80a9db47-73ab-3326-3488-d5d9649e352f@ni.com>
References: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
	<20191017184222.GN17412@denix.org>
	<2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
	<20191017200153.GO17412@denix.org>
In-Reply-To: <20191017200153.GO17412@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR0102CA0005.prod.exchangelabs.com (2603:10b6:805:1::18)
	To DM6PR04MB4219.namprd04.prod.outlook.com
	(2603:10b6:5:9c::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11d509bb-ea2f-4e99-2208-08d753f4c961
x-ms-traffictypediagnostic: DM6PR04MB5356:
x-microsoft-antispam-prvs: <DM6PR04MB5356595D0D381592A8F49976866C0@DM6PR04MB5356.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(376002)(346002)(39860400002)(136003)(396003)(366004)(199004)(189003)(5660300002)(6116002)(86362001)(305945005)(7736002)(8676002)(31696002)(3846002)(4744005)(81156014)(81166006)(36756003)(2906002)(8936002)(66556008)(71200400001)(14444005)(66066001)(6512007)(64756008)(476003)(6436002)(256004)(6486002)(11346002)(186003)(66476007)(478600001)(71190400001)(66446008)(486006)(66946007)(52116002)(229853002)(316002)(2616005)(99286004)(446003)(4326008)(102836004)(386003)(6506007)(53546011)(26005)(6246003)(76176011)(31686004)(14454004)(110136005)(25786009)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB5356;
	H:DM6PR04MB4219.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AzLQy1X46BErEAEINZJVpE6gNPq460koIoG0uoE0RuOvdfANhN6XT1L+BjZyqC0u3mj7IMPKkCHpgjqLDnNcVOWHfD2ynTKE6kZtyirjdOK7y+SI3Kgx0vsFxSsDDjTP6hEIqEsMmSHFvSUWMe/lqBCVoe5hWg/JBuxWv4ktSy25zQaE6dYPWxJM4vGEBRaFIQKwtfTcSciuK8VZ5XsSdsnZULBFjjksMQRR71UF3y8qXaOB/K1eZYjvuWvDSOytjScDmiyLnQbbjLB2gDwEGEQGCRVMQ8xI5ZEk/BIhCsvoV9NN5YtW7fsWESv1bRT4dOBnEPURhyCf7NsrRtUNkR/yNRYseIUmQpHoszmgHV7cdAC4teLtAOoUQfX/tW+tYRDmfSk7KOIZJgxTzGRrMcqjynzVQfd48yFbXILGnjQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d509bb-ea2f-4e99-2208-08d753f4c961
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:58:31.3715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoz5hyyEfxgX5Jd+QRgjYKHtxuHkgSX7m/kiTLrBb/1cwcU26/b1s1NfHJCJWxvoGw2eymeS6bIXnA55PkKw8MydlWnZoGhSd4HOmJHs4jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5356
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-18_04:2019-10-18,2019-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30 spamscore=0
	mlxlogscore=999 adultscore=0 clxscore=1011 mlxscore=0 bulkscore=0
	impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
	phishscore=0 suspectscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.12.0-1908290000 definitions=main-1910180163
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
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
X-List-Received-Date: Fri, 18 Oct 2019 18:16:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAA544FD109E6D4BA66D31963D11E285@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCk9uIDEwLzE3LzE5IDM6MDEgUE0sIERlbnlzIERteXRyaXllbmtvIHdyb3RlOg0KPiBPbiBU
aHUsIE9jdCAxNywgMjAxOSBhdCAxMjoyMToxMVBNIC0wNzAwLCBha3VzdGVyODA4IHdyb3RlOg0K
Pj4gT24gMTAvMTcvMTkgMTE6NDIgQU0sIERlbnlzIERteXRyaXllbmtvIHdyb3RlOg0KPj4+IFRo
YW5rIHlvdSBmb3IgdGhpcyByZXZlcnQhIEkndmUgYmVlbiBwdWxsaW5nIG15IGhhaXIgb3V0IHBh
c3QgY291cGxlIGRheXMNCj4+PiBmaWd1cmluZyBvdXQgd2h5IEJBRF9SRUNPTU1FTkRBVElPTlMg
c3RvcHBlZCB3b3JraW5nIGZvciB1cy4gVGhpcyBmaXhlZCBpdC4NCj4+DQo+PiBXaGF0IEkgZmlu
ZCBjdXJpb3VzIGlzIHRoYXQgdGhlIG9mZmVuZGluZyBjb21taXQgaGFzIGJlZW4gaW4gdGh1ZCBz
aW5jZQ0KPj4gSnVseSAyOXRoIGFuZCB3ZSBhcmUganVzdCBub3cgaGVhcmluZyBhYm91dCBpc3N1
ZXMuDQo+IA0KPiBZZWFoLCBpbiBvdXIgY2FzZSB3ZSBvbmx5IG5vdGljZWQgdGhlIGlzc3VlIHdo
ZW4gd2Ugc3RhcnRlZCBwcmVwYXJpbmcgdGhlDQo+IGxhdGVzdCByZWxlYXNlIGFuZCBmb3VuZCBl
eHRyYSBwYWNrYWdlcyB0aGF0IHdlcmVuJ3Qgc3VwcG9zZWQgdG8gYmUgdGhlcmUuDQoNCklzIHRo
ZXJlIGEgYnVnemlsbGEgdGlja2V0IHRyYWNraW5nIHRoZSBpc3N1ZT8gSSBhZGRlZCB0aGUgDQot
LWFkZC1pZ25vcmUtcmVjb21tZW5kcyBmbGFnIHRvIG9wa2csIG1haW5seSB0byBnZXQgQkFEX1JF
Q09NTUVOREFUSU9OUyANCnRvIHdvcmsgZm9yIE9FLiBJZiB0aGF0J3Mgbm90IHRoZSBjYXNlLCB0
aGVuIG5lZWQgdG8gZmlndXJlIG91dCB3aGF0IA0Kd2VudCB3cm9uZyAodGhlIE9FIHNpZGUgb3Ig
dGhlIG9wa2cgc2lkZSkuLi4uDQoNCi0tIA0KQ2hlZXJzLA0KDQpBbGVqYW5kcm8NCg==

