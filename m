Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id A74247F7B9;
	Wed,  4 Dec 2019 19:07:50 +0000 (UTC)
Received: from [10.25.145.45] (mobile-166-175-57-115.mycingular.net
	[166.175.57.115]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xB4J7k2B018598
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Dec 2019 13:07:48 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Mime-Version: 1.0 (1.0)
Date: Wed, 4 Dec 2019 13:07:46 -0600
Message-Id: <AE5DD869-8FB9-4EAD-9E92-4A61CBFE70FA@kernel.crashing.org>
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
In-Reply-To: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: iPhone Mail (17B111)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core python minimum version requirement
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
X-List-Received-Date: Wed, 04 Dec 2019 19:07:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Seems reasonable to me as well..

--Mark

> On Dec 4, 2019, at 11:45 AM, Richard Purdie <richard.purdie@linuxfoundatio=
n.org> wrote:
>=20
> =EF=BB=BFI just enabled hashequiv's server in local mode by default in pok=
y.
>=20
> This causes an unintended side effect of requiring python 3.5 as the
> minimum version.
>=20
> We had thought that the servers would be 'rare' and a 3.5 version
> requirement for that was fine. It turns out a local server is also
> extremely useful.
>=20
> The code needed the python 3.5 async support and trying to write it any
> other way is a nightmare, we need that performance for the server.
>=20
> At this point I think we just give in and require python 3.5 as a
> minimum. Any objections?
>=20
> Cheers,
>=20
> Richard
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


