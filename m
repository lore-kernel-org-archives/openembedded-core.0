Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2D49B6AB67
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 15:18:33 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so3720209eaj.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 07:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VuUMrtWBg1jJrDDLn6BZUkOoDAhj8MObsBEQyEjCAfY=;
	b=jNMUpVNPNSHDAVScjOpYT0jb33QEk9T9KV+I6/PiDaGKolwzkaw9xVqjrCCRWJv6tB
	pkfx8Hjc3RnAAjMhFxighV/yM79bUUcyDOEXbq3qWLRTBKc3PzLXYD1bF7g6QVTmZ7J2
	UTCVbPbn/ThEjPzfmg4H8IghvyjS0kpaM07u4xPEMNe36IihVjqu/RhR2zG51JtYM36K
	YGN+sqCYeiRgouq/YIgi0Cerrf+UEO2iTbTVFecotDbPGCtcZhrjQRrKHMEZwH1IoCMv
	3o18Z0BfEIs/7Dmr7+AKfJfmpSXzlcHCmCfm1wdTfw4T9yvLgakJ0pWnnmjNgklCQ3vr
	tkzA==
X-Received: by 10.14.98.5 with SMTP id u5mr1490046eef.69.1384960714518;
	Wed, 20 Nov 2013 07:18:34 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm61075097eem.9.2013.11.20.07.18.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 07:18:33 -0800 (PST)
Date: Wed, 20 Nov 2013 16:18:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131120151836.GP3708@jama>
References: <528CA4B0.3060907@topic.nl> <528CA4D3.6020109@topic.nl>
	<20131120122945.GN3708@jama> <528CAEDA.7000107@topic.nl>
	<1384955025.16887.57.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1384955025.16887.57.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 20 Nov 2013 15:18:33 -0000
X-Groupsio-MsgNum: 47342
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OmL7C/BU0IhhC9Of"
Content-Disposition: inline

--OmL7C/BU0IhhC9Of
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 01:43:45PM +0000, Richard Purdie wrote:
> On Wed, 2013-11-20 at 13:45 +0100, Mike Looijmans wrote:
> > =EF=BB=BFOn 11/20/2013 01:29 PM, Martin Jansa wrote:
> > > On Wed, Nov 20, 2013 at 01:02:27PM +0100, Mike Looijmans wrote:
> > >> =EF=BB=BFOn 11/20/2013 12:09 PM, Mike Looijmans wrote:
> > >>> On 11/20/2013 11:38 AM, Martin Jansa wrote:
> > >>>> On Wed, Nov 20, 2013 at 11:01:36AM +0100, Mike Looijmans wrote:
> > >>>>> =EF=BB=BFI get this error every time I try t build the current oe=
-core master:
> > >>>>>
> > >>>>> ERROR: Checksum failure fetching
> > >>>>> https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.=
tar.xz;downloadfilename=3Dtslib-1.1.tar.xz
> > >>>>>
> > >>>>> ERROR: Function failed: Fetcher failure for URL:
> > >>>>> 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1=
=2Etar.xz;downloadfilename=3Dtslib-1.1.tar.xz'.
> > >>>>>
> > >>>>> Checksum mismatch!
> > >>>>> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has=
 md5 checksum
> > >>>>> d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37=
e837d was
> > >>>>> expected
> > >>>>>
> > >>>>> Now the weird thing is, that when I fetch the thing using wget, I=
 get ablob
