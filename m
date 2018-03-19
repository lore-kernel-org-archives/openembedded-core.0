Return-Path: <cbugot@sierrawireless.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0085.outbound.protection.outlook.com [104.47.40.85])
	by mail.openembedded.org (Postfix) with ESMTP id F1104788F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=SierraWirelessInc.onmicrosoft.com; s=selector1-sierrawireless-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Cv4f2bjWFDde3WaEXBW65SPPsNjdnyRIehIh2r4ztrc=;
	b=t1jtJMBXq6mzTdbfmP3i2nzgssNg3A/rgV048r1Gieik8dx5xyoJKZyoLxRPFnV5xrivQLzsQMK5Y3DVRE5g/2PJY4ZulvoDXo1znzj1gblQqZdKAeyYhWH+jJ9oS9P2cW8nACspxH3HQhFJqMvY4OdrF741ggEbFudJwIcjQa4=
Received: from CY1PR02MB1152.namprd02.prod.outlook.com (10.163.15.154) by
	CY1PR02MB2090.namprd02.prod.outlook.com (10.166.190.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.588.14; Mon, 19 Mar 2018 13:58:02 +0000
Received: from CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3]) by
	CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3%13]) with mapi id 15.20.0588.017;
	Mon, 19 Mar 2018 13:58:02 +0000
From: Cuero Bugot <cbugot@sierrawireless.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] uninative: add variables to the whitelist so
	that it does not re-triger recipe parsing
Thread-Index: AdO9TH9RHM3TjEkGRgOC2+RK0UYmKwALiVWAAIPGOEA=
Date: Mon, 19 Mar 2018 13:58:01 +0000
Message-ID: <CY1PR02MB1152E42C871EE92C609E1035A3D40@CY1PR02MB1152.namprd02.prod.outlook.com>
References: <CY1PR02MB115262F14464BB959F555708A3D70@CY1PR02MB1152.namprd02.prod.outlook.com>
	<CAMKF1sqpRjw=m59+W1cwPUOTQ0ovDq8HY00BS1-3_in72RHmQg@mail.gmail.com>
