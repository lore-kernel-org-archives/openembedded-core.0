Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.64])
 by mx.groups.io with SMTP id smtpd.web10.2486.1587391201995788850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 07:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=dV601YAN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.64, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn2aShQ7gqzjeakvHaCbh5hTWwnt+WaGuOXPRtwnA2dpGMXexn8Hi+fBIPvc41Olq5hF6qSeFmFQuIU/JO1rqjWq8X763uChXw7uIYL1In3aB6Zf6DcdMfb1k/crAD1Yrq7j4Sd+gbH77AM93vS7HXGZgyLynEUZJFhw2Z+LyOtaxNv6NJB3Lo9cIwy9e4wHpjd8gEyOw/uYr8Ovg5K+HdexkIGoVrm/PcYn3OwvOxeamYLILPNUa83O3BGNqbF6vCjQ9WzoOx40OAS63fE9MzJlS/BhwFaQaBzklPXNbKHciwaBwEAMu6ALkgCDxArmBsBQnihlmFUcGub4Ts+PMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUOvbtFMd38+yqYlBTj4tbzcUiEBM5KD+iwvzZAvAsk=;
 b=gW/QUXHVn+wo19k/+GxtbzaHLJhzCpKX3eYmpCEVk12WKAf+pKgFS4FjgxpC9tXtE1HHZIhphO3qtSBK8cCmbznU04ttV68IQ3v/eYnXbgSM5jLoqS3rpXjkMg2nf8mFtAjnzJTXJ4z0yCpC6rlrd4V1OOXG/JxqNJRHlt2zlyezgE17O/ymIdtJUsr/RdBbFPvnHs4+Hqgx7+d4nSXRos7jKZNCIbOHTUowQQ77JmCXFkjXxx+BbvNcR04Vnbmyv5Apzz1DU3B4QfdY0VXQgcY6rTKfyVFtl9IWnuUY2YHbu8AmyoTuC93aMCiqy8qajXXSJQdCfi/nGMuldzD1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUOvbtFMd38+yqYlBTj4tbzcUiEBM5KD+iwvzZAvAsk=;
 b=dV601YANVBTy14PYmNba8C0dM0tQL9rVf6hdLlZLgdxBz+FL5tKNHB1op3yViw9Vyeyj++wVBaLR0bDc3JbVzDRVV2wjji+Xojg34SPIX3GJ8LNS0Wn6+UMy2DfmfAMSL3C71QqTo3BGxaVYyGDZEhjwCUId0VeWpnO/BC7TvRM=
Received: from DM5PR12MB2471.namprd12.prod.outlook.com (2603:10b6:4:b5::10) by
 DM5PR12MB1610.namprd12.prod.outlook.com (2603:10b6:4:3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Mon, 20 Apr 2020 14:00:00 +0000
Received: from DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab]) by DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab%5]) with mapi id 15.20.2921.030; Mon, 20 Apr 2020
 14:00:00 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
Thread-Topic: [OE-core] Uninative for i386 native tool?
Thread-Index: AdYWkVM2trCb21KjTGaQ4NZX8woV6AAAwS0AAAATDeAAAN0CgAAgydzwAAAoxlA=
Date: Mon, 20 Apr 2020 14:00:00 +0000
Message-ID: 
 <DM5PR12MB24718ACA1FC6CD132F10C7988BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
References: 
 <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
	 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
 <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
 <16078BB604B2F7AB.6073@lists.openembedded.org>
