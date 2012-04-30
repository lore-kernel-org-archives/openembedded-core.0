Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOrnH-0007kv-Ty
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 16:41:40 +0200
Received: by wgbds1 with SMTP id ds1so2308344wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s8k2cq0aZaE9JqxKogfNWtZwn7CfwsdGbs3XEkjN1I0=;
	b=xAyEsIOCtZR8za37/bU8nGrQzFm//gyJULRmXesUfBKB0YFR64cjfS4VO729BQB6Yo
	VLRXMc+DQfc4Mf2Q8fhYTi9pERQnjwhgQZyPM0TrOTtObKVxo3O/VZdi7mfJqsY0qVGg
	OC639860qg0XwrxUL43n9Eu4mBo96W8r0qjYTVctFbwBKpibXxypurZKAt15/QWvD+XD
	hehipQNzDB5iS0AvMZeG/QhDvf3vfOouvWLjuo48tk0NyUWEikFfDE3rhKriRrMeyFRT
	bBWNlGhQGuBPIBxuEiotngmmMpXadtLYYQtHgBCLOk+XMm6KZ08mpMOMjqAc8ZYAbnfC
	Qacg==
Received: by 10.180.85.70 with SMTP id f6mr20838679wiz.5.1335796317118;
	Mon, 30 Apr 2012 07:31:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm28742539wib.4.2012.04.30.07.31.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 07:31:55 -0700 (PDT)
Date: Mon, 30 Apr 2012 16:31:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120430143155.GE3664@jama.jama.net>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<20120429091230.GB350@jama.jama.net>
	<20120430104345.GC3664@jama.jama.net>
	<CAMKF1soz_mgP2bwDP_kqRVFcb5MrO3PTOTu7J+u+eWfR2W3jsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soz_mgP2bwDP_kqRVFcb5MrO3PTOTu7J+u+eWfR2W3jsQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gcc 4.7 + mips64 architecture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 14:41:40 -0000
X-Groupsio-MsgNum: 21326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2012 at 07:15:11AM -0700, Khem Raj wrote:
> On Mon, Apr 30, 2012 at 3:43 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > I've found one more, which seems to happen only on x86(-64)
> > /OE/shr-core/meta-openembedded/meta-oe/recipes-multimedia/libav/libav_0=
=2E7.4.bb
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git=
/libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
>=20
> port the below commit from OE-Core/master
>=20
> commit 1161c40a26146629613bd6a17b263175a492b751
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Fri Mar 30 12:07:39 2012 -0700
>=20
>     gst-ffmpeg: Fix build with gcc 4.7
>=20
>     A cmp instruction with two constants is invalid, therefore 'g' constr=
aint
>     is not correct but must be "rm" instead.
>=20
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks, works, done in meta-oe-contrib/jansa/test

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+eolsACgkQN1Ujt2V2gBxLtQCghUy3i7cp6pu02knxoqbzKOuj
U8QAn0dJOFSBuOK3V2YLZ6wNYysAE+Dm
=Xsdg
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
