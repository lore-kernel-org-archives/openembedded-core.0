Received: from mailout07.rmx.de (mailout07.rmx.de [94.199.90.95])
 by mx.groups.io with SMTP id smtpd.web12.2859.1594285384338444360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 02:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.95, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout07.rmx.de (Postfix) with ESMTPS id 4B2VZC6dx7zBwlL;
	Thu,  9 Jul 2020 11:02:59 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B2VZ90k6Bz2xGF;
	Thu,  9 Jul 2020 11:02:57 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.146) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 9 Jul
 2020 11:02:56 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] license.manifest misses header-only libraries
Date: Thu, 9 Jul 2020 11:02:56 +0200
Message-ID: <3088893.YUjuDaUgfW@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <87ad1d67a94200b7cafd75a88661814037fcf393.camel@linuxfoundation.org>
References: <15493295.j7L6bUlEPz@n95hx1g2> <87ad1d67a94200b7cafd75a88661814037fcf393.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.146]
X-RMX-ID: 20200709-110257-4B2VZ90k6Bz2xGF-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 8. Juli 2020, 18:19:24 CEST schrieb Richard Purdie:
> On Wed, 2020-07-08 at 17:48 +0200, Christian Eggers wrote:
> > [...]
> > Is there a reliable way to get the header-only/static libraries into
> > the manifest file?
>
> The image manifest is a list of the things actually shipping in the
> image and their corresponding licenses. Most images don't ship
> development headers so they'll not be included there.
I'm more focusing on the (empty) main packages, not the -dev
packages with the header files.

> You can certainly get a list of everything used during the build
> instead. I'm not sure how you'd decide that a set of headers were used
> or not, compared to say the cross toolchain binaries or a native tool
> though so anything in between these two is harder.
I suppose that the "archiver" class already tracks everything which has bee=
n
used for building. But I'm only looking for licenses which are distributed
with my binary embedded software

> There is some work I did a while back which traces all SPDX identifiers
> referenced by debug symbols in the code to better audit license
> information but the lack of SPDX headers in much of the code we use
> makes that less useful right now.
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Drpurdie/licens=
e-exp
> eriments-osls (and a presentation/slides at OSLS 2019)
Thanks for this hint. But I think that this is not exactly what I'm locking
for. For now I'll stay at manually rdepending on the empty main packages
of header only libraries for getting them into the license manifest.
For the case of the boost library, I'll probably "invent" some additional
empty sub packages for tracking the license of the boost components
I use.

At the end I'll anyway publish everything collected by the archiver class o=
n
our download site. But for the printed documentation of our product I would
like to focus on licenses which apply for the "binary distribution".

regards
Christian



________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler
