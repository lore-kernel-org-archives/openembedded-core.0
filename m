Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A173C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:59:29 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.12773.1693227561205573734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 05:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=I6gxVIQ5;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=oWtDWjfpLXDJLlsLIaMzLZ7RW6ksE/X8FnXmtu5N9B8=; b=I6gxVIQ5hAjP0GWH4gzjkqUcsl
	rk6/N5foy+ab8sUA3drRrZxhlNvM/iYVN+wNn9Re/vvGZm+pzO42jPq7o8sCQy4ggtPPxJQ7Z9LHh
	S9Co5JGqlG5CQn2ILp/oPm7xFYZe9D4o7IVyI8XsMBPASAe8NAqO8nJeriG72vaVDKSAKU/Zqy8dw
	zk05hYwBlNjWQNF6ZoknSlIewzUthq+RDpwq29vfZMEnsO4XmvWdQAIZvbAylEsBEywW0970db8v2
	6PfcDMHFgybbtzJhWk//UBoZid5mEFPS++CnSbAJb0GJ+RkfuioHwZWktoQTfamVs6XN3WQrFz8Zo
	Us668RYg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qabpv-000Amz-Pe; Mon, 28 Aug 2023 14:59:19 +0200
Received: from [85.184.138.13] (helo=[192.168.8.20])
	by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qabpv-000VVh-DM; Mon, 28 Aug 2023 14:59:19 +0200
Message-ID: <ea8e63109ee5a05de8e9397eca7165b1c44b9395.camel@geanix.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] ninja: build modified version with
 GNU Make jobserver support
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2023 14:59:19 +0200
In-Reply-To: <CANNYZj-iEBSOzp5_CbfhPuvhvaJ9KkdwZiLrLgPL=jaLzBJt8w@mail.gmail.com>
References: <20230828124834.376779-1-martin@geanix.com>
	 <20230828124834.376779-3-martin@geanix.com>
	 <CANNYZj-iEBSOzp5_CbfhPuvhvaJ9KkdwZiLrLgPL=jaLzBJt8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 12:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186829

On Mon, 2023-08-28 at 14:57 +0200, Alexander Kanavin wrote:
> Thanks, make/ninja jobserver is something we've been talking about
> since forever, and it's great to see actual code.
>=20
> I suppose the biggest obstacle is that ninja support hasn't yet
> landed
> upstream, and I'd like to ensure it does. Also, a link to the pull
> request is missing? :)

Indeed, upstream seems to ignore the pull request :(

Link references are like attachments: easy to forget... Here it is:
https://github.com/ninja-build/ninja/issues/1139

// Martin

> On Mon, 28 Aug 2023 at 14:48, Martin Hundeb?ll <martin@geanix.com>
> wrote:
> >=20
> > Ninja doesn't (yet) support the GNU Make jobserver out of the box,
> > but
> > there is a pull request adding that support[1]. Switch the SRC_URI
> > and
> > SRCREV to point at the source of that pull request, to make ninja
> > play
> > nicely together with the recently added jobserver class.
> >=20
> > Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > ---
> > =C2=A0.../ninja/{ninja_1.11.1.bb =3D> ninja_1.12.0.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 4
> > ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > =C2=A0rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb =3D>
> > ninja_1.12.0.bb} (84%)
> >=20
> > diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
> > similarity index 84%
> > rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb
> > index 8e297ec4d4..9abdd40a92 100644
> > --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > +++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
> > @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52e"
> >=20
> > =C2=A0DEPENDS =3D "re2c-native ninja-native"
> >=20
> > -SRCREV =3D "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
> > +SRCREV =3D "c9e21dbbc4c746ba397c0f9bec5f65c99f783c08"
> >=20
> > -SRC_URI =3D "git://github.com/ninja-
> > build/ninja.git;branch=3Drelease;protocol=3Dhttps"
> > +SRC_URI =3D "git://github.com/stefanb2/ninja.git;branch=3Dtopic-issue-
> > 1139-part-3-jobserver-fifo;protocol=3Dhttps"
> > =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
> >=20
> > =C2=A0S =3D "${WORKDIR}/git"
> > --
> > 2.41.0
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186825):
> > https://lists.openembedded.org/g/openembedded-core/message/186825
> > Mute This Topic:
> > https://lists.openembedded.org/mt/101009093/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


