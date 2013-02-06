Received: from mail-ia0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U3Znn-00083R-R9; Thu, 07 Feb 2013 23:18:44 +0100
Received: by mail-ia0-f178.google.com with SMTP id y26so3418702iab.23
	for <multiple recipients>; Thu, 07 Feb 2013 14:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MPC47kLRAfWIlPMZw7aTiDcHnRbJ+bNyMoK0Kku4EVI=;
	b=is1cs/7u7kvZ2rk91Y1nAjH27PHLDzM50rJsJOerKLP9+mRzfHCh0q4R7vyTLjbXpo
	xmA0YanuXkD/Ynjtqs7+Pq84giev0x0dWJFKRkQ35qq6/zwxu3xRSu98WDwDy2NmrhP2
	8ykye1oK9Tn68eYO6WOm2t+y5rRxvGIwuB7kEKoST6hZUp7/qoFXM6nbtSTA3F3Hcuev
	c88Rx/aGkKazS6kKpU8p8zyQTrEBwqGVMCRlW6B774GPxsjIsMm0o3MwH5KSP/T9cT7q
	ZSjJGyxN/jBcOneDlTEJJdGvZ9dPr5wR0xvPNP/wKkpkSHMAUf7W9s0MQ+nP26bJxEwF
	MQKQ==
X-Received: by 10.50.91.168 with SMTP id cf8mr9677531igb.20.1360185439369;
	Wed, 06 Feb 2013 13:17:19 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hg2sm5112718igc.3.2013.02.06.13.17.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 13:17:18 -0800 (PST)
Date: Wed, 6 Feb 2013 22:17:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130206211710.GC3271@jama>
References: <20130206093802.16EA32097@opal> <20130206115620.GT3271@jama>
	<511247C9.2010505@intel.com>
MIME-Version: 1.0
In-Reply-To: <511247C9.2010505@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : add fontcache.bbclass
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
X-List-Received-Date: Thu, 07 Feb 2013 22:18:44 -0000
X-Groupsio-MsgNum: 35127
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z3Nkz3fRLNVT9Ca+"
Content-Disposition: inline

--z3Nkz3fRLNVT9Ca+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 02:08:41PM +0200, Laurentiu Palcu wrote:
>=20
>=20
> On 02/06/2013 01:56 PM, Martin Jansa wrote:
> > Fails in do_rootfs here, but without any details in log:
> > Building from feeds activated!
> > Running intercept scripts:
> >> > Executing update_font_cache
> > ERROR: Function failed: do_rootfs (see
> > /OE/shr-core/tmp-eglibc/work/tuna-oe-linux-gnueabi/shr-image/2.0-r20/te=
mp/log.do_rootfs.2236
> > for further information)
> >=20
> Most probably fontconfig package was not rebuilt with the new sysroot
> feature. Can you run the native fc-cache with --help and look for a
> sysroot option? If it's there, than it's probably a qemu issue... :/

It fails only on some machines I'm building (3 machines from 6) and only so=
metimes (last run it was only on 2 from 6)

Now I was running it manually and got nice error finally:
Running intercept scripts:
> Executing update_font_cache
readelf: Error:
'/OE/shr-core/tmp-eglibc/work/tuna-oe-linux-gnueabi/shr-image/2.0-r20/rootf=
s/usr/bin/fc-cache':
No such file
ERROR: intercept script "update_font_cache" failed!

So something is pulling interceptor without runtime dependency on
fontconfig.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z3Nkz3fRLNVT9Ca+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESyFYACgkQN1Ujt2V2gBxvZgCff0dywmGlbB80B8IjvVgygEh2
kEsAmwU8a931/lXN8E6l+B1uzEDz7e0u
=M+jo
-----END PGP SIGNATURE-----

--z3Nkz3fRLNVT9Ca+--
