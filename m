Return-Path: <chris.laplante@agilent.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	by mail.openembedded.org (Postfix) with ESMTP id 444EE7FCBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 16:23:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RDTEAS3p/sThAFyTYElnrctS6KeniMV6q36LJdp9HOIcVg1qIPGUpgZBsKT4OZPr3PFmuGxGESUc8ZHeuysyoOl8f7cnQcBNpzXSSMxsBfRjcYooNc7leYhE3ETb1bZ81gA8kk0mincq+XqIpk/00Ags+5pC+v9DrxpoFNrpKpm7qQLXtUBW+VaCgEXWJt66ziELehouyuMB6CIacbfQ6t/x0EDrmzr6YjAG2DO04uxh+oDper6dV5DuWuxscsUVG260iEVKBcbGrNySfoCmEApTxDFVkqYgtHoDOdJv924826eLY7e1on/9QpwSv7tcQRB5ySHP/fmxrd17Dy81Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dazwk6YDdHsD1wQVDu54b8fQY5lIZsYP3rIGWcnsQlA=;
	b=DqNVAy50p5FEqlLFybhL2lumKjS906qq5db57JxSJ8W3Eaq4xjvoLVg7Qq2NxeabbaqUOWddpM50MfnrQvLI+F0e79RvlXNG0VwpQP3WxAT4OUbjpokF6kAtbuOWLii8oSqt5OZ052nPpXJM93oPh/mVtIbO2gfJzO/IAvGV02RVDC4y0j+mcfygsATH6rHVuBQIr2quXYOtkhLZAb3Wz6PU179WCNlfSHR7IH30oQM2kWnXECttFA8VSh1h1BSqA1DsR793CnZlqv1QopQKdFBAEEwAXt+/5QCsSKYy7scCXs6u6vSjaLgZ1aVT9jjHAYlAsaaZGn8uJBhF0vml5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dazwk6YDdHsD1wQVDu54b8fQY5lIZsYP3rIGWcnsQlA=;
	b=KZlZyLuYg3RM0KG4jskMZJbojzPAsrmpsV2wxqf67DXjPsBAaAwGX56Zc8WlsgxqDUBrip3Ae3lIlyX0YG8vgLM1q5mdC4clq9WTTRJGOoMJP2ogBU+EHbUeFyfimpybrXd0n37eRGag7qMCeZPySsKPihjZfHuNGNxpxdEHQxw=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1173.namprd12.prod.outlook.com (10.168.169.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.10; Mon, 13 Jan 2020 16:23:02 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2623.015;
	Mon, 13 Jan 2020 16:23:02 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Pascal Huerst
	<pascal.huerst@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Looking for a way to build latest tagged releases in
	recipes
Thread-Index: AQHVxtrVLP5ZK3dnBEaFuu03GmqUsqfiOsqAgAACogCAADZ9MA==
Date: Mon, 13 Jan 2020 16:23:02 +0000
Message-ID: <CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
In-Reply-To: <a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82d74d8d-24ac-4dc0-4a49-08d79844dd01
x-ms-traffictypediagnostic: CY4PR12MB1173:
x-microsoft-antispam-prvs: <CY4PR12MB1173D1CD7B1E0DA2D9D5CE438B350@CY4PR12MB1173.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(376002)(366004)(346002)(396003)(39860400002)(189003)(52254002)(29502001)(199004)(8676002)(81156014)(110136005)(8936002)(81166006)(316002)(4326008)(33656002)(52536014)(2906002)(86362001)(26005)(7696005)(5660300002)(71200400001)(9686003)(66446008)(66556008)(64756008)(66476007)(76116006)(66946007)(6506007)(478600001)(55016002)(186003)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1173;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lj9GzxbG27BHj0Seb7hNNK2gUYImkX46Pbm9k6v5OeUplMWEOiA1XrVOhjS0Adn2HbVkI7GoG1uws77zj0xLWBjcjdY+YN3zBUQAbg4M6jYQHfqbfSxc9J0rVGTEZGf0M1+Hhx3asGPtcYVCYlGtXgnp6CgZ3F2Q7jZHdn+bEV2ufCAcSR3k57RMN1ibtj7DByRXkTmhExADWvHSO1RyKdYrIU6eTnMU71PxgCNRQaXauXVp0NMWaERPEiQ5aBkE0np1SQyeWcfTYMgKNIdKTjVXrDcLTg9xTQ8VvFt/r97Xf8/SMEOhteg7Yk7SYnB7ehv1B6ONoOSpqk4VStNnru63HaJxPEJib1mxtNS+t3HXeuD61IVbzRG/LvOGSGyGOu6gsBw+pmOmtDYBDrWkgTpVXHtALAQ6ACk0YexANoczf78A4pDPwKZTO59pgkQqpWfoWZ02fMPET5B8AAdDM5WpE+J2gNNzc1RvusZjnoh7QZ9tmEV/u+FD4CrXDwEHAcG/HF7EubISbBLT9m+VevoKzZDAQ2CxW9VdMxdviWE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d74d8d-24ac-4dc0-4a49-08d79844dd01
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 16:23:02.7612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vcWjhIMfOuJFb8vO4XLF4eB5AGdn/ssUazRF5uJMizOCAXMp/VFcVFVzk6ClhJDqKRyj0X/k7RefXdawvCwxsnIwti14Ox2mH6JKXJznnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1173
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Mon, 13 Jan 2020 16:23:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> FWIW I do want to see the system used to do things like this. I've kind
> of envisaged you'd do it "up front" though. For example it should be
> trivial for a script to use tinfoil, iterate through and generate an
> include file of the revisions you want, using the fetcher calls.
>=20
> Yes, its slightly more annoying to generate the config, then build it
> but if it stops the core becoming unmaintainable with corner cases,
> that could be the right decision.
>=20
> If you do something like that it would be great to share it so others
> can see what you did and be able to build off it...

This is actually something I've been working on and thinking about a lot fo=
r the past year and a half. Our application layer has probably 30 or so rec=
ipes that use AUTOREV. For the purposes of reproducible builds, we need to =
generate similar output to what buildhistory-collect-srcrevs generates, e.g=
.=20

	SRCREV_pn-my_daemon =3D "githash"=20

I've gone back and forth and re-implemented the code to do so a half dozen =
times. Chronologically, these are the fundamental strategies I've attempted=
:

1. Simply in terms of buildhistory-collect-srcrevs.=20
	Pros: dead simple
	Cons: requires that you actually build stuff first; requires buildhistory =
to be enabled
2. As a bbclass, injecting a task between do_fetch and do_unpack ("do_captu=
re_srcrevs")
	Pros: can be invoked without actually building stuff, e.g. bitbake my-imag=
e --runall=3Ddo_capture_srcrevs
	Cons: adds yet another task to the recipe; a little ugly since you either =
need to INHERIT the class, or individually inherit it in recipes=20
3. As a separate tinfoil script (as you suggest) which I run before the act=
ual bitbake.=20
	Pros: decoupled from the actual build
	Cons: since it's decoupled, it's slower - each recipe needs to be parsed
4. Hacking the srcrev cache (inside fetch2) to log all information necessar=
y to generate the SRCREV overrides, paired with a script that reads the cac=
he and does it
	Pros: Equally suitable for the "config-then-build" workflow ("bitbake --pa=
rse-only && generate_overrides.py >> local.conf && bitbake image") or the "=
build-then-config" workflow ("bitbake image && generate_overrides.py > over=
rides.conf")
	Cons: Invasive, required large changes to fetch2/__init__.py and some smal=
ler changes to fetch2/git.py

In the current incarnation (#4), I also go a step further and, in cases whe=
re a SRC_URI has a parameterized branch, I generate BRANCH override lines a=
s well. For example, if I see:

	MY_BRANCH ??=3D "master"
	SRC_URI =3D "git://git.oe.handhelds.org/git/vip.git;tag=3Dversion-1; branc=
h=3D${MY_BRANCH}"=20

I generate this line along with the corresponding SRCREV override:

	MY_BRANCH_pn-recipe =3D "master"

The algorithm for detecting the branch variable in the SRC_URI entry is as =
a little complicated, and not super relevant at this moment, but I want to =
get it off my chest :). The code first tries to find a parameterized branch=
 by using a regex to find stuff like "branch=3D${VAR}". If that fails, it c=
ould be because the branch is expressed as something more complicated like =
this:

	BRANCH_RELEASE_NUMBER ??=3D "1.0"
	SRC_URI =3D "git://git.oe.handhelds.org/git/vip.git;tag=3Dversion-1; branc=
h=3Drelease-${BRANCH_RELEASE_NUMBER}"

In that case, I fall back on a breadth-first search on all the variables th=
at SRC_URI references (recursively) to find the "deepest" one that controls=
 the branch. I wrote this in terms of d.expandWithRefs, and can detail it f=
urther if people are interested. Basically, I didn't want to enforce a part=
icular convention on the name of the branch variable. You'd think BRANCH wo=
uld cover it, but the kernel recipes also have KMETA and stuff like that.=20

I realize the branch stuff as currently implemented is maybe too opinionate=
d (and a bit dangerous) for inclusion in bitbake. But I digress.=20

I'm very interested in discussing the SRCREV (and perhaps BRANCH) stuff fur=
ther with anyone interested. I would love to see some strategy for doing th=
is make its way into bitbake or poky, so I can stop reimplementing it and s=
econd guessing myself :).

Thanks,
Chris

