Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f51.google.com (unknown [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 695FC60048
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 22:22:18 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e51so2111331eek.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H7pcUSB5j65Gj8YNsEWyyLLFq46CdDcrluKIkILM9eI=;
	b=0jUilESEOx1ytfjGhF3Zd/JJUGwXlgYVFaLpqujCPtaYqIZxtKtdpWGCc0jcRsYXGB
	7lyM+c467zjz+YgRLLf410BDX9rSBmfW92XBUCvHvUMq+FGs/8FO9DE6N4QCiUo7t44v
	/pRu20/H+ijc+lH72n5TBgKv6UL5w2gophTUDs1OJnoze4/bm2Zy4XWYiRbAe/dkeiiH
	Ln6vVEuqUXDHpExkeoGPZLXHE1iLZ6KGeYGvALGrTVxoPubmLFTUMzbHCzi4ZkxROjKw
	kEZ0xDhWJLUDCIuvqf4JQOJB5YTd2PsDOphEDhhMwmNVrxPoukAAjqPx8dTsAmxWztv3
	u3vQ==
X-Received: by 10.14.224.72 with SMTP id w48mr5376288eep.63.1399587739476;
	Thu, 08 May 2014 15:22:19 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id x45sm7042070eee.37.2014.05.08.15.22.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 15:22:18 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Thu, 8 May 2014 22:22:16 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140508222215.GF26157@gmail.com>
References: <1399568104-11641-1-git-send-email-paul@paulbarker.me.uk>
	<1399586585.31891.75.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1399586585.31891.75.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC] Support hierarchical ipk feeds
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
X-List-Received-Date: Thu, 08 May 2014 22:22:21 -0000
X-Groupsio-MsgNum: 53007
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2014 at 11:03:05PM +0100, Richard Purdie wrote:
> On Thu, 2014-05-08 at 16:55 +0000, Paul Barker wrote:
> > This is an RFC only and is not suitable for merging yet. The necessary =
patches
> > for opkg-utils have also been posted for review but have not been merge=
d yet. I
> > want to know if there is general approval for adding this feature to oe=
-core. If
> > there is, I'll go ahead and merge the opkg-utils patches and post a new=
 patch
> > series which includes the update to the SRCREV used for opkg-utils in o=
e-core.
> >=20
> > This patch has been tested on qemuarm:
> >=20
> >   A feed was created with IPK_HIERARCHICAL_FEED unset and opkg was poin=
ted at
> >   that feed. 'opkg update && opkg install ncurses-terminfo-base' worked
> >   correctly, downloading a package file from the same directory as the =
package
> >   feed.
> >  =20
> >   IPK_HIERARCHICAL_FEED was then set to "1" in local.conf and the feed =
was
> >   rebuilt by running 'bitbake core-image-minimal && bitbake package-ind=
ex'. On
> >   qemu 'opkg update && opkg install ncurses-terminfo' worked correctly,
> >   downloading the package from the subdirectory 'n/ncurses-terminfo'.
> >=20
> >   Finally, IPK_HIERARCHICAL_FEED was unset again and the feed was rebui=
lt. On
> >   qemu 'opkg update && opkg install ncurses' worked correctly, download=
ing
> >   package files from the same directory as the package feed again.
> >=20
> > Those tests prove that changes to IPK_HIERARCHICAL_FEED do not break th=
e upgrade
> > path of an existing system provided that 'bitbake pacakge-index' is re-=
ran after
> > the change.
> >=20
> > The proposed commit message follows...
> >=20
> >=20
> >=20
> > package_ipk.bbclass: Support hierarchical feed
> >=20
> > This patch allows for an optional new layout for ipk feed directories w=
hich I've
> > called a 'hierarchical feed' and is based on how Debian pools package f=
iles. It
> > is disabled by default and is enabled by setting IPK_HIERARCHICAL_FEED =
to "1".
> >=20
> > In the traditional feed layout, package files are placed in <outdir>/<a=
rch>/.
> > This can lead to several thousand files existing in a single directory =
which is
> > often a problem if developers want to upload a package feed to a shared=
 web
> > hosting provider. For example, in my case, listing files via FTP only s=
hows the
> > first 2000 files, breaking my scripts which attempt to upload only new =
and
> > changed files via FTP.
> >=20
> > In the hierarchical feed, package files are written to
> > '<outdir>/<arch>/<pkg_prefix>/<pkg_subdir>', where pkg_prefix is the fi=
rst
> > letter of the package file name for non-lib packages or "lib" plus the =
4th
> > letter of the pacakge file name for lib pacakges (eg, 'l' for less, 'li=
bc' for
> > libc6).  pkg_subdir is the root of the pacakge file name, discarding th=
e version
> > and architecture parts and the common suffixes '-dbg', '-dev', '-doc',
> > '-staticdev' and '-locale-*'.
> >=20
> > This change relies on recent patches to opkg-utils which support hierar=
chical
> > package feeds.
>=20
> FWIW I'm ok with this and its something we probably want to enable by
> default however:
>=20
> a) I'm not sure <pkg_subdir> is that useful, we tend to only have one
> version of things around in most cases and I can't imagine people having
> a lot of these.

