Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 15C8C6B4BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 13:24:02 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so3746327eek.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=67tUIgONfq9cYIhcE5zg6gewg7SqKpXlGmoJGu8CTlw=;
	b=nWUY7Bo93T0Tf8K9aIKEk6Dv25svEi+YAPh468AUSJuiYN8+jGqW57XdhbxxZA2jZz
	ZmXVx90UqRbgWflEs3/89n76GZn+nYBF+D7pbw28KiBRRprUAiYX2bIRnsg1vyGsFck2
	9ejcXNmb8q5GBZSKi2+g80/z5BiTzizgL5/uRoNaAZYW1tPTjtBq16WRf9UtbJyq6tvs
	wb7ujVSSCeGuHj9EcW9R/qSJsiWFbBw01ZGIKQnWyhd1EmWFltOfCjFSSYtY3h3q8dys
	UW3lsVykTyu+vN6ALr9XBDPmLJgGuzsTzcHGs+SxcpBtzxdtu3I7pIdbkMflYT3IwnHF
	r/Xw==
X-Received: by 10.14.109.1 with SMTP id r1mr969437eeg.32.1384953844602;
	Wed, 20 Nov 2013 05:24:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm59983522eem.21.2013.11.20.05.24.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 05:24:03 -0800 (PST)
Date: Wed, 20 Nov 2013 14:24:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20131120132406.GO3708@jama>
References: <528CA4B0.3060907@topic.nl> <528CA4D3.6020109@topic.nl>
	<20131120122945.GN3708@jama> <528CAEDA.7000107@topic.nl>
MIME-Version: 1.0
In-Reply-To: <528CAEDA.7000107@topic.nl>
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
X-List-Received-Date: Wed, 20 Nov 2013 13:24:03 -0000
X-Groupsio-MsgNum: 47339
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w6U88vdWm8UqIXvc"
Content-Disposition: inline

--w6U88vdWm8UqIXvc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 01:45:14PM +0100, Mike Looijmans wrote:
> =EF=BB=BFOn 11/20/2013 01:29 PM, Martin Jansa wrote:
> > On Wed, Nov 20, 2013 at 01:02:27PM +0100, Mike Looijmans wrote:
> >> =EF=BB=BFOn 11/20/2013 12:09 PM, Mike Looijmans wrote:
> >>> On 11/20/2013 11:38 AM, Martin Jansa wrote:
> >>>> On Wed, Nov 20, 2013 at 11:01:36AM +0100, Mike Looijmans wrote:
> >>>>> =EF=BB=BFI get this error every time I try t build the current oe-c=
ore master:
> >>>>>
> >>>>> ERROR: Checksum failure fetching
> >>>>> https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.ta=
r.xz;downloadfilename=3Dtslib-1.1.tar.xz
> >>>>>
> >>>>> ERROR: Function failed: Fetcher failure for URL:
> >>>>> 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.t=
ar.xz;downloadfilename=3Dtslib-1.1.tar.xz'.
> >>>>>
> >>>>> Checksum mismatch!
> >>>>> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has m=
d5 checksum
> >>>>> d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37e8=
37d was
> >>>>> expected
> >>>>>
> >>>>> Now the weird thing is, that when I fetch the thing using wget, I g=
et ablob
> >>>>> with the right checksum:
> >>>>>
> >>>>> # wget https://github.com/kergoth/tslib/releases/download/1.1/tslib=
-1.1.tar.xz
> >>>>> # md5sum tslib-1.1.tar.xz
> >>>>> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
> >>>>>
> >>>>> Is oe-core using some other flavour of wget or what else could caus=
e this kind
> >>>>> of fetch error?
> >>>>
> >>>> Have you tried to unpack both tarballs and compare content in them?
> >>>
> >>> Nope, I just assumed they're two somewhat different copies of the same
> >>> software (e.g. one of them has a "downloaded from here" remark or so).
> >>> Anything in particular I should look for?
> >
> > Any difference is important, sometimes you can find there HTML code fro=
m some
> > proxy or server which generates HTML page instead of 404 or someone
> > trying to sell you domain of long dead project etc
> >
> >> After upgrading I tried again. The file as downloaded by bitbake is co=
mpletely
> >> empty. Nothing in it. The md5 sum of this empty file is
> >> d41d8cd98f00b204e9800998ecf8427e indeed.
> >>
> >> I'm now using bitbake 1.21.0 (current master) and OE rev
> >> 0eb947454e1c92467283e6f1adeca67c7c57698b to build with, with the above=
 results
