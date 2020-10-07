Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.57])
 by mx.groups.io with SMTP id smtpd.web11.3167.1602082738070313130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 07:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=freXf4ia;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.57, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPTaJHgcRpZ9umSlPXV29PmGJJk/zdtzicRPvzOgPAcH8Zejw2JMgNI6nupJZVQ2gzPCsZJ3xLOCGpChOWJ8hF7SiOE0nWNFSjxhGL8Kl2IL3GazCtgZfTyrwN9u+s8N8r6R8TDkzo11/8AzpKTvqLQTUiULGiIrQ3I7hdrXHfaPBjnC3Mbt9rpTmm8OPQDg7oeQCFGNNaR4btdKLzVblKcp5NiWKN7kFIqdce6ugMcnAq/GquDekk4bmbaIVCSfXt/E2EoxAAGAqWfjLlLxA+NDgZ1oK/pty1mhLnA+54xRzP8fdRU8B82tnfB9gpz63ZZgbvaL1V3UInP3igYHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aM2K9CcZg/wb8X0YZLMVCMKk2kaPijml6hDhnCB6QmM=;
 b=Vq+HVZ22aIB6jMyP8jIL/UeLP4K8wVdu1tXXC/H/rZJ3IhS8pQYaId+cwNrRJI1zmlmJasDanWSEaEpQH4F9DUt+Wev923avb+bKOkSS0b3b0oWK/ae38NZe0GRS+WiFMHZ2Kz9XzomPZeiLmfbljQlVV7V2XGHy07PwTLpE0gZjMZFCq1Znc4+yWx/FatGN7dzvYd25wMiVDUe71K4jXs8RkcU5DbFUgctRUIdp7FvpQkSiGT8W5gyp48zr8Ynmna/HF6vQFlnHhNGVTdE3eCFVr/KXHKAxnQ44g/0koGjKZC6xKbHNcPWtP3APxoDeP7/pZjTTyq+LUi4Dd2bcCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aM2K9CcZg/wb8X0YZLMVCMKk2kaPijml6hDhnCB6QmM=;
 b=freXf4iaQZRUEo0MYjGpyOMrvBUPKrK94xFyNb5uPBQEwnTvJQEKWc9csCvMQWA/mj6dKc64rNcan+AYouFqZYolejWQNNaqXq3l03LQXjRMPKRP4U6FFgIaUICmCfqpVLhRfI/7QBBosdXPuHrfHLN/pkVxfqdQCABe0GX0R0lMzVjLH3kuR2dSPqbtyah4Iyn2rW3hhKfAtDOcA9KuQkThoNP2cj450Zk24LXFXQBrxjzjBZyKKec1ZilWV6aOZnLQVFz/7wwK5iGaRTbIuGMPrsf4eaoW9AbHVQpL9brG0qFMXlTg1ZNa1jLeLrJjUkmfmpfcRKU9JMcrgP2ueA==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN1PR12MB2352.namprd12.prod.outlook.com (2603:10b6:802:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Wed, 7 Oct
 2020 14:58:57 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d%7]) with mapi id 15.20.3433.046; Wed, 7 Oct 2020
 14:58:57 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are added
Thread-Topic: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are
 added
Thread-Index: AQHWlZygHIczyD9sPkqHZe4YWbbZnKmKygswgAAL74CAAAJ0IIABJe6AgABLA4A=
Date: Wed, 7 Oct 2020 14:58:56 +0000
Message-ID: 
 <SN1PR12MB24809CB5582CC83DE3D4DE6B8B0A0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	 <SN1PR12MB2480083B16B34A4A0C9119978B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
	 <1ef1432ac36ca2224dea67e2824c5b8f04cc1066.camel@linuxfoundation.org>
	 <SN1PR12MB2480A99FEE6B179D1A5A76E58B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
 <ae93fdcf366f38395f74b0eb6d22f471a57fb0be.camel@linuxfoundation.org>
In-Reply-To: 
 <ae93fdcf366f38395f74b0eb6d22f471a57fb0be.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 131e6927-007f-46d8-80a8-08d86ad1841e
