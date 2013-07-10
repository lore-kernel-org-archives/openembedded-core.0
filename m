Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 077936204F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 11:43:56 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so4883925eak.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EGIyreWVEyR6sstwfG8BDEUhh7vDZ/8AUxXYcpWIE0s=;
	b=sZ14+jychrUQv7hXrpi+XMymciRKzE0HUcn4Urn5+lJ/Gv3AGCSRArEvXKE1mr+Efc
	OfYh5Y3r1yseSpcUlqY2HLs0h/E7H0oJxbEtU7tvg9QKdnD3ROm1v3+YuxUREy0CZKcg
	VvjXNc1vvrmx11LplKj53ZLI3UGQkv/n2+h7bVD7fclf1PVmts8hJRS2JMz+rWI4KW/n
	wnwe/4CANZE2W2wM3zRP7nt8C9+UD9BSRitPw2f46J8g2JMQBAmOwJIiH0M7ymfDLdYh
	jhICRcXUelHQBZtCc9fjekz4qYG+niAPHWSuRWSTkzMEyJ/NLpwqtR+OIvPvnbv5rZU2
	pOYA==
X-Received: by 10.14.176.68 with SMTP id a44mr35989854eem.31.1373456636661;
	Wed, 10 Jul 2013 04:43:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm59320092eez.6.2013.07.10.04.43.55 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 04:43:55 -0700 (PDT)
Date: Wed, 10 Jul 2013 13:44:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130710114405.GZ3288@jama>
References: <cover.1372674367.git.mihai.prica@intel.com>
	<2ee8976b4ad482eafb186deba9a14fc52f6dc8cf.1372674367.git.mihai.prica@intel.com>
	<CAJTo0LbWDHqUoaks86RrGMSnKyN+fw-cxShpFpr=DT-sOGbvxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbWDHqUoaks86RrGMSnKyN+fw-cxShpFpr=DT-sOGbvxQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA warning for shipping /usr/share/info/dir
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
X-List-Received-Date: Wed, 10 Jul 2013 11:43:57 -0000
X-Groupsio-MsgNum: 41726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="abYdCjSRCBwcb+dP"
Content-Disposition: inline

--abYdCjSRCBwcb+dP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2013 at 03:51:26PM +0100, Burton, Ross wrote:
> On 1 July 2013 11:31, Mihai Prica <mihai.prica@intel.com> wrote:
> > /usr/share/info/dir should be generated at install time in a postinst.
> > Added QA warning to check at build time for this file. The warning
> > is disabled by default.
>=20
> Patch is good but why don't we enable this by default?

FWIW: this is list of QA issues found with this check in my world builds:

gcc-4.8.1: The /usr/share/info/dir file is not meant to be shipped in a par=
ticular package.
ed-1.7: The /usr/share/info/dir file is not meant to be shipped in a partic=
ular package.
emacs-23.4: The /usr/share/info/dir file is not meant to be shipped in a pa=
rticular package.
quagga-0.99.21: The /usr/share/info/dir file is not meant to be shipped in =
a particular package.
lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a par=
ticular package.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--abYdCjSRCBwcb+dP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHdSQUACgkQN1Ujt2V2gByuSgCfRQ93LPY5+VCpOflXD51ySMTj
A1EAoJh8qWBgbg0vv29wnVF/Ic1Wy1z1
=bGz5
-----END PGP SIGNATURE-----

--abYdCjSRCBwcb+dP--
