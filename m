Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCSxq-0000Ib-Vq
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 11:49:51 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so3090885pab.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 02:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0ourNJCs9mAIda+Oa09VR5ptI0E+6Gpp0Kivy3WKGG0=;
	b=fhZRbYzTvYRFVgVPIHpkUd9UHEPJHpYklCAs4heUSria3PNipHV6rf5uDWGzb1h/P3
	1b1Dvhe/E4ZKxK5hqSzlAAHmCEtLrSO5vEz3qCRqFDIcj4Wg12WZpZfqVY5V3BSq0mhI
	vQEwYLYl7tMsv68IwQSrmhhR57WsUILHbuBvpkotZXsKvmKNLHuPtt5yx/9sE2KeQJH+
	u1izq9I/bFAeXqgHhDI09siMUm+ThLdQm76FvJ8FtPAA6hRNWdNIPc+ibus2V0ND09Zf
	URlrfPzfAZTZPTb7m33vy9Cojg2INDzCucGsJm+mwU1Igvbzz+KSHknh9/q57/1KxDdh
	6gPQ==
X-Received: by 10.68.138.225 with SMTP id qt1mr27113789pbb.82.1362393202695;
	Mon, 04 Mar 2013 02:33:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	rr14sm21888777pbb.34.2013.03.04.02.33.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 02:33:21 -0800 (PST)
Date: Mon, 4 Mar 2013 11:33:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130304103306.GF3268@jama>
References: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
	<20130304081846.GC3268@jama> <1362391887.29587.5.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1362391887.29587.5.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
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
X-List-Received-Date: Mon, 04 Mar 2013 10:49:51 -0000
X-Groupsio-MsgNum: 36175
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline

--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2013 at 10:11:27AM +0000, Richard Purdie wrote:
> On Mon, 2013-03-04 at 09:18 +0100, Martin Jansa wrote:
> > On Sun, Mar 03, 2013 at 08:34:30PM -0500, randy.macleod@windriver.com w=
rote:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >=20
> > > The hardcoded paths in libtool will cause apache2 compile fail at
> > > link stage when the package apr is installed from sstate cache, so
> > > add libtool to SSTATE_SCAN_FILES.
> > >=20
> > > [ CQID: WIND00405372 ]
> >=20
> > You can drop this.
>=20
> Is this really a big problem? I can understand people wanting to be able
> to track commits back to defect reports...

Not big problem, but isn't link to cgit in their tracking system enough?

That's what I'm using for SHR bugs now, because I cannot assume that people
using oe-core will know where bug tracker for [SHR #666] is.

I cannot find public windriver bug tracker where I can search=20
WIND00405372 to find longer description why this change is needed (I
know why in this case) - that's why I find yocto bug tags useful, but
not WIND00*.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE0eGIACgkQN1Ujt2V2gBzqiACgu/t+w9nhkoRkyekIgMjsPmpS
CL8An0yM7jkcUHqkrNg0l5G2Zotl4sNv
=nXvi
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
