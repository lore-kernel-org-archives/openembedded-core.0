Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0KCS-0000nq-Fw
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 00:02:44 +0100
Received: by mail-pb0-f41.google.com with SMTP id ro12so558376pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 14:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WBE4ogaQ62Q5r/g98OQtAt6jxiELdDR9YiZSrZDK01g=;
	b=ocpLXvTKrhiUpx1xBZwuI8qcUSxbIlxZ4K1n20fSJ78MZN/WZmuda3ePMnwpVsSNCE
	uoEforMaVn2luPiWHFjhFLNfsZAzzEmdlIqp17HgkHzGLtvHduMWJvbuQxppzQsOcxPs
	LASOTa0P78PJUoyL6cA/fayIF3wZqRjmHjSXh60wjiwx1yR/67tlDEqtxbl/cNwKjvfY
	RUzZznu5+4Ne7G5DZfdezIe/tsGEukh6VdeVAouRhnzz1nhHyWDTtH25vzoxcA3QXpfq
	mw/LfRToy3oCXN9YsHX8AtcDpflptHmMJCco0WfIQcpD/lI8VBzMPIcUEz4szEuThPvU
	lBNg==
X-Received: by 10.68.130.161 with SMTP id of1mr6755627pbb.32.1359499623332;
	Tue, 29 Jan 2013 14:47:03 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rv8sm9382179pbc.27.2013.01.29.14.47.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 14:47:01 -0800 (PST)
Date: Tue, 29 Jan 2013 23:46:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Harvey Chapman <hchapman-oecore@3gfp.com>
Message-ID: <20130129224658.GT16904@jama.palm1.palmone.com>
References: <20130129203953.GS16904@jama.palm1.palmone.com>
	<F9975BBC-4DD7-41A8-AD7B-601BD66E8A8B@3gfp.com>
MIME-Version: 1.0
In-Reply-To: <F9975BBC-4DD7-41A8-AD7B-601BD66E8A8B@3gfp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sstate keeping ipk for every AUTOINC value?
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
X-List-Received-Date: Tue, 29 Jan 2013 23:02:45 -0000
X-Groupsio-MsgNum: 34672
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6M1qd/2fGtHH53kd"
Content-Disposition: inline

--6M1qd/2fGtHH53kd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 05:13:45PM -0500, Harvey Chapman wrote:
> On Jan 29, 2013, at 3:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Or why do I have each .ipk 7 times in deploy/ipk/arch?
> >=20
> > tmp-eglibc/sstate-control $ grep ncurses_ manifest-armv5te-ncurses.depl=
oy-ipk
> > /OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.6_armv5te.i=
pk
> > /OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.8_armv5te.i=
pk
> > /OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.7_armv5te.i=
pk
> > /OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.4_armv5te.i=
pk
> > /OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.3_armv5te.i=
pk
> > /OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.9_armv5te.i=
pk
> > /OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.1_armv5te.i=
pk
>=20
> On that note, I often tweak my PR value when testing a modification to a =
recipe. Then, I change it back. How do I get rid of all of the files genera=
ted for a recipe that no longer exists like all of Martin's old ncurses ver=
sions shown above?
>=20
> Is there some way to have all of the old revisions auto-deleted?

Normally they are deleted as soon as you build different one (newer or
older).

So nothing special will be needed as soon as this issue is fixed.

And RP already has patch for it :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6M1qd/2fGtHH53kd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEIUWIACgkQN1Ujt2V2gBwGEACdGU7A5+6LS13DMpJFSD+ANEYP
uEMAn26WV2WMYL3tFNF5ik09GG1BdJE6
=qSKB
-----END PGP SIGNATURE-----

--6M1qd/2fGtHH53kd--
