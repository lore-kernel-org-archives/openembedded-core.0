Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.59])
 by mx.groups.io with SMTP id smtpd.web11.49441.1606204877283217094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 00:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=W5nlAVpC;
 spf=pass (domain: siemens.com, ip: 40.107.5.59, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xth24vpkYIPLbbPmf7GdaPbsOg/cZY+dfp49dD0gC4ONUhXGOmwA/8uOQmk/k+LrLusQWhu0NiKc+m4b+yBYf+T3qAGYIYMZ3MMBxdnDVX1XB6yGAhTP7psjBpjjDmkl9UVj8riuroEAgaSrwZgnucDiXqT4SGxebV2Q/5lTYX/C0/fTu7gpZwVkzOfEeYDySeyuD7wDJsT5SuJqXTiX5guC3Gu9QADIZk1jol7IIKEWYoOel/g7IwG2L4VWuGtZdaHe0fyW8PPBRwzr+8Mv5JCciXCZKOG7hAXDiBo2K2XUKeLD47RqJN5jBMiShutI6/O3ESQHZERkBpzhfX8rcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTS8Hi7daBj2RJx13TavcxpCbkoAmwT5gExO5IpPxUg=;
 b=LF8Z7OoERkw5rkD97AuskFqjZA60WfZ86i/ROeTgfefxwljPJBJFvsbpSUG66wpXyC8oUN02vkVumCn2qNlhLzA7C4jVglkg3u3P0kEETfxx0wX6VjJ7vKsSxsgOjaReKWEOhCNkJ8FUAQB3yYhwQ4JqV1qWBCn7/8zmzrdLBZyqhdFXiQivUlgUxkzf8mJcCPSqk0PFUL3ZVADSY6MUNzJN7cwtEqzVTYI6w/A6bvS2by1mhAbqYWxwl/u4EqWzyYZ5RVN8uYhwYJz1dhijkIG1NEpoHQuJLFy1Xi7Qd0XkFYcOuve9f+1YRspqzfwNAi4YG/FVU7J2AEdsKu4lOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTS8Hi7daBj2RJx13TavcxpCbkoAmwT5gExO5IpPxUg=;
 b=W5nlAVpCA5rzatH2KXtHpKzYfYYuYQxdBetUHjeOPYCMg3FAXT+LKdUACB7wI+LSNEf7uEVpfP2Q64rHMX7AUI+HHELmedLaLF2OU4tUmDPiF8prsfBhJom5NkQAR4ksYFiyYxi90gPtxUzKaCMG71myl6R2Djiorsu4Qnc3YQc=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB7PR10MB2473.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 08:01:13 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb%3]) with mapi id 15.20.3589.025; Tue, 24 Nov 2020
 08:01:13 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Bach, Pascal" <pascal.bach@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into common part
Thread-Topic: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into
 common part
Thread-Index: AQHWwc1DofT9NPccPEqgzUZHxvddV6nW6rCw
Date: Tue, 24 Nov 2020 08:01:12 +0000
Message-ID: 
 <DB8PR10MB3977CFDFC71C9D64380189E192FB0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201122124853.30262-1-andrej.valek@siemens.com>
	 <20201123190029.13811-1-andrej.valek@siemens.com>
 <96f00422db0f45f642f33828d7cb21e85db81ab6.camel@linuxfoundation.org>
In-Reply-To: 
 <96f00422db0f45f642f33828d7cb21e85db81ab6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-24T08:01:11Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=a97fb57e-386a-4123-9e9e-997acdedb15f;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 02f4f40c-268f-4f2b-c344-08d8904f1cb5
