Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6452C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 09:53:27 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.3689.1742464403966563540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 02:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=SJ+yjNok;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=FVhQDRcZ;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742464404; x=1774000404;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=4tLGmoJjPBZchjduvkJpWlzBXUxwsCePrVii+5FELCs=;
  b=SJ+yjNokm4DbOYnLT2v9wqwE8PWa7HdNNERVegbKEuEkxcPl9Kv+yQrN
   i9KLZgKdpLQSa9If6pinLsNWMxEGsFqxNAJ4xdmuiHXZ/sedMWt6HCbAe
   ynQ7mX1+2aAC9aRyoqGX87Ln7s77qOTE9N1nwNqXCL2qaFbnM6B0TwplZ
   p556dOzuECt0BpgGvP315nSaxs5HJ+/b/QaHT7OIP5cv5/sNKcY6wlxUX
   at9PqBFHKyzqxELO5jAuctJVMqmleVGzlu0qzhoYWBhJuSa668vToTWIA
   FCSmLYLnKZZD76gCx7vCUo//r83afzZFVckm0a14q00J79znM5a8WLQqx
   A==;
X-CSE-ConnectionGUID: /oXJEin+RsSgW/7KHAv5IA==
X-CSE-MsgGUID: 0EFsbuGBSyCaoQU0pqHqng==
X-IronPort-AV: E=Sophos;i="6.14,261,1736809200"; 
   d="scan'208";a="43066342"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Mar 2025 10:53:20 +0100
X-CheckPoint: {67DBE590-1A-903EAEAC-E04C76C8}
X-MAIL-CPID: 3FCF4B25CF0292F1E1FDAF6805730A17_5
X-Control-Analysis: str=0001.0A00636C.67DBE595.002A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9167D163B9A;
	Thu, 20 Mar 2025 10:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742464396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4tLGmoJjPBZchjduvkJpWlzBXUxwsCePrVii+5FELCs=;
	b=FVhQDRcZyTJt3XjR2QWdzPz+ctxhGv9NFraNar94LkKHvc+V6rkjLnyBBx60Z2hpBo/M85
	WvWO2YQOuUqDq0x8V4TWCz28nSkPzogWckuMV1WvM9di1nnWrS61Gw3qputtPZ4V5yTyAr
	oi26Q2vvegmuTStyi2lX0bSVec6d7URDV21KoZKyn2J9B9a2IugesOrMyJaDZPlnydedUk
	3CigvkDz9GEaKAOwS/5aI4nxD0aiEDMDIrZ/3uYpKW2rlTPm7v0LoD/2ERUdrjQn76e5Wk
	jD/kFMlzGd3AV6HIgqDlVPqOFGc4xgS7BPvVNqKoDSI3O7p6Jg6MRAqgGJPxVw==
Message-ID: <09b5e53a03892d24392293a19aef326d73d10acb.camel@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH] Revert "git: git-replacement-native: depend
 on ca-certificate"
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>, oss@ew.tq-group.com
Date: Thu, 20 Mar 2025 10:53:15 +0100
In-Reply-To: <87a48eb28f555495e48fe2b68001b502f2ff860a.camel@linuxfoundation.org>
References: <20250320092959.563213-1-matthias.schiffer@ew.tq-group.com>
	 <87a48eb28f555495e48fe2b68001b502f2ff860a.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213378

On Thu, 2025-03-20 at 09:42 +0000, Richard Purdie wrote:
>=20
> On Thu, 2025-03-20 at 10:29 +0100, Matthias Schiffer via lists.openembedd=
ed.org wrote:
> > This reverts commit 2e99ffda70fd95b5eab3de47048032349cd66f4b.
> >=20
> > git-replacement-native is used only to provide a newer version than may
> > be installed on the system; apart from that, it should work more or les=
s
> > the same. In particular, it is using the host system's /etc/gitconfig;
> > it should also use the system CA certificates, otherwise it will break
> > HTTPS connections in environments that need local certificates, for
> > example for a corporate HTTP proxy.
> >=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> > =C2=A0meta/recipes-devtools/git/git_2.49.0.bb | 3 ---
> > =C2=A01 file changed, 3 deletions(-)
>=20
> This is going to turn into a battle where you and Max both alternate
> with revert requests as you're seeing different breakage as far as I
> can tell.
>=20
> The original commit message says:
>=20
> """
> git is delegating webacces for URLs using TLS to libcurl.
> However our native libcurl build does not find a ca-certificate.crt
> unless its curl-native work dir still exists and thus git will fail.
> If a recipe uses AUTOREV with a git repo using https as its protocol
> parsing of that recipe will fail fetching the latest HEAD.
>=20
> Fix that by depending on ca-certificate and give its location
> to libcurl via git's envrironment variable GIT_SSL_CAINFO.
> """
>=20
> so the question is, does curl-native now use the system certificates?
>=20
> Cheers,

Ugh, I had thought I had tested this properly, but there is indeed still
something weird going on with curl-native's certificates. Please disregard =
this
patch for now, I'll have to look into the issue again.

Best,
Matthias




>=20
> Richard

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

