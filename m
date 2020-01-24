Return-Path: <chris.laplante@agilent.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8557FDA2
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:35:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EqZ2Kk/PkXDsz4OPmWQppcCG4EoFdcWZbkkXZY92GPDfavNkvNndhAY3HMOdh5jWinvHqv1QAKUseBoLXNvU+dsBm7jpatK9KJDxiEVLupOEAjkUrUhvLIZRthqboocNggbwDf1V+9u3vU3POJt5061TGYOfMaPtV7tPljqqEuZdHfFcXw4YHtYjwp9X2c3I8rCAi5uZ5yxVpIi7JTzHdMkxu0MmdO7ICVUGgZJR3DgjlDvVR6JpSOvfK6GpA47HBC/yhlMLSg7+SzD6nbugVv2mrTNsud9yE6pBC99NK1vsn3PgOPWyZVAiqYYxUnoSzkAEGDzOOXx3HG/w7qDW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KLTmL81zi/CRmGaCqGsWRh+z6PDY+6Wh/7gBpT5rylg=;
	b=AdSntEjzqQk1N4IFnEGTDw5bVYvGUvQg7M1vlSpN6oc4iNSFdQuTf7wf/qpNZ5QpTfjM6Jx916XW9famqi7LU2mGC2Hz11q9shmyJIcQLflFmfWaY92i8lwJMcU/xieTNazMCoBKtP0nWaxKzIHsnj53i42e58QWDm21TrOkTtul2drALLqTHNX5yZeV793jKuduOxtSXzRyG29PXLhgISggunluhq4mDjWueCTgJyCftRf/AlJtGf6n1EDM94tDNM9Z9IabXsgD+O91VGh6Z9DaFAAzVGfXgSFLcc6id41YuWMCZPoohsKxH+FMw6yO7XjYwrMPyRtbr7llFg7m1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KLTmL81zi/CRmGaCqGsWRh+z6PDY+6Wh/7gBpT5rylg=;
	b=UeKWVEbwhg/dGcPUO+xPLmg0Y78nKN3dqur/bP1eaoLUFCoLH/T7X1/I6cukanNgJpOY3wXatG/xV/IM5BXQdEdV/sSwMfee6R4dmBy7HjReCiRSwdNVMohRizKZUaqXYJ3u+c5OLx3yBnZ93lEXlvbL7oyU3mv/nUHt32vNH/Y=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1318.namprd12.prod.outlook.com (10.168.164.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.25; Fri, 24 Jan 2020 17:35:12 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2644.028;
	Fri, 24 Jan 2020 17:35:12 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
Thread-Index: AdXSu2r5qh8vRNvQSy2wYaWkj47c6wADCyQAAAB32eAAAZZQgAAAoB+gAAKHNIA=
Date: Fri, 24 Jan 2020 17:35:11 +0000
Message-ID: <CY4PR12MB1653131F7E8C472BFE0098F88B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB165355D4A69E257FD4AB30298B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<e2eb64a553a0b7bf89a942cdf9a1c177c5145aaf.camel@linuxfoundation.org>
	<CY4PR12MB1653D3CA9B953DF531F2FD7B8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<49070937ed7f0ea84d7a667abd88af4c3ae6b92b.camel@linuxfoundation.org>
	<CY4PR12MB1653FB5B97BA8B92042EE63D8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB1653FB5B97BA8B92042EE63D8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c09cec56-2358-44d6-5953-08d7a0f3c3ef
x-ms-traffictypediagnostic: CY4PR12MB1318:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1318D92C3E53894760E9FF888B0E0@CY4PR12MB1318.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(366004)(346002)(376002)(199004)(189003)(29502001)(64756008)(66476007)(66556008)(66446008)(86362001)(71200400001)(107886003)(2940100002)(4326008)(5660300002)(66946007)(2906002)(478600001)(110136005)(76116006)(316002)(8676002)(33656002)(52536014)(55016002)(4744005)(9686003)(8936002)(6506007)(186003)(26005)(7696005)(81156014)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1318;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xlzCGlB9vofJm9NkQofHSe7zGCquVZkTlJErFfEYqbaGBMUBnPQQwQpg3SKqznJ4+mX6gX5zfnjjyTy5oZHcXyjxg7p1RH0tfMvV7ZOvyqHauOW7bOr7FOV1nsU9kK1nh3K2+PS0cu3cGZQvZgM7ui+GT4IH4NxEY48qAHSqd0UGw46HEJr4U8kTz+FhG0YtbbaKRUMplKt3Gp9xrqDo7758H5HKZRIfkwpQbY2mOGMQQRplW229lSttC+o351rNSaX0E5r+PKpXb9uTNuQeQ0DbfnEkdJUC9RKDvMFoPFVb9xuwn6fKnH1KBWPc4OMqHnxas5q7xJ0bubk7B87S1Ndj3gmpF1EkOec3sNTDr5xG3grJNyZyavVJURs4bR7S8yVvisOt3pFmUplFwlatN9llNqg852cf+z4Kwstqy3XC1+uqV3NV8GcIAJ0WX8MvL6nxsQVHTwbzxoOK8n+CGXCvlu8QyVXZqt51IOOGoTMe+MALFZkFA58AjFQjJv2g
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09cec56-2358-44d6-5953-08d7a0f3c3ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 17:35:11.9885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqMC1iZqjo6c5ABeUBtHImbwVdXJobbMOKOE/idFFSbssWz6hfUJalfWA+7u6fIsnEX2CGKZmFNriFGT/Ez7W1mmfnF5qFg8lWHNpCKuRoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1318
Cc: "dave_clouser@agilent.com" <dave_clouser@agilent.com>
Subject: Re: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
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
X-List-Received-Date: Fri, 24 Jan 2020 17:35:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBIbW0sIHJlbW92aW5nIHRoZSBzdGFtcC1leHRyYS1pbmZvIGxpbmVzIGxlYXZlcyBtZSB3aXRo
IGVycm9ycyBsaWtlIHRoZXNlOg0KPiANCj4gRVJST1I6IG1jOm1jLW5hbWU6bGlicmFyeS1lbXNj
cmlwdGVuLTEuMCtnaXRBVVRPSU5DK2FiNmQzMGMxMGMtcjAgZG9fcGFja2FnZWRhdGFfc2V0c2Nl
bmU6IFRoZSByZWNpcGUgbGlicmFyeS1lbXNjcmlwdGVuIGlzDQo+IHRyeWluZyB0byBpbnN0YWxs
IGZpbGVzIGludG8gYSBzaGFyZWQgYXJlYSB3aGVuIHRob3NlIGZpbGVzIGFscmVhZHkgZXhpc3Qu
IFRob3NlIGZpbGVzIGFuZCB0aGVpciBtYW5pZmVzdCBsb2NhdGlvbiBhcmU6DQo+ICAgL2hvbWUv
bGFwbGFudGUveW9jdG8vYnVpbGQvdG1wLW1jLW1jLW5hbWUvcGtnZGF0YS9tYWNoL2xpYnJhcnkt
ZW1zY3JpcHRlbg0KPiAgICAgKG1hdGNoZWQgaW4gbWFuaWZlc3QtY29ydGV4YTl0MmhmLW5lb24t
bGlicmFyeS1lbXNjcmlwdGVuLnBhY2thZ2VkYXRhKQ0KPiAgIC9ob21lL2xhcGxhbnRlL3lvY3Rv
L2J1aWxkL3RtcC1tYy1tYy1uYW1lL3BrZ2RhdGEvbWFjaC9ydW50aW1lL2xpYnJhcnktZW1zY3Jp
cHRlbi1zdGF0aWNkZXYNCj4gICAgIChtYXRjaGVkIGluIG1hbmlmZXN0LWNvcnRleGE5dDJoZi1u
ZW9uLWxpYnJhcnktZW1zY3JpcHRlbi5wYWNrYWdlZGF0YSkNCj4gICAvaG9tZS9sYXBsYW50ZS95
b2N0by9idWlsZC90bXAtbWMtbWMtbmFtZS9wa2dkYXRhL21hY2gvcnVudGltZS9saWJyYXJ5LWVt
c2NyaXB0ZW4tZGV2DQo+ICAgICAobWF0Y2hlZCBpbiBtYW5pZmVzdC1jb3J0ZXhhOXQyaGYtbmVv
bi1saWJyYXJ5LWVtc2NyaXB0ZW4ucGFja2FnZWRhdGEpDQo+IC4uLg0KPiANCg0KDQpBY3R1YWxs
eSBuZXZlciBtaW5kLCBJIGhhZCBkZWxldGVkIGp1c3QgdG1wIGFuZCByZXRyaWVkLCBidXQgSSBo
YWQgZm9yZ290dGVuIHRvIGRlbGV0ZSB0aGUgdG1wLW1jLSogZGlyZWN0b3JpZXMuIERlbGV0aW5n
IGFsbCBvZiB0aGVtIGFuZCByZXRyeWluZyB3b3JrZWQuIA0KDQpUaGFua3MgYWdhaW4uDQpDaHJp
cyANCg0K