In-Reply-To: <CAMKF1sqpRjw=m59+W1cwPUOTQ0ovDq8HY00BS1-3_in72RHmQg@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=cbugot@sierrawireless.com; 
x-originating-ip: [84.14.163.134]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB2090;
	7:ZxG7oRdx/hTr2FNvE76uF2oXyLNNCav4/FkRBLwBFTf3FiR89j9TvOx+OfnJsyjMu3qXChMcgycLyL3F/0dEBdZx2I3qKXYN1Dtmj1e4Ru85LfVsTru8pK/WHpxqOSPOAfwmQG49KFSR3x1NIIZfSCuPbA9WFsypMqFrCCj3Jupk29DSy8oy8r6y2cVU+wZr220nX3FMJtpoyygilkWIvZUGtsAzagcuLa8+26kK2+Vp3O1YgCiVHyX7EKH1ZuRE
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f3afd5e8-8b81-4c2a-8abe-08d58da16e40
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR02MB2090; 
x-ms-traffictypediagnostic: CY1PR02MB2090:
x-microsoft-antispam-prvs: <CY1PR02MB20902921D44983514540C96BA3D40@CY1PR02MB2090.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231221)(944501300)(52105095)(10201501046)(6055026)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY1PR02MB2090; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB2090; 
x-forefront-prvs: 06167FAD59
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(39380400002)(376002)(396003)(366004)(39860400002)(346002)(199004)(189003)(2950100002)(6916009)(33656002)(478600001)(53936002)(6246003)(26005)(316002)(55016002)(5250100002)(86362001)(106356001)(9686003)(66066001)(3846002)(6116002)(6436002)(68736007)(7696005)(8936002)(76176011)(229853002)(5660300001)(99286004)(81156014)(81166006)(97736004)(8676002)(25786009)(7736002)(4326008)(305945005)(53546011)(105586002)(6506007)(74316002)(14454004)(102836004)(186003)(2906002)(55236004)(3280700002)(39060400002)(2900100001)(3660700001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB2090;
	H:CY1PR02MB1152.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: sierrawireless.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: o9t7Mz59HQgSy7yNwA4GdRN4f83YpX9P2dwgbGzwOIJ4u1wXYsLc5GWbQVroVRI2hXGkqy3xdVY52om46SfaiOpJq2U7xgwLJv6TDNTF3QYEXAzwT2vyGfmeZklRMWqboJWgJWjaNPpoT+yqUNuAaSH1EnEzTOn3bYR1oQ6r4jyx5jYjKPgQxqLXYAF/90ZbA1Osa8F1vU2pP8XZ5Ch/O45VkIC6DBDiOW/KK75teFumBz4QkJX2C752L9Ae/d/KWcYk1SgcFR+9h4Kv0/ANBDtWJL7S2zpjIM2gfbJb+6WNoqqu4mCB4A+WwdPJS1zdppAJx4eaYGit94ZXQgZkaw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: sierrawireless.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3afd5e8-8b81-4c2a-8abe-08d58da16e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2018 13:58:02.0048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 08059a4c-2486-43dd-89e3-3a747e0dcbe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB2090
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Mon, 19 Mar 2018 14:31:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IE9uIEZyaSwgTWFyIDE2LCAyMDE4IGF0IDEwOjMxIEFNIEN1ZXJvIEJ1Z290IDxtYWlsdG86
Y2J1Z290QHNpZXJyYXdpcmVsZXNzLmNvbT4gd3JvdGU6DQo+ID4gV2hlbiB1bmluYXRpdmUgaXMg
YWN0aXZhdGVkIChwb2t5J3MgZGVmYXVsdCkgaW50ZXJuYWwgZGF0YXN0b3JlIHZhcmlhYmxlcyBh
cmUgbW9kaWZpZWQgKE5BVElWRUxTQlNUUklORyBhbmQgU1NUQVRFUE9TVFVOUEFDS0ZVTkNTKSB0
byBlbmFibGUgdW5pbmF0aXZlDQo+ID4gc3VwcG9ydC4gVGhpcyBpcyBoYXBwZW5pbmcgYWZ0ZXIg
cGFyc2luZyBpcyBkb25lIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGJ1aWxkLiBPbiB0aGUgbmV4
dCBiaXRiYWtlIGNhbGwgdGhlIHJlY2lwZSB3b3VsZCBiZSBwYXJzZWQgaWYgdGhlIHR3bw0KPiA+
IHZhcmlhYmxlcyBhYm92ZSB3ZXJlIG5vdCBhZGRlZCB0byB0aGUgcGFyc2luZyB3aGl0ZWxpc3Qg
QkJfSEFTSENPTkZJR19XSElURUxJU1QuDQo+ID4NCj4gPiBUaGUgZml4IGlzIHRvIGFkZCB0aGVz
ZSB0d28gdmFyaWFibGVzIHRvIHRoZSByZWNpcGUgcGFyc2luZyB3aGl0ZWxpc3QgQkJfSEFTSENP
TkZJR19XSElURUxJU1QsIHRoaXMgaXMgZG9uZSBhdCByZWNpcGUgcGFyc2luZyB0aW1lLCBvbmx5
IHdoZW4NCj4gPiB1bmluYXRpdmUuYmJjbGFzcyBpcyB1c2VkLg0KDQo+IEl0IHNlZW1zIHlvdSBo
YXZlIGEgY2FzZSB3aGVyZSBkYXRhIGlzIGFscmVhZHkgcGFyc2VkIGFuZCB0aGVuIHVuaW5zdGl2
ZSBpcyBlbmFibGVkIGFmdGVyIHRoaXMgdGhlIHJlcGFyc2UgaXMgaGFwcGVuaW5nLiBPciBpcyBp
dCBhbHdheXMgaGFwcGVuaW5nIHdoZW4gdW5pbmF0aXZlIGlzIGVuYWJsZWTCoA0KDQpJdCBpcyBh
bHdheXMgaGFwcGVuaW5nIHdoZW4gdW5pbmF0aXZlIGlzIGVuYWJsZWQgKA0K

