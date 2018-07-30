Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0046.outbound.protection.outlook.com [104.47.2.46])
	by mail.openembedded.org (Postfix) with ESMTP id 90F0A7473A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2ySYOvrCQK0qqA7G+wWDctC+rVEgCh0b3clumg7osRI=;
	b=bHyDRm3YhwUOeDDXyxVvUDy2eCH1Lxh6YALl3nLM3memDnbMRtDxfPNCia6BXjZMK+GTQBuujF44fD3MSBsIK5Qe6liUzPLv+SJYjnDc3SC2662GhrL5PCihtwnS97oWaIBhIK9NJUE0GDMw4HY0hr1qu0h1DCiFd1m4dlSAus0=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB0470.eurprd08.prod.outlook.com (10.161.245.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.995.19; Mon, 30 Jul 2018 16:42:23 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::c0:e7e3:e3db:cb3]) by DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::c0:e7e3:e3db:cb3%4]) with mapi id 15.20.0995.020;
	Mon, 30 Jul 2018 16:42:23 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core] INCOMPATIBLE_LICENSE mechanism
Thread-Index: AQHUH2P1ipMkerX65UWFRjBAEJC/rqSWocT7gAsWAwCABjB/LQ==
Date: Mon, 30 Jul 2018 16:42:23 +0000
Message-ID: <DB5PR08MB0888C53D5D1C88CE358E5642932F0@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>,
	<f8ab4ac1813c531937fae65654513f8a21ab24b4.camel@linuxfoundation.org>
