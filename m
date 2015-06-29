Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 30E9460670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 11:18:33 +0000 (UTC)
Received: by wiar9 with SMTP id r9so526593wia.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=je1MhJxkVW5jSrs/fhRVC+3gDZ41Yolvr0JOKQAxiuE=;
	b=MlGjnmTyl0C7ppzufhhwddw7dctGc2sxZ3FkaddTzOSRSpKVE7JBbQ4ZOToc5fz9BR
	Z4a3FrCEnnDS2kzRSzwJoI5YE43sPXTX04x388uF/IepJgWcT3M0cBQVfTjwvGmVXVvw
	JkTjDe03HIsgCS8wtwbi2zGx2TscotJKh7cT1ikK6dcGIHaMq+Q2Rn4lv6UnfPno7QrD
	k5TK/hcL7yQe6/M6KHxryG4wF3kc9ayx6ojpNevWw7dK10Bw+bP0OMLoSqZt4hKoDIjh
	+qJNMTUW+hN/2cay5cXlAnmKSqB7ZqIXEmduqaZs4mLB4SEAy9dn0Lnn1nTf5Q8arKrL
	vwyg==
X-Received: by 10.180.74.132 with SMTP id t4mr22514957wiv.55.1435576714432;
	Mon, 29 Jun 2015 04:18:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id u7sm11674825wif.3.2015.06.29.04.18.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 04:18:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Jun 2015 13:18:39 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150629111839.GB2393@jama>
References: <cover.1435297800.git.mariano.lopez@linux.intel.com>
	<e70f95d9bb6247ec0f305966894b22f681135013.1435297800.git.mariano.lopez@linux.intel.com>
	<CAJTo0LZrsr7u7a-jRhoG6nKP51vXBGCiuRsm51YoySiK_YSxsg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZrsr7u7a-jRhoG6nKP51vXBGCiuRsm51YoySiK_YSxsg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] report-error.bbclass: Added file syncronization.
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
X-List-Received-Date: Mon, 29 Jun 2015 11:18:34 -0000
X-Groupsio-MsgNum: 67274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2015 at 04:17:01PM +0100, Burton, Ross wrote:
> On 26 June 2015 at 06:56, <mariano.lopez@linux.intel.com> wrote:
>=20
> > errorreport_handler would fail if several errors are
> > triggered at the same time because of two proccess
> > writting to the same file. This patch add the required
> > syncronization to handle concurrent process.
> >
>=20
> The code in the autobuilder that sends error reports doesn't care for the
> filenames, just that they're under error-reports/.  Instead of locking
> around a single file - which surely will replace errors with lost reports=
 -
> just write each report to a unique filename.

This is about multiple TaskFailed events being processed at the same
time, isn't it? So it's still part of the same report and unrelated to
uploading to web app.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWRKY4ACgkQN1Ujt2V2gBzu7QCgtYADx8LwE0FbSs2oK4yl5QdJ
CI0AoKwsATlqyyico4foFH60bMr9CpCL
=GiN/
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
