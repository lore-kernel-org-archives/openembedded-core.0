Return-Path: <adrian.freihofer@siemens.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140079.outbound.protection.outlook.com [40.107.14.79])
	by mail.openembedded.org (Postfix) with ESMTP id 5A32160EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 08:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ep8MSia51mVS7dSoLK2Bdo2B0+SGWzpvmxkJPA3iHQP6a926K21vhPLGNWXIFpBk2gvxFkcUSqGz3YRUaPFkwogYYiI52Nf9Y/tFrClgi+eimD36hnqB9rEJoq7ML/u32fabDEDWpJAZdHmv9yWQ1prck+0yEJb1YJahUG/WbSzykfhpLiny+KvCu/3ZAD599uT6dDbVLaUqu8Z0Et6fjG2Iyo/wedH5NSjn3OinwCgiqphL3BgnPBRSnby96q1+kb/whktJH8BnbE/k7eXgkimhiSdwknaZjSARZVfef+lD5ezUXN4VfNDEGYUu0eXbzUQ3i+mprObr5nffhgb+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jEmXIZfTxb8nD904xJetLm29tdL/NjUzf8bCmP/u3IE=;
	b=I6w732n/npG2+9DI9nRjDiWlGa4ZhtQDOhNuSZ4MGYQEYXo9k03vbe0NbHIOA/43ZNF29/hfip0Qp/T/5bSbMqAein6SvPsGKxukOZMsvF9xhQzqkzSscYEWLVd/c/2/KaDp5x989o4vVK9aDIyjhXemsFIHSov7PeAUW3bRuBs+nXWmY6ZqExV6CU/+mmCrI9CgLlgge53wen3C403cVpdCJ1nZZNyfagDa8noyQenoDqBz2i71ItsGb7Fbl2sawEmKEOauEqM4F6Ingm30GeHMvqWDMc4x5wByqk2+NGc0K5QXCn3YxnQlnlbcY2X3+vxgIz0lGzcW5+bXPf7+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=siemens.com;
	dmarc=pass action=none header.from=siemens.com; 
	dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jEmXIZfTxb8nD904xJetLm29tdL/NjUzf8bCmP/u3IE=;
	b=FOt+qoiS3aXa6FZ/FXe8xuURmDAjBH94AF7WBeksfWjq9YQztCnNOamX63z73MqICQuzZX2NRIvgbfjF57VMkC30CJW04Y+Ff3M+ueW/UojjWUjjf2DhzUtWYKi5BX4FT+/pYCv19GoOj54ZWr1svVh2a+TH2uy43XnKF9hWST4=
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM (20.180.104.80) by
	PR3PR10MB3931.EURPRD10.PROD.OUTLOOK.COM (20.180.104.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.15; Wed, 4 Mar 2020 08:12:27 +0000
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311]) by PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311%5]) with mapi id 15.20.2772.019;
	Wed, 4 Mar 2020 08:12:27 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] bitbake: gitsm: download submodules
