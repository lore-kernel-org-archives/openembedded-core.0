Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.3287.1585100025649688135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=R7JzWXRy;
 spf=pass (domain: nxp.com, ip: 40.107.20.50, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhRN1r+wCNmdvezCuLwMtukr8S8XlcbykgSI5BzVXeKvjKtYw1z9WRA+fpDRSUtXp3bL9f8KP3yloWAFS6KsG3ux9CQ33UtgHboHY1TUZ1wdpLTjSZRTErIZHa/+Y/v5DpISPnoi9D5cBqKwdrkH1J8AiKs35meGDBvT1wjH3zuRLCyGLPS/isl07iH0kTL/AwTIHZDAllFu8iUaS74U4SVM7P82GP/35a9rA0yhWolUt0fYfMYgIKj5UQcE7UPmDc4+ELPGxx2FGkPRoxcgm0jVFpa+9GpV3p6CxtJ2Isse+cIolSk1TQSAhRVB3qNuZLdINjJCkK6pik4CwP/Pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHDrvIVnUrvGWgIr2k7YLjqLPPSBwaZssd+3r//N7Yo=;
 b=MbPDM8s377SwKPLnyK63SFTEyedHpKD+oOfRh5MerE9sLF74Ojke3xNgJaY+3bhg1iv12LEjTivryyWMBnLMWHOvMt6BknmrC00VRe6zfk/3SbsYmugHIrhoubHWRs58XDTZNWBto4Djo4d9KcKiU7sGkqMyn4tbf82XrhluI7oMh1J4FA+lth+HRMJuk9+cF0scDEPb9JE42p65AzW8H9CV/RzVbl+BQgjtHwwAFyJRWiMlXRhhCApoxafF8/fWXBkIz9eSNMNWsef/MfHOazUEL+L9ADWUO97uvc9wDBCANOQ9p6+TNo2cIEU3B0zhu+DBZHXS2vtEgBzVY5wvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHDrvIVnUrvGWgIr2k7YLjqLPPSBwaZssd+3r//N7Yo=;
 b=R7JzWXRyjgaoLDMMcx0SLr1FHDgGJmBrFNZNdkOvIj55ggq7UvSxFwBhYRmJKgNIxPHjmXJ9n5YIOGabY7+ywGFDfsotumcI1YXqA18zUAAmbPVFBlqHNKvoD0cbtHEmjqI18c2JV9z2gez0JP2NBHPOVk6pd6uyXo/YbgOjoNo=
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
 VE1PR04MB6365.eurprd04.prod.outlook.com (20.179.233.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Wed, 25 Mar 2020 01:33:43 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 01:33:43 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Antoine Manache
	<a.manache@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
Thread-Topic: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK
 toolchain
Thread-Index: 
 AQHWAf4ySYaIHuSCg0uYVir/1OX0+KhX/oUAgAAKeYCAAAKpUIAADx8AgABAeYCAACm20A==
Date: Wed, 25 Mar 2020 01:33:43 +0000
Message-ID: 
 <VE1PR04MB662103E59BAAF095702FC0DEE2CE0@VE1PR04MB6621.eurprd04.prod.outlook.com>
References: <20200324170259.3206-1-tom.hochstein@nxp.com>
	 <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
	 <5e1f58719f8835201ddcd82bb19af555f5c2dcc2.camel@linuxfoundation.org>
	 <VE1PR04MB6621F3264C205F46AACCA6AFE2F10@VE1PR04MB6621.eurprd04.prod.outlook.com>
	 <CAMu9SpKSFfexqz2sqsr6ZyPtdeSCu1XfLYSSznX1FtpG5=TK7g@mail.gmail.com>
 <1745659de941c18de2c96c16b3f8c3fc5b457c7d.camel@linuxfoundation.org>
In-Reply-To: 
 <1745659de941c18de2c96c16b3f8c3fc5b457c7d.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [63.246.163.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 844a8cf0-a771-472c-0de7-08d7d05c8e37
x-ms-traffictypediagnostic: VE1PR04MB6365:
x-microsoft-antispam-prvs: 
 <VE1PR04MB636579B449D1EF9B2312AA27E2CE0@VE1PR04MB6365.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: 
 SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(33656002)(8936002)(2906002)(26005)(5660300002)(478600001)(7696005)(44832011)(4326008)(9686003)(186003)(110136005)(53546011)(316002)(86362001)(52536014)(8676002)(81156014)(55016002)(66556008)(15650500001)(66946007)(66446008)(81166006)(64756008)(76116006)(6506007)(71200400001)(4744005)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6365;H:VE1PR04MB6621.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G1lOOFuxcvrXUq3sPZ2BcJwHuGSNzYfnixB0zt3xSTY5dTxzVO2TzGdBX7hiZC3M9fbif9/Hq7RoWG47snE4p6VqnBM8aMBX7ezW21vQK8GKxuuzLIAuEj72XiQxMeBMuJxu1xq4bvoWRYzJD+tBIwoAXUPmIsn5Kaqv6TbknszkdqO/JAgeJFxGRd/nV55+PgKx2PhLhu8/x01iWdQLd/QYBsoz6bS/l4LidM1pW6ERWtjUpN5KPYAGumO69KkV98Go8dp2YEobVphD13Y/YZV4v8dtbjnHan0qNza/rQyzCpolmiwfez/ReuslJ1fC5FW3/H+Qz0GQsiKViM4NYzqG6z7LogoyDVZiT6yXhJqy6n19XY1m7M4e8pLRK6/pANGhxhRvR3c5SS/z3OWDxGDx6JxtQ1tRJfn3l0jwNWwjgZneiqKXoEvgWRBnGggR
x-ms-exchange-antispam-messagedata: 
 ZAKwaZ7Zqty+ZpS78ltVPNYbxGMxP3QMhZrsp4XeMoKuhWhyhd1ekpXH6acw9JpMwi89spNvf2ZQHlh/Ak1eTzQfIAXfaB/S0vtOW+DLbDHRn6JLgC3osBvhtHe3mlZqvn1p1RHSER3M9l5dSeOSSQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844a8cf0-a771-472c-0de7-08d7d05c8e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 01:33:43.7126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvqAMBP5qP9/hHYgdocgDhRJ6+YscpN4cj00lyTjwMhngoGMQPegqfhIXRZTfE68QtZ/cummWKIFBNua0hIECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6365
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1h
cmNoIDI0LCAyMDIwIDU6NTggUE0NCj4gVG86IEFudG9pbmUgTWFuYWNoZSA8YS5tYW5hY2hlQGdt
YWlsLmNvbT47IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT4NCj4gQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXVtQQVRDSF0gc2VjdXJpdHlfZmxhZ3MuaW5jOiBmaXggZmxhZ3MgbWlzc2luZyBmcm9t
IFNESyB0b29sY2hhaW4NCj4gDQo+IEkndmUgdGhlcmVmb3JlIHRha2VuIFRvbSdzIHZlcnNpb24g
d2l0aCBzb21lIHR3ZWFrcyB0byB0aGUgY29tbWl0DQo+IG1lc3NhZ2UuDQoNClRoYW5rcy4gQ2Fu
IHdlIGdldCB0aGlzIG9uIHpldXM/IERvIEkgbmVlZCB0byBjaGVycnktcGljayBhbmQgc3VibWl0
IHRoZSBwYXRjaD8NCg0KVG9tDQoNCg==
