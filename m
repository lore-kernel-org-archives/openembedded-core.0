Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 872BE601A0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 04:38:41 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hZpgQ2XZcz3hhlD;
	Sat, 16 Aug 2014 06:38:42 +0200 (CEST)
X-Auth-Info: fD1j5RGAORgzTh2xLKeIzCQE/8Xh7u10xr3FsdEOKs4=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3hZpgQ0Dskz7S6Rr; 
	Sat, 16 Aug 2014 06:38:42 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 15 Aug 2014 22:53:02 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1407425157-2736-1-git-send-email-marex@denx.de>
	<CAP9ODKpCTJTLg2iwP+JmL+X_dyj919gB0k85r2HtKNKy_nhd_w@mail.gmail.com>
In-Reply-To: <CAP9ODKpCTJTLg2iwP+JmL+X_dyj919gB0k85r2HtKNKy_nhd_w@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201408152253.02781.marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: qt4: Let qmake control some compiler/linker flags
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
X-List-Received-Date: Sat, 16 Aug 2014 04:38:48 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, August 11, 2014 at 02:49:16 AM, Otavio Salvador wrote:
> Hello Marek,
>=20
> On Thu, Aug 7, 2014 at 12:25 PM, Marek Vasut <marex@denx.de> wrote:
> > In the case of building an Qt application outside of the Yocto
> > build system, we want to make sure that a "debug" configuration
> > of the application does contain debug symbols and is has the
> > compiler optimalization unset. On the other hand, we want to
> > have a "release" build which does not contain the debug symbols
> > and has the compiler optimalization turned on.
> >=20
> > The OE_QMAKE_* flags serve to pass all kinds of flags into the
> > qmake-generated Makefile. Currently, we set OE_QMAKE_CFLAGS to
> > be ${CFLAGS} and ditto for CXXFLAGS and LDFLAGS in the SDK
> > toolchain environment script. This poses a problem, since the
> > CFLAGS can contain optimization options (-O*) and even flags to
> > produce debugging info (-g). The LDFLAGS may also contain some
> > harmful flags.
> >=20
> > The easy way out is to let qmake's army of configuration files
> > handle the proper configuration of CFLAGS, CXXFLAGS and LDFLAGS
> > for the generated Makefile and don't interfere with qmake's
> > decisions by adding arbitrary flags. This patch completely
> > scrubs OE_QMAKE_C{,XX}FLAGS and leaves only harmless flags in
> > OE_QMAKE_LDFLAGS. With this patch, the behavior is as it is
> > explained in the first paragraph.
> >=20
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Eric B=E9nard <eric@eukrea.com>
>=20
> I understand your problem however I don't think the solution you found
> is optimal. It does fix the issue you refer in the commit log however
> it also makes difficult for user to "reuse" default SDK flags to test
> the application.

What solution do you propose then?

The default SDK flags effectively disallow qmake to operate correctly -- th=
at=20
is, to control the compiler/linker flags.

[...]

Best regards,
Marek Vasut

