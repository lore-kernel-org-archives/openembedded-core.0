Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A081571633
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 17:02:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so5009547wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 09:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=95V5IB2HjRzHKzeYn3Rg8a9geHQHrQrteqeHxy4diKY=;
	b=Xii5t8bsT5EReNJ+87IT3aHg2oT+5zpsKaADDQSHKGrDDzjI90RtfmVCBZA0zaf8X6
	oRtr2PpM1AsCjr9yr0fBleZ4HfXtA65/t2bEM6K+tjLRB2zTvIy+HFOQM6ya4qQMm7PI
	lJezESyGxmnylXF6RBS1udMK9r7Bdp7NzDFTTz9z8fETRnQlZ4JEH+0AbmJIpGrYfLX2
	r2ORIkvoPWRPUEH5eVUEiOhnB/avruXZ2zRMoH6lOGmUof4Er5MV0qEtwWyOyELKDBgn
	7du4NcPNz3Vgu5nRvy8ochdKD0mXinB4x46WOaFTdEI38g0tAmbtGIvb5biSzYYI45uC
	6Mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=95V5IB2HjRzHKzeYn3Rg8a9geHQHrQrteqeHxy4diKY=;
	b=GGJH5iHnc21iYkOByEw+YOtQKqumFGmNme8ybRhLGaicT1Xl88UfS2GzbvpVdg+FqT
	iucLgzDUnIkM0OmgEpd270/lKZqicLWgcA5D1ECTLeUC37UF//XDCPFZpijWUdbzmMgK
	R8uxL/GdMp6nYt4xZ8471uzRfOBDR9yHDvBPOcncdpiH9xbvNxcmyRuAMkIiNPBEShkP
	m00RKR5vaDInRUQVmt3/7ndKGaP8769ZuxqdmMbZYRF5dYPTe9XE9jwVnIH4E/rv1AWd
	qzMB2gRLNL3VLzEqCu4mku1zxaB/sSirIx9O+lD7oF5m5dmUVL4SN9KcGcnQiUcoi4Gr
	RKXQ==
X-Gm-Message-State: AD7BkJIIsDdr8NnEaojU3h+PSLcekn3Zg3nRPg6SbNqoCqo81GLRSfZ82Rtllb564T+nLQ==
X-Received: by 10.194.78.83 with SMTP id z19mr4955489wjw.5.1457629374920;
	Thu, 10 Mar 2016 09:02:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w125sm4371987wmw.18.2016.03.10.09.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 09:02:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 18:05:53 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160310170553.GM2573@jama>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<20160310165631.GK2573@jama>
	<CAJTo0LZ+Pwv=7OrQDGEFaHEBGCqk38fyWvJp3+n4T5DcUV_+0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+Pwv=7OrQDGEFaHEBGCqk38fyWvJp3+n4T5DcUV_+0A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Thu, 10 Mar 2016 17:02:57 -0000
X-Groupsio-MsgNum: 79416
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ARLBH93C7pgvpZY"
Content-Disposition: inline

--+ARLBH93C7pgvpZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 04:56:21PM +0000, Burton, Ross wrote:
> On 10 March 2016 at 16:56, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> >  which triggered exception NameError: name 'qemu_wrapper_cmdline' is not
> > defined
> >
>=20
> Do you have oe-core 0b68f0632312392cbd20bfcb9ed4895cfc9883ff?  (which is =
in
> master, which master-next branches from).

I have 0b68f0632312392cbd20bfcb9ed4895cfc9883ff, but one of the layers
included in that build was overwriting qemu.bbclass to fix some issues.

The issues were fixed since then in oe-core as well, so I should be able
to just drop this qemu.bbclass.

Sorry for noise, for some reason I usually notice the root cause just
after hitting Send button in e-mail :/.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+ARLBH93C7pgvpZY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhqXAACgkQN1Ujt2V2gByIxQCgm3Zueg84VGDiERyIU0hay+Sh
wlMAoKZA7BBEu2CMtgtEMdKNRR7Wd+qv
=NoKy
-----END PGP SIGNATURE-----

--+ARLBH93C7pgvpZY--
