Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 86264783E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:20:04 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id v109so21562952wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ypg/p7qAO1BQrm/Ta5mT5vI1pKgt09iFDn/PkpqCzBw=;
	b=vPkG1XgbaDkD/XpGLKP6jyr+MVHzJTUjQivr2Rit4gQQrrw2eqzaotBuqzgFwz/Wcy
	/k3IoAuF/oA3vAd6j3urVrNkzYRXH9T5BWG0fvF+ute13BANWs2jNe6K57e97dN6Y7Cr
	ZZy9IzvtisgHqd5efN+GEbg/zUPzaJVTppVypSrKI/rf+7LgkxnQ/SJW7qi2Yv3sD86J
	ZMcLqu6D7/fNT/5cuemzp8vX/7HOlDo6U2J891jBA9QPVla1ULZpeCmrZ2t3Y2T9IVxW
	+J8ln7nUGx9t+iQGpSW4npSa6rpNQNrE5JwN5fL+iaeGa8vgU/JJR0XMW5Zm9uQCJflW
	k5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ypg/p7qAO1BQrm/Ta5mT5vI1pKgt09iFDn/PkpqCzBw=;
	b=BBjBbaXAu2iav3Jkl1iFHLldu4cRKiphwlh4kraAaqx9EDotZUEXt4vtaSkXK4l3Kn
	LDkimMztXQF8I/bDLGOfTn/TmcOfODFbUzIxTRuspiL17THew/KO7p2hj9oSFJQYbu0B
	CVwraKQs+OXefMF5OA4ZRhYL9v+0jBy0b0rRAyqEfnjom9JgemKh6JtZYXg6nMB5nmm/
	4Wf4iD3cBASpBBPf1o6+QVme1lYhxphNz01+50lLSp0CNWG51oaAfhDOvKJxL59EaGH6
	fjiuRs058gXxErz5YRCWAfnPrtGgL5u7CvEEKMq/DP1SQn2dYZRXf3/rfLWavFUPfP6D
	zkhg==
X-Gm-Message-State: AHPjjUic5MEDtjdzk8fpQeCFp2bcBew5SBZm2NQNXpNFhgA5CNP8noc5
	MVBoqcU1Ex2Ylw==
X-Google-Smtp-Source: ADKCNb7mj3P52bKblXLgFcM4+PIUhFImKOSYRO6i6k1yhlWm5nJnXi1FSflNGHBFOpr478rQUurPKw==
X-Received: by 10.223.160.214 with SMTP id n22mr13578638wrn.257.1505218805331; 
	Tue, 12 Sep 2017 05:20:05 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 56sm10513541wrx.2.2017.09.12.05.20.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:20:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Sep 2017 14:22:21 +0200
To: Matt Madison <matt@madison.systems>
Message-ID: <20170912122221.GB4102@jama>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
	<1505209529.18640.15.camel@linuxfoundation.org>
	<CA+chaQcH+Sk7G24o3SGSn=Yw=cvStUHXdU+LtC7A0wts0p9Uhw@mail.gmail.com>
	<CAGgRHJpJ87iJzPj3icuxNFxSLvEy5fvp19P1VmbQ9Sq1OR3B1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGgRHJpJ87iJzPj3icuxNFxSLvEy5fvp19P1VmbQ9Sq1OR3B1w@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Will Newton <willn@resin.io>
Subject: Re: [PATCH v7 00/12] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 12:20:04 -0000
X-Groupsio-MsgNum: 102755
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2017 at 04:57:49AM -0700, Matt Madison wrote:
> On Tue, Sep 12, 2017 at 2:58 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Interesting I've seen this issue only for PN-staticdev package
> > ERROR: QA Issue: go-dep-staticdev rdepends on bash, but it isn't a build
> > dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
> >
> > and the bash is already in RDEPENDS (the warning is shown in our builds,
> > because we use busybox as RPROVIDER for bash).
> >
> > So maybe this file isn't always included? Or something else might be
> > non-deterministic.
>=20
> Depends on which patch set you were testing against.  One of the
> recent go.bbclass changes moved the sources from the -staticdev
> package to the -dev package (which is more appropriate, since the
> sources are also the header files).  I thought I had updated the
> go-dep recipe along with that, but I may have missed it.

I was testing only what is currenly in master. I'm sorry if this is new
patchset on top of what was already merged I didn't notice it.

> > On Tue, Sep 12, 2017 at 11:45 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Mon, 2017-09-11 at 15:28 -0300, Otavio Salvador wrote:
> >> > This improves the Go support on OE-Core.
> >> >
> >> > We are trying to port as much as possible work done by Matt on
> >> > meta-golang back to OE-Core and also to avoid carrying old releases
> >> > as
> >> > there is no need to support more versions of Go toolchain.
> >> >
> >> > This fixes issues in existing support as well as add support for SDK
> >> > generation which supports Go.
> >>
> >>
> >> https://autobuilder.yocto.io/builders/nightly-no-x11/builds/471/steps/=
BuildImages/logs/stdio
> >>
> >> ERROR: go-dep-0.3.0-r0 do_package_qa: QA Issue:
> >> /usr/lib/go/src/github.com/golang/dep/vendor/github.com/pelletier/go-t=
oml/test.sh
> >> contained in package go-dep-dev requires /bin/bash, but no providers f=
ound
> >> in RDEPENDS_go-dep-dev? [file-rdeps]
> >> ERROR: go-dep-0.3.0-r0 do_package_qa: QA run found fatal errors. Please
> >> consider fixing them.
> >> ERROR: go-dep-0.3.0-r0 do_package_qa: Function failed: do_package_qa
> >>
> >> Should be easy to fix hopefully!
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbfRfAAKCRA3VSO3ZXaA
HOP6AKCu7dv2tD+jyAOEbp/LlC4Mf+YSHQCgrLMt83ME5LaIso4FVfd7AKs5m2c=
=pJ6A
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
