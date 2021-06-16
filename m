Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.42])
 by mx.groups.io with SMTP id smtpd.web08.9115.1623857313324209507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 08:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector1 header.b=QlJ5Xg1I;
 spf=pass (domain: de.bosch.com, ip: 40.107.6.42, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkvURw1X9V/uXTNV5XaQprOCfWkCvGwA9+dQVi4p0FCSwD9wVuDavbvRnbhv5SGAxPkuNx56NMlTU7b57TovubZa1YocoZYilFOUa46c4d28qE6XnxXU87ZM2GbRyjrWyR71HKJKr08jK1Z/u0BrfgsVr/8Ue6ORQYpazOs6eFum1AhDzXQasrUg+1AZgBrhMRU8Q8mbqJnfHotmkslIqylAfjpNFumzVuZFmXV/FqsiyaNavLYzN36usqcOVqU3f/fBRkvgB0o905HDRmNnK0qzNL2v6u9LrZAXW5fr7Npg++zOomHO6CRtM2NMl57fcP9sNQ/wDc/vds6NtaWwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBsggcT7uvTN+XC5WvWAdtv60VZaOx3WZ1hyK8CcrjY=;
 b=JvzTBpVDQZMVTuSCLSX9GneC8EbwgMlts8SYmIFj43/L84t22CLqo+b2XcdFKc+mNy0UREx6cJQ1w9Fiy5NC+Mh9x/oYYk7MEajGmBz3fIcl6v+y+PAOPd/FJCCcjAZA9nOxEkOJM/HFZYNDmxV9UpPaxBkDNafDEWfQYuyHqe5TrXPgX+saMWMu9docLm/VBPzMIzvbv6+AtQM2tihgTLBOcbAxlTJmWEQpoOdWoCEGxNLKa13ct4onr+Hau2mFjKcd00GdhQDn8dY6rQ76w6PCwHu++Yz0IR83RgJZs+hzEw+Y5fI3ZgAMi8fAV0C0uRq+PnXNYopSzTMZ4ScGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBsggcT7uvTN+XC5WvWAdtv60VZaOx3WZ1hyK8CcrjY=;
 b=QlJ5Xg1IY8Nw3BfsyNnGF9Ww8Y3k55u+T2Gx8D6mTfHRHlgvc6LhAVLPb6oTZ2sn6Zfz5ts5ir0ab0vhjO05aZdtwdP3oNqXQNbzhjJUpj+Yh4I5hKrhSNl5ByjXUILkHg8ckbxBfBbIxsrWDufHasjOZFta05GWNE1Y57dkUlI=
Received: from AS8P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::9)
 by DU2PR10MB5029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 15:28:31 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::cf) by AS8P189CA0010.outlook.office365.com
 (2603:10a6:20b:31f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Wed, 16 Jun 2021 15:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.203) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 15:28:31 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Wed, 16 Jun
 2021 17:28:17 +0200
Received: from SGPMBX2030.APAC.bosch.com (10.187.83.39) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Wed, 16 Jun 2021 17:28:16 +0200
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 SGPMBX2030.APAC.bosch.com (10.187.83.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Wed, 16 Jun 2021 23:28:14 +0800
Received: from FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f]) by
 FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f%6]) with mapi id
 15.01.2176.014; Wed, 16 Jun 2021 17:28:12 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Steve Sakoman
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ovidiu.panait@windriver.com"
	<ovidiu.panait@windriver.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "toertel@gmail.com"
	<toertel@gmail.com>, "RUAN Tingquan (BT-FIR/ENG1-Zhu)"
	<Tingquan.Ruan@cn.bosch.com>, "quentin.schulz@streamunlimited.com"
	<quentin.schulz@streamunlimited.com>
Subject: Re: Request to backport KERNEL_DTC_FLAGS to Dunfell
Thread-Topic: Request to backport KERNEL_DTC_FLAGS to Dunfell
Thread-Index: AddZPHjUNiLGiOl4SkO6mJBwBSv0IAABmXiAAACO5wACXa/BIA==
Date: Wed, 16 Jun 2021 15:28:12 +0000
Message-ID: <8f04ab75284a42e084c02519d177bd18@de.bosch.com>
References: <d8dac798fed14554b0bfb5b7ea2daf12@de.bosch.com>
 <CAOSpxdZQBmu8Da90W2h01ZMRD+s9GVP3Lvq-xsSrSjJJRuFeNA@mail.gmail.com>
 <CADkTA4NkMjTjTJbp_6HCapzasyzrWGwQkBWuen7GWgNi4ppZbw@mail.gmail.com>
