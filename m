Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.86])
 by mx.groups.io with SMTP id smtpd.web11.2871.1602177752625098260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 10:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=qNbFOS97;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.86, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpPapyr9pxpGWc992wPKpM18CnqQ9koWOdvJAlfpwBPfUSBrPMkqpv/gBjIJW0wUs26GcuhuVoWM3AVlkVKQ7EA1z4Bl+KsB8uscGmjCvc8dbX9fGfidJyuTba0yjm7KiN0n3IGNyE4gBoCGU8ptJLtnK5Lor1HZnilnPHh/9v/0araK76/PZ1Tw+i6poWcPtMSfzlbPRR1AtfogW4i/LSEyr9C7GptXJxfUErjDRyE24K/LAsprqMdo6F8yKAsXcnSbDch6eF75s3Uv4ziT0eHFMCFOwnUXyce0cR5wL9PiL+ywzDI5hLBA7C1M7YH3hL7aotlehGFECyZ77vPjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6W3883Qinh4oWpGIoCQgK+3WTMMrIIsaCcq3D7RJtA=;
 b=cnLRV5JvMINn0sVgXpbbZJgsDp2ghi56LuVcbaIqGdm3DTIrNaUmPDsOPX4cZTToyzDGdWo43dBVwvfTstb+/nYnQex8BaruXNQG5nl4T0LptZ5zj0aD+agTxhNTbgeK+mJ2nt77Sd7IDoLq58BegGsT5UFQAJNPkeLHRGEMI5tpjJTBVFrsYz+CgzE9MOBlFNbY0SInmVBClmueg753mrhS9/HhE0uF5xFq9gEnC6RD8hkigm1J5YgxXBQNGBARvsrck0WFAZXjtT894uzIVZTRIHWC1LGCUkql3W9GSNZZ6xDoaIusdkwhbTz2/LFVlO8/oYSj4AZtnV+LQn0P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6W3883Qinh4oWpGIoCQgK+3WTMMrIIsaCcq3D7RJtA=;
 b=qNbFOS97ieEw4tvTSJwgJWLusMNcTRIbNLkrk9I7fMku0ODUblugkLdFn7j5HzjiNUtR+djoW0bUKLWhhdx6KGGX7f4cypeVKV/UK5a7wBaKN3vTLFWIUEKyFhnH6/UPACYbZTp+df0FD98I3ymRd8ABs3ac3tjhuRppr7QsUP6wR5cR+IreAff5o93XDzS/Ir+WX6S6NEU9VyLjwkNqxCDQOErewNN0jrE+FyW7RzWyQ/ja3yAWloDELaFupoG/01NXO0vYneDIa9RGwXrdzgebgVd9TI8Wkig75ZQtQFc+jfkI3JyEvvg4UjQXSy+tw63GjUjA642iTnSAgRtOwA==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Thu, 8 Oct
 2020 17:22:31 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d%7]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 17:22:31 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Joshua Watt <jpewhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: ensure out-of-tree build when under externalsrc/devtool
Thread-Topic: [OE-core] [PATCH] meson: ensure out-of-tree build when under
 externalsrc/devtool
Thread-Index: AQHWnMlMgJs8aNiUwUauCVp48BLudamMihCAgAFqNoA=
Date: Thu, 8 Oct 2020 17:22:31 +0000
Message-ID: 
 <SN1PR12MB2480E9CCDB9E862AA6A3700E8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20201007164534.123373-1-chris.laplante@agilent.com>
 <15be7caa-aa27-1776-6f41-6ef0bd64a9fb@gmail.com>
