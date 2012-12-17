Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tkgnx-0002Wd-29
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 20:56:51 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3782562pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4sv829ZUYEK2ckSQPjpuYFS2b8+6BNcKkL1OvJ2KxFw=;
	b=H1mnbybOVkLNEDK/DfAAMXRsJaz961Dg8Gjy3Dpjo0YxHl6E1L++xKWPykDHzZBnUI
	GmEfqbmr11lulqgQxvFeENneSaqG/IBS0/AIw8jGZTh3RA5YAIfuiyEd5W2RjmbcGo8m
	oIK1pxLXP/J1PNYsMscMdEjxIagpLPnyYfs0fK0sqsxubxCo/WyqPH7cxhPZJLaSdiQO
	yPRJJ0Z1hQ8gjWb28OneTYOIjghyy8Ne0C29ux0C54HFdPGUr1eoL8gpMledlQUt2alf
	CK7wQEf1oO7+CBjae4QouDY9ud+UZHfOSNYrUEWmqzGk4cUVBuiNmghH5rya/gyL1Wmk
	5fEg==
Received: by 10.68.252.69 with SMTP id zq5mr46466405pbc.104.1355773327578;
	Mon, 17 Dec 2012 11:42:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o5sm9059058paz.32.2012.12.17.11.42.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 11:42:06 -0800 (PST)
Date: Mon, 17 Dec 2012 20:42:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20121217194203.GI3448@jama>
References: <cover.1355479412.git.Qi.Chen@windriver.com>
	<2ff77d8cdc19c9040f3ede2203700ee91e878e5f.1355479412.git.Qi.Chen@windriver.com>
	<20121214205253.GE8699@jama.jama.net>
	<50CE8230.6060209@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50CE8230.6060209@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] ICU: upgrade to 50.1
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
X-List-Received-Date: Mon, 17 Dec 2012 19:56:51 -0000
X-Groupsio-MsgNum: 32794
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vs0rQTeTompTJjtd"
Content-Disposition: inline

--vs0rQTeTompTJjtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2012 at 10:23:44AM +0800, ChenQi wrote:
> On 12/15/2012 04:52 AM, Martin Jansa wrote:
> > On Fri, Dec 14, 2012 at 06:08:52PM +0800, Qi.Chen@windriver.com wrote:
> >> From: Chen Qi<Qi.Chen@windriver.com>
> >>
> >> Upgrade ICU to 50.1.
> >> All unnecessary patches of previous version are dropped.
> > Here it fails with:
> >
> > ERROR: Logfile of failure stored in:
> > /OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/icu/50=
=2E1-r1/temp/log.do_configure.5863
> > | configure:3917: checking for gmake
> > | configure:3935: found /usr/bin/gmake
> > | configure:3947: result: /usr/bin/gmake
> > | configure:3983: error: No such directory
> > /OE/jansa-test/shr-core/tmp-eglibc/work/x86_64-linux/icu-native/50.1-r1=
/icu/source
> > supplied as the argument to --with-cross-build. Use an absolute path.
> >
> > Notice native path when building for target (armv5te). Ah and I'm using
> > rmwork so maybe it worked for you, because source from native build was
> > still available when you started target build.
> >
> > Cheers,
> >
>=20
> Thank you for testing it :)
> This failure should have been fixed in version 2. Are you using version=
=20
> 1 of this patch?

Ah you're right, it was probably from version 1 you've sent me off list..

BTW: can we stage only parts of native build which are really needed
instead of whole workdir?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vs0rQTeTompTJjtd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDPdYsACgkQN1Ujt2V2gBxd+QCfclJExaFCjuNijxrSOAi+9zxP
hqUAn3lRdHPAev6sfSBqnG2YWHc/5gQl
=1ZX0
-----END PGP SIGNATURE-----

--vs0rQTeTompTJjtd--