In-Reply-To: <CADkTA4NkMjTjTJbp_6HCapzasyzrWGwQkBWuen7GWgNi4ppZbw@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.141.195.108]
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d601576-e85a-45a1-c9b6-08d930db65b4
X-MS-TrafficTypeDiagnostic: DU2PR10MB5029:
X-Microsoft-Antispam-PRVS: 
	<DU2PR10MB502983197DEC41B63E17BAD1AD0F9@DU2PR10MB5029.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AJAFODEapCPmREYFT+8SvtJF9BozaTPCUbTgl3X6KcqxuuoLuZCNdcoNMtShH9BZFIJD2tisOVJXVr3gToGuCAIE1v0MSKOGVgCVoIoShHBKs8JhunsLuhZ9TEVhoXp0EWpXtnNu9X3rL93yXfnxkaochYSqCRZiQM9eEyumNZx+fTJzB20LFy3T8IuScjZGyCp/W7qfRnXdrhNzj2cINSgxeGxJdHtdoov3n9i7R5Zb9uyrYjdS9SqumRM604PCMkwS3Woy2J6gMDQx9Cgd0cyul3hf4b+G1/1Nii0mxp69ShEWxNcpctsecEdeDFF0axpnBxiCjhxRGSkBJejwpvjKnZcswhqPE9y1UChKjZug0/eUteGtuuZGawf69MbZ6TiKJVu/n88E/1dX86+CHULWtRT5lU0iKpkOVhvJDQMMJvcoPl+SJ7FddZbOaa0m3+zfTlfdNyFw287OS47smDtwcVa6hKoTRV8GY30+JmotOJWT/ksUubGsV8sCpGG3J3M3jPHJXe/VdjM5h2yqMJErG842VkgZmbitjavFZSsW4kE0T+MeU9AdGN8qs2d68a93g7J3WxZb3TC+f6YoKhxHhbRScWcZSa6aANWicH5dAHeJ37ZtbTeFD2H9U8kbY7ydx3RcEY/cgu3x8eWLu5CdqXnuLYgrxOVEah1RN5UH8HsL8lRfoU2pyIKGRsnN
