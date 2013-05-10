Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Uan6J-0007kQ-Sh; Fri, 10 May 2013 15:11:08 +0200
Received: by mail-ea0-f182.google.com with SMTP id z16so2246630ead.13
	for <multiple recipients>; Fri, 10 May 2013 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=epkHF9E5uo6xiN5yCWm7aUychizFJMDXTxBtGgqnvXk=;
	b=yjUtEba1JSmh5UF0M+Cj7km/mtfQx8Teh2qhgTRRsyBRlo3LhnIX4ujDPk1JZGz4td
	qXbqTrGcuNqq0wtjq0PLogLZ0tsDLZw7n+JNiJH8DggGQeBTvW+QZCRkzOdruqJ6dUEh
	YdS79rxpRPYlfRjBu19zXZEacymvKCjK8Mmp/LP3uete96KnUiWzFRZLshDMFQxkYlnF
	4sAishbXqBwVeHRGusLXhKl7BqDISrNCtMGvbtL31GNH9M4w9AqumTDbBqelycxUU98j
	aIFzgg+SdWYvPVFjb+hO+gm+me0fb8ulQaHYdymmZGxmrxLhm9BLvHeRDKJeNMbE+XvB
	b/Zw==
X-Received: by 10.15.82.201 with SMTP id a49mr41181337eez.44.1368190382835;
	Fri, 10 May 2013 05:53:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n7sm3469678eeo.0.2013.05.10.05.53.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 05:53:01 -0700 (PDT)
Date: Fri, 10 May 2013 14:53:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130510125303.GF12329@jama.dyndns-home.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<20130329145514.GH11120@jama> <20130330090319.GM11120@jama>
	<20130401095202.GP11120@jama>
	<4669BF70-0FA8-441D-9A60-325FA8DFA54B@gmail.com>
	<501EC0A2-9F13-4ADF-9D94-056671BFC6DD@gmail.com>
MIME-Version: 1.0
In-Reply-To: <501EC0A2-9F13-4ADF-9D94-056671BFC6DD@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Fri, 10 May 2013 13:11:08 -0000
X-List-Received-Date: Fri, 10 May 2013 13:11:08 -0000
X-Groupsio-MsgNum: 39025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2013 at 05:32:43PM -0700, Khem Raj wrote:
>=20
> On Apr 2, 2013, at 7:22 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > Thanks Martin, elfutils test case is now reduced and reported others I =
will take a look.
>=20
>=20
> I have pushed a fix for elfutils issue to the pull branch. please retest =
and report.

yes elfutils issue was fixed

xserver-xorg issue was actually caused by extra patch for rotating input
calibration when xrandr rotates screen (new warning and -Werror made it
fatal) - also fixed

target gcc-4.8 was fixed by your dependency change, but it still fails
on armv4t:
|
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:71=
98:(.text.unlikely+0x9c):
relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char
const*, ...)' defined in .glue_7 section in linker stubs
|
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:72=
00:(.text.unlikely+0xaa):
additional relocation overflows omitted from the output
| collect2: error: ld returned 1 exit status

webkit-efl is failing (and causing huge logs with 3.9M lines in
log.do_compile) I've patch to upgrade it which works on x86-64, but
fails on other archs.. so it will take a bit more time.

I hope to get better smaller logs from world builds today.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGM7a8ACgkQN1Ujt2V2gBzEEACdHsn9QYyZluDTqYonyint85on
XgUAnRL/CsCzMYR7cJVp7/hJkWMXu4We
=eW34
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
