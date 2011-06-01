Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRtQA-0001S7-FC
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 23:58:35 +0200
Received: by fxm19 with SMTP id 19so424649fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=nujxYTLnb1HCdF/VbdsQjByKNwxDziLCqX7rmcbw3GE=;
	b=Wi2FMe94WrP2z1wERl/sJQ0en8hSqQENVeTNi5jpjLk98aIdNsPpd53l0973lpnaYt
	kBk4HGDE44/aqul9RV6RxIUV3RmTPKtp/NU4GVjU0dpUsMng2B2+YEtk2CMR4nyH0N5C
	V/aqrgdIZyj3KerlrqVIBIZpiigdwN71DArec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ikroA97qCeOtu2iZUE7nHCmF83toXQR2HVVZeblLDscAdIjGqvVTs17IbXXOV8YDc9
	vhAPyZVoQ7V/BTaaGq96erBABnqqzIN5VEdb/S7Dp5rzjWQHiho1v4/lGZ4+dPPLf0Zp
	yyYv0FhgoBKdxB7tSTPTbx2RSWzE3VdVM/zb4=
Received: by 10.223.33.80 with SMTP id g16mr1882937fad.125.1306965159947;
	Wed, 01 Jun 2011 14:52:39 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c1sm546682faa.13.2011.06.01.14.52.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 14:52:38 -0700 (PDT)
Date: Wed, 1 Jun 2011 23:52:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110601215232.GE3281@jama.jama.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
	<1306960406.3119.6.camel@lenovo.internal.reciva.com>
	<BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
	<1306961600.3119.15.camel@lenovo.internal.reciva.com>
	<BANLkTimvA2gMHB=zmZmLqz+CdyAsR3dmXg@mail.gmail.com>
	<4DE6B299.2060507@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DE6B299.2060507@linux.intel.com>
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
X-List-Received-Date: Wed, 01 Jun 2011 21:58:35 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DNUSDXU7R7AVVM8C"
Content-Disposition: inline

--DNUSDXU7R7AVVM8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2011 at 02:43:53PM -0700, Saul Wold wrote:
> On 06/01/2011 02:00 PM, Otavio Salvador wrote:
> > On Wed, Jun 1, 2011 at 20:53, Phil Blundell<pb@pbcl.net>  wrote:
> >> On Wed, 2011-06-01 at 20:39 +0000, Otavio Salvador wrote:
> >>> Are you able to reproduce it?
> >>
> >> No, it works fine for me.  I get:
> >>
> >> checking how to link with libpthread... -lpthread
> >> checking for libdl... yes
> >> checking how to link with libdl... -ldl
> >> checking whether we are using the GNU C++ compiler... yes
> >>
> >> This is with the current head of oe-core on qemuarm.
> >
> > I am building for i586 but I doubt it is related.
> >
> > I get:
> >
> > checking for libpthread... yes
> > checking how to link with libpthread... /usr/lib/libpthread.so
> > checking for libdl... no
> > checking whether we are using the GNU C++ compiler... yes
> >
> I also built for x86 and beagle, both have libdl, can you check that you=
=20
> do not have some kind of site configuration that is overriding, also=20
> maybe post your log from .../gnutls-2.12.5/lib/config.log

here it tries to link against host libdl

configure:26050: checking for libdl
configure:26069: arm-oe-linux-gnueabi-gcc -march=3Darmv4t -mtune=3Darm920t
--sysroot=3D/OE/shr-core/tmp/sysroots/om-gta02 -o conftest -O2 -pipe -g
-feliminate-unused-debug-types
-I/OE/shr-core/tmp/sysroots/om-gta02/usr/include -Wl,-O1
-Wl,--as-needed conftest.c  /usr/lib/libdl.so >&5
/usr/lib/libdl.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DNUSDXU7R7AVVM8C--
