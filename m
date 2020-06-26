Received: from mailout06.rmx.de (mailout06.rmx.de [94.199.90.92])
 by mx.groups.io with SMTP id smtpd.web12.9316.1593182365541579919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 07:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.92, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout06.rmx.de (Postfix) with ESMTPS id 49tffJ6Crjz9srS
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 16:39:20 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 49tffJ0Wf7z2TTLm
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 16:39:20 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Fri, 26 Jun 2020 16:39:19 +0200
Received: from n95hx1g2.localnet (192.168.54.27) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 26 Jun
 2020 16:39:19 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Patch v2 0/2] Extend dependencies of networkmanager for native/nativesdk
Date: Fri, 26 Jun 2020 16:39:13 +0200
Message-ID: <2259940.Q60ZqerjEb@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAAnfSTtcUvrt1dVYXi+2qfo_kQOKGn6PSCucaq3x5WH4Dgr-vQ@mail.gmail.com>
References: <20200622125359.11587-1-ceggers@arri.de> <CAAnfSTtcUvrt1dVYXi+2qfo_kQOKGn6PSCucaq3x5WH4Dgr-vQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.27]
X-OriginalArrivalTime: 26 Jun 2020 14:39:19.0486 (UTC) FILETIME=[933D6DE0:01D64BC7]
X-RMX-ID: 20200626-163920-49tffJ0Wf7z2TTLm-0@kdin02
X-RMX-SOURCE: 217.111.95.7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 26. Juni 2020, 14:06:02 CEST schrieb Ross Burton:
> I'm curious what you're actually building for native here? (ie what
> bit of network manager is meaningful as a native build).
>
> Ross
>
Our own application (embedded product) links against libnm.
This application can either be built for the embedded system
or for PC platform.

I plan to perform unit tests of this application on the build machine
(native). This tests can also include testing the interfaces to
NetworkManager.

I'm still unsure whether I will built and run my own application
tests within the Yocto build environment (native Yocto package)
or doing this "externally" under the (native part of the) SDK. The
compiler/libraries from the build machine itself are not suitable
as they are usually too old.

From your question it sounds like not every type of software
may be suitable for -native/-nativesdk? Shall these packages be
limited to software required for "building" (compiler, code generators,
documentation, ...)?

Sure, I could create separate SDKs for both machines, but having
the "target" SDK and the "PC" SDK together works very fine for us.

regards
Christian

> On Mon, 22 Jun 2020 at 13:54, Christian Eggers <ceggers@arri.de> wrote:
> > On Friday, 2020-06-19, Richard Pudie wrote:
> > > A native eudev is a really bad idea, a nativesdk one isn't much bette=
r.
> > > If there are libs we need from here, then the recipe should only be
> > > generating those but a "native eudev" makes no sense to be needed by =
a
> > > build system.
> >
> > Ack. I already expected that there might be a (hidden?) rule, what type=
 of
> > software is (NOT) allowed for -native/-nativesdk.
> >
> > > A native or nativesdk consolekit does not make sense.
> > >
> > > If you need libs from networkmanager, you'll probably have to patch i=
t
> > > just to generate the libs you need. We don't want builds polluted wit=
h
> > > confusing and potentially quite problematic binaries.
> >
> > Networkmanager can be built fine without consolekit. Probably this will
> > not make any difference for libnm.
> >
> >



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