> >> still.
> >
> > OK, I was asking mostly because newer bitbake (1.19+ is new enough)
> > renames file with bad checksum, moving corrupted download aside so it
> > doesn't stand in way for new one.
> >
> >> (I know I can just move my own file into the download directory and ge=
t on
> >> with it, but i'd rather actually solve this problem).
> >>
> >> There's a direct connection to the internet, no proxy (just a router) =
that
> >> might have been caching things.
> >>
> >> Any suggestions?
> >
> > Check log.do_fetch in WORKDIR/temp, I'm not sure if the error shows only
> > the original URL or also possible (PRE)MIRROR url from which it could
> > download that empty file.
> >
> > You should see the exact URL in log.do_fetch.
>=20
> The problem seems to be that I am "my own mirror". There's a http server =
that=20
> serves sstate-cache and downloads to the rest of the company. And via an =
NFS=20
> mount, that dir is also linked to my local downloads directory. So bitbak=
e=20
> ended up executing:
>=20
> /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate -O=
=20
> /home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz -P=20
> /home/mike/zynq-next/build/downloads=20
> 'http://192.168.80.24/sources/tslib-1.1.tar.xz'
>=20
> This would create an empty file "tslib-1.1.tar.xz" and the http server ha=
ppily=20
> returns that empty file, and then bitbake thinks it all went well.
>=20
> I removed the link to the NFS mount, and now it works.

If I understand you correctly your DL_DIR and (PRE)MIRROR point to
physically the same directory, correct?

So there is no point to set "duplicate" (PRE)MIRROR on this builder and
then it should work fine.

> Weird that only tslib suffers from this. Then again, it's probably just t=
he=20
> only package that wasn't readily available.
>=20
> Is this my mistake and don't do this again, or should there be some prote=
ction=20
> against fetching your own files? (for example, by NOT using the filename=
=20
> itself as a target, but download with a ".part" extension and then rename=
 when=20
> done. This also helps when multible builds share the download dir).
>=20
> Mike.
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
>=20
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
> Telefax: (+31) - (0)499 - 33.69.70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>=20
> Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitslu=
itend bestemd voor de geadresseerde, zoals die blijkt uit het e-mail berich=
t en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaa=
n. Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, ter=
wijl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseer=
de te ontvangen, wordt u verzocht de afzender hierover direct te informeren=
 en het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de=
 inhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, do=
or een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de eve=
ntueel in het e-mail bericht of de bijlagen voorkomende andere personen. TO=
PIC Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloei=
end uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij b=
ehorende bijlagen.
>=20
> The contents of this message, as well as any enclosures, are addressed pe=
rsonally to, and thus solely intended for the addressee. They may contain i=
nformation regarding a third party. A recipient who is neither the addresse=
e, nor empowered to receive this message on behalf of the addressee, is kin=
dly requested to immediately inform the sender of receipt, and to destroy t=
he message and the enclosures. Any use of the contents of this message and/=
or the enclosures by any other person than the addressee or person who is e=
mpowered to receive this message, is illegal towards the sender and/or the =
aforementioned third party. TOPIC Embedded Systems is not  liable for any d=
amage as a result of the use and/or acceptance of this message and as well =
as any enclosures.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w6U88vdWm8UqIXvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKMt/YACgkQN1Ujt2V2gBxTNACeNVjeqNAN0O/Aj+WMatkK7x4y
E+UAoJtoIwBxFwsNfoywoO+N6FmHqfsp
=spN1
-----END PGP SIGNATURE-----

--w6U88vdWm8UqIXvc--