Thread-Index: AQHV8fyk0udwZ4WybUKJKtP9t84IPw==
Date: Wed, 4 Mar 2020 08:12:27 +0000
Message-ID: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=adrian.freihofer@siemens.com; 
x-originating-ip: [165.225.72.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f3ca91b4-d66e-4100-ffc9-08d7c013c70f
x-ms-traffictypediagnostic: PR3PR10MB3931:
x-microsoft-antispam-prvs: <PR3PR10MB3931F518F0ADB9517394AEF88EE50@PR3PR10MB3931.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:473;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(199004)(189003)(6512007)(5660300002)(66946007)(81156014)(36756003)(64756008)(81166006)(66446008)(2616005)(8676002)(8936002)(66556008)(186003)(86362001)(316002)(66476007)(4744005)(26005)(6916009)(55236004)(76116006)(6506007)(91956017)(478600001)(6486002)(2906002)(71200400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:PR3PR10MB3931;
	H:PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ppplKROYZa7nlypk68fXESvot5DtQKGjy1/E35hJcf/IpQ8n9JzCQlcqrW2W4/puz+7/SdF4mwx+dqL/0ashnYgUqL2k+o1DL5u4TT6ZrcKffaRu5ExjrUGCxHimaLa/kELpMM/dKWhAi4dLFvRTSWRaSdxI2CsnrgF78S6DEi/5NymB3qLFuxVZj3XoYPXviSqUdzDDzv4k9s0/vcGLn7nu8Tnvj1+wYYIDpW8DEgn29ysj0Wzse6f33um2K4QELvEz6afFVXlfj7YvTf3UeuKi4+eGt8SQaJLsL9sNA3aqo9coDRBxEvZ3fluUuX0Im6w7IJJ12pnnVXhfHocvWcfZyDHaSwg838DYlplxHamQWw6wGW2HI3wovH6znE4QVIIlPFsfxFLR6fz69ljETlW/bn7qstqAQx5ntheLgAUcEwTbnY5RUcnGQM/WAoI
x-ms-exchange-antispam-messagedata: eOOnScQ3L3sYxSI7fHRNKGhJSjz6wh9kYz/vxEqeTEUak3iEaww4N4/mW3p+7/oW0T53vKrDOaAeG7FZGKNIcUWXzC7g/gnXwLweq2aEgwwXORpmsQN/2jBPaFxMGciDayr/a99fb7TPyRZiqDBHvw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ca91b4-d66e-4100-ffc9-08d7c013c70f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 08:12:27.1740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /UowuzEl+isa74rIM9unTjNsMMLlLcqZRjRESXxC0TH6WRX33yaECcUlCeB5XGf6D0gWiiz7ByHTVXQKwrjhjw7rUzZ0NXWMOematdkhZEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3931
Subject: [PATCH] bitbake: gitsm: download submodules
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
X-List-Received-Date: Wed, 04 Mar 2020 08:12:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF53D13FCF37B24F8FD83C819369E478@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

VGhlIHVucGFjayBmdW5jdGlvbiBmYWlsZWQgYmVjYXVzZSB0aGUgc3VibW9kdWxlcyB3ZXJlIG5v
dCBkb3dubG9hZGVkLg0KQ2FsbGluZyBkb3dubG9hZCBiZWZvcmUgdW5wYWNrIGZvciBlYWNoIHN1
Ym1vZHVsZSBzb2x2ZXMgdGhpcyBpc3N1ZS4NCg0KU2lnbmVkLW9mZi1ieTogQWRyaWFuIEZyZWlo
b2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4NCi0tLQ0KIGJpdGJha2UvbGliL2Ji
L2ZldGNoMi9naXRzbS5weSB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
DQpkaWZmIC0tZ2l0IGEvYml0YmFrZS9saWIvYmIvZmV0Y2gyL2dpdHNtLnB5DQpiL2JpdGJha2Uv
bGliL2JiL2ZldGNoMi9naXRzbS5weQ0KaW5kZXggYzYyMjc3MWQyMS4uMzcxNWU5ODI0ZiAxMDA2
NDQNCi0tLSBhL2JpdGJha2UvbGliL2JiL2ZldGNoMi9naXRzbS5weQ0KKysrIGIvYml0YmFrZS9s
aWIvYmIvZmV0Y2gyL2dpdHNtLnB5DQpAQCAtMTg0LDYgKzE4NCw3IEBAIGNsYXNzIEdpdFNNKEdp
dCk6DQogDQogICAgICAgICAgICAgdHJ5Og0KICAgICAgICAgICAgICAgICBuZXdmZXRjaCA9IEZl
dGNoKFt1cmxdLCBkLCBjYWNoZT1GYWxzZSkNCisgICAgICAgICAgICAgICAgbmV3ZmV0Y2guZG93
bmxvYWQoKQ0KICAgICAgICAgICAgICAgICBuZXdmZXRjaC51bnBhY2socm9vdD1vcy5wYXRoLmRp
cm5hbWUob3MucGF0aC5qb2luKHJlcG8NCl9jb25mLCAnbW9kdWxlcycsIG1vZHVsZSkpKQ0KICAg
ICAgICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZToNCiAgICAgICAgICAgICAgICAgbG9nZ2Vy
LmVycm9yKCdnaXRzbTogc3VibW9kdWxlIHVucGFjayBmYWlsZWQ6ICVzICVzJyAlDQoodHlwZShl
KS5fX25hbWVfXywgc3RyKGUpKSkNCg==

