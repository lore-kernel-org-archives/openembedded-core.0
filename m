Return-Path: <chris.laplante@agilent.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	by mail.openembedded.org (Postfix) with ESMTP id 835EE6061F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OJCm8cIbuLJM0Gv++7sFYTKogM2Vd0i7gf/Vlxn2auxEfqcxQ+EJ0zIWNktvqapyCczow8RDAgoRhB0NOwjoZ3y7PzjH4Y0WaE/77zj4jSF8xevp4IGiP/B0PS7/6lSvQw1+fZPPgLCTWiIO3run11dlKrWGXiunbQu0cW66PaPjdPx6EJ3jwsMDBV3S2mrOk9zOfsQWSh+fbKmsaaLn14lfnaI8s5j/fqV6AUX+xPJjTOpHrVK3UQOoU0Bx2mx0rZuD8gA+7Ma7j/5ewd9QGWJ04WS1swP0pxumEDh8IcyTMSBnhgdibQC/DFE2qDK4V/KTvqSUKT4x4OR4E9YRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ea+Gv1bYs+2IZxs/0efSclmAki7m6cmvZuUfy8V+L3U=;
	b=d+DtbWpFy2I1+ELinusRYWwJQThxlpzK68XU2aXVGHKEYPu+nSrsH0M9VzBUiam/+7EaaNoJK1z9DgaTC/QeDdFfGBgJqnZK/o52CiA9lEskFD3oR/FmWIboe7TbsIetrgeTFDZcXsiUkgayoFSjWQ9eA5IeHroL9+ir7b4Oi3IB8gidgv+U08zVUwR3vUJ7mpbiWna/NVI6VasTDypWK9jTSvh8CG6lJSkAv70ja8FppM5NeY07nvS4hpwnYaArbpvumNtjgnVqAjjTGQ/JarlVOXVVi8e8FDLyvonyXA8chQ8iYRjScMFGhZZuybRV1n0CZTveIETuTSCIofK7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ea+Gv1bYs+2IZxs/0efSclmAki7m6cmvZuUfy8V+L3U=;
	b=Z4zfJQzSkQUTev5/ETX9QH8DV5qoDoToCbRxiFdEG2zQ1+vJaPquWwb0jptAqsOF3xJbYrlq84jukbibvIKH6fzK3AAoPfAO8uBYLTAeObbXvArXsbPRDzG7rj34xcrTZRqEnDH14UaQp6tRQCNEXibcuuDUGdhkbUsw9vYDq6U=
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com (10.172.108.140) by
	BN6PR1201MB0145.namprd12.prod.outlook.com (10.174.238.146) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2686.29; Fri, 7 Feb 2020 14:43:15 +0000
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290]) by
	BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290%11]) with mapi id 15.20.2707.024;
	Fri, 7 Feb 2020 14:43:15 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Cache unihash ... doesn't match BB_UNIHASH ...
Thread-Index: AQHV3Y7yppMxqsfL50SQ0gLLoMQb+qgPZvSAgABkhGA=
Date: Fri, 7 Feb 2020 14:43:15 +0000
Message-ID: <BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
In-Reply-To: <ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab68d7dc-e3e5-426d-109f-08d7abdc10b0
x-ms-traffictypediagnostic: BN6PR1201MB0145:
x-microsoft-antispam-prvs: <BN6PR1201MB0145F7536671EA2F1D411B7C8B1C0@BN6PR1201MB0145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(346002)(136003)(366004)(376002)(39860400002)(199004)(189003)(29502001)(2906002)(9686003)(6506007)(110136005)(86362001)(26005)(52536014)(186003)(33656002)(478600001)(316002)(4326008)(8936002)(81166006)(81156014)(8676002)(66946007)(76116006)(55016002)(66446008)(64756008)(66556008)(66476007)(5660300002)(7696005)(71200400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0145;
	H:BN6PR1201MB2482.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gdPMiMBBAMQt5/cgV6oXlSKrYxHPqXcVRGRmTvH7F6tv5y+OHAhuwQjYumst6kgz5AgNwwjZCO8Z9faxqoozfwj/a+ROKum+A+4VnJGf9RFqexwT2SSUsTuv7w2hopAQbd/mUBiVdYPhgu2qUAFwVwcFC+3Gp8/FO+m4WvCyAAzUhSKEpgt4IUYAEhrZvqhBNiUchbauQX8Wb85+39dQzJZG7drF421sb36Xuv/ubnNOUvD8gfbI3lqUXV57n2ZC9V7FmNxCxsEqgZnpLYyUm22fbzyBpcFSavtYD814gB6/DbXyFeMPgvSP7MI8QAaNgAM3pV8OjYdraqGmvDoZ7Ux8XBl0pMHy5IkALsZ2m21zHIyvszQWfoMJYpn8ebr0jRR57i9cxc4iEP9VCtsGel8R5bI1ZBXMEUqdgFQ1Ynd6hkOzsIi/tU12/XADp6e/GYFDIyonLT77tYG0TbeWSmtZYMgWnHKtDSvWUoNQz66WUCgSIHlfhHTJ8e4hOHpK
x-ms-exchange-antispam-messagedata: fDzDHXmIiGzTtw+kJn8kS1jRxDE51uQxFZPT5EvSPDHWgRNzGj4WSajdVvkERdK7BfFnuENvy3kVslvAI4LkWyoUe+gsoHtuuNqS2FKjR5RbLo7DsC/ZHV2e7V4RelN05sDKrAr/4lCCNpJyLE7Mrg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab68d7dc-e3e5-426d-109f-08d7abdc10b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 14:43:15.6983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hkHclWkQuLEdaWf5EXrbg3N+CI9Q3OgbE58Ac9B9ig3PD+wFKMsn1OQkRO7npxzbg/s1sj34SEN0aZ7nt62CIly2i6Pw9bkblZNX6ywxGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0145
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Fri, 07 Feb 2020 14:43:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> On Fri, 2020-02-07 at 08:16 +0000, Alex Kiernan wrote:
> > Hi
> >
> > We've got a couple of multiconfig builds with different
> > configurations in one bitbake run (whether it needs to be like this a
> > different question - I suspect we had something that worked and
> > stopped there!)
> >
> > However, for sometime we've been seeing errors like this on master
> > (the recipes vary):
> >
> > ERROR: mc:forensic:ca-certificates-20190110-r0
> > do_deploy_source_date_epoch: Cache unihash
> > 37d2546973a2b7c16fbcb1a8dd4939e4a1bba8c3d6d2dfb6e7204ca08d437ace
> > doesn't match BB_UNIHASH
> > 09baf78bd9316acdd308980c42ea4ed1eacea61bcc0d840c36293d1a5a22db69
>=20
> This is an internal sanity test. It means the hash that it had in the
> task/worker context didn't match what the server thought the unihash
> should be. There have been changes in this area to try and fix various
> things, I'm wondering if we introduced a bug with multiconfig handling.
>=20
> There are some patches in master-next related to this area so it would
> be interesting to know if that made things better/worse.

Anecdotally, we are running Zeus for nightly builds with three multiconfigs=
. I cherry-picked your "bitbake: fix2" and "bitbake: fixup" patches and hav=
en't seen any of the BB_UNIHASH errors since. Granted it's only been a week=
. But before that, hash equiv + multiconfig was unusable due to the BB_UNIH=
ASH errors.

Thanks,=20
Chris

