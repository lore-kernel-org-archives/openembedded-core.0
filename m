Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id DEBC66AF35;
	Wed,  4 Jun 2014 17:12:09 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id md12so7299525pbc.29
	for <multiple recipients>; Wed, 04 Jun 2014 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f9mnGaV4zKyhIxQoNHWJbMPjW9g686ySLoUMA84+r00=;
	b=cP7UDc/zAkMB/cuuy95wWuqyJCIEQLpq0OtLKntzy9cHpLAEcSif0rcmcznnMV7Kd8
	jdqnoRM/8SRdbSdd0gPraJS9Xk3z4XwVlqoCGpcyoOqQ2erdznzfb3thxBBGgh0Tflql
	BvIW6vUVroabyq7ePxc6s/xim6yDQDNvASCdvjsNat4tHJLCB+rlCAeKx5fAiKhkV0PL
	23ZcQzFS++Q9O96Lp2a/ULsA7qpco9T6vtcuzEcgLT0hAkIpAcf5GSE/uWoNfHyvRu7d
	RVw6acFvSnGF+SszFKM9pf44DvsIfGsP8itHCL7PQO8KXTypgDN3RbJtK1DvztjcGhgw
	a2Sg==
X-Received: by 10.69.17.230 with SMTP id gh6mr66709696pbd.0.1401901929863;
	Wed, 04 Jun 2014 10:12:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	se3sm12115293pbb.80.2014.06.04.10.12.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 10:12:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Jun 2014 19:12:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140604171220.GT2426@jama>
References: <cover.1399993010.git.valentin.popa@intel.com>
	<CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
	<20140604125205.GS2426@jama>
	<CAJTo0Lab7wwV2NN=NSMqLYTxeW=_CfeGwvETkDCh4emwVRLxFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lab7wwV2NN=NSMqLYTxeW=_CfeGwvETkDCh4emwVRLxFg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Wed, 04 Jun 2014 17:12:10 -0000
X-Groupsio-MsgNum: 53831
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EsfvRFssnM00t552"
Content-Disposition: inline

--EsfvRFssnM00t552
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2014 at 03:24:34PM +0100, Burton, Ross wrote:
> On 4 June 2014 13:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Sorry for hi-jacking the thread, but since today even the older 9.2.5 is
> > failing to find native python-libxml2
> >
> > config.log:
> > configure:8059: checking for python2
> > configure:8075: found
> > /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-nativ=
e/python2
> > configure:8086: result: python2
> > configure:8103: checking python2 module: libxml2
> > configure:8112: result: no
> > configure:8118: error: failed to find required module libxml2
> >
> > Any idea why it started to fail now?
>=20
> Great.  Can you share the config.log?

This is from config.log, do you want whole file?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EsfvRFssnM00t552
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOPU3QACgkQN1Ujt2V2gBzb+gCbBXcjewtDdLtZ3TJecVgdf99K
dbgAnRTNHDaF/LCjflu7lZbznQYzWt1B
=flRK
-----END PGP SIGNATURE-----

--EsfvRFssnM00t552--