In-Reply-To: <16078BB604B2F7AB.6073@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c16a0f00-974a-4243-5289-08d7e5331dfc
x-ms-traffictypediagnostic: DM5PR12MB1610:
x-microsoft-antispam-prvs: 
 <DM5PR12MB1610E7D984537DE9D2C79ACF8BD40@DM5PR12MB1610.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2471.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(346002)(366004)(376002)(39860400002)(136003)(29502001)(4744005)(478600001)(52536014)(186003)(86362001)(5660300002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(71200400001)(26005)(33656002)(6506007)(7696005)(316002)(4326008)(110136005)(8676002)(2906002)(9686003)(8936002)(55016002)(81156014);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 v6kZQXCK6120Sg+9/p5hNr/qEjSgTfDGhjS1n+fbysHkAbWWzIx0bOkLDHlldCgS8YzCYE0vI4JA7xybgo7JmvOZ20V07PF04k/9HK5KlrBYOKu/bjzPBavPeZnfeoW0RQAfoKDDKL+7UxI2P8cviMDXTrRekQM52zLNWBPR/uxPhqM8LOOy0oEkzGltjrh7TF5F1mPzemQDu5ibpM5nIHWTWBMDgbJkZTkX9uGOHBu1+w1AVdHzavaeJfmf1Ccnq3nZxG5BrIvpxcdOn09iJb4AaxBiKXmJMjCSmw2D1Sv61K1k5eGvj8tZ3SX6Fibr++FqIrjfaNefQQ6l9XUiuEIKC1m/OKGXlGJB44dNyEgW5fVYuospV1pT4g31/0DQ1EuGh9zoVehgoOkJ5LWUHuPDLr8Mao9w1nSVx53iq9mS/F78IkHM0KbA7tWPS7KsNogtolmO/Dls5weL3ecY7tM5ejYXkzZOMTQsFmxrY1HMQTzFamjnOSwdiWMtvcZl
x-ms-exchange-antispam-messagedata: 
 5IV4QGzZZBONlL6kunIGZkY96dJU7v8b4XVgq3AKFr/VbSAPaxDEMDi7+x+8Kc5p3mDX4Ms58COjhaGyIfaIY2NKgvMcX1G97TH0PBhhO/AVACh+fqRLTFc0vvEuWcRLJIWnDNJOgDM8ef/UBfEioA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16a0f00-974a-4243-5289-08d7e5331dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 14:00:00.4233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vOexBsDfDh3zC7FnG+SyIuidPJ/dIkFsdz5ryt0YVdgR9Z7k0AhcZlWhZrWjjVb2lg4J6zpqoHESSFYvdIBlxjHBWlnPncNVcMVQpUcBI6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1610
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEkgc3VzcGVjdCB1bmluYXRpdmUgYXNzdW1lcyBhbGwgYmluYXJpZXMgYXJlIGZvciB0aGUg
bWFpbiBzeXN0ZW0NCj4gPiBhcmNoaXRlY3R1cmUgc28gaXRzIHByb2JhYmx5IHRyeWluZyB0byBj
aGFuZ2UgdGhlIGludGVycHJldGVyIHRvIGEgNjQNCj4gPiBiaXQgb25lIHdoaWNoIGNsZWFybHkg
d29uJ3Qgd29yayBpbiB0aGlzIGNhc2UuDQo+ID4NCj4gPiBJdCB3b3VsZCBiZSBhIHF1ZXN0aW9u
IG9mIHN0b3BwaW5nIGl0IGZvciB0aGVzZSBiaW5hcmllcyBzb21laG93Li4uDQo+IA0KPiBNYXli
ZSBhIG1hdHRlciBvZiBkb2luZyBzb21ldGhpbmcgbGlrZSBVTklOQVRJVkVfTE9BREVSX3BuLW15
LXRvb2wgPQ0KPiAiPz8/Ig0KPiANCj4gV2hlcmUgIj8/PyIgd291bGQgYmUgdGhlIGxvYWRlciBp
biBhIGh5cG90aGV0aWNhbCBpMzg2IHVuaW5hdGl2ZS4NCg0KT3IgSSBzdXBwb3NlIHRoZSBleGlz
dGluZyBpNjg2IHVuaW5hdGl2ZS4gU28gdGhlIHRyaWNrIHdvdWxkIGJlIHRvIGdldCB1bmluYXRp
dmUuYmJjbGFzcyB0byBmZXRjaCBib3RoLiANCg==
