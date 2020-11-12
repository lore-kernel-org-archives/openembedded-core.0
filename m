Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web12.11729.1605217568232259884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 13:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=okUf+dNm;
 spf=pass (domain: nxp.com, ip: 40.107.8.40, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VC5Z274d8pAMM9U8Yw5TXbrteJyf9L5zPuI339tleHafPmyLKf/uyxcMQLm9cQwj+OYqgPonGHn7JttwVfVBajNfZyRNO/wMlwPoUiYNr9u40a4FmZYdRXXw0EfFP1toQqL7dQ0g9RIEOO68qX77TDnZb02xuo7d9j5SYpvHaHAiJoV/7eauJ6bLHHmAupv3SFBh2humCzY3aimNPXjKzd2Dcdwi5VYLevKqFdXXR8Onco7CdGYFE+L4KdTYayA8ROIcPCFan+Jsjak/ZsJAr8SR/k4EIytMM3rnOgj1R5WUuS2tXIZXj+8ghMe0nHf8aO6+W7h8RlouyTqdd+Xp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg5wtjM+tP4cIHGLGdvs0xhWktfVavsS9LvNECmf8oA=;
 b=ELTLkWy9H4V3JqdQ049vGEFJ9/8swmh6INJu79Cmtnz/wyThRhYqnXy8rehsnxHk/+Y8cpN3Vw0PjjhBYOaCD5ifW07flvZra2rMvXT4sBcgBnHnjIzG35xm/S/gL8YdbpGvqLmVuDFNzRHtU2bUl60rki/EBBYIKH3ZWPWYkSWIppd8P46N4oab77zgFvmo2S3Qsu6v9/P4f7oQlOiYYk4UUleXfnxCm7EPTOUXjzSJUmX5Ou0dtuENiJtsTYz8eXBMDGlZgLsr6kuQ+gELqOiAW+4Xe10yxIlKvux2XQpVA/emytrYqKBYb2ATVjLagpMx62Ec8g3nkco43D8LVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg5wtjM+tP4cIHGLGdvs0xhWktfVavsS9LvNECmf8oA=;
 b=okUf+dNmwXbb38KocTcXnCIrJsY7Kac1E4W1IggMqzL+rC1eLHfZBDS87I32GPsyB1rjrY3IrE/0hX99/Mn/bQm2uA2Hap1bZShu6MSaMVYiZzkqU6YRwDuDIBHok1lFvgvUs6gWqseE8O6/zMEqr9R0MDDq4zsqo3Y7qp2MMhI=
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (2603:10a6:803:124::21)
 by VI1PR0402MB3453.eurprd04.prod.outlook.com (2603:10a6:803:6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 21:46:05 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::7dd5:534a:a183:dc71]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::7dd5:534a:a183:dc71%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 21:46:05 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa: Add xcb-fixes to loader when using x11 and dri3
Thread-Topic: [OE-core] [PATCH] mesa: Add xcb-fixes to loader when using x11
 and dri3
Thread-Index: AQHWs7OtRmXTO0U1LUmC9/m2DFGJ5qnFDIKAgAAF2vA=
Date: Thu, 12 Nov 2020 21:46:05 +0000
Message-ID: 
 <VE1PR04MB66218F050F87B8091197D2EEE2E70@VE1PR04MB6621.eurprd04.prod.outlook.com>
References: <20201105203820.19558-1-tom.hochstein@nxp.com>
 <CAHtQpK5zznC3PsgUey+pL0sn+WoYuhgng4-uhWg+RYT20_QYKw@mail.gmail.com>
In-Reply-To: 
 <CAHtQpK5zznC3PsgUey+pL0sn+WoYuhgng4-uhWg+RYT20_QYKw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [24.28.102.84]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7d0527b5-b721-4d15-2330-08d887545bb8
x-ms-traffictypediagnostic: VI1PR0402MB3453:
x-microsoft-antispam-prvs: 
 <VI1PR0402MB34538620ECF3AD37E02B7419E2E70@VI1PR0402MB3453.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5CGMcyP+WIW8r2akSeqGWwM6QONhOQYhKIFcRUJt76B+H/1W6QUmd9Y9XuggQgeKj37u5F69OmbtF3UMpaEKyzqSzJlK13MAAeVXGOF5kz6+6J6EaUftlpCbl/mTT47NziiF4+KQQF3hGa5OfrNNbhRRCeA+aKVOFjRqEkXoNpeB+mS2sziScdnf3T5ulV9Z7f+sESWDA+nCKCRjjnqRqYTzLockS3f/Bfw3nuBryZYuLQTzzYy9KJuP/GMIu55qbVIDDU/+8oc9OZUC638ntUptSazBGcctsstPUZHAPsrk5a06DrrxyH3twe0BxHYbUhJaUjbGi/Uc7RqQ+urC7Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(55016002)(83380400001)(66946007)(316002)(7696005)(6916009)(6506007)(64756008)(4744005)(66476007)(76116006)(52536014)(4326008)(5660300002)(2906002)(8676002)(478600001)(9686003)(86362001)(33656002)(8936002)(26005)(66556008)(44832011)(186003)(71200400001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 so+gnmbBXPVZ2J7PX/slBIoMQVD1nCaS45Yo07MMv54OOQ56HP2Y+TnpCpdIRf6D4cki1nZzII2zRIZ8DuIDBPpl23EOCbGDZiWlnZWS4ilWbn8vX0u93VkUdjuSCkoo1muY2/Wy3RcRmhlUqFNaoSJzIJ9fwrNAQYHxHXbJBF08cvsWVNZHES4oKzwl3wA7oMJ6RWUT4ec322IkdvnefK30m4AptH62xHQtqzjzy0iDQznsAtM/cunsMH4mDEYlMZjmqrKCFaGYWJk24S7nrr1ugtwvR67+1LlwBCS2hodSH/UqraJg9sDiFuyDPZaDK22oXg0sk3C94bcu+j6BcyN+VZJBa3FsGaji0EpXjXWiCllW+YNCedemtn3MaOo0bWgXlOkcKBnngrqtx9uKF9a4Qvjtabu+jw+mKC9a/kqCC/ZnYC0FCkKAzHntk8oEg2CQqluUWxCeqI0Nc1G07s+QKm+V+Flculbq7jIDeMwsPhTsvGdw1a59CUEx8lLkuBTMr7LSkOrat5fPTtNkrF4XYw0wT37DfXoF8w3r004EwYTSY3iBWa1mnJHoLqynkLkhwxT0i21IBwi6dWBXhWwCi/uH/NMRKv7BFgs8O8RIGd5p+kUiZwD4wVb0XTyKPzRSdA2FlfEvZ8ouUZm31g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0527b5-b721-4d15-2330-08d887545bb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 21:46:05.7922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0qIldPfOJdavKuKPKxtVNudVEVAKDw1wH6TwO5WJ6BuEEHHe0tjNkVuo7KikQWZaOHfuJsIVz2dWaLJhwcq5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3453
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXkgWmhpemhpa2luIDxh
bmRyZXkuekBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxMiwgMjAyMCAz
OjIzIFBNDQo+IA0KPiBJIGJlbGlldmUgYWxsIHBhdGNoIGZpbGVzIGFyZSBsb2NhdGVkIGluIGBm
aWxlc2AgZm9sZGVyLCB3aGlsZSB0aGlzDQo+IHBhdGNoIHRyaWVzIHRvIHB1dCBpdCBpbnRvIGBt
ZXNhYCBmb2xkZXIgd2hpY2ggZG9lcyBub3QgZXhpc3QgeWV0PyBJcw0KPiBpdCBpbnRlbmRlZCBo
ZXJlPw0KPiANCg0KSXQgd2FzIGEgbWlzdGFrZSwgdGhhbmtzIGZvciBjYXRjaGluZyBpdC4gVjIg
c3VibWl0dGVkLg0KDQpUb20NCg==
