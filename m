Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C79797746D;
	Fri, 10 Feb 2017 16:26:38 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v77so52673627wmv.0;
	Fri, 10 Feb 2017 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=h86l5zLmpOk4XAO075DZcQbR6kxb39gmFqbwR8HrxSk=;
	b=Y91nGvdJIKR6w4fV2KuEYq5oRiZfQ+8OKUQbrm7qzmytPh78eh/3W5JquOGaA6iDkz
	725MiJ5PUjIa9qH2ai1r4oyYJW2vN+McAoacj+hdYaMWpIOHOoWx0HMTnJ16H7AIpIR1
	J/atJKKRs4VIo1+RqQxCawj1ERIHuTuEMY8RjNLaGwGyAserqZS1yZhc165gOE0wLdaG
	oYjrWb0fIfNQ+046WaMx34H3vjxhPWLQU4LmOlveSXW52c1lqAqNwdkF4ezZ2EXv5Ae6
	Iv6KYsw0RVlJu/lhwt+5LNKIItsoX2PoUapcTLl7Bzy/5dHQ9SxNmlsWawmlIhQShPXJ
	axkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=h86l5zLmpOk4XAO075DZcQbR6kxb39gmFqbwR8HrxSk=;
	b=Pqqya/huo7rIALl9kNVab/g5LG34D+otBTz6JAg7r7EujtrXbprvCZIeBjdSYYq0tF
	vODWoQNujzlzdJ19BHrb6Cj4EYfUKlSUCDQKOgr2jMVKqmmtx2MfflMyyUTrHxzf7j5H
	4TGIZtSkD4LVtZ2F+LnfhOQlpL3RYO8/6JJH+z2VEdw5hOt5C+QL3qmlGnuz4H4w5mfG
	S+ozTBf7D0Mq/UnW2IjQTSwP6K1C5exsRsAFiWpRzLX7CA2muhRkPpHdudgqe3d+GtpQ
	PYSfw6OWBkDUVzhuoMEHyHLeFBFIDP9ggDUhyRNuuEaE9hmu1Rq40KAsf5SHbuOeiJZv
	lJLg==
X-Gm-Message-State: AMke39ltgL1gTxD/VaVSAYhiYtQM2Tuh2kvqaPFzvejxYFNXvLySvUlInUhKvHJ5sZXCag==
X-Received: by 10.28.170.213 with SMTP id t204mr26172286wme.29.1486743998095; 
	Fri, 10 Feb 2017 08:26:38 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id g6sm532747wmc.30.2017.02.10.08.26.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Feb 2017 08:26:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Feb 2017 17:26:37 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170210162637.GB3021@jama>
References: <20170210082811.GA3021@jama>
MIME-Version: 1.0
In-Reply-To: <20170210082811.GA3021@jama>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: State of bitbake world, Failed tasks 2017-02-08
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
X-List-Received-Date: Fri, 10 Feb 2017 16:26:45 -0000
X-Groupsio-MsgNum: 93176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 09:28:11AM +0100, Martin Jansa wrote:
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed de=
pencencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||=
min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	=
||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	|=
|unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgnam=
e	||=09
> |-
> ||2017-02-08	||96	||100	||100	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0=
		||0		||2		||0		||6		||36		||0		||0		||0		||0		||0		||0		||=09
> |}

During this weekend I plan to start adding PNBLACKLISTs to failed recipes.

With this number of failures the builds don't help to spot new issues.

If you care about some of the listed recipes, please send patches or at
least send e-mail saying that you plan to fix them soonish.

Many of these failures aren't hard to fix, I have already fixed all
recipes I care about (which are included in some images I'm building),
but I don't want to spend more time fixing (or even building) recipes
nobody uses (or cares about).

If you don't send the fixes before Sunday evening, than no big deal,
you will just need to update commit with the fix to also remove the
PNBLACKLIST from the recipe before sending it to ML.

Regards,

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJ3pvAAKCRA3VSO3ZXaA
HINuAKClWrzUJxpifAfVQTYbCiatAJyTxACcDQGHk7W25O+04Gi9ZpW3AokdV9E=
=1S5H
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
