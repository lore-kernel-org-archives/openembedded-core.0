Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web10.3770.1588666401161195658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 01:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=D6antpNs;
 spf=pass (domain: siemens.com, ip: 40.107.22.74, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeV4ezlej2xRIMiXfRKlGExiyfA32s0Wxsr4yVMsb6QvAYvhOL/35iIvWAvnOn1VlNXYKHneDW0YfzwD//QCjqUGpk1uspgDlxdJEHcd1Scjj6XWYlRvMdVUjDljSR257Nr+yCofkcC/6dWW1RJnN+h+2sOJJpgezb6uYJ6unsorRJaqq/0sEAOdwM735jw9LmX7yRtWHAq4T+sCMoAOPvXFI5HGRMRH1wnsnNMKETvINjgeqDjvhPwY9mpeatmnzdpg0SJZUT9OGiWdgYLcREuc1PDaD9B3bfQmFXDfGyvtomTqX3fiNuKR7JZkxE3oW3NRRO2HCK6S+MdfBKgLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YbIYvLaYOqpsQKhtvWH4pOhhf9/71G6KR0mVmDjmDo=;
 b=Do6xonvoaqzgYz3zITsf090GpJzctOE2DUmjGtNpy0cUvhCLV30wFvFP74NaeZK7fEsGa4HJjsYwfRPG3pEEtk3hskomY7hG0rGM4qmMmZi972K2WkhoCEft9L8b0ZLy+kU7dkUGWfc7HxeCK9aEf4GgpL045EUSeWQhYx6B66cb51t7jgMfCBqJTL0A229NMh5CIa6+eRoFwhmWHWcnM1tDZYd19y+8jOS3eEMSWti4T0qw4Ci7GuclexdInEpoNpKZgfuKgU9w2IUGyLOghcN3fLUL7EiWH7I5Hz7x6ZJ1dBmdWwUy2qBJgxX8SyU/kHaffab+kawRa+15+LFH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YbIYvLaYOqpsQKhtvWH4pOhhf9/71G6KR0mVmDjmDo=;
 b=D6antpNsPKNldGCYNhEtPeABFTGlcgZWrNM8/ID9a67/yBxCVgM/YdNgjMA1P2Sq+ZSifGZBzVnqNn8KDv8H1KvAYVelqkw/UjAswghXX9I0MzXArFkA/Yac0WmOW6y6vbyZPOrZXSiNUorh0qnWzw04WBovLjn9waknuSM5pZI=
Received: from AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e6::28)
 by AM6PR10MB2696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Tue, 5 May
 2020 08:13:18 +0000
Received: from AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::808a:ad03:40a9:baec]) by AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::808a:ad03:40a9:baec%6]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 08:13:18 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
Thread-Topic: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
Thread-Index: 
 AQHWH5JNIZU6aOc5VUeHm/83tk0OiKiTPWRQgAAEBwCAADCeMIAAWw+AgAFBVRCABBeBkIAABHEAgAAAMxA=
Date: Tue, 5 May 2020 08:13:18 +0000
Message-ID: 
 <AM6PR10MB3000B53772612F2BF2E835DB92A70@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
References: <20200501082616.11296-1-andrej.valek@siemens.com>
	 <AM6PR10MB3000A0A64DB428E5ED6F33D292AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <CANNYZj-0k=gL0K6b5r5U4SJpRo-cnUNO7zymt4J43uzapH6JKA@mail.gmail.com>
	 <AM6PR10MB3000922C3F644E6916BDE3C092AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <CANNYZj8OcGr5911zfRXpKaEYY-3o_WJCoLZoybE+=863==L2tw@mail.gmail.com>
	 <AM6PR10MB3000E49EE4C38CFA9947DDA492A80@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <AM6PR10MB30002791F30A5942D6CB496592A70@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
 <abf15032d9b14a18031f0c017ab422365d386930.camel@linuxfoundation.org>
In-Reply-To: 
 <abf15032d9b14a18031f0c017ab422365d386930.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c38bfdde-d975-43d4-f2e7-08d7f0cc2b6e
