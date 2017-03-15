Return-Path: <jobol@nonadev.net>
Received: from erza.lautre.net (erza.lautre.net [80.67.160.89])
	by mail.openembedded.org (Postfix) with ESMTP id A6DE571A8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 08:04:31 +0000 (UTC)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by erza.lautre.net (Postfix) with ESMTPSA id 3DCAEF7496;
	Wed, 15 Mar 2017 09:04:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1489565072;
	bh=dsy9z2qMyc+L0MfrYMFKdFDZKNwNWbudwx+BoG6Q0p0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DbDz6/ObR+1jvVWLnGX6WCXltN43D8iQmHziUsShaafkkCRoJ6fLHjCD2uszaOZC6
	aOvcZM4zQEHRQH0kwTR3GIIKkqys9IJx/BSzISaQoZB8sxcKNjIjCcS+YEPVoFKri7
	jL0BcdmiChkMt9JUXVl0JMtIV+3/2AGhdugCHyDU=
Date: Wed, 15 Mar 2017 09:04:30 +0100
From: =?UTF-8?B?Sm9zw6k=?= Bollo <jobol@nonadev.net>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170315090430.69b17cc1@d-jobol.iot.bzh>
In-Reply-To: <1489079885.7785.371.camel@intel.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: =?UTF-8?B?Sm9zw6k=?= Bollo <jose.bollo@iot.bzh>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Wed, 15 Mar 2017 08:04:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 09 Mar 2017 18:18:05 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Thu, 2017-03-09 at 17:48 +0100, Jos=C3=A9 Bollo wrote:
> > On Thu, 09 Mar 2017 17:07:54 +0100
> > Patrick Ohly <patrick.ohly@intel.com> wrote: =20
> > > Can't you reorder and rebase the patches so that this
> > > 0001-useradd.c-create-parent-directories-when-necessary.patch
> > > applies on top of the patch which was submitted upstream? =20
> >=20
> > I agree that it would be better to reorder. Better but less
> > conservative because an existing patch must be upgraded. =20
>=20
> If upstream merges the proposed patch, then rebasing will be
> inevitable at some point, so we might as well do the cleaner solution
> now, even if the diff becomes larger.
>=20
> > > "devtool modify shadow-native" might be useful for that. "git
> > > rebase -i" in workspace/sources/shadow-native", then finish with
> > > "devtool update-recipe shadow-native". I haven't tried whether
> > > "update-recipe" handles re-ordering patches. If it doesn't, just
> > > fix it manually. =20
> >=20
> > I'll do and propose the new version soon. =20
>=20
> Thanks!
>=20

I pushed a new version of the patch this monday. I suppose that it is
waiting for approval.

Best regards
Jos=C3=A9 Bollo


