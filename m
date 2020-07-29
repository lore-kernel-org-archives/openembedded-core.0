Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.81])
 by mx.groups.io with SMTP id smtpd.web12.7057.1596032997529613103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 07:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=rqBZ5PXL;
 spf=pass (domain: agilent.com, ip: 40.107.236.81, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbEuoNP6y900aNc7TmgTtk2cbUgTIUTNWjIC88Uulhkct0ONdkTCn5xWJyLswhYpaLr+mBiNpU9rjE5cX93FkNFRbNNXk7C8CIKtSKfDV/w0mshYeqzKOwEWpuWQv0OAhpu4VRIs4fbuYa0DA+ORM/zyPbigc/ahYee/DHuZaAKffSoQSDsg0CcJz6hXAzuObJzgScQ/SER6/V9O712N85GR5JljyUsPArbVT9QnKo+gRZ64Dkla9pHLxKLlSF5sYI9LiWvU/7DKW6UG0Y/RoSHat1p8zfck1MCJf45g3wT/XBO1kiZQGPe/sjpeozKZ999SZwaknK/0ZpfGjMAJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE7E9xvCIVJKd+JHetsi9zBs9opFAqhAa1Z/tMpOTOU=;
 b=fuLZd8AHtUH/0BLAuE+y7DGpL2/WG6Gus/mYv9mwfJHlsvGOIMCtMNO9TPeBPW88wp8zMI5PD8RU58JN7KDXHS6wmCkYeCFFELhBuBOgKzavQgs0rYaJqrPDeN1fYx+lxxVW77/SD5jD8R3GmX4XmxJ6N27G5xTTZrI6VqOl74PcMOKpXwL2hpOHAUXC4cB3W2umLdZJ063SAcJ2os6YWhY570ruRhki4QUgiY7lr3m1X6UNCjKx9/2+sPzM2p2W6KxdEMZh7EuXfipRz11urJwWdBMRFuNIkP87+QJ0dq1fSUbOmY5QzBqxL0/5kDKfws9e/JxcUUg8vvQAz5XhnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE7E9xvCIVJKd+JHetsi9zBs9opFAqhAa1Z/tMpOTOU=;
 b=rqBZ5PXLtDW1M2Xv31qZrnz7Ht6FFvTcViCcAo0wqX2cIhEmZoR5N+O3iU/fvCb+IvpfWa8SfixJrn+97HlpDB7T4gjqn0L1kiyQWYgxhCbgCSWSUCfZUa8LZr+9yyQFjENG4lHuiabT+xPENsAtSIGVhRDswFw2jLlWXixfF1cjv+YZ3KtdYeadQG7CzIgae64H3Po6Trhb8xTOoNABVmuiWtK6hBkltxfFz+tdEficbfh9JECNHxj0adpTEFjnSP72M0opmGpVKTJgXPx4Wr/wfAbBTxDH+i1+YjfpWYZ/Aw9gZWo+dQHacYfQjv50doSkM8oSnZKmMX5Rk+dr2Q==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN1PR12MB2496.namprd12.prod.outlook.com (2603:10b6:802:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 14:29:56 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::4c4f:2633:b1bc:c164]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::4c4f:2633:b1bc:c164%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 14:29:56 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/3] Log colorizer
Thread-Topic: [OE-core] [meta-oe][PATCH 0/3] Log colorizer
Thread-Index: AQHWZH+X/5T0YEzquE+9VTefFwGSvakdJImAgAF7gVA=
Date: Wed, 29 Jul 2020 14:29:56 +0000
Message-ID: 
 <SN1PR12MB24800D1ED6AD906B5C79F7008B700@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200728013557.111830-1-chris.laplante@agilent.com>
 <edc83a1a101292425dce9dd1c9df51d6b8db8e7a.camel@linuxfoundation.org>
In-Reply-To: 
 <edc83a1a101292425dce9dd1c9df51d6b8db8e7a.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 746eb501-9484-4510-7cbe-08d833cbdda1