In-Reply-To: <f8ab4ac1813c531937fae65654513f8a21ab24b4.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB0470;
	6:r50g6fxduOA60Kcggl/ylMTsDIh8nZqhfFq+v1FjoLOvNlmCqZTQpPSNwfOx+DZfamrniNSgu7U//THJdnYmIpC8DJpK2tXg8q6EjAA6ZG0wnHLgE8tVaBmof2Ik4dF229n1NNBcpogCZVxaJ/C9I4R5qJmi2rtf49XwXLCtZQS17zwi/sipFax/W9NVUzdLsQ6yZizAE39iLlZnqjLfyDSuTa7sO+ASfB2ocmB/xktuL4wSZr4rWsqLtjG4Pv8EmTaKSrKls6uPi3tOQ06HIqc5vmjXUCTsnq1HlkL+vDuEfcECF9uy/OkcgjAem95Yvy+3ZibJm220Uyb0WSQLxL5EvuIkXJEb04MhH2ETImQM2pF47X4N+CIya5lpLwdacMC6qPvG9LUuo5uMW6b06t17z378xYjwKL2scr5kHPVT9/eat9+pSs1t92IwjVAd/g1dyTrwvIcUvwXkOWEMmQ==;
	5:XlnrmVfX9K9XnJftyIIzGXKGk/3s0eDgpg09IZ6zg/4BZjISyCVHpK12POr9U+59YYCOC5GY5pV66qYXIEvSsdGXPgghJSFQ700mFal1UjRFAxkZrxyS6g6TGxM+v6RoChcsjj9SJxWdWeOD/6LFLTqay4LP59YD1yFOJTqJpdA=;
	7:IBQFRiZAFiJhbKuQW51RT0sbeMhN8OGOXE0/indmmQRyJ4bkxzA6YvXW22krUKTfxECaaMxcVPjEPoQP4LWowOdaYykQ/i9ggUNMLLp1AChZE61LMK99PoYhNOLNB+cVBLx6IuGwZf71DUhybov7FikhYzsYW7gS1SKzb9ZMZF23/63dA2Y14mH2PJzKLdVksKHj06tPeyGUZgYExPMkwZvlkAY8WJ1k22RVpPiZHCtTC2bDkG7yz8j03ywr+xo/
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 5010b3a3-edb5-4d72-60d1-08d5f63b6cc3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB0470; 
x-ms-traffictypediagnostic: DB5PR08MB0470:
x-microsoft-antispam-prvs: <DB5PR08MB0470791B6EF35D70332A8DA6932F0@DB5PR08MB0470.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(35073007944872)(223705240517415);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB0470; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB0470; 
x-forefront-prvs: 0749DC2CE6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(376002)(366004)(346002)(136003)(51914003)(189003)(199004)(40434004)(72206003)(14454004)(6506007)(26005)(102836004)(66066001)(6246003)(478600001)(229853002)(25786009)(4326008)(86362001)(256004)(99286004)(53936002)(105586002)(2900100001)(14444005)(97736004)(5024004)(9686003)(81166006)(81156014)(8676002)(55016002)(8936002)(33656002)(2906002)(6436002)(74316002)(305945005)(110136005)(7736002)(476003)(106356001)(76176011)(7696005)(5660300001)(2501003)(3846002)(6116002)(446003)(68736007)(316002)(5250100002)(486006)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB0470;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Qn960GsfhuMCtVSxPUew9TQjqkUyN7hrfJzGZxR4t6cJ4aENcfAcEc5fK5rvKivyDq0rElfC8Z1CfvHoIESIXgkCzFVOANMxBawjLrpaYTtQT74WhxVJOc5rUyeHUUhniL4J76YLQJupp3tAS7i2SZizBVsip01SOPAQfEVKpZDdrsxiB7kL7K3Bkz7aOi9dfYExkwglE5wJkXMQU58ThQFuNKvOGuSMGrXSSeEhRZvSFSIm0moQ6jbkbsSHycE70cqbVPpAldsr7f7djACjnGjipkJikZaw3aMMmdyl07d2W/CXqpY5K3BwB0s/Mbc+xg230sxJAJr++h/lfR8sJnxCAYEpEc/BNO9G6i1dorI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5010b3a3-edb5-4d72-60d1-08d5f63b6cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2018 16:42:23.0258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB0470
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: Re: INCOMPATIBLE_LICENSE mechanism
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
X-List-Received-Date: Mon, 30 Jul 2018 18:15:50 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>> I have some questions, comments and suggestions about the
>> INCOMPATIBLE_LICENSE mechanism:
>>
>> 1. If I specify licenseX in INCOMPATIBLE_LICENSE then I get an error
>> when building a recipe with a package (packageA) that just
>> RRECOMMENDS a package (packageB) with licenceX, even if I add
>> packageB to BAD_RECOMMENDATIONS_pn-packageA. Am I correct in thinking
>> that this behaviour is unintentional?
>
> RRECOMMENDS are a runtime setting and something that the package
> manager cares about. From bitbake's perspective, a RRECOMMEND and an
> RDEPEND are the same thing.
>
> This is done mainly for build determinism, we can't just sometimes
> decide to build a recommendation but sometimes not (for example if its
> build failed).
>
> So the behaviour is intentional at one level but obviously the
> implications for INCOMPATIBLE_LICENSE are problematic.
>
>> 2. When checking whether a license expression is compatible with
>> INCOMPATIBLE_LICENSE, the code takes into account "or" operands in
>> the license expression, such that if licenseX is in
>> INCOMPATIBLE_LICENSE but licenseY isn't, and a package's license
>> expression is "licenseX | licenseY" then the license will be deemed
>> okay even though licenseX is incompatible. I don't think this
>> consideration of "or" operands is valid. Consider the case where:
>> packageA has license expression "LGPLv3 | GPLv2;
>> packageB has license expression "MIT";
>> packageB dynamically links with packageA;
>> INCOMPATIBLE_LICENSE =3D "LGPL-3.0".
>> PackageB mustn't be using packageA under the terms of the GPLv2
>> because the resulting combination would have to be GPLv2, not MIT, to
>> comply with the terms of the GPLv2. PackageB must therefore be using
>> packageA under the terms of the LGPLv3, but LGPL-3.0 is in
>> INCOMPATIBLE_LICENSE, so the combination should be rejected.
>
> The code there is simplistic and tries to spot "obvious" problems. As
> you point out, its not entirely accurate. I'd very much like to see it
> improved.
>
>> Actually keeping track of how licenses of packages and their
>> dependents interact might be too much work, too messy, or require too
>> much legal knowledge, so I suggest this special treatment of "or"
>> operands in license expressions is removed.
>
> If you remove it, I'm not sure the situation improves much. I think
> originally the idea was to be able to dial in a license policy such
> that it would flag whichever combinations were problematic and
> configured as incompatible.
>
> Perhaps a better idea would be a new check in insane.bbclass which
> checks the things a package is depending upon and considers and warns
> about known problematic licensing. The list of licenses it was using
> could then be influences by INCOMPATIBLE_LICENSE and you would get the
> result you're looking for, admittedly at build time rather than parse
> time but its better than nothing.
>
>>  Another approach might be to allow packages explicitly declare the
>> licenses under which they are using their rdependencies. That
>> wouldn't work nicely with the implicit RDEPENDS addition mechanism
>> though.
>>
>> 3. If I understand correctly, INCOMPATIBLE_LICENSE doesn't let me
>> have different license policies for packages that go into different
>> images. It would be useful to be able to specify INCOMPATIBLE_LICENSE
>> in an image recipe to prevent just that image containing
>> packages/recipes with incompatible licenses. This would be useful
>> e.g. to have a GPLv3-free production image but allow GPLv3 packages
>> in a debug image.
>
> INCOMPATIBLE_LICENSE is a "hammer" approach which removes many recipes
> from the view of the system entirely. That was the way some legal
> departments wanted it to work.
>
>> 4. From the code in license.bbclass, it looks like when writing the
>> rootfs and image manifest files, the intended behaviour is to modify
>> the license expressions of packages/recipes by removing incompatible
>> "or" branches (which seems a little odd, especially given #2).
>> However, this is not the actual behaviour of the code when run with
>> Python3. From write_license_files() in license.bbclass:
>>
>>     bad_licenses =3D (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
>>     bad_licenses =3D map(lambda l: canonical_license(d, l),
>> bad_licenses)
>>     bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
>>
>> expand_wildcard_licenses() expects a list, but in Python3 map()
>> returns some sort of iterator, which causes
>> expand_wildcard_licenses() to return an empty list. This can be fixed
>> by wrapping the call to map() in a call to list(). I'll send a patch
>> for this.
>
> Please!
>
>> I have a bbclass that adds license checking at the rootfs/image stage
>> and doesn't take into account the "or" operands in license
>> expressions, but I think it would be better to change/extend the
>> functionality of the INCOMPATIBLE_LICENSE mechanism. Do the oe-core
>> maintainers here agree with the following approach?
>>
>> Don't fail a build if a package just RRECOMMENDs another package with
>> an incompatible license, only fail if the package is actually built.
>
> This is potentially more problematic than you realise.
>
>> Don't take "or" operands into account when checking for incompatible
>> licenses.
>
> I don't agree with this, I think we need to improve the code to handle
> this better though.
>
>> Add functionality to allow INCOMPATIBLE_LICENSE to just apply to
>> packages/recipes that go into a particular image.
>
> That is using it for something quite different from its original deisgn
> intent.
>
>> Don't modify package/recipe license expressions in the manifest
>> files.
>
> This is done because that file may be used as a basis to provide
> something to a legal department and if you're not meant to be shipping
> GPLv3, listing it in the manifest would cause more confusion. I can see
> this from both sides...
>
>> If so, I'd like to contribute patches to do this. I'm not at all
>> familiar with how the RRECOMMENDS mechanism works though, so some
>> guidance on that part would be useful.
>
> See above, I've tried to explain the challenge there!
>
> I would much rather see the existing mechanisms improved than adding
> extra classes or new ones but there are reasons for some of why it
> works the way it does.
>
> Cheers,
>
> Richard

Thanks for the information Richard.

I need to think about this some more, but I suspect INCOMPATIBLE_LICENSE is
just not the right tool for what I want to achieve - it works at the recipe
level but I'm more interested in licensing at the package level and what
actually ends up in final image(s).

I still don't think choosing "or" branches of license expressions to satisf=
y
INCOMPATIBLE_LICENSE is a good idea though, at least at the recipe level. I=
n
order to be able to confidently choose between alternative licenses for a
recipe or package, you'd have to be sure that the chosen license was compat=
ible
with the licenses of everything else that might have something to say about=
 it
(practically speaking, anything that might link with something in the
recipe/package). Doing that when the recipe is first being built sounds ver=
y
tricky to me. Doing checks like that later when a rootfs or disk image is b=
eing
created seems much more feasible.

I've posted a patch on the oe-core list for the map() return value issue I
mentioned.

Regards,

Jonathan
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

