Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUCWl-0000BP-QC
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 08:46:07 +0200
Received: by bwz5 with SMTP id 5so177643bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OT6LoufgM6JjhXuzEBv2MoZCalLCAliNQVG6R338Ppw=;
	b=DmSA9kQyxcoW16qjkzmO4PrcxcroK5tsTgdTMMJOK9yUJOtoA/v4YkcBFoXV/11daq
	jAsClMwKKnasVw/PVtOlyViLKjRGDsosX0WBmGsaMgtE4/k/xp7Z9l5bV3fdDoofN9zL
	4bRmoyvP/RYd5vlyCd10VrCNvMKWt7kaXcK88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=llvvIsAS0tmq/OgqmAkXwQNYpvbqpJrLRUhtal0fkx5ksy87PJW9/Oq9opWQO1U0rJ
	HDUp2AUicfBX+2CB8jaPJhqUOwGGCyAKa23k421T7gkpU1rQalVSsUvTZz/bHX+VMeFn
	FONktlqJI9kU++DsOYSqXlDiQGPYHc4dm1c5E=
Received: by 10.204.163.130 with SMTP id a2mr224813bky.108.1307515369566;
	Tue, 07 Jun 2011 23:42:49 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t23sm234404bkf.4.2011.06.07.23.42.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:42:48 -0700 (PDT)
Date: Wed, 8 Jun 2011 08:42:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110608064239.GF23137@jama.jama.net>
References: <cover.1307438945.git.kai.kang@windriver.com>
	<46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
	<C2744CFA-2121-4B18-A9DB-98C4512092F1@dominion.thruhere.net>
	<4DEED433.9030707@windriver.com>
	<2D8F2725-9A17-40E0-9BB9-1D555BB74139@dominion.thruhere.net>
	<4DEF1826.7020004@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4DEF1826.7020004@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Wed, 08 Jun 2011 06:46:07 -0000
X-Groupsio-MsgNum: 3751
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Content-Disposition: inline

--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2011 at 02:35:18PM +0800, Kang Kai wrote:
> On 2011=E5=B9=B406=E6=9C=8808=E6=97=A5 14:25, Koen Kooi wrote:
> > Op 8 jun 2011, om 03:45 heeft Kang Kai het volgende geschreven:
> >
> >> On 2011=E5=B9=B406=E6=9C=8807=E6=97=A5 17:48, Koen Kooi wrote:
> >>> Op 7 jun 2011, om 11:42 heeft Kang Kai het volgende geschreven:
> >>>
> >>>> From: Kang Kai<kai.kang@windriver.com>
> >>>>
> >>>> Migrate configurability from oe, try to shrink minimal image size
> >>>>
> >>>> Update to get eglibc configuration options from DISTRO_FEATURES and =
enable them. All
> >>>> the options are enabled by default.
> >>>>
> >>>> Uncomment the line in conf/local.extended.conf to define DISTRO_FEAT=
URES, so put
> >>>> what options you want to enable there.
> >>>>
> >>>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> >>>> ---
> >>>> meta/conf/distro/include/default-distrovars.inc    |    8 ++-
> >>>> .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 ++++++
> >>>> meta/recipes-core/eglibc/eglibc-options.inc        |   62 ++++++++++=
++++++++++
> >>>> meta/recipes-core/eglibc/eglibc.inc                |    6 ++
> >>>> meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
> >>>> 5 files changed, 98 insertions(+), 2 deletions(-)
> >>>> create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-=
fix-macro-RTLD_DEBUG.patch
> >>>> create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
> >>>>
> >>>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/=
conf/distro/include/default-distrovars.inc
> >>>> index 4b68a0a..16ac681 100644
> >>>> --- a/meta/conf/distro/include/default-distrovars.inc
> >>>> +++ b/meta/conf/distro/include/default-distrovars.inc
> >>>> @@ -10,7 +10,13 @@ LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
> >>>> ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
> >>>> LOCALE_UTF8_ONLY ?=3D "0"
> >>>>
> >>>> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usb=
host wifi nfs zeroconf pci"
> >>>> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usb=
host wifi nfs zeroconf pci \
> >>>> +		libc-ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests =
libc-catgets libc-charsets libc-crypt \
> >>>> +		libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg li=
bc-fstab libc-ftraverse \
> >>>> +		libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-lib=
m-big libc-locales libc-locale-code \
> >>>> +		libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug li=
bc-spawn libc-streams libc-sunrpc \
> >>>> +		libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-pos=
ix-regexp libc-posix-regexp-glibc \
> >>>> +		libc-posix-wchar-io"
> >> Hi Koen,
> >>> I think a seperate DISTRO_LIBC_FEATURES var would be cleaner and easi=
er to override.
> >> I used DISTRO_FEATURES_EGLIBC before, but it didn't make Richard happy=
=2E :)
> > So how does one easily override LIBC features without touching other fe=
atures?
> That is why use libc-spawn not "spawn" itself.

I agree with koen, when distro wants to keep all default libc-* but
alter other DISTRO_FEATURES it has to list all libc-* in it's own
config.

IMHO DISTRO_FEATURES_EGLIBC had wrong only suffix as it's not _EGLIBC
specific,

DISTRO_FEATURES_LIBC or proposed DISTRO_LIBC_FEATURES will allow
distributions to override it like this:
DISTRO_FEATURES =3D "foo bar ${DISTRO_FEATURES_LIBC}" which is much better
then 6 lines of libc-* features which need to resync when someone adds
new feature with new *libc version.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3vGd8ACgkQN1Ujt2V2gBzyKwCfQZUdOGQEfv281luxljlA0gdS
GtAAnijC9iA1QqEzJnbeewCGCE3zum9h
=Mrvb
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--