In-Reply-To: <15be7caa-aa27-1776-6f41-6ef0bd64a9fb@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b6a0cb1-8170-415a-7dce-08d86baebd1d
x-ms-traffictypediagnostic: SN1PR12MB2575:
x-microsoft-antispam-prvs: 
 <SN1PR12MB257520133DED40D23D1A4CE18B0B0@SN1PR12MB2575.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JNz3rn3pM1jj1UaUGm/ZiAkSDrtvdC5D4XhMsuxnv/sVSIljVP6Gzl7wznURvBE0jWKJexh9GI4eubNOOwdSu3OEiroEUs0x5Oq189eGZeacstRQn8HoKM8WbzLV6nO/uhB0+ovK92I5OwMpMIfVYP7cI0c9SBntOBPI0hTxixb5zM21AZjGJvigP5m0Bq3+EOeWfTLLOx1zsGy9Bz313uyRv6Tb+Le1qLNFPMDiElJsHZc04IbGc/ADc0OlMfXrFSzk06pS/iQkpgeRekkQY5iSdT/JA9Qr+um1wZooClPvamVAchkOKOX0jz/l52CK9jZcDRMXOsE/MuACUpXO8/0bDHqIqxtylTnJrj6925kVTehzPI39pNhjusigB3ZE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(29502001)(8676002)(33656002)(55016002)(186003)(86362001)(9686003)(71200400001)(5660300002)(52536014)(4744005)(2906002)(110136005)(7696005)(66446008)(8936002)(64756008)(66556008)(478600001)(66946007)(6506007)(26005)(76116006)(66476007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 qDkJ5LiPmwdHi2a3mfHjETwpBUCYtqQ9TPXRpNX96NEnZStg/gUH7NcUGnDU/RcyeBL8bSDvaLfBwKRhSDLrfQzvUwOfWJgj5R0B1qCz6E06KoCvhyCImm39eOfqfTAMNVwLKw3Ddu6Nfj6iv2kTV4fkzMupqCkkAmbhI6f9DTLNnKSaQT1OY7/nQElBPui1PAd5mZk8+VhAeXE0P902++5HZbeXP17gZooP6CT4JHa+CErXUegLDE3Vn0Fv+cR55sCMsa69AWHEupAuERqyFvc4VCmwkTS5rgyL36iepZ+Y1jF5UYprh4fVzJoxgrUFqdflv83Xs30XLdvEXSUWjmv0r/6/SpPRS9+g4AQaeCBBm99Y7vkEO+RbtbnJZFzudN8fZ21aPRQRy037/Jw9lUd8sbdBz8hzyEJWcwKFE236ytHNMBdc4mz01NCy9kxlLltPL5JZpqxGVFBB5uKggpaub4UVe5i8Xg2CD748YIpHn4sL/dRP+UCRUbBIsM++YQEkb36iRTScF9URo9W4B5NPnE9xlFoLRIn0RuTGkLfV5dCNeMYJetv95JcfR3ZPRW7dXXzXgfm2q1BjVjek5AGr0zaH/Sbf8eZUo0p/rmjVRUwAP4kBVe8h20khhsPdBDoRKNutVcWZ2e7WGectpQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6a0cb1-8170-415a-7dce-08d86baebd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 17:22:31.3033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1YxeC76cFUHp3My2eeR1C8lXAxKeKPk5XQRt2SbQCCsV5vZ6VSlicYJW3SHTO5Y85/juWKT47Ltq49ooNOIen3Za0rxS2Z0P2hVaMmMWzWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2575
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiArQ0xBU1NPVkVSUklERSAuPSAiOmNsYXNzLW1lc29uIg0KPiArRVhURVJOQUxTUkNfQlVJTERf
Y2xhc3MtbWVzb24gPSAiJHtXT1JLRElSfS9idWlsZCINCj4gKw0KPiBXaHkgaXMgZGV2dG9vbCB0
ZWxsaW5nIHRoZSByZWNpcGUgdG8gZG8gYW4gaW4tdHJlZSBidWlsZD8gSXQgc2VlbXMgbGlrZSBp
dCBzaG91bGQNCj4gYmUgY29uc2lzdGVudCB3aXRoIGV4dGVybmFsc3JjLmJiY2xhc3MsIHdoaWNo
IHdvcmtzIGZpbmUgZm9yIG1lc29uIGJlY2F1c2UNCj4gaXQgYWx3YXlzIGRvZXMgYW4gb3V0LW9m
LXRyZWUgYnVpbGQuIEZXSVcsIHRoaXMgd291bGQgKmFsc28qIGJlIGEgcHJvYmxlbQ0KPiB3aGVu
IHVzaW5nIHdhZi5iYmNsYXNzLCBidXQgSSBzdXNwZWN0IG5vIG9uZSBjYXJlcyB0b28gbXVjaCBh
Ym91dCB0aGF0IDopDQoNCkkgaGF2ZSBubyBpZGVhIHdoeSBkZXZ0b29sIGRvZXMgaXQgKGluIGdl
bmVyYWwpLCBidXQgaXQgZG9lcyAoc2VlIHBva3kvc2NyaXB0cy9saWIvZGV2dG9vbC9fX2luaXRf
Xy5weSwgdGhlICJ1c2VfZXh0ZXJuYWxfYnVpbGQiIG1ldGhvZCkuIEdyYW50ZWQgSSdtIHVzaW5n
IHpldXMsIGJ1dCBteSBleHBlcmllbmNlIGlzIG5vdCB0aGUgc2FtZSBhcyB5b3VycyBzbyBmYXIg
LSBteSBtZXNvbiByZWNpcGUgdHJpZXMgdG8gYnVpbGQgaW4gdGhlIHNvdXJjZSBkaXJlY3Rvcnku
IA0KDQpDaHJpcw0K
