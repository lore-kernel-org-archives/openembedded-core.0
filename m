Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TCwWn-0005Mn-Sn; Sat, 15 Sep 2012 19:51:37 +0200
Received: by wgbds1 with SMTP id ds1so1682191wgb.0
	for <multiple recipients>; Sat, 15 Sep 2012 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8WL43TMVMW0aQVdIkjgMN8f5juCXtVUUhtTbTdXplRQ=;
	b=u5qEuQ05qWa/MExTPPf8ooK4XLkmP2cFsHdPUvE+04HNzgOLQTyhe7dg0xOjc/V1aC
	TL3MiOHDWIiGp0PMA9yTKCQ53W3vHSQevCabXkidodjFXCVRCO4UXr7VrY9BPGJcYT3U
	g9YCuyigj+6EngwboJIXaApuzXxLlheCMhxBUR29dEvLWOATIURgYb4HZJsCMqzBIjQH
	Ka3c9/PLY9YfotuPKfqd6BgQiIu7aXF1lkCxn6eyKSa1b3l6M1BrY+FDu3+SnWgM3tv2
	+HyxNPWSocTt+aWc3Wd9cpCiuKcrTuB+SQ5UVkxXIc+qeIaIHRhQccNBB6JiQ7ea99Mc
	irAg==
Received: by 10.216.139.95 with SMTP id b73mr3192432wej.191.1347730741633;
	Sat, 15 Sep 2012 10:39:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm6389592wib.6.2012.09.15.10.39.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Sep 2012 10:39:00 -0700 (PDT)
Date: Sat, 15 Sep 2012 19:39:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120915173905.GD11051@jama.jama.net>
References: <20120914085706.2CBFC103C3@opal>
	<20120915162051.GA11051@jama.jama.net>
	<1347729817.4444.52.camel@x121e.pbcl.net>
	<20120915172816.GC11051@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120915172816.GC11051@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Dinu : libffi upgrade to 3.0.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Sep 2012 17:51:38 -0000
X-Groupsio-MsgNum: 29356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline

--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2012 at 07:28:16PM +0200, Martin Jansa wrote:
> On Sat, Sep 15, 2012 at 06:23:37PM +0100, Phil Blundell wrote:
> > On Sat, 2012-09-15 at 18:20 +0200, Martin Jansa wrote:
> > > This changes .so name from libffi5 to libffi6, breaking every recipe
> > > depending on libffi when someone is using debian.bbclass.
> >=20
> > How exactly do the recipes break?  The whole point of debian.bbclass is
> > to avoid breakage when this happens by making libffi5 and libffi6
> > parallel installable.  If that isn't working then there is clearly a bug
> > somewhere and we should fix that.
>=20
> libffi5 is no longer in feed, so if you try to install something from
> feed which still has libffi5 in depends it will fail.
>=20
> Cheers,

also e.g. navit is using librsvg-native to create .png from .svg and
fails now
|
SRCDIR=3D/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/navit-1_0.2.0=
+svnr5159-r11.3/navit/navit/xpm
BUILDDIR=3D/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/navit-1_0.2=
=2E0+svnr5159-r11.3/navit/navit/xpm
=2E/navit_svg2png
"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/rsvg-convert"
"nav_destination_wh_96_96.png"
| /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/rsvg-convert:
error while loading shared libraries: libffi.so.5: cannot open shared
object file: No such file or directory

Fortunately navit.do_install finds that some mandatory .png files are
missing and fails too (before creating invalid .ipk in feed).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBUvTkACgkQN1Ujt2V2gByMcgCff4ac/MLiHudsQTaLKy3jDokV
bRgAoJbjkYjiudv7FWK5ft+xGiQF9mTn
=4ZnQ
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