x-ms-traffictypediagnostic: DB7PR10MB2473:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DB7PR10MB247340641EECB889CEDA76CA92FB0@DB7PR10MB2473.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KGbNF6AWzWmAowU/blnfaEVVmLpsmX6/vHXu3YV//9NoNdnw+wiXXywKMI2ur3J20hPOcxuwl/+Ki+itHo1M9K5Xs+SXtDXO6iQDvcPaOQew4cUNM4Duou4CdgRDNLh7NptcQ24H0fL1SoP8rRlYXvq3FgWlzBN5Bf1bebGj0HNPjGXDlKH3eAZm1YUgueMLbvy1cnXK0Zl9+zN3arEdVM+NY5k4dDBFj+xbR3d08kVf9fkbGfs6gfS1dzzHEEzCLwcoeACRDeUGxuRph5H8ApdZPs8lkvbHll6MKzRx9/CM8gp6nZiqPYF/CCHW/jAJ8EGfJskEY96Qv5j9ItRb5ZDES/qflzCen3fAjFXQWEqdqFa8UvOuIHOh5Mn/+YpqCZD+Xjg4GiMpCJm950A/oA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(4326008)(55236004)(478600001)(4001150100001)(107886003)(71200400001)(26005)(5660300002)(83380400001)(2906002)(8936002)(33656002)(6506007)(316002)(7696005)(55016002)(9686003)(8676002)(110136005)(54906003)(76116006)(64756008)(66556008)(66446008)(66946007)(66476007)(966005)(86362001)(186003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 bUHzdA7l9z1L5qyAZoWuy6SNHrcvDU+PE9ev9hLIFTClLKVG5l1vT7v1rxxF9MekDaTULW48OXlLvnGMp1GYEXrgvT/wlStaM4/+DBCHajjmVnQH/QEHkkS7pZ1jkcfOG76UbrJqiC6ttV/WyiGBCpMhY6SXmvRbSLaRDu1w7e928CQ9oCO7xGYFrUuSdMthisxuueIAQ3bObhWxpqg0+tTLa7mYFmpmAOupxkF/CNFSOsKs0jTLaCzqygf8XmVpSxaODLgaq3T1XgKtj2fc6LUtMbWIgpo1FExJh8fIpZzn2o1Ngj5A8yj3lcq5X0TNIAh0OVNyT+oGrCmQA+t7Pa8NH4jonNy4bhVkPxRZleuhLSt/DQQuT1rNGXqDQUZwQdzckOlN/33MSCMvNP8xsPO+QcxbP8I6KGt2QNfokS/AkyCqiMK+cILYDazNFgMYJUUtMjygKHl/UsU/r/sMmNiiii3WFaOhigm2Y0/3Wz7X5CfkkFhyoiI6bBrP8IHPmqup+E3TXf2JBm/OJ+5DhDJnGkw7ybGlJ/9xUYGXlsJuHv1nb6+H2ruqNotmvcvrIDry75LiuQEjWGga2Xd+tHIZOwl22o2EE/INqlcb8ZKgGFhWzaDVeMETE8kHPZ1amdNtlsCwTkb8DcMTtuSrIWsBaib5K6IzzeW747C5qOOYtZvjkgkqCFsJO1FpN4/6/c1SZMe6z7hAfBnghUQULByH9WXtTFnqsFiqfxolsawvMpou1RJCdRkU8H+SLrw+3KlKg+xHdUqEnaKfu3T+/UyUKskDcSVNsZQlfynEvzqM0Cxu0CEIs45XV6bomh7BlaP0ZS+1fizj9V4JgUmF6//R3sjnw9zXjzfP3Ih12jxfnHABxYT2AOSJgzdPkY1s/AJLfL/RiO0ZpIM/J/oK7g==
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f4f40c-268f-4f2b-c344-08d8904f1cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 08:01:12.9931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xtUg6OUQ6uCXh0XYuqsuerUvQgEKPLvz1bzw9GkMDE2K5/aT+lbyA91gcW0Qs7ab2IpuV6ciZALwensLLVm4ccXQ+fipbmjjbJ+aXvFnaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2473
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUmljaGFyZCwNCg0KSXMgaXQgcG9zc2libGUgdG8gcHJvdmlkZSBsb2cuZG9fY29uZmln
dXJlIGxvZz8gSSd2ZSB0cmllZCBpdCBvbiBxZW11eDg2LTY0IGFuZCBpdCB3b3JrcyB3aXRob3V0
IHByb2JsZW1zLiBUZXN0cyB3ZXJlIGJhc2VkIG9uIHBva3ktZ2xpYmMteDg2XzY0LWNvcmUtaW1h
Z2Utc2F0by1jb3JlMi02NC1xZW11eDg2LTY0LXRvb2xjaGFpbi1leHQtMy4yLnNoIC4NCg0KREVC
VUc6IFB5dGhvbiBmdW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QgZmluaXNoZWQNCkRFQlVH
OiBFeGVjdXRpbmcgc2hlbGwgZnVuY3Rpb24gZG9fY29uZmlndXJlDQotLSBUaGUgQyBjb21waWxl
ciBpZGVudGlmaWNhdGlvbiBpcyBHTlUgMTAuMi4wDQotLSBUaGUgQ1hYIGNvbXBpbGVyIGlkZW50
aWZpY2F0aW9uIGlzIEdOVSAxMC4yLjANCi4uLg0KLS0gQnVpbGQgZmlsZXMgaGF2ZSBiZWVuIHdy
aXR0ZW4gdG86IC9ob21lL3Byb2plY3RzL3lvY3RvL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC9jbWFrZS8zLjE4LjItcjAvYnVpbGQNCkRFQlVHOiBTaGVsbCBmdW5jdGlv
biBkb19jb25maWd1cmUgZmluaXNoZWQNCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9u
IGRvX3FhX2NvbmZpZ3VyZQ0KREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19xYV9jb25maWd1cmUg
ZmluaXNoZWQNCg0KUmVnYXJkcywNCkFuZHJlag0KDQo+IE9uIE1vbiwgMjAyMC0xMS0yMyBhdCAy
MDowMCArMDEwMCwgQW5kcmVqIFZhbGVrIHdyb3RlOg0KPj4gVGhpcyBvcHRpb24gYWxsb3dzIGNv
cnJlY3RseSBoYW5kbGUgdGhlIHJlbGVhc2UvZGVidWcgZmxhZ3Mgc2VwYXJhdGlvbiANCj4+IGlu
IHVwcGVyIHJlY2lwZSBsaWtlIGNtYWtlLiBBZG9wdCBTRUxFQ1RFRF9PUFRJTUlaQVRJT04gdXNh
Z2UgaW4gb3RoZXIgDQo+PiByZWNpcGVzLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWog
VmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFBhc2Nh
bCBCYWNoIDxwYXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFkcmlh
biBGcmVpaG9mZXIgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+DQo+PiAtLS0NCj4+ICBt
ZXRhL2NvbmYvYml0YmFrZS5jb25mICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyArKysr
LS0tDQo+PiAgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3NlY3VyaXR5X2ZsYWdzLmluYyAgICAg
ICB8IDggKysrKy0tLS0NCj4+ICBtZXRhL2NvbmYvbG9jYWwuY29uZi5zYW1wbGUuZXh0ZW5kZWQg
ICAgICAgICAgICAgIHwgMSArDQo+PiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kXzMuMTYuMS5iYiB8IDEgKw0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkNCj4NCj4gVGhpcywgb3IgdGhlIGNtYWtlIGNoYW5nZSB0aGF0
IGZvbGxvd3Mgc2VlbWVkIHRvIGNhdXNlOg0KPg0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3Rv
cHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzQwL2J1aWxkcy8yNzM4DQo+IGh0dHBzOi8v
YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNTIvYnVpbGRz
LzI3MTgNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9i
dWlsZGVycy8xMDgvYnVpbGRzLzExMjkNCj4NCj4gYW5kIG1heWJlDQo+DQo+IGh0dHBzOi8vYXV0
b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvMTAwL2J1aWxkcy85
NTYNCj4NCj4gQ2hlZXJzLA0KPg0KPiBSaWNoYXJkDQo=