pkg_subdir does reduce the number of files in a single directory quite a bi=
t,
especially when several locale-specific packages are created.

Also, one of the features I'm currently working on in opkg is per-package
signatures. These would be separate '.sig' or '.asc' files next to each pac=
kage
file so that will immediately double the number of files per directory if i=
t is
used.

I do keep an archive of old packages around so that if something breaks I c=
an
just tell people to revert back to the old version.

There is one thing slightly specific to my use case and that is that the nu=
mber
of directories in each directory doesn't matter but the number of files in =
each
directory does matter. This is because the mirror operation will do a separ=
ate
'ls' for each subdirectory (cheap) whether or not it saw it in the 'ls' of =
the
parent directory, however it will do a full upload (expensive) for each fil=
e it
didn't see in the 'ls'. Thus every file past number 2000 is uploaded in full
even if it was already on the server. Fixing this would require patching lf=
tp
which I haven't had time to look at yet.

>=20
> b) How are the "common suffixes" configured? I guess its just a loose
> thing but I worry about the "why did my package get put into directory X
> when its really part of Y?" type questions. Perhaps splitting on the
> first dash in the name might be good enough? I'm thinking about
> kernel-modules-xxx for example and some of our other dynamically
> generated packages.
>=20

The common suffixes are just my best guess at the minute. They certainly do=
n't
group all related packages together. They just handle the suffixes that are
automatically packaged ('-dev', '-dbg', etc), plus locales. I've not even l=
ooked
through the packaging code to see if I've got the full list of automatic
suffixes - I'll do that before this is merged.

Splitting on the first dash could be confusing for packages which have a da=
sh in
their 'well known' name (eg. util-linux, update-rc.d, etc).

'kernel-modules-xxx' looks good at first glance but it would immediately en=
d up
with many many packages in one directory.

> Cheers,
>=20
> Richard
>=20
>=20

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTbAOXAAoJEBwoJlo7UPQDurUH/jAFddh5YzutsicZMmUHBaMK
cnfDwEaiE0wY/O6Vo8xNj8BFTp7MtS9v6ld8s1pL0+S8di6P2CKAmk8mdGj5dMG1
v+pzfozUwpcaBMvM1SKyjwHIe34d/pSZg4gPqMfjQKcYO2Q0Am8Um7S3P1cijsGB
rF0TRmGFxA2/4RCo5odKuOCMdZJtYKfFZuh3WAl0mySMoEEjoUMXXo8Ux/Wmf5gX
h0XvFjWXCHc2S9JyALPIb9dE20V3kfm/lGUzTmGN5s98mtKrqH+Fgp9/FaXiX9sp
gHNYn6xoJambfbyatxHjirfAvD8INhUl3Ro5s4SccqZbXttCISJ7wDpeVPVDvHk=
=pJ7z
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
