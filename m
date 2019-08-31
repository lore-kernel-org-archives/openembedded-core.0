Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF0347E9CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 11:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0338B1832D;
	Sat, 31 Aug 2019 13:00:18 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id c0zKlahpDs0w; Sat, 31 Aug 2019 13:00:17 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 047FE182EC;
	Sat, 31 Aug 2019 13:00:17 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E11C41A060;
	Sat, 31 Aug 2019 13:00:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D55F81A05F;
	Sat, 31 Aug 2019 13:00:16 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 31 Aug 2019 13:00:16 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id C6ED426B9;
	Sat, 31 Aug 2019 13:00:16 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Sat, 31 Aug 2019 13:00:16 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 31 Aug 2019 13:00:16 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1395.000; Sat, 31 Aug 2019 13:00:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>, Andrey Zhizhikin <andrey.z@gmail.com>
Thread-Topic: [OE-core] FETCHCMD drop breaks build when append is used (from
	patch b259bd31eb)
Thread-Index: AQHVXxr8lR6BLYkSkk+HiB+pgGJiAKcTohmAgAF0RsA=
Date: Sat, 31 Aug 2019 11:00:16 +0000
Message-ID: <eff34d1d857a47ab9a902eafcea2d733@XBOX04.axis.com>
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
	<CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
In-Reply-To: <CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: FETCHCMD drop breaks build when append is used (from	patch b259bd31eb)
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
X-List-Received-Date: Sat, 31 Aug 2019 11:00:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Andre McCurdy
> Sent: den 30 augusti 2019 16:41
> To: Andrey Zhizhikin <andrey.z@gmail.com>
> Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] FETCHCMD drop breaks build when append is used
> (from patch b259bd31eb)
>=20
> On Fri, Aug 30, 2019 at 3:08 AM Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> >
> > Hello Andre,
> >
> > I've just pulled the master and experienced a build failure during
> > fetching of updated recipe's source tarballs.
> >
> > The reason for this being that defaults for FETCHCMD has been dropped
> > with your patch b259bd31eb from the series. Once defaults are removed
> > and appends are used - the FETCHCMD gets defined to the value listed
> > in append, which normally does not contain a command itself rather
> > than necessary additional parameters (like user/passwd if working
> with
> > local pre-mirror servers).
>=20
> I think for the specific case of usernames and passwords the advice
> would be to put them in .netrc etc rather than trying to append to the
> fetcher command lines (but mainly for security reasons rather than
> this issue).
>=20
> > This patch would also break several other recipes which are using
> > appends to FETCHCMD, for example for FETCHCMD_wget the libedit would
> > fail since it appends the wget to use different User-Agent.
> >
> > I've copied Raj here since he introduced this recipe in the form it
> is
> > and would definitely break.
> >
> > Can you please have a look at this and advise on how one can continue
> > to use the FETCHCMD appends for the future?
>=20
> One answer could be that modifications of the fetcher command lines
> should be done by completely defining them rather than appending. I'm
> not sure how reasonable that is though.
>=20
> In the end the approach to fixing this depends on whether appending to
> the default fetcher commands is considered valid usage or not... and I
> don't know the answer to that.
>=20
> > For now, I've defined the FETCHCMD_wget in my local.conf but I do not
> > believe that this is the general way everyone should follow if they
> > would need to append fetcher commands...
> >
> > Thanks a lot!
> >
> > --
> > Regards,
> > Andrey.

Given that the libedit recipe in OE-Core does:

FETCHCMD_wget +=3D "-U bitbake"

someone will probably have to do something about this...

One can also note that wget.py and npm.py will now use different arguments=
=20
to wget after the default was removed from bitbake.conf (the difference=20
being the added use of -nv in npm.py so nothing major, but still...)

//Peter