x-ms-traffictypediagnostic: AM6PR10MB2696:
x-microsoft-antispam-prvs: 
 <AM6PR10MB269675C0071AB5EFE46F159B92A70@AM6PR10MB2696.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nHmp1XIaBXr1KqFZEBCgC+lIwM9di++uh4EUd8OlBy+QX743fjY3bkNz1U3rwSpz9FeWmHks6RWe1XMFfZlTv32Zqkr9l2PK4bwIx/zLg16kvGCld8SHF+YFTMXgMHJoXWSX0yH50/EvEKTl/IeG5Yi242K/gttvHce61Y6Jc+Zo5i8Ii6vRq+sg7ZlEKn4gQ31e3l4WlBt61WzeRmwhRj0SmRksX26j4GBlm4SVzn7eXQNogn/V/8k81fdFwzlwZlcU3MsQ7OI2kJ/K2c7OgKLpfzsddWWiQdNcqpIrTGD3Se1ZNIG7qvJKvnELMEIExCARq3yy9bqPFX7iVx09zSR6DrFv+YifrwxHWOBuUd6n5+rY39NIUoZdERqDHdN1yWalfE0u5N20eQXCGBfydIrR3yCbbK8na0KBZBNTKApgRwW4iMS5x2BjpSkyClCBfJ1qDdrRANGM6BZ8sn43ZMRw6JAb6QYs0l1NJpt3RU3ZOk36EEdEVB6TQBd0T9qcy4NdupsK45Wb86soQMwSFw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(33430700001)(86362001)(52536014)(55016002)(33656002)(6506007)(478600001)(2906002)(4326008)(9686003)(316002)(66556008)(66476007)(8676002)(66446008)(64756008)(8936002)(66946007)(4744005)(76116006)(55236004)(71200400001)(5660300002)(186003)(53546011)(110136005)(26005)(7696005)(33440700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 xlvtJVndghwFa238MoLwMTxcPqqMdi2EB1BtCjhr9lbW0HZA6uUpS6fXRFounxEaFazR1MwVrTJrce7qrDEY1RsbetAi0fr27pdplRNHe8EABWAwpZZla/4oWAdDNxQIrV3AhSCnkH6iljxurofwx8gy9BJ6gh6kCCTv/sw+fuNwDX7Jv15ijs1F+q07pe+MjfiKw6e8SfCWO4iqwF7eL4oVbNewxlRqTSJy+wPoTK3KQRze+H9MJ/CEDhn8EHDBsFTMzAdHIHRzRwGASy9kqxpFIKYARtf9DH72r/iFLshvgIOJySq7od47nvZSM+FU+wkcZSJSLS2PNYm++6jbhJIOG7TUlc3IL2BpMoaiZq7Rk2qZEwrAwfKA5k337X5/32dTSxxZ+fNPy9KS//YrQzPgE/rt1yyJwlnXwBaBWfTy4RUWKp2Fuw4hpmQEyM3SCwVH/t4SKsbNIN7pIe5cTMmNMkihd9P8Z5mFy0ZHLhg85JFrVlX8EPMiADMycdTOsKThpyMYS0JfFf/F6G528xr2nPARDFrtDnP/Nu5/FTR+wTANVOaBUiB/BGLBicwGVTiSqgAJzeDjs62cUi8b3wF7TD2OjOH5kSvBrzEAfwAs3nROY+hRSk1zXkcALCkzuLweTQ+eX8fZLkSC7nZuiwI4Lts54z3cEfoDkqZgYi+1L8eeShPzJjwPYx+//hyJFMAuB8D/ypiIlXepIKvLJte/D0ZirLFXfTWXwOCVtEfg9u1E55QuSkTyn2IbXGVHJjXfMOaeIIjVzZHl7u0ehnN2bJmGbgPH/KHnYhzQOw2Nrlcits+Mqu7NajcFPLBn
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38bfdde-d975-43d4-f2e7-08d7f0cc2b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 08:13:18.8230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Io0q+QkfCNCMNzFoWvTKz732QzgB+ObxVBj2oXAH2im7majbXVAZCVx3frlPE4LweOrwidQ0OsSp6ELwvbBG7i9toIxU9BzMb9Mw+Dh3zcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2696
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBrbm93LCB3aHkgdGhlIHBhdGNoIGlzIGZhaWxpbmcsIGJlY2F1c2Ugb2YgbWl4ZWQgbGluZSBl
bmRpbmdzLg0KDQpJIGhhdmUgYWxyZWFkeSBjcmVhdGVkIGEgUFIsIHdoZXJlIGFsbCBwYXRjaGVz
IGZpdCBhcyB3ZWxsLiBTbyB5b3UgY2FuIHRha2UgdGhlIHBhdGNoZXMgZnJvbSB0aGVyZSBpbnN0
ZWFkIG9mIG1haWxpbmcgbGlzdC4NCg0KUmVnYXJkcywNCkFuZHJlag0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+IA0KU2VudDogVHVlc2RheSwgTWF5IDUsIDIwMjAgMTA6MTEgQU0NClRv
OiBWYWxlaywgQW5kcmVqIChJT1QgRFMgRVUgU0sgU0ktQlAxKSA8YW5kcmVqLnZhbGVrQHNpZW1l
bnMuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KQ2M6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KU3ViamVjdDogUmU6IFtP
RS1jb3JlXVtQQVRDSF0gaWN1OiB1cGdyYWRlIDY2LjEgLT4gNjcuMQ0KDQpPbiBUdWUsIDIwMjAt
MDUtMDUgYXQgMDc6NTYgKzAwMDAsIFZhbGVrLCBBbmRyZWogd3JvdGU6DQo+IEhlbGxvIFJpY2hh
cmQsDQo+ICANCj4gQ291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBvbiBpdD8NCg0KSSB3aWxs
LiBLZWVwIGluIG1pbmQgdGhhdCBJJ3ZlIG11bHRpcGxlIHBlb3BsZSBhc2tpbmcgbWUgdG8gaGVs
cCB1bmRlcnN0YW5kIHdoeSB0aGVpciBwYXRjaGVzIGZhaWwgaW4gdGVzdGluZyBhbmQgSSBjYW4g
b25seSBkZWFsIHdpdGggc28gbWFueSBhdCBvbmNlLiBBcyBzb29uIGFzIHNvbWV0aGluZyBuZWVk
cyBleHRyYSB3b3JrIGxpa2UgdGhpcyBkb2VzLCBpdCBtYWtlcyBpdCBoYXJkZXIgdG8gZ2V0IGFy
b3VuZCB0by4NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg0KDQo=
