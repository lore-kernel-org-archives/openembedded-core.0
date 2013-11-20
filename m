Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D05396D59C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 12:29:41 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2752361eei.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 04:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5tI2OsM8F5n2AIKjOo3Nq6TjjFqveJJJI65rFhrYUlA=;
	b=q0J2sdEDTs7jzbN3Mx92r58jVArzMq4zA0+8q+das1INc0yN4T6UZfBgNqGKPmVip+
	mP7bDXpeJwYr3jw/7O0jBjg0lfr4Uz/suvIjBqwDvPOMLktjUVRXhomo6uebp+5IpRXp
	9MkM7fyXJY9zHzZ8tThDB7Hqu5nvNFc+Tpx9Rbd7pJsYKzSuzNeRqVedY6Xl1xJbXtGn
	1XKf4jBmDsUs7whGvhl/9OEXdSldcbZ0QbZWGB30mX/kpHv3oMkpmjamJlHBaQ6vNNoI
	xjqUHzZxpsEgcRQw/wm2HY3GycSApF+cE9xaafia03dXzA9JECFJTsqaEwbEfFsgn7If
	bDIA==
X-Received: by 10.14.211.69 with SMTP id v45mr451216eeo.75.1384950583029;
	Wed, 20 Nov 2013 04:29:43 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm59368165eeh.8.2013.11.20.04.29.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 04:29:42 -0800 (PST)
Date: Wed, 20 Nov 2013 13:29:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20131120122945.GN3708@jama>
References: <528CA4B0.3060907@topic.nl>
 <528CA4D3.6020109@topic.nl>
MIME-Version: 1.0
In-Reply-To: <528CA4D3.6020109@topic.nl>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: tslib keeps failing on checksum
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
X-List-Received-Date: Wed, 20 Nov 2013 12:29:42 -0000
X-Groupsio-MsgNum: 47333
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IoFIGPN1N3g1Ryqz"
Content-Disposition: inline

--IoFIGPN1N3g1Ryqz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 01:02:27PM +0100, Mike Looijmans wrote:
> =EF=BB=BFOn 11/20/2013 12:09 PM, Mike Looijmans wrote:
> > On 11/20/2013 11:38 AM, Martin Jansa wrote:
> >> On Wed, Nov 20, 2013 at 11:01:36AM +0100, Mike Looijmans wrote:
> >>> =EF=BB=BFI get this error every time I try t build the current oe-cor=
e master:
> >>>
> >>> ERROR: Checksum failure fetching
> >>> https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.=
xz;downloadfilename=3Dtslib-1.1.tar.xz
> >>>
> >>> ERROR: Function failed: Fetcher failure for URL:
> >>> 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar=
=2Exz;downloadfilename=3Dtslib-1.1.tar.xz'.
> >>>
> >>> Checksum mismatch!
> >>> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has md5=
 checksum
> >>> d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37e837=
d was
> >>> expected
> >>>
> >>> Now the weird thing is, that when I fetch the thing using wget, I get=
 ablob
> >>> with the right checksum:
> >>>
> >>> # wget https://github.com/kergoth/tslib/releases/download/1.1/tslib-1=
=2E1.tar.xz
> >>> # md5sum tslib-1.1.tar.xz
> >>> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
> >>>
> >>> Is oe-core using some other flavour of wget or what else could cause =
this kind
> >>> of fetch error?
> >>
> >> Have you tried to unpack both tarballs and compare content in them?
> >
> > Nope, I just assumed they're two somewhat different copies of the same
> > software (e.g. one of them has a "downloaded from here" remark or so).
> > Anything in particular I should look for?

Any difference is important, sometimes you can find there HTML code from so=
me
proxy or server which generates HTML page instead of 404 or someone
trying to sell you domain of long dead project etc

> After upgrading I tried again. The file as downloaded by bitbake is compl=
etely
> empty. Nothing in it. The md5 sum of this empty file is
> d41d8cd98f00b204e9800998ecf8427e indeed.
>=20
> I'm now using bitbake 1.21.0 (current master) and OE rev
> 0eb947454e1c92467283e6f1adeca67c7c57698b to build with, with the above re=
sults
> still.

OK, I was asking mostly because newer bitbake (1.19+ is new enough)
renames file with bad checksum, moving corrupted download aside so it
doesn't stand in way for new one.

> (I know I can just move my own file into the download directory and get on
> with it, but i'd rather actually solve this problem).
>=20
> There's a direct connection to the internet, no proxy (just a router) that
> might have been caching things.
>=20
> Any suggestions?

Check log.do_fetch in WORKDIR/temp, I'm not sure if the error shows only
the original URL or also possible (PRE)MIRROR url from which it could
download that empty file.

You should see the exact URL in log.do_fetch.

You can also check for (PRE)MIRROR usage in bitbake -e tslib output
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IoFIGPN1N3g1Ryqz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKMqzkACgkQN1Ujt2V2gBzdDgCfReqXIb/J+NFMOkMTvChubnjO
XIcAoIiZq8lfeBb7yRlrKSJ8itnNU7+4
=hdih
-----END PGP SIGNATURE-----

--IoFIGPN1N3g1Ryqz--
