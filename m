Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE66FC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 11:25:39 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29006.1785151505469266096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 04:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=UVg6MAX7;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0jEWwRav7UajvYk9lAjMtAiI/6CqwST1JDouEM0uG6k=; b=UVg6MAX7bSekVbAFiiniC2tIOZ
	9w8Wqibopp5qwTBg2F8p4PyWv6wR/+yZKegv17s3z9D6YuZBhcRcUnQj/OPUAQLO97qgRC6HLuTWO
	coRTn4syeZKgCgpW7dT4PEoni3Jiw0dEWVPFJEbcuevmuk5Nc8PZVdpq7xmnSa5wgJ4l/Lhb/Ia/M
	3znWfYYRPhkkcCZ7WfNu8eWlYS4huh4laxpoec2cmsDAnzxiQvDjKxukAw1w8sngX+vmpuNBbALng
	mlYzA1HHuFF8PZrQLXs/54WnODtuzT0l5uKZUy5Hgwc+q5ofSlLkpZQib7eUvtfaBNlLTQkzgeLqP
	mlpoRp9A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1woJSA-00005K-2M;
	Mon, 27 Jul 2026 13:25:02 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1woJSA-000ME2-2U;
	Mon, 27 Jul 2026 13:25:02 +0200
From: "Alexander Stein" <alexander.stein@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] kea: Fix crosscompilation
Date: Mon, 27 Jul 2026 13:25:01 +0200
Message-ID: <6366208.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DK99V3JWQCQU.9V7MD3S1EN5L@smile.fr>
References: 
 <20260723114222.261331-1-alexander.stein@ew.tq-group.com>
 <DK99V3JWQCQU.9V7MD3S1EN5L@smile.fr>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28074/Mon Jul 27 08:25:14 2026)
Content-Type: multipart/signed; boundary="nextPart5195511.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242086

--nextPart5195511.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [OE-core] [wrynose][PATCH] kea: Fix crosscompilation
Date: Mon, 27 Jul 2026 13:25:01 +0200
Message-ID: <6366208.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DK99V3JWQCQU.9V7MD3S1EN5L@smile.fr>
MIME-Version: 1.0

Hi Yoann,

thanks for your reply.

Am Montag, 27. Juli 2026, 12:13:05 CEST schrieb Yoann Congal:
> On Thu Jul 23, 2026 at 1:42 PM CEST, Alexander Stein via lists.openembedd=
ed.org wrote:
> > Backport upstream commits to fix cross compilation.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../kea/files/0001-3982-Checkpoint.patch      | 169 +++++++++++++
> >  ...002-3982-Checkpoint-applied-proposal.patch | 227 ++++++++++++++++++
> >  .../files/0003-3982-Last-improvements.patch   | 104 ++++++++
> >  meta/recipes-connectivity/kea/kea_3.0.3.bb    |   3 +
> >  4 files changed, 503 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/kea/files/0001-3982-Check=
point.patch
> >  create mode 100644 meta/recipes-connectivity/kea/files/0002-3982-Check=
point-applied-proposal.patch
> >  create mode 100644 meta/recipes-connectivity/kea/files/0003-3982-Last-=
improvements.patch
>=20
> Hello,
>=20
> Neither the upstream commit messages or yours really explain why we would
> want to backport this.

I was assuming the issue is obvious, but I should have been more explicit.

> Can you send a new version with added justification for this patch?

Will do.

> What cross compilation issue does that fix?

I get the same error message as in the issue [1]:
> | ../sources/kea-3.0.3/meson.build:367:13: ERROR: Can not run test applic=
ations in this cross environment.

> How do the patches address them?

I picked the patches from this linked Merge Request [2].

> Is that just for a specific configuration?

This is the single non-systemd configuration I have.

> Notes: the current version of wrynose/kea should already be
> cross-compiled during usual tests.

Assuming it does compile, what might be different? I mean meson's
"cpp.run()" doesn't look like this could be much different for you=20
cross-compile environment. Why does it not raise an error there?

Best regards,
Alexander

[1] https://gitlab.isc.org/isc-projects/kea/-/work_items/3982
[2] https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2973
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/

--nextPart5195511.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmpnQA0ACgkQaS+g2M0Z
/iVnZgf+MW3q8ltBkx5Et/dhDM0/gcxl0QKQ0u1gfWX3aRDr8+oYRV1tpq3lDNGD
97X3/URfhaxpEOhN0acttCgMXfisfghqUEjrTkJd2GZHOgwESK2pzITbU4TFjLrf
GIRHFXdetYnHzM4YH92wj0aTc6zrwEH/cGQ+PYNQrbm9yEgYNoYgr1oXSDA2Cimu
C2Wyq0NZ4nuVr5wx3t20dH5/FP90V+W+76+MCQCgb77ZDukcQFTPQ3S+TsfESsIx
kXoidNKPdDhT+QxTVQYKuOEuVUf4ZsRj8EmZLmKWvA5DAL5XgQv6GtUSnlpl1ps6
Zt7Zh0KnTMiLiSD4R925ps5pYVSBvA==
=cwFI
-----END PGP SIGNATURE-----

--nextPart5195511.31r3eYUQgx--

