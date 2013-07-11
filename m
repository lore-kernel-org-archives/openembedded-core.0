Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 86C73608C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 07:30:20 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so5504968eaj.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 00:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WdglE2J3HU3nEJGGZiVLJuAqACZJ99u8Q4wV1uH4wJA=;
	b=i98omwK2HqxILn+dbp0Paeo3FPxLsfUwvybzMskhJJ0XSMhb8d+R9JVPp3M2CBLHZD
	91vOyOoQr/84ceD32nosRUs2fC1hj4YLOikwTb0yw5TD5ruzW/pL29mY8SZytP3WNYo3
	4m3tcCbVwhmD1MZWe+rRzG7Bt/7Zgw63jXfcjQmGewdMT1yz6cNFRwqyDfseXJnItYY+
	Biv1wo83/VHPsRW4P3DQqh3VO/uPirO/jPmP0rySDycARfMnTm3Iq8My8blFfTER9+WR
	dUqo9ooBXq3JrvxAi6DGB7BPyHt0yzLz/j4C0ayVcaqDcsEUnB1L8AhOaNUu/aPqA6kQ
	nCAA==
X-Received: by 10.15.52.5 with SMTP id o5mr40525908eew.58.1373527820533;
	Thu, 11 Jul 2013 00:30:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm66695090eex.17.2013.07.11.00.30.19 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 00:30:19 -0700 (PDT)
Date: Thu, 11 Jul 2013 09:30:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Message-ID: <20130711073030.GF3288@jama>
References: <2457726.ZAE80f4V8O@yiqingliang-pc>
	<4753381.i1zt9jKOiD@yiqingliang-pc>
MIME-Version: 1.0
In-Reply-To: <4753381.i1zt9jKOiD@yiqingliang-pc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: boost 1.54 compile fail
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
X-List-Received-Date: Thu, 11 Jul 2013 07:30:20 -0000
X-Groupsio-MsgNum: 41772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Q7FmPuhIbtiu4EM"
Content-Disposition: inline

--/Q7FmPuhIbtiu4EM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2013 at 09:54:28AM +0800, Yi Qingliang wrote:
> maybe it is the gcc's fault (recently it is updated to 4.8.x in poky)
>=20
> I can found uintptr_t in cstdint, but it is wrapped by a c99 related macr=
o.

See
http://lists.openembedded.org/pipermail/openembedded-devel/2013-July/091331=
=2Ehtml
https://lists.yoctoproject.org/pipermail/yocto/2013-July/017159.html
threads

>=20
>=20
> On Wednesday, July 10, 2013 04:21:02 PM Yi Qingliang wrote:
> > Hello!
> >=20
> > after update poky to latest git version, I got failure when compiling b=
oost:
> >=20
> > the main error is: (indeed, and too many warning!)
> >=20
> > | ./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared=
 in
> >=20
> > this scope
> >=20
> > |  typedef atomic<uintptr_t> atomic_uintptr_t;
> > | =20
> > |                 ^
> > |=20
> > | ./boost/atomic/atomic.hpp:202:25: error: template argument 1 is inval=
id
> > |=20
> > |  typedef atomic<uintptr_t> atomic_uintptr_t;
> > | =20
> > |                          ^
> > |=20
> > | ./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration
> > | before
> >=20
> > ';' token
> >=20
> > |  typedef atomic<uintptr_t> atomic_uintptr_t;
> > | =20
> > |                                            ^
> > |=20
> > | In file included from ./boost/system/system_error.hpp:14:0,
> > |=20
> > |                  from ./boost/thread/exceptions.hpp:22,
> > |                  from ./boost/thread/pthread/thread_data.hpp:10,
> > |                  from ./boost/thread/thread_only.hpp:17,
> > |                  from libs/thread/src/pthread/thread.cpp:11:
> --=20
> Nanjing Jilong
> Yi Qingliang
> niqingliang2003@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Q7FmPuhIbtiu4EM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHeXxYACgkQN1Ujt2V2gBzLPQCeMZ+jpr16zQ7fX1d3oUFDXypz
coAAn2tj1DvWt8crNH/IQ00aeaqnSMmz
=5Yk9
-----END PGP SIGNATURE-----

--/Q7FmPuhIbtiu4EM--
