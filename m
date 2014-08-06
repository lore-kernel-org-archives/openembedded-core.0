Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB8A6FE5C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:37:03 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so2762014wes.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PmWjMT+etq9eWe8VM/9dW2Zuu+BvYuuZtOlnepxKX/g=;
	b=OBpf2vd0xEm90Cnmkr/mxmj4mc391ADK8m8HgNcnqJ1A+ExzFaKTo1e8Fh5KE7CN4h
	jQ5BvK+5IqOS+DQ9E5NBfy4A4+7v6jPQGBzxrO/Y75lDw+/wco1GtmTzlOCjT2Sonbkm
	JJ6S9v+n9cBoa09qcs4yqCqVQZhED4GrUcEixDBwmVaT9nQ4wOUT23hdGW7lJKhMEgia
	xU7yVtyUfDLWw8xsciUADgPEwV3qg3+Gl99XQlEW3EBJfPW4ti3/hK2ocmfxFtyUK691
	Bi2Eg/RzcIRlDBxYonWBeQqSD1R8vpvoAcmrnFMG19nhZU+32b9ROPim9E2idvUo0B+O
	Podw==
X-Received: by 10.180.99.102 with SMTP id ep6mr16907678wib.1.1407335824278;
	Wed, 06 Aug 2014 07:37:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bt9sm2896666wjc.40.2014.08.06.07.37.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 07:37:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 16:37:34 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140806143734.GK14848@jama>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
	<1407325317-5030-1-git-send-email-Martin.Jansa@gmail.com>
	<42649926.Kn7RmW5cEk@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <42649926.Kn7RmW5cEk@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Wed, 06 Aug 2014 14:37:04 -0000
X-Groupsio-MsgNum: 56057
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q6mBvMCt6oafMx9a"
Content-Disposition: inline

--q6mBvMCt6oafMx9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 01:41:58PM +0100, Paul Eggleton wrote:
> On Wednesday 06 August 2014 13:41:56 Martin Jansa wrote:
> > * building with libav-9 fails with:
> >   | checking for POSTPROC... configure: error: Package requirements
> >   | (libpostproc libavcodec libavutil) were not met:
> >   |=20
> >   | No package 'libpostproc' found
>=20
> Does gst-ffmpeg actually work with libav > 0.8?

No, not yet (see world status e-mails), but at least this is step
in right direction IMHO and doesn't harm libav-0.8 users.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--q6mBvMCt6oafMx9a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiPa0ACgkQN1Ujt2V2gBx3ZgCgmrfA1bpaQVwTxYyRWkR19sqN
wHEAoKz8puxKQ999cAkSpLbUA+lG7/JV
=9oYI
-----END PGP SIGNATURE-----

--q6mBvMCt6oafMx9a--
