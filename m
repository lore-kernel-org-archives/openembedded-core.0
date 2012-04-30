Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SOxtn-0006q4-KJ for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 23:12:47 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3VhJB32gpXz3hhZH;
	Mon, 30 Apr 2012 23:03:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3VhJB34dLpz4KK3l;
	Mon, 30 Apr 2012 23:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id WJalIUCfu2mG; Mon, 30 Apr 2012 23:03:07 +0200 (CEST)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Mon, 30 Apr 2012 23:03:07 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id D38481A5832;
	Mon, 30 Apr 2012 23:03:06 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
	by gemini.denx.de (Postfix) with ESMTP id B708A20021A;
	Mon, 30 Apr 2012 23:03:06 +0200 (CEST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <CAMKF1so3xwMOB30-yogUL9jCuHoTEsMgTDRxTLWKT_dYn-LkuQ@mail.gmail.com>
References: <1335693807-17609-1-git-send-email-wd@denx.de>
	<CAMKF1so3xwMOB30-yogUL9jCuHoTEsMgTDRxTLWKT_dYn-LkuQ@mail.gmail.com>
Comments: In-reply-to Khem Raj <raj.khem@gmail.com>
	message dated "Sun, 29 Apr 2012 08:41:50 -0700."
Date: Mon, 30 Apr 2012 23:03:06 +0200
Message-Id: <20120430210306.B708A20021A@gemini.denx.de>
Subject: Re: [RFC] [PATCH] Add KERNEL_EXTRA_ARGS parameter
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
X-List-Received-Date: Mon, 30 Apr 2012 21:12:47 -0000
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Khem Raj,

In message <CAMKF1so3xwMOB30-yogUL9jCuHoTEsMgTDRxTLWKT_dYn-LkuQ@mail.gmai=
l.com> you wrote:
>
> > Add KERNEL_EXTRA_ARGS parameter so affected boards can add for exampl=
e
> >
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_EXTRA_ARGS =3D "LOADADDR=3D0x800080=
00"
> >
> > to their configuration. =C2=A0We make this general enough so other ne=
eded
> > command line options can be passed as well when compiling the kernel.
>=20
> will EXTRA_OEMAKE =3D "..." work ?

No, it will not, as "meta/classes/kernel.bbclass" explicitly ignores
all EXTRA_OEMAKE settings:

...
# For the kernel, we don't want the '-e MAKEFLAGS=3D' in EXTRA_OEMAKE.
# We don't want to override kernel Makefile variables from the environmen=
t
EXTRA_OEMAKE =3D ""
...


Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
I express preference for a chronological  sequence  of  events  which
precludes a violence.   - Terry Pratchett, _The Dark Side of the Sun_


