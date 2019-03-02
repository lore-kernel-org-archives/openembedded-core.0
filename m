Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 05F907CB31
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 12:57:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id 10so594850eds.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5AVbOq8raqyNeLF26s6GaPkaclnM06B8Oojd/eJBp9U=;
	b=pS581uTkVg+x0WsYKHpoY/0GBv2B4AfgSdJbYwnpw1RDfdF8GfjprjQm8LNDGqUDwo
	OuPifncks8VL4IGoOzgPRYNdTeXDBuk7ZberXhM2HOcLovjUT99AVabWFxUtJvUkeGHZ
	uC+WQqWoPa6um38sQcJCEaDQbWjaB7rv+RLBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5AVbOq8raqyNeLF26s6GaPkaclnM06B8Oojd/eJBp9U=;
	b=BXsX7Exs2/nv9kD5SIz7H1MH1pZJeC3qwsUXmN9NYry6ijC8sgc8gk1Rcjk6OjE0Xy
	5HvktY5ui5jb2FXycxZS53Y3cNFG6wvrYe9ZZmJw4t+qjujLPIVTHRj7dnCckKMdmsLz
	det6zgY43ym7Lx5I6xcD4PbOb32ugANrCSQvhBCe7CsKsc39jmFHNftpjr4F8G1fscfc
	Kiq5aF6ASAzq5KnSNBsfN0m/uaNOFXtg+7SYVETBJi00Xt4NXeYDQdjiCYDSgUsViEV6
	c7WotmHlXTp+exFgZWZwYmnYk1kOFiL6fPeZ+089egn4seAKAuiLQgcXbmnb+dGWDX6p
	AS8w==
X-Gm-Message-State: APjAAAUhtl8XbbCbmvWzxSWciX02C4BP4Pd32K7/xbsfiqbZ8JHzakPY
	WRKcj8ewHx3vS5UasCsNMZGwzg==
X-Google-Smtp-Source: APXvYqxlbD5YIS63IDQhyUTT/3e4rI6wZO8TAw9uT+a1uq7LYrC1xVw1//HEhL5rrIbLWPA8xYgTKg==
X-Received: by 2002:a50:eb4a:: with SMTP id z10mr8125832edp.284.1551531450567; 
	Sat, 02 Mar 2019 04:57:30 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id s24sm327446edd.23.2019.03.02.04.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 04:57:28 -0800 (PST)
Date: Sat, 2 Mar 2019 07:57:25 -0500
From: Tom Rini <trini@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190302125725.GF5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-2-git-send-email-trini@konsulko.com>
	<20190302091548.GE1503@jama> <20190302123634.GE5026@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20190302123634.GE5026@bill-the-cat>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] vim: Import version 8.1.0347
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
X-List-Received-Date: Sat, 02 Mar 2019 12:57:30 -0000
X-Groupsio-MsgNum: 121827
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline

--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2019 at 07:36:34AM -0500, Tom Rini wrote:
> On Sat, Mar 02, 2019 at 10:15:48AM +0100, Martin Jansa wrote:
> > On Fri, Mar 01, 2019 at 05:26:49PM -0500, Tom Rini wrote:
> > > In order to have a stand-alone editor in oe-core, bring in vim from
> > > meta-openembedded/meta-oe.  This imports the recipes as of git commit:
> > > commit 7b48bd2be97408107c0dd3c74b1e28f042268457
> > > Author: Ovidiu Panait <ovidiu.panait@windriver.com>
> > > Date:   Fri Feb 1 10:07:20 2019 +0200
> > >=20
> > >     vim: Enable GUI support for x11 DISTRO_FEATURES
> >=20
> > This isn't the latest vim commit in meta-oe, you're missing:
> >=20
> > commit c4db3971ab88dc8c012256e987f73ccd4459b400 (HEAD -> jansa/master, =
contrib/jansa/master)
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Fri Feb 8 22:57:02 2019 +0000
> >=20
> >     vim: use empty PACKAGECONFIG for vim-native
> >=20
> > it's currently in master-next, but it should be imported as well.
>=20
> OK, yes, I only grabbed current master.  Yes, I can re-spin to include
> this version.

I see that in master-next, this is current:
commit 41f3f8165bde3eb4f8bcf6dddbaca0d3b760c70b
Author: Mark Hatle <mark.hatle@windriver.com>
Date:   Thu Feb 28 09:39:19 2019 +0800

    vim: remove xfce vim bbappend

    Changing the behavior of a recipe by including a layer is not allowed
    by the yocto-check-layer script.

And have grabbed the vim recipe side of this as well.

--=20
Tom

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcen20AAoJEIf59jXTHXZSpk4P/jJBzXzYHvDyC8AbJ3ZEKQdo
u1g/UJHfeaq/RZAjk+csQqZfnVpacXgVAiPt6x7Z7K2d/J1mqy+o2UC+PLxWMVac
dyxstOed7P2fTzA+eTFCxLvsDPU3j4YJRtC6VY6veWvYp9IM1B7w9vYEhedN8gGP
rN2F2eFELZQgVsoYsg1XHQihSQiyL5MkEfz7H3bVIX48byP8Nlqx6tiXevnJDQ3M
eJMpZRrY5Y69BuMoMKTewAwKwzHxeyBJ79vSjRJuAO1RW304pc+NPXTyBLA0i11n
JvykeDqP4QY2vTcKd8GFcByCxVJgHBpJG71JkEPIgGivyOpUgq7stLoRBXtHYcMQ
NZ0xUO+Mt0TaCEZukKQeMSk9q9MAR409AuKolwgwUhAahPv6trwIZGyjNSfjuZ1s
53K2h7mtT0as02rb3Qov1SXs85lHGYFvt2Pc3m9jChlXrnSMZvlIkDgrlFMPfuHz
eDTpxLSkFda9D3CxKRWOOJrDHx0gp7x1wYbveuyGhl9mP76tJ6Xing/gQRpwUzr4
mQlXvpyZZbv1Qd4OY1gWJy1VKk2A89nb94PffALQvHIgq7PhjR59uoG+K1mld35h
QqtBNcWnBHyIeyW0mHBGb14ebXhQhPLMy8xBWTz1QgN+szOiW4L792YfHr7x2tpc
xBjeeLrAsEMetEUX/DdK
=Fqfg
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
