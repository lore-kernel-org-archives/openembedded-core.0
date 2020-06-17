Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.3279.1592358613781737661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 18:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DYZ7Fu82;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=5455; q=dns/txt; s=axis-central1;
  t=1592358614; x=1623894614;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O8FTHkhK8waIQHmbHmWkVgbftGXZm/LkPI6BAHCW4p8=;
  b=DYZ7Fu82tny5sGu2FD1MQydRVvW61yhgWGmflT3xSR9ZibRzwcG6APf3
   ExuVyUVPzdR3x6oz0Bd91cbrO+fvd4EEYezTSy90foG78FFNbawXEuzkC
   CGS1lkCE517F3IemMRI69yxjg1SB+z/hiaVq62Ko79ENRXIgph9ZB+LOa
   Bg3p84Ti4fJhE2pZ4rDnYmipNw0Ma5gedCz2yxoP9MYTCHtEJvV4uImCL
   VJKqEBN4TB3YB55/fB1TLj+Xac2sl8FpMBdSI5FYI5yFZcvd1gUxo5vVs
   YqSJfKDJvK+o6E55J9RpTFjSzdAHVbO3UhqtmJYCWY0LTl5dwfYUXhGu/
   w==;
IronPort-SDR: CYNBhFokqXRqaV0ZWbNQj4xP0m69zACH5AxGdDebNPphYUdCDSE7g6yJR/abVjmKMzsfCtwbln
 +HCwUzwE+TivRMQnThhmBN+SVXHAc8YtLZHJ1yMIwJzHhUhgX+NRIejuRjKZJWeZbkqe3ko6Dp
 h01fQ4ZbZYYkB7gCxIOizPFzPI8X+2qMWIjKBGuP0Ae3H4MswKYC9amBKCjYu7P/Urq+oa0jfu
 158HD1wC7IlyYHLYZq0jM39rvv8fSt9bryKgLExScjxj97TKq7KDViEHtX1JLhcV8A1MLWs0qW
 vsE=
X-IronPort-AV: E=Sophos;i="5.73,520,1583190000"; 
   d="scan'208";a="9612621"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>, akuster <akuster808@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
Thread-Topic: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an
 exception if an empty pkgconfig dir exist
Thread-Index: AQHWCdRlzShdKB7XZ0iWsxM6QnpIZqiJsMGQgDNOC1CAGJjfQIAG5S5Q
Date: Wed, 17 Jun 2020 01:50:09 +0000
Message-ID: <737d657e7eb7486fa2d0f1dbbbbad07f@XBOX03.axis.com>
References: <20200320180420.32303-1-pkj@axis.com>
 <16025BE698C394B5.19764@lists.openembedded.org>
 <16090558444D87E6.18576@lists.openembedded.org>
 <16130CCABBD4F064.18282@lists.openembedded.org>
 <1617D89C6070B90C.14082@lists.openembedded.org>
In-Reply-To: <1617D89C6070B90C.14082@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This has been integrated to master now (commit f9c5df6d).=20
Please cherry-pick it to Dunfell and Zeus.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 12 juni 2020 18:26
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> an exception if an empty pkgconfig dir exist
>=20
> *ping* *ping* *ping* *ping*
>=20
> Ok, it was only two weeks since I pinged this the last time, but
> since I'm going on vacation in a week I thought I'd give it a shot
> before then. I am still waiting for any kind of reaction to this
> patch...
>=20
> //Peter
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 28 maj 2020 03:26
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> > an exception if an empty pkgconfig dir exist
> >
> > *ping* *ping* *ping*
> >
> > I am not sure why this is being ignored. It is two months since I
> > first sent it and the third time I ping it. I have not received any
> > objections, yet it has never made it even to master-next as far as
> > I know.
> >
> > This should not be taken as a complaint. I know there has been
> > problems with the autobuilder and that patch integration has been
> > slowed, and during this time all other patches I have sent have
> > been applied on the first try. So it just seems to be this one that
> > has been left out, and I would like to know if there is a reason or
> > if it just has fallen between the cracks.
> >
> > //Peter
> >
> > PS. The patch of course applies to Dunfell now too in addition to
> > master and Zeus since it has been released in the meantime.
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > Sent: den 25 april 2020 11:17
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> Avoid
> > an exception if an empty pkgconfig dir exist
> > >
> > > *ping again*
> > >
> > > //Peter
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > Sent: den 3 april 2020 18:24
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> > Avoid an exception if an empty pkgconfig dir exist
> > > >
> > > > *ping*
> > > >
> > > > //Peter
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Peter
> > Kjellerstedt
> > > > > Sent: den 20 mars 2020 19:04
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Subject: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> Avoid
> > an exception if an empty pkgconfig dir exist
> > > > >
> > > > > Rewrite relocatable_native_pcfiles() so that it can handle that
> any
> > of
> > > > > the checked pkgconfig directories are empty without causing an
> > > > > exception.
> > > > >
> > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > > ---
> > > > >  meta/classes/relocatable.bbclass | 20 +++++++++++---------
> > > > >  1 file changed, 11 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/relocatable.bbclass
> > b/meta/classes/relocatable.bbclass
> > > > > index 582812c1cf..af04be5cca 100644
> > > > > --- a/meta/classes/relocatable.bbclass
> > > > > +++ b/meta/classes/relocatable.bbclass
> > > > > @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
> > > > >      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
> > > > >  }
> > > > >
> > > > > -relocatable_native_pcfiles () {
> > > > > -	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> > > > > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'),
> > d.getVar('libdir') + "/pkgconfig")}
> > > > > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> > ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
> > > > > -	fi
> > > > > -	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> > > > > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'),
> > d.getVar('datadir') + "/pkgconfig")}
> > > > > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> > ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
> > > > > -	fi
> > > > > +relocatable_native_pcfiles() {
> > > > > +	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> > > > > +		files_template=3D${SYSROOT_DESTDIR}$dir/*.pc
> > > > > +		# Expand to any files matching $files_template
> > > > > +		files=3D$(echo $files_template)
> > > > > +		# $files_template and $files will differ if any
> > files were found
> > > > > +		if [ "$files_template" !=3D "$files" ]; then
> > > > > +			rel=3D$(realpath -m --relative-to=3D$dir
> > ${base_prefix})
> > > > > +			sed -i -e
> > "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> > > > > +		fi
> > > > > +	done
> > > > >  }
> > > > > --
> > > > > 2.21.1
> > > >
> > > > //Peter