x-ms-traffictypediagnostic: SN1PR12MB2352:
x-microsoft-antispam-prvs: 
 <SN1PR12MB2352DF587AFFF4DFD88A53808B0A0@SN1PR12MB2352.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8fRiCrdxal41bU9e07XP6gDwFJxrbALGSzn+dJv3PAKNjfsDCuNoPOa1ldn08xKpOyFQzvEwOHI/Jb06LDt6Ao0NsJpBy194wyKYl8KTvLEnq20cSccicnbdv0L6pkiH7d3F8I/qN8xpbnnpmVaLDw0bZfctgejT2Sk9qOlRDjJ/eKlOkmxI7YOgjYYnc3KSKmlaSMDWa0oUNU83U48vmkEU94SICa5yNKWbXFdRBizHLnvkwZfucMXXrQmNSc7c0CQ/EhO/phST+/80lijil4r1XLjrwnmS9QfZUUuJBpTaC+48TQNxs8Pq+pOOOx4VSa7UvDtVPsW6GCLa1rTdWeeMXN1/UrEV1vVOER6es/8TQ0TVvc99KMgWDNQ3+8xc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(29502001)(4744005)(71200400001)(110136005)(7696005)(316002)(478600001)(6506007)(33656002)(2906002)(8936002)(5660300002)(66556008)(8676002)(9686003)(55016002)(26005)(186003)(66946007)(52536014)(76116006)(64756008)(66446008)(66476007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 stOpfEJDqqSuE9xuUGybMd1L342V5IHBjV4/3+4UN8UEGWUGU/PRyqb5ReMX4Bwmng2flM1oPCQ7b5Uo8dZyzXD6aMukcagmu9/+KbUGppw8sVIDvptqEsPAaTAmOVIC7dyiCy9sk1xKbnV3/HHA1CO9fCciLnrUPRfZRmQ0LVbuCrGcsA3CoMe8K4ZhWR6gGCe5q6nSUCNRYGjcqrFbCLwcQz1xxgv1JMWOBrhDIwp3jWqKLVuWjYOYKz45qgt3dXWEsqJSFHhYGdO674b/IZlaMgdZGEbr7Js3wCAQa1P1ktoFdlyr737+tnZ4BUOOvH2yO9XgUWMLGd9ocpXl/e6WWDrwsIHWokvl90va2Kykcjl+PIW/S3cc66RfjxtFO2i07tKkIIz8tMTcOoYg5UjS4nYBJ+4p8Qg5SphSAUoD7bSV8/sQhsN1iB5NSqEla4KyfIWTl97VX4TEz4JImNc2RIRO58h3JLFwGfOlMln8uMH5Jw1yCPGEpL7gmFosPylTiDsHMf8gAteK2mrbosO4Kc7i28kcjStPljrg4dhp7ikKMW5Lw07jY3hofk251gYhviu2DWc2lql1PhBXXMBA+5ynp/WNFJgC2T1AjxG4jolO6yhZsQTm86H4BkRlQTxV0wS57zce74JYGdjU9A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 131e6927-007f-46d8-80a8-08d86ad1841e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 14:58:56.8746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5zvBmKPauNZBv1wB4pVd56u4UZpoqI4tBm6xU1O37+Wktpg7yxA6VIh67FvqVk29BwHmtFNtaQU6PvQnN97+gItEZ/a+PjrwLHI/567KmZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2352
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEEgY29sbGVhZ3VlIHRvZGF5IGRpZCBzZWUgc29tZXRoaW5nIHRoYXQgc291bmRlZCB0byBt
ZSBsaWtlIGl0IG1heSBiZQ0KPiA+IGZpeGVkIGJ5IHRoaXMgcGF0Y2guIEl0IHdhcyBhIG5hdGl2
ZSB0b29sIHRoYXQgc2hvdWxkIGhhdmUgYmVlbg0KPiA+IGF2YWlsYWJsZSBkdXJpbmcgYSBkb19j
b25maWd1cmUgdGhhdCB3YXNuJ3QuIFdlIGRpZG4ndCB0YWtlIHRoZSB0aW1lDQo+ID4gdG8gZGln
IGludG8gaXQgdGhvdWdoIC0gaXQgd2FzIHJlc29sdmVkIHdpdGggYSAtYyBjbGVhbnNzdGF0ZSBv
ZiB0aGUNCj4gPiAtbmF0aXZlIHJlY2lwZSBhbmQgdGhlIHRhcmdldCByZWNpcGUuDQo+IA0KPiBJ
IGtpbmQgb2Ygd2lzaCBwZW9wbGUgd291bGQgZGlnIGludG8gdGhlc2UgdGhpbmdzIGFzIGl0cyB0
aGUgb25seSByZWFsIHdheSB3ZSdsbA0KPiBnZXQgdGhlbSBmaXhlZC4gSWYgaXQgd2FzIHRoaXMg
aXNzdWUsIHJlbW92aW5nIHRoZSBwcmVwYXJlX3JlY2lwZV9zeXNyb290IHN0YW1wDQo+IHNob3Vs
ZCBoYXZlIHNvcnRlZCB0aGUgcHJvYmxlbS4NCj4gDQo+IFRoZSBpc3N1ZSBpcyB0aGVyZSBpbiB6
ZXVzIHNvIEkgZ3Vlc3Mgd2UgY291bGQgbmVlZCB0aGlzIGZpeCB0aGVyZS4NCj4gUXVlc3Rpb24g
aXMgd2hldGhlciBpdHMgd29ydGggYW55IG90aGVyIGluYWR2ZXJ0ZW50IGJyZWFrYWdlLg0KDQoN
CkknbGwgZGlnIGluIHRoZSBuZXh0IHRpbWUgaXQgaGFwcGVucyBhbmQgcmVwb3J0IGJhY2suDQoN
ClRoYW5rcywNCkNocmlzIA0K