x-ms-traffictypediagnostic: SN1PR12MB2496:
x-microsoft-antispam-prvs: 
 <SN1PR12MB2496C7FD18B6594772EF19CF8B700@SN1PR12MB2496.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BDsgMFeFfjF4nRkvBCv/Q9TD50L233mU9EKJyAAz8DhpDs5vp3h7mZ00Kk50NxWpxpmIwGQJgyhoT80WIcNy4ekCk4c3T1rlzqdzRfeG5MtoXHfgp+h7FGEMITn0rj+fN1rn9yZ4xxUCF43hcnrmaTkbW1+e1oM6eyA4OMUuND82YHjApUy2gjQg3bE+Ss8miGiHpIAVeczDpulUM6e82/plud9wWoyPj1xdPxaj4mAWhLNiDPoyyUgnMnJQgJaPYRTFxTc9VRcuEB7c+XxN+HVr00evNTQMOo59A42OFzFm8ASTvRrGNCEq9O8UGpKyxZL4ukKgjHGTY5TDgIZtrFErRk6u/vnnFz/YEuywt0DJaCGJYbBiaD3dezxePFrs
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(29502001)(66946007)(64756008)(6506007)(316002)(66556008)(5660300002)(83380400001)(2906002)(66476007)(8676002)(33656002)(66446008)(76116006)(52536014)(71200400001)(4744005)(8936002)(110136005)(478600001)(26005)(7696005)(55016002)(86362001)(186003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 2DoCqwYFPj3JybCM5wSH4kn5/hooFvnwWeMxY+gW1rO9glMy7pSpklxT4wiI1bdwp+6YtDvocVQYVT6fuEGixSaHwwaMeHjhcvB8HjEUJP5/gNDlnAwveqUEHgLIMV1RVjTnCHmDEWVheaSM4VAiJatCMPNQ/rSW+eacoF9hKifGJo/aTVeJXvtWbK2ovDydFsHH4eb+sUqQ5tyP3pjHhID/fz2+jxMCYNWZ032cu7UvCJ95Xy19kadm1uS7C7A+sVZSFJzNawxc5Fs87vx0WB5aoKamTQ4U5bp0NzsIe2AoYRoh5wJUm9AftUGzYI3Ju0EBuuArNlq195CYSndhdkZ7JZipC64y/A4yc+PNTfSRTMeou156jVeR0QWBrnrGaqm+uFQ2RZ54CMCm8USgumid3Bq9+H115VJ7f7mzhAR2zl3yTRIBF1S0tWeascUEnsLLA9/u9MXmwZCSlrIinawir7BisU6jBhnMyXfNyqk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746eb501-9484-4510-7cbe-08d833cbdda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 14:29:56.1321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lPydshaKjzEQ6Xc8igxL3rM1GESrZPMtrhheOvoWSe/PmDQeqp6XvisJJLS7Xk6aRFvLAQXkhrj5sGBdLgi2i5Tj9oNAPw4ynfdnKa5GiGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2496
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiBZb3UgY2FuIHJ1biB0aGVzZSB0ZXN0cyBpbmRpdmlkdWFsbHkgd2l0
aCAib2Utc2VsZnRlc3QgLXIgaW1hZ2VmZWF0dXJlcyIgdG8gcnVuDQo+IHRoYXQgZmlsZSBvciAi
b2Utc2VsZnRlc3QgLXIgaW1hZ2VmZWF0dXJlcy5JbWFnZUZlYXR1cmVzLnRlc3RfYm1hcCIgYXMg
YW4NCj4gZXhhbXBsZSBvZiBhIHNwZWNpZmljIHRlc3QuDQoNCkknbSBkZXZlbG9waW5nIHRoZSB0
ZXN0cyBmb3IgbG9nIGNvbG9yaXplciBhbmQgSSBoYWQgYSBxdWVzdGlvbiBhYm91dCBvZS1zZWxm
dGVzdC4gSXMgdGhlcmUgYSB3YXkgdG8gcmUtcnVuIHRoZSB0ZXN0cyB3aXRob3V0IGhhdmluZyB0
byBkZWxldGUgdGhlIGJ1aWxkLXN0IGRpcmVjdG9yeSBhbmQgc3RhcnQgZnJvbSBzY3JhdGNoPyBJ
dCB3b3VsZCBzYXZlIG1lIHRpbWUuICANCg0KJCBvZS1zZWxmdGVzdCAtciBsb2dfY29sb3JpemVy
LkxvZ0NvbG9yaXplclRlc3RzLnRlc3RfbG9nX2NvbG9yaXplcl9iYXNpYyANCjIwMjAtMDctMjkg
MTA6MjY6NTUsNjE5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gQWRkaW5nIGxheWVyIGxpYnJhcmll
czoNCjIwMjAtMDctMjkgMTA6MjY6NTUsNjIwIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gCS9ob21l
L2xhcGxhbnRlL3JlcG9zL29lLWNvcmUvbWV0YS9saWINCjIwMjAtMDctMjkgMTA6MjY6NTUsNjIw
IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gCS9ob21lL2xhcGxhbnRlL3JlcG9zL29lLWNvcmUvbWV0
YS1zZWxmdGVzdC9saWINCjIwMjAtMDctMjkgMTA6MjY6NTUsNjIwIC0gb2Utc2VsZnRlc3QgLSBJ
TkZPIC0gUnVubmluZyBiaXRiYWtlIC1lIHRvIHRlc3QgdGhlIGNvbmZpZ3VyYXRpb24gaXMgdmFs
aWQvcGFyc2FibGUNCjIwMjAtMDctMjkgMTA6MjY6NTcsMTkwIC0gb2Utc2VsZnRlc3QgLSBFUlJP
UiAtIEJ1aWxkIGRpcmVjdG9yeSAvaG9tZS9sYXBsYW50ZS9yZXBvcy9vZS1jb3JlL2J1aWxkLXN0
IGFscmVhZHkgZXhpc3RzLCBhYm9ydGluZw0KDQpUaGFua3MsDQpDaHJpcyANCg==
