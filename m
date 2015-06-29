Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id BE95C6AC15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 12:45:06 +0000 (UTC)
Received: by wiga1 with SMTP id a1so70236539wig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qwANp91FrMExl6HOI+MlExarfqXXcpsWkmpi7RbI4nQ=;
	b=jLK02RwD6aANo+KD1Y50+KP1TadgvE0hl73Mmx81C9JAeybKCxHZsQ4VJbuWeHEx3S
	SUmWLW1xmVfx7yxthmByzYGLl7tXBTWDPgQVQAMg5DP9BJ5KhP065pU4+rDVkgcfL9Nz
	Jq/ahFl7pyCd/u0EQDpjF3TVnWCYtxc5EHCueP11VVGDIw2Dp1ycvvOdXU6EJmhQYyPR
	kM50IpMDEQ8A+FY8sY0EuLXlvT3H+rXCvgofWXGMnejy4kRZSUq1Q53+OkpLJdAv218S
	CDYTSJbiQPAW6fnw9Pear2vhfBCbJHX0R6vG8AYWBbD1PKX2qpfzuLLyH+I7nKhYreeY
	w2GA==
X-Received: by 10.180.14.193 with SMTP id r1mr21262461wic.47.1435581906918;
	Mon, 29 Jun 2015 05:45:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ex8sm7090778wjc.34.2015.06.29.05.45.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 05:45:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Jun 2015 14:45:12 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150629124512.GE2393@jama>
References: <cover.1435297800.git.mariano.lopez@linux.intel.com>
	<e70f95d9bb6247ec0f305966894b22f681135013.1435297800.git.mariano.lopez@linux.intel.com>
	<CAJTo0LZrsr7u7a-jRhoG6nKP51vXBGCiuRsm51YoySiK_YSxsg@mail.gmail.com>
	<20150629111839.GB2393@jama>
	<CAJTo0LZ4fC8k889WXqfgvqLxGMZgZvQoCe3RGZTEvYxaf0xjow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ4fC8k889WXqfgvqLxGMZgZvQoCe3RGZTEvYxaf0xjow@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Jun 2015 12:45:07 -0000
X-Groupsio-MsgNum: 67280
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline

--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 12:43:04PM +0100, Burton, Ross wrote:
> On 29 June 2015 at 12:18, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > This is about multiple TaskFailed events being processed at the same
> > time, isn't it? So it's still part of the same report and unrelated to
> > uploading to web app.
> >
>=20
> In which case the last task wins, as they're all writing to the same
> filename right?

No, if the locking is implemented correctly.

Even the last task parses the file before appending additional
task failure and dumping it back to the same filename.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWRPdcACgkQN1Ujt2V2gBxXyACfRod/spdsfZEM+g/5HUXNEZ9r
t3sAn1YdIII88UCZ+Qjcn889XLeIvUF6
=tgsV
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
