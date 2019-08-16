Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9231A7F340
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:22:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v15so4624183wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=34ECVtM9Xu9mPwQEVXY2uAF/FRuk7hvzbJEvB0rjMLI=;
	b=MfbeHY00W1ZOEPgTDtxU3K3VxsD46HPtKcF9PTpaYUzVPPcNvnWWTAi1RriwWbF2Xn
	rNH/BW45u7oYg1EhmUGJwYSIFnJuKPkvxt9LI6okpzcCpKiveeaMaqh1H5MTXlDniN2H
	oMuj/au5YAQDFHK165DD4ScKuXRtyksPve+kSuJenCoWlGi5JHOE71NJ6ehazEVOcjBt
	sjaaw58KsiyB6UXoX0rUsjgDOpbO5d8G8aiD/YxEZkzbgG4sVUBFBnRh2nNnVjBGgLjk
	/gYhmCTomdc0zOVOFitD121jVrwNnFsMHckw3lN1neBbBoZjTliETC80cc9tiW2XFZpL
	QgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=34ECVtM9Xu9mPwQEVXY2uAF/FRuk7hvzbJEvB0rjMLI=;
	b=pDtsGhc1pN+/16w4cTKMknX7lfDCzi//n15Gep9xn/xmLypZV0cVqy8S7HX2Qgbgjm
	AAIotVBUsbUvT6N46UpHXLHwCkS5UQHu195vItoM4Rhv0Un2JFz860bcI1twaALicfPI
	OgqkKn7yXXEYQRvPkOz2iXVwlxg7K95jYLLElUGw1TBVRUisr/YhT8cGFywiaHUa/KJr
	eevZN/HVCL0TjAYQettsuXP1obCmiTGlowqWLy9+sctsjRIt0HTW6lfWOc5J6Oabcb4j
	77aJSVYZbXmVdRLYSKasU0YrT17nO6Ffe2jNGvac3FMmpcO04ukyQog5SXnym3Z0DVEx
	kzZw==
X-Gm-Message-State: APjAAAWtAi90sUjTOYkvhOgfB6+tAviaQb9fAZ7+S1SEn16JpCIq4ALj
	myktzWunPZs7r2i60/nEuI0=
X-Google-Smtp-Source: APXvYqyS0N3+jl5Ae4fFhktaYyixM7dIJH2fEbRCYRza9REPC3LtqvmQ5tWS/qdVnb1ShaZAI29eCA==
X-Received: by 2002:a05:600c:299:: with SMTP id
	25mr3550191wmk.80.1565976168109; 
	Fri, 16 Aug 2019 10:22:48 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	q19sm3597411wmc.41.2019.08.16.10.22.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 10:22:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 16 Aug 2019 19:22:55 +0200
To: richard.purdie@linuxfoundation.org
Message-ID: <20190816172255.GC1515@jama>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<20190815150548.GA1515@jama> <20190816102441.GB1515@jama>
	<CA+chaQdS_QHpe2jmr6Epqc_CBBHTwbtA5beg1rjD4kwMHbhycA@mail.gmail.com>
	<cad2ebcaf8102857799d0c0a3e921b04348c8515.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <cad2ebcaf8102857799d0c0a3e921b04348c8515.camel@linuxfoundation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Fri, 16 Aug 2019 17:22:47 -0000
X-Groupsio-MsgNum: 127971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline

--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 04:54:48PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Fri, 2019-08-16 at 17:00 +0200, Martin Jansa wrote:
> > > Will try to bump BB_NUMBER_THREADS from 8 to 72.
> >=20
> > I've tried to remove icecc.bbclass inherit (because it does things
> > while parsing and RP probably doesn't have it inherited), but that
> > didn't save much time.
> >=20
> > All 3 tests were with bitbake
> > 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7
> > 94m19.081s  8 BB_NUMBER_THREADS and icecc
> > 82m59.574s  8 BB_NUMBER_THREADS no icecc
> > 68m3.556s    72 BB_NUMBER_THREADS no icecc
> >=20
> > Still don't know how to get to sub 10min world runs RP was seeing,
> > but at least it's as slow as it was before runqeueu changes (or even
> > a bit faster in lastest master).
>=20
> Just thinking out loud, other things which can influence timings:
>=20
> Is SSTATE_DIR on NFS or local disk?

SSTATE_DIR is empty directory on local disk
/dev/mapper/vg00-jenkins on /jenkins type ext4 (rw,noatime,nobarrier,commit=
=3D6000,stripe=3D128,data=3Dordered)

> Are sstate mirrors configured?

None, normally I have SSTATE_MIRRORS over sshfs in this case, but I've
removed it before any performance testing.

> Is there an existing build or not, if so, how much is valid?

Nothing, I remove whole TMPDIR and cache before each run. Then let it
recreate the cache before starting the profile:
bitbake -p; time bitbake world -P -n

> Underlying filesystem of the build?

ext4, everything is pretty much generic Ubuntu 18.04

There is plenty of ram, I'll try to test this from tmpfs as well.

> Your build seems especially slow at executing through the tasks which
> is effectively a test on how fast the system can fork() and return in
> some ways. It would be interesting to block dry-run on the server side,
> skip the fork and see how the numbers compare.

As discussed on IRC, it's slower than yours (8 minutes from 68), but the
most significant chunk of time is lost somewhere else.

> My build manages some parts of the tasklist faster than others, perhaps
> because there are more "free" tasks to execute at some points in the
> task graph than others.
>=20
> Also, I have some patches which improve performance a bit which I'm
> still testing.

Thanks for all the work on this!

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXVbmbgAKCRA3VSO3ZXaA
HFY6AJ0R2TwB+6pzUzDzgIvdzxKqbK9YTgCgo62ArsRQtVWbpUwQtqNFULlmnWU=
=nDe2
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
