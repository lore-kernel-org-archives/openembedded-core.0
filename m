Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.24247.1591979158054091894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 09:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YBAlFjU2;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4740; q=dns/txt; s=axis-central1;
  t=1591979158; x=1623515158;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3J+wNwxSdHWgFWARBQ/HdJkVYJ/xRtvC9dThorg8PpU=;
  b=YBAlFjU2TZCpgb0GNLG2r0XK0pGc8m3xJFQkCkff4nytV0+gqjduy0zV
   JF096tehVi/AqTdsbRrs8ueDuOz0jSj30X/EeaX9QgXPBWEYTn4zHawRp
   qnMTrhoVjZEaHBiVeS6Kyva57bQlixUii25+DOkQr2uqlaMh3zTldK2jC
   p6DANhag1AOT6CydKwQN97JennBqai//FHQwgjoPWh6Pc/BL1QJpU7nkC
   aOMG+cwH0/4Ys87cZ8zQspA0yA+/LIlr2LavBqxMDQjVs9GWpulHi52zX
   im1FZnjriQwBWK78BfBl4Yapt0SISDd1lhOJKFdVc7je7GfYxTZGdWHcq
   Q==;
IronPort-SDR: JN1MF3f5fl8LrWm8qP5VkMn/LlwY6WQgROOk0M2knHKc4CIvbyA4jrDx1FYbrQJZwKclFXxyQS
 Hp6bs2WvR7UJLcnZMNq4krv9OA+GNkfZEwdIP0Ezso/FN9BPqU1hEc9HpNpnuqktPyMOeQm77o
 kNmdLhEEOpcbE+wOQGwNQCur3qeOCBnozirxcNxYN+BzFmVFgyMKSsa3SbwUmIURiAyq3FnPQG
 iOpLMkkZUqltI3UwlLag/GD9ag51d5CGj96ooVDYWshcYAOIMhASFNdrR7xFvO6lUgrPzxmgd9
 TJE=
X-IronPort-AV: E=Sophos;i="5.73,504,1583190000"; 
   d="scan'208";a="9757961"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
Thread-Topic: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an
 exception if an empty pkgconfig dir exist
Thread-Index: AQHWCdRlzShdKB7XZ0iWsxM6QnpIZqiJsMGQgDNOC1CAGJjfQA==
Date: Fri, 12 Jun 2020 16:25:55 +0000
Message-ID: <7e09b26e9d4043919fe81a1817947213@XBOX03.axis.com>
References: <20200320180420.32303-1-pkj@axis.com>
 <16025BE698C394B5.19764@lists.openembedded.org>
 <16090558444D87E6.18576@lists.openembedded.org>
 <16130CCABBD4F064.18282@lists.openembedded.org>
In-Reply-To: <16130CCABBD4F064.18282@lists.openembedded.org>
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

*ping* *ping* *ping* *ping*

Ok, it was only two weeks since I pinged this the last time, but=20
since I'm going on vacation in a week I thought I'd give it a shot=20
before then. I am still waiting for any kind of reaction to this=20
patch...

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 28 maj 2020 03:26
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> an exception if an empty pkgconfig dir exist
>=20
> *ping* *ping* *ping*
>=20
> I am not sure why this is being ignored. It is two months since I
> first sent it and the third time I ping it. I have not received any
> objections, yet it has never made it even to master-next as far as
> I know.
>=20
> This should not be taken as a complaint. I know there has been
> problems with the autobuilder and that patch integration has been
> slowed, and during this time all other patches I have sent have
> been applied on the first try. So it just seems to be this one that
> has been left out, and I would like to know if there is a reason or
> if it just has fallen between the cracks.
>=20
> //Peter
>=20
> PS. The patch of course applies to Dunfell now too in addition to
> master and Zeus since it has been released in the meantime.
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 25 april 2020 11:17
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> an exception if an empty pkgconfig dir exist
> >
> > *ping again*
> >
> > //Peter
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > Sent: den 3 april 2020 18:24
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> Avoid an exception if an empty pkgconfig dir exist
> > >
> > > *ping*
> > >
> > > //Peter
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Peter
> Kjellerstedt
> > > > Sent: den 20 mars 2020 19:04
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> an exception if an empty pkgconfig dir exist
> > > >
> > > > Rewrite relocatable_native_pcfiles() so that it can handle that any
> of
> > > > the checked pkgconfig directories are empty without causing an
> > > > exception.
> > > >
> > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > ---
> > > >  meta/classes/relocatable.bbclass | 20 +++++++++++---------
> > > >  1 file changed, 11 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/meta/classes/relocatable.bbclass
> b/meta/classes/relocatable.bbclass
> > > > index 582812c1cf..af04be5cca 100644
> > > > --- a/meta/classes/relocatable.bbclass
> > > > +++ b/meta/classes/relocatable.bbclass
> > > > @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
> > > >      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
> > > >  }
> > > >
> > > > -relocatable_native_pcfiles () {
> > > > -	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> > > > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'),
> d.getVar('libdir') + "/pkgconfig")}
> > > > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
> > > > -	fi
> > > > -	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> > > > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'),
> d.getVar('datadir') + "/pkgconfig")}
> > > > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
> > > > -	fi
> > > > +relocatable_native_pcfiles() {
> > > > +	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> > > > +		files_template=3D${SYSROOT_DESTDIR}$dir/*.pc
> > > > +		# Expand to any files matching $files_template
> > > > +		files=3D$(echo $files_template)
> > > > +		# $files_template and $files will differ if any
> files were found
> > > > +		if [ "$files_template" !=3D "$files" ]; then
> > > > +			rel=3D$(realpath -m --relative-to=3D$dir
> ${base_prefix})
> > > > +			sed -i -e
> "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> > > > +		fi
> > > > +	done
> > > >  }
> > > > --
> > > > 2.21.1
> > >
> > > //Peter

