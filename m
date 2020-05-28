Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3739.1590629156936050920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 18:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=O14hSPrj;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3951; q=dns/txt; s=axis-central1;
  t=1590629157; x=1622165157;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HcNdqEWjDKt0immFODq1BfzKkQT5aNANhhiUXL5Wed0=;
  b=O14hSPrjkZc9rD7QO9MNHU4lfwucF1n05hBfQtPszgYDylFEeWf62omA
   LZI0/1uQJVbDVfkw8EDRpH+sIOjYPMdea4+DjXl3bBpllBUw575LbzOT9
   uDu3X2xoKedkuVg8dxIzi3PZQfbIxpz0daQmaFa4B220xRkaRdHI+KMsz
   2/WN/Annq3KBi+E8/v6WVAOskato45w1ePNSnrC6nD7wywCBoNj5Cq7Vp
   DfIvKokIy1AlJhePLGYdgIOC+SBAmZjK3vOxnbsXzFimr3scJ5v6VbS//
   CyUzHQMf560OqqmamwyaGC7HTTBFPBwS8yPQZoMENJx6aWbmTXKkMfNJC
   Q==;
IronPort-SDR: tZky7ItaRfnEtRa0adLKV89hiDmJRH4axcbUuG6gZToFn9BJH6yRoCvFuDelzBR+sMfr0g4Cxo
 6ICTT7qBIwQZNbyrTOcl/J9Z4Epyu/OcB7wuLy75auMO33GCEpCGkkPITKppknfDGAgcfMMOnc
 DAbRTKKgnSp5ojE+f0DQbXcqE9Urr/nFOEFwupISpE9pJ9lxtb87LWQwyQ4lque2HDMy83/jFW
 7qsB9x53imL/vHvbMSyhzNV2CO0ENOBNwlTGbHw2zY3inTFlisjRER5PLIZvHdaqwn2ylDRQWN
 m4s=
X-IronPort-AV: E=Sophos;i="5.73,443,1583190000"; 
   d="scan'208";a="9190665"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
Thread-Topic: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an
 exception if an empty pkgconfig dir exist
Thread-Index: AQHWCdRlzShdKB7XZ0iWsxM6QnpIZqiJsMGQgDNOC1A=
Date: Thu, 28 May 2020 01:25:51 +0000
Message-ID: <9c968d407ae44858ab74bb766b5f7c13@XBOX03.axis.com>
References: <20200320180420.32303-1-pkj@axis.com>
 <16025BE698C394B5.19764@lists.openembedded.org>
 <16090558444D87E6.18576@lists.openembedded.org>
In-Reply-To: <16090558444D87E6.18576@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.15]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping* *ping* *ping*

I am not sure why this is being ignored. It is two months since I=20
first sent it and the third time I ping it. I have not received any=20
objections, yet it has never made it even to master-next as far as=20
I know.=20

This should not be taken as a complaint. I know there has been=20
problems with the autobuilder and that patch integration has been=20
slowed, and during this time all other patches I have sent have=20
been applied on the first try. So it just seems to be this one that=20
has been left out, and I would like to know if there is a reason or=20
if it just has fallen between the cracks.

//Peter

PS. The patch of course applies to Dunfell now too in addition to=20
master and Zeus since it has been released in the meantime.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 25 april 2020 11:17
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid a=
n exception if an empty pkgconfig dir exist
>=20
> *ping again*
>=20
> //Peter
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 3 april 2020 18:24
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid=
 an exception if an empty pkgconfig dir exist
> >
> > *ping*
> >
> > //Peter
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org <openembedded-=
core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > Sent: den 20 mars 2020 19:04
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid a=
n exception if an empty pkgconfig dir exist
> > >
> > > Rewrite relocatable_native_pcfiles() so that it can handle that any o=
f
> > > the checked pkgconfig directories are empty without causing an
> > > exception.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  meta/classes/relocatable.bbclass | 20 +++++++++++---------
> > >  1 file changed, 11 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocata=
ble.bbclass
> > > index 582812c1cf..af04be5cca 100644
> > > --- a/meta/classes/relocatable.bbclass
> > > +++ b/meta/classes/relocatable.bbclass
> > > @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
> > >      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
> > >  }
> > >
> > > -relocatable_native_pcfiles () {
> > > -	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> > > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir=
') + "/pkgconfig")}
> > > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDI=
R}${libdir}/pkgconfig/*.pc
> > > -	fi
> > > -	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> > > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadi=
r') + "/pkgconfig")}
> > > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDI=
R}${datadir}/pkgconfig/*.pc
> > > -	fi
> > > +relocatable_native_pcfiles() {
> > > +	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> > > +		files_template=3D${SYSROOT_DESTDIR}$dir/*.pc
> > > +		# Expand to any files matching $files_template
> > > +		files=3D$(echo $files_template)
> > > +		# $files_template and $files will differ if any files were found
> > > +		if [ "$files_template" !=3D "$files" ]; then
> > > +			rel=3D$(realpath -m --relative-to=3D$dir ${base_prefix})
> > > +			sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> > > +		fi
> > > +	done
> > >  }
> > > --
> > > 2.21.1
> >
> > //Peter

