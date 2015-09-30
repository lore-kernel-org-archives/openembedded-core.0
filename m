Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 391E677027
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:28:07 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so64685614wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3ajk1ls8Mh0fljZoa1ZJNfBVY5UOD6CHH/ILCZbkU7Y=;
	b=WxewySq04L3LGm5PfuaJNd/DAsGjDB4RFpoX/D3zju+zvwzEI5KZHboeDah1AnXcGP
	QVg9R12sK+E58PX6jyoM8hzuQRd7fmUi9Hyx4YmsfLL2TG1p6DSpEyoBS8iOpNMZT7sF
	5oXcgyNOykm45GabgZt/HBboeDMdeDiz/epkz+4i6JgA+jw+MOD0dSqisBjlB1tkuJgd
	if0k8ZxJR3Kec10HHvS3zurxIPqMvVvwfw+GG4V7qOp3PcB6ib5k7Tw3kjL+Y/kBMbQ+
	fxBNYgUkWsWttSgf1FcKHGDZWxyinf9tfmDbMaX0ilFfPs+0qkSWrJja0vlVLeWkPK4u
	RiXA==
X-Received: by 10.180.186.195 with SMTP id fm3mr33435574wic.1.1443623286877;
	Wed, 30 Sep 2015 07:28:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p4sm29903692wia.15.2015.09.30.07.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Sep 2015 07:28:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Sep 2015 16:28:59 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150930142859.GB2405@jama>
References: <1443620833.5162.83.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1443620833.5162.83.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-selftest: Add qemux86copy machine
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
X-List-Received-Date: Wed, 30 Sep 2015 14:28:10 -0000
X-Groupsio-MsgNum: 71812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 02:47:13PM +0100, Richard Purdie wrote:
> I know Martin finds something like this useful for testing sstate signatu=
res,
> this adds one to meta-selftest so we can use it from oe-selftest in the s=
state
> tests there too.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta-selftest/conf/machine/qemux86copy.conf b/meta-selftest/=
conf/machine/qemux86copy.conf
> new file mode 100644
> index 0000000..bcce2f5
> --- /dev/null
> +++ b/meta-selftest/conf/machine/qemux86copy.conf
> @@ -0,0 +1,3 @@
> +require conf/machine/qemux86.conf
> +
> +MACHINEOVERRIDES .=3D ":qemux86"

I wasn't changing MACHINEOVERRIDES (in case this would hide some
possible sstate differences), instead I had to duplicate couple qemux86
overrides in linux-yocto, but this is still useful.

I'll drop my version after testing with sstate-diff-machines.sh that
both return the same results.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYL8aoACgkQN1Ujt2V2gBzMrgCgoQsASnJXXBPXCZaN33Ey/juS
degAnRu4eW9yzvPPU/WxEKixBJ61YtAD
=fI27
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
