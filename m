Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SA1iq-0006nU-3C for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:15:44 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3VBzY93MPJz3hhwH;
	Tue, 20 Mar 2012 17:06:53 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3VBzY93XxWz4KK7M;
	Tue, 20 Mar 2012 17:06:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id nnTbRBC1GGwX; Tue, 20 Mar 2012 17:06:53 +0100 (CET)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Tue, 20 Mar 2012 17:06:52 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 997211A6535;
	Tue, 20 Mar 2012 17:06:52 +0100 (CET)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id A53E1202A50;
	Tue, 20 Mar 2012 17:06:51 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <1332254996.9740.97.camel@ted>
References: <20120319215934.5336A206060@gemini.denx.de>
	<1332203843.9740.76.camel@ted>
	<20120320103520.22B00202A50@gemini.denx.de>
	<1332254996.9740.97.camel@ted>
Comments: In-reply-to Richard Purdie <richard.purdie@linuxfoundation.org>
	message dated "Tue, 20 Mar 2012 14:49:56 +0000."
Date: Tue, 20 Mar 2012 17:06:51 +0100
Message-Id: <20120320160651.A53E1202A50@gemini.denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: specific version dependenciews
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 16:15:44 -0000
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Richard,

In message <1332254996.9740.97.camel@ted> you wrote:
>
> > How do I mark a package as machine specific?
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> > And would setting "the preferred versions at the machine level" not b=
e
> > exactly what I am trying to avoid?
> >=20
> > I don't want to make the machine descriptions aware of any version
> > dependencies between A and B.  I would like to put this information
> > into the description of A, so that when a specific version of A gets
> > built, automatically the matching version of B will be chosen.
> >=20
> > Can this be done?
>=20
> You could write the dependency A in the form:
>=20
> DEPENDS =3D "B-1.2"
>=20
> where 1.2 is version of B you want. This has been known to work in the
> past but isn't well supported/well tested. It can work since B PROVIDES
> "${PN}-${PV}".

We will try this.

Thanks a lot!

Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Everybody is talking about the  weather  but  nobody  does  anything
about it."                                               - Mark Twain