X-Forefront-Antispam-Report: 
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(186003)(82310400003)(5660300002)(426003)(54906003)(70586007)(4326008)(26005)(70206006)(110136005)(8676002)(2616005)(316002)(82740400003)(2906002)(83380400001)(24736004)(8936002)(45080400002)(478600001)(356005)(47076005)(336012)(108616005)(36860700001)(86362001)(81166007)(53546011)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 15:28:31.0824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d601576-e85a-45a1-c9b6-08d930db65b4
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB5029
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UgYW5kIFN0ZXZlLA0KDQo+IFZvbjogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZp
ZWxkQGdtYWlsLmNvbT4NCg0KPiBPbiBGcmksIEp1biA0LCAyMDIxIGF0IDExOjA5IEFNIFN0ZXZl
IFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIEZyaSwgSnVu
IDQsIDIwMjEgYXQgMjo0NSBBTSBKb25hcyBNYXJrIChCVC1GSVIvRU5HMS1HcmIpDQo+ID4gPE1h
cmsuSm9uYXNAZGUuYm9zY2guY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBIaSwNCj4gPiA+DQo+
ID4gPiBXZSBhcmUgdXNpbmcgRFQgb3ZlcmxheXMgYW5kIGhhdmUgdGhlIG5lZWQgdG8gcGFzcyB0
aGUgLUAgcGFyYW1ldGVyDQo+ID4gPiBpbiBEVENfRkxBR1MgdG8gTGludXgnIG1ha2UuIFRoZSBw
YXRjaA0KPiA+ID4NCj4gPiA+ICJrZXJuZWwtZGV2aWNldHJlZTogSW50cm9kdWNlIEtFUk5FTF9E
VENfRkxBR1MgdG8gcGFzcyBkdGMgZmxhZ3MiDQoNCltjdXQgb3V0IHdlYiBsaW5rcyBtZXNzZWQg
dXAgYnkgT3V0bG9va10NCg0KPiA+ID4gbWFrZXMgdGhhdCBwb3NzaWJsZSBpbiBhIG5pY2Ugd2F5
LiBXb3VsZCBpdCBiZSByZWFzb25hYmxlIHRvIHJlcXVlc3QNCj4gYmFja3BvcnRpbmcgb2YgdGhp
cyBwYXRjaCB0byBEdW5mZWxsPw0KPiA+DQo+ID4gVGhpcyBpcyBzb3J0IG9mIGluIHRoZSBncmV5
IGFyZWEgYmV0d2VlbiBmZWF0dXJlIGFuZCBidWcgZml4LiAgSXQgZG9lcw0KPiA+IHNlZW0gcmVs
YXRpdmVseSBzYWZlLCBzbyBJIHdvdWxkIGNvbnNpZGVyIHRha2luZyB0aGUgcGF0Y2ggaWYgdGhl
cmUNCj4gPiBhcmUgbm8gb2JqZWN0aW9ucyBmcm9tIHRoZSBjb21tdW5pdHkuDQo+ID4NCj4gPiBB
ZGRlZCBCcnVjZSB0byB0aGUgY2MgbGlzdCB0byBnZXQgaGlzIG9waW5pb24uDQo+IA0KPiBHb29k
IHRpbWluZywgSSBoYXBwZW5lZCB0byBub3RpY2UgdGhpcyBlYXJsaWVyIGFuZCB3YXMgdGhpbmtp
bmcgYWJvdXQgaXQuDQo+IA0KPiBXaGlsZSBJIGFsc28gd291bGRuJ3QgY2FsbCBpdCBhIGJ1Zywg
SSBhZ3JlZSBpdCBpcyBhIHNtYWxsL3N0YW5kYWxvbmUgY2hhbmdlIHRoYXQNCj4gc2hvdWxkbid0
IGJyZWFrIGFueXRoaW5nLg0KPiANCj4gQSBxdWljayBzY2FuIG9mIHRoZSBkdW5mZWxsIHRlc3Rl
ZCBrZXJuZWxzIHNob3dzIHVuY2hhbmdlZCBNYWtlZmlsZSBoYW5kbGluZyBvZg0KPiB0aGUgb3B0
aW9uLCBzbyB0aGVyZSdzIGxpdHRsZSByaXNrIHRoZXJlLg0KPiANCj4gSSdkIHNheSB0aGF0IGl0
IHdvdWxkIGJlIGZpbmUgZm9yIGJhY2twb3J0Lg0KDQpDYW4gSSBoZWxwIHdpdGggdGhlIGJhY2tw
b3J0IGluIGFueSB3YXk/DQoNCk15IGNvbGxlYWd1ZSBUaW5ncXVhbiBnYXZlIGl0IGEgdHJ5IGFu
ZCB0aGUgcGF0Y2ggZnJvbSBIYXJka25vdHQgYXBwbGllcyBjbGVhbmx5IG9uIER1bmZlbGwuDQoN
ClRoZSBkb2N1bWVudGF0aW9uIHBhdGNoIGZvciBQb2t5IHByb3Bvc2VkIGJ5IFF1ZW50aW4gZG9l
cyBub3QgYXBwbHkgdGhvdWdoLiBCdXQgaXQgaXMganVzdCB0aGF0IHJlZi12YXJpYWJsZXMucnN0
IHdhcyByZW5hbWVkIHRvIHZhcmlhYmxlcy5yc3QuDQoNCj4gDQo+IEJydWNlDQo+IA0KPiA+DQo+
ID4gPiBXZSB3ZXJlIGFsc28gd29uZGVyaW5nIHdoYXQgY291bGQgYmUgYW4gYWx0ZXJuYXRpdmUg
YXBwcm9hY2ggZm9yIGdldHRpbmcNCj4gdGhpcyBvciBhIHNpbWlsYXIgZnVuY3Rpb25hbGl0eS4g
UGF0Y2hpbmcgYSBiYmNsYXNzIHVzaW5nIGEgYmJhcHBlbmQgaXMgbm90DQo+IHBvc3NpYmxlLCBp
cyBpdD8NCj4gPg0KPiA+IE5vLCB0aGVyZSBpcyBubyBlcXVpdmFsZW50IG9mIGJiYXBwZW5kIGZv
ciBjbGFzc2VzLg0KPiA+DQo+ID4gT3RoZXIgc29sdXRpb25zIGFyZSBwb3NzaWJsZSwgYnV0IHRh
a2luZyB0aGlzIHBhdGNoIHdvdWxkIGJlIHRoZQ0KPiA+IGNsZWFuZXN0IHNvbHV0aW9uIHRvIHlv
dXIgcHJvYmxlbS4gIExldCdzIHNlZSB3aGF0IG90aGVycyB0aGluayBiZWZvcmUNCj4gPiB3ZSBn
byB0aGVyZSA6LSkNCj4gPg0KPiA+IFN0ZXZlDQoNCkNoZWVycywNCk1hcmsNCg==