> > >>>>> with the right checksum:
> > >>>>>
> > >>>>> # wget https://github.com/kergoth/tslib/releases/download/1.1/tsl=
ib-1.1.tar.xz
> > >>>>> # md5sum tslib-1.1.tar.xz
> > >>>>> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
> > >>>>>
> > >>>>> Is oe-core using some other flavour of wget or what else could ca=
use this kind
> > >>>>> of fetch error?
> > >>>>
> > >>>> Have you tried to unpack both tarballs and compare content in them?
> > >>>
> > >>> Nope, I just assumed they're two somewhat different copies of the s=
ame
> > >>> software (e.g. one of them has a "downloaded from here" remark or s=
o).
> > >>> Anything in particular I should look for?
> > >
> > > Any difference is important, sometimes you can find there HTML code f=
rom some
> > > proxy or server which generates HTML page instead of 404 or someone
> > > trying to sell you domain of long dead project etc
> > >
> > >> After upgrading I tried again. The file as downloaded by bitbake is =
completely
> > >> empty. Nothing in it. The md5 sum of this empty file is
> > >> d41d8cd98f00b204e9800998ecf8427e indeed.
> > >>
> > >> I'm now using bitbake 1.21.0 (current master) and OE rev
> > >> 0eb947454e1c92467283e6f1adeca67c7c57698b to build with, with the abo=
ve results
> > >> still.
> > >
> > > OK, I was asking mostly because newer bitbake (1.19+ is new enough)
> > > renames file with bad checksum, moving corrupted download aside so it
> > > doesn't stand in way for new one.
> > >
> > >> (I know I can just move my own file into the download directory and =
get on
> > >> with it, but i'd rather actually solve this problem).
> > >>
> > >> There's a direct connection to the internet, no proxy (just a router=
) that
> > >> might have been caching things.
> > >>
> > >> Any suggestions?
> > >
> > > Check log.do_fetch in WORKDIR/temp, I'm not sure if the error shows o=
nly
> > > the original URL or also possible (PRE)MIRROR url from which it could
> > > download that empty file.
> > >
> > > You should see the exact URL in log.do_fetch.
> >=20
> > The problem seems to be that I am "my own mirror". There's a http serve=
r that=20
> > serves sstate-cache and downloads to the rest of the company. And via a=
n NFS=20
> > mount, that dir is also linked to my local downloads directory. So bitb=
ake=20
> > ended up executing:
> >=20
> > /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate -=
O=20
> > /home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz -P=20
> > /home/mike/zynq-next/build/downloads=20
> > 'http://192.168.80.24/sources/tslib-1.1.tar.xz'
> >=20
> > This would create an empty file "tslib-1.1.tar.xz" and the http server =
happily=20
> > returns that empty file, and then bitbake thinks it all went well.
> >=20
> > I removed the link to the NFS mount, and now it works.
> >=20
> > Weird that only tslib suffers from this. Then again, it's probably just=
 the=20
> > only package that wasn't readily available.
> >=20
> > Is this my mistake and don't do this again, or should there be some pro=
tection=20
> > against fetching your own files? (for example, by NOT using the filenam=
e=20
> > itself as a target, but download with a ".part" extension and then rena=
me when=20
> > done. This also helps when multible builds share the download dir).
>=20
> We certainly don't support circular references like this. As you
> mention, we can work around some parts with the .part approach but for
> things like git repositories for example things are much harder to
> ensure they work.
>=20
> I'm not even sure how we'd detect this kind of situation to be honest,
> I'm open to ideas though.
>=20
> Sharing a "live" DL_DIR is probably a bad idea as files may be
> incomplete, etc. The checksums do at least help catch most of the
> problems.

Aren't .lock and .done stampfiles supposed to prevent downloading
incomplete files when it's shared over NFS between multiple builders?

I haven't tried it in practise yet, but I was planing to convert all our
jenkins builders to share common live DL_DIR/SSTATE_DIR, so that first
builder to fetch or build something saves the work for other slaves.

I know that especially for sstate archives it could be too late when 2
builders are already in runqueue phase, but still it could be a bit
sooner than waiting for whole build to finish and rsync
DL_DIR/SSTATE_DIR after the build.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OmL7C/BU0IhhC9Of
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKM0swACgkQN1Ujt2V2gBwUIgCeOvseJzG/0jq2e7zGDZUVwPCv
GsAAnjvpPELQH6WLyHxOF2TYJwnrd5hN
=ly2Z
-----END PGP SIGNATURE-----

--OmL7C/BU0IhhC9Of--
