Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id E109371422
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 09:46:49 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2A8EA4C80F9;
	Fri,  5 Sep 2014 11:46:48 +0200 (CEST)
Date: Fri, 5 Sep 2014 11:46:47 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Dvorkin Dmitry <dvorkin@tibbo.com>
Message-ID: <20140905114647.0da82340@e6520eb>
In-Reply-To: <540983E2.9080402@tibbo.com>
References: <540975F3.7050806@tibbo.com> <20140905111313.0f978efd@e6520eb>
	<540983E2.9080402@tibbo.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wrong automatic dependency
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
X-List-Received-Date: Fri, 05 Sep 2014 09:46:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 05 Sep 2014 17:35:30 +0800,
Dvorkin Dmitry <dvorkin@tibbo.com> a =E9crit :
> pretty sure! see my grep on *.dot files. python is installed due to crda.
> may be the difference is that I'm using new version of crda (2014.06.00)?
> look at my recipe (attached)
>=20
your grep shown the build of crda depends on some python but doesn't
show that the package depends on python.

Eric

