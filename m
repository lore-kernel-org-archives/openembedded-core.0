Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6A4C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 11:19:27 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.10190.1636024765920823197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OtkEINt9;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636024766;
  x=1667560766;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oK96iUvU22861SlWjxZaxmD8Kyo5kcoGAUSx2EmwBn4=;
  b=OtkEINt9rlC9c02YCjc8ic9ii/OF89hO+i0VchDFvIFfB7aZ9uijS707
   mPkh5ajAV1XvU3DAtNnYyKx0uSBd+SusXV/jtZTwab+BhaQCL88PSreK6
   9QAIW9NlN6PaWeqQaTIIHQLBxakIch9/wlxdVKrqwXKi4WMJGbXETs3p8
   Pgpn5aMznAR3Hf8bU7f7982WkZbCXlNqnODhfDcejUJ6xN7Pw5ZSHuD4+
   2ev2N5K1qd4D4FbNFpKDBrFG3RsDulCOjy2W0C1iSIMyJy+Fv962eDsrE
   1AUycUKhQlHO2jfeuCFxx6LVWt5JPspw6bqTsdA+JmJDJws0q9fK6s6xu
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
 license
Thread-Topic: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
 license
Thread-Index: AQHXoBdRHylTpuQRkUCaM9wiRafn0Kvo5DXwgAq2/sA=
Date: Thu, 4 Nov 2021 11:19:22 +0000
Message-ID: <ce5f46365f6d4d38a6017b04ee1564f0@axis.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
 <20210902162435.1375245-11-ross.burton@arm.com>
 <16B23C3CDA8BCB16.30289@lists.openembedded.org>
In-Reply-To: <16B23C3CDA8BCB16.30289@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 11:19:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157841

Ross: any comment to my question below?

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 28 oktober 2021 17:44
> To: Ross Burton <ross@burtonini.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
> license
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Ross Burton
> > Sent: den 2 september 2021 18:25
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
> > license
> >
> > "BSD" is ambiguous, use the precise licenses BSD-2-Clause BSD-4-Clause.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.b=
b
> > b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > index 7519b4c018d..e53ccc6aea8 100644
> > --- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > +++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > @@ -8,7 +8,7 @@ python () {
> >
> >  require xorg-lib-common.inc
> >
> > -LICENSE =3D "MIT & MIT-style & BSD"
> > +LICENSE =3D "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
>=20
> Why is this marked as BSD-4-Clause? Looking at the COPYING file and
> searching the code I can find no trace of any license text with the
> advertising clause from BSD-4-Clause. What am I missing?
>=20
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D172255dee66bb0151435b2d5d709fcf7"
> >
> >  SRC_URI[md5sum] =3D "c5fa5a86a20e3591bed6c046498d4b8f"
> > --
> > 2.25.1
>=20
> //Peter

//Peter


