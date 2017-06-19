Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB7677D9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D008A32039D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:30:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PKJry_cSrbGZ
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:30:45 +0200 (CEST)
Received: from t460p (p57A610EC.dip0.t-ipconnect.de [87.166.16.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9581D32039D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:30:45 +0200 (CEST)
Date: Mon, 19 Jun 2017 14:30:44 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170619143044.780a7feb@t460p>
In-Reply-To: <1497874001.25895.5.camel@andred.net>
References: <20170619103238.2626-1-git@andred.net>
	<20170619140225.5cfdc2a6@t460p>
	<1497874001.25895.5.camel@andred.net>
MIME-Version: 1.0
Subject: Re: [PATCH] connman: fix nftables dependency
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
X-List-Received-Date: Mon, 19 Jun 2017 12:30:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Jun 2017 13:06:41 +0100
Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Mon, 2017-06-19 at 14:02 +0200, Andreas Oberritter wrote:
> > Hi Andr=C3=A9,
> >=20
> > On Mon, 19 Jun 2017 11:32:38 +0100
> > Andr=C3=A9 Draszik <git@andred.net> wrote:
> >  =20
> > > From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> > >=20
> > > When building with nftables support, connman doesn't ever
> > > depend on the nftables command line tool.
> > >=20
> > > connman will depend on libmnl and libnftnl at build and
> > > run time. In addition, the nftables rules it creates
> > > depend on various kernel modules being present.
> > >=20
> > > Update the PACKAGECONFIG to reflect this.
> > >  =20
> >=20
> > packageconfig creates runtime dependencies for the modules you added. T=
his
> > will cause problems if the modules are built into the kernel binary. You
> > should add runtime recommendations instead. =20
>=20
> But they should all be fulfilled because of PACKAGES_DYNAMIC in
> kernel.bbclass, no?

This will let the build succeed, but the package manager still aborts
when trying to install connman if some runtime dependencies don't exist
on the package feed. Runtime recommendations get ignored if missing, but
get installed by default otherwise.

Regards,
Andreas

>=20
> Cheers,
> Andre'
>=20


