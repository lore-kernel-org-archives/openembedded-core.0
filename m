Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QS1UU-0004sa-9W
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 08:34:46 +0200
Received: by bwz5 with SMTP id 5so802155bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 23:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Sr4PdX5FxG2X9NmWsTvQPhUr8mdp/D5i3ZZq6tHCfQ4=;
	b=SgcmO9TVK3+kfcy2PTNfTbzqbsQrtOqnINGYLo3GNFmfFYlKJHOeHWcVRUOdkOUjiC
	02V7yVs0YPiHTMqLjvKrfe0qPyuSy8yg7iczmaunsv/DlKfPazkIwObABfXOdR5Y5qB9
	FC9V01VfE1eSdA26pof+GM+QPcXul3B9MkhTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FmLKsNwGj/ZSrJuRn5gpFd9TrSFM9fNVENGxERv/8nynvqZqVzd/wvPNvDnDBEsmDx
	yhPGmQRVPn449FLEMsfVYkKw+RVJDhDWfdzerh6aO811sLRamlrc0woiRg+iP8qy0im0
	yZkySRXmLHoJEocMhRZymsfYZQUETxQeB3vts=
Received: by 10.204.16.198 with SMTP id p6mr350804bka.143.1306996294898;
	Wed, 01 Jun 2011 23:31:34 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id af13sm209720bkc.7.2011.06.01.23.31.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 23:31:33 -0700 (PDT)
Date: Thu, 2 Jun 2011 08:31:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110602063130.GG3281@jama.jama.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
	<1306960406.3119.6.camel@lenovo.internal.reciva.com>
	<BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
	<1306961600.3119.15.camel@lenovo.internal.reciva.com>
	<BANLkTimvA2gMHB=zmZmLqz+CdyAsR3dmXg@mail.gmail.com>
	<4DE6B299.2060507@linux.intel.com>
	<20110601215232.GE3281@jama.jama.net>
	<4DE6BAE6.3040406@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DE6BAE6.3040406@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Thu, 02 Jun 2011 06:34:46 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wjoFZxbW4tu+iR6v"
Content-Disposition: inline

--wjoFZxbW4tu+iR6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2011 at 03:19:18PM -0700, Saul Wold wrote:
> On 06/01/2011 02:52 PM, Martin Jansa wrote:
> > On Wed, Jun 01, 2011 at 02:43:53PM -0700, Saul Wold wrote:
> >> On 06/01/2011 02:00 PM, Otavio Salvador wrote:
> >>> On Wed, Jun 1, 2011 at 20:53, Phil Blundell<pb@pbcl.net>   wrote:
> >>>> On Wed, 2011-06-01 at 20:39 +0000, Otavio Salvador wrote:
> >>>>> Are you able to reproduce it?
> >>>>
> >>>> No, it works fine for me.  I get:
> >>>>
> >>>> checking how to link with libpthread... -lpthread
> >>>> checking for libdl... yes
> >>>> checking how to link with libdl... -ldl
> >>>> checking whether we are using the GNU C++ compiler... yes
> >>>>
> >>>> This is with the current head of oe-core on qemuarm.
> >>>
> >>> I am building for i586 but I doubt it is related.
> >>>
> >>> I get:
> >>>
> >>> checking for libpthread... yes
> >>> checking how to link with libpthread... /usr/lib/libpthread.so
> >>> checking for libdl... no
> >>> checking whether we are using the GNU C++ compiler... yes
> >>>
> >> I also built for x86 and beagle, both have libdl, can you check that y=
ou
> >> do not have some kind of site configuration that is overriding, also
> >> maybe post your log from .../gnutls-2.12.5/lib/config.log
> >
> > here it tries to link against host libdl
> >
> > configure:26050: checking for libdl
> > configure:26069: arm-oe-linux-gnueabi-gcc -march=3Darmv4t -mtune=3Darm9=
20t
> > --sysroot=3D/OE/shr-core/tmp/sysroots/om-gta02 -o conftest -O2 -pipe -g
> > -feliminate-unused-debug-types
> > -I/OE/shr-core/tmp/sysroots/om-gta02/usr/include -Wl,-O1
> > -Wl,--as-needed conftest.c  /usr/lib/libdl.so>&5
> > /usr/lib/libdl.so: file not recognized: File format not recognized
> > collect2: ld returned 1 exit status
> >
> Well that's interesting, since I see it linking using -ldl, there must=20
> be some other setting that's affecting this, I have been looking in=20
> gnutls to see if I can find something else that sets libdl.so vs -ldl,
> I have not found it.
>=20
> configure:26075: i586-poky-linux-gcc -march=3Di586=20
> --sysroot=3D/builds/world/tmp/sysroots/qemux86 -o conftest -O2 -pipe -g=
=20
> -feliminate-unused-debug-types=20
> -I/builds/world/tmp/sysroots/qemux86/usr/include -Wl,-O1=20
> -Wl,--as-needed conftest.c  -ldl >&5
> configure:26075: $? =3D 0
> configure:26085: result: yes
> configure:26092: checking how to link with libdl
> configure:26094: result: -ldl

what do you have in configlog for LIBDL?

here it's all empty
LIBDL=3D''
LIBDL_PREFIX=3D''
LTLIBDL=3D''

if I add=20
+             --with-libdl-prefix=3D${STAGING_DIR_HOST}${prefix} \
+             --with-libpthread-prefix=3D${STAGING_DIR_HOST}${prefix} \
to EXTRA_OE_CONF (we already have couple of --with-*-prefix there) it's
found correctly (and this is at least better workarround then forcing
-ldl directly to LDFLAGS):
LIBDL=3D'/OE/shr-core/tmp/sysroots/om-gta02/usr/lib/libdl.so'
LIBDL_PREFIX=3D'/OE/shr-core/tmp/sysroots/om-gta02/usr'
LTLIBDL=3D'-L/OE/shr-core/tmp/sysroots/om-gta02/usr/lib -ldl'

same problem is with libpthread..

maybe their m4/lib-link.m4 does something wrong in
AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
[
  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
  AC_REQUIRE([AC_LIB_RPATH])

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wjoFZxbW4tu+iR6v--
