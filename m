Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0842C73179
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 21:21:58 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id ho8so97239126pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 13:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=uzo9kN/H5GjnjCi1rtf2kXHOiDBzVqtvVnCgLIhVzX0=;
	b=oifECpTApbBs3Xk8KQB7g3NdUG6XYzgp4qaf0SdtYlP23V/PSeUE4f7/TCdvlOJ2h1
	wfhUd+h8Ni92MYIuVWmGF+y5ZFP2hQPHk9zjNIMCkN+on6VQz5tUBga2XY9YnbH9/D8J
	S1XgtDZmtb1ksOrVabGGS3/Dpekrlc3J2lGi59b/WsV8dQpbNHs4zzsrpNkRaNAm92yY
	NR9y65HR5VS8aYP2qKKJNTx3ku3WZ4h55bC9IVLD1KK/M40nKyv9tW2wJPq2whfElkER
	Z2+c7x858ix5t21vj13RDBnV0QmFpee86xygkASe/KTEPgLGO1H0JclGzkcJpXnY4Zr6
	/G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=uzo9kN/H5GjnjCi1rtf2kXHOiDBzVqtvVnCgLIhVzX0=;
	b=QKSdU5hbBAsy6Et709tmjM0MVx1E13s2sZW68Mm7Hr6pK2LzYnqF++LetbWBPjSbAF
	wB3HBGPncm+nHIdb+5izpvMdsA44N3AOM0uPzcKYwyAhjd9juwH0xK6kGFliPVfyDu7a
	8GuiD2ZWCDlGWUOaiMWmaEF5ga9qXDEzpNNeeui/XEOwOqRyzeMCrHo34mH8OnHgpZIt
	3sE5tTTM6r9el3iO3AFPa6a83T4FAPKdRFww6GITJWUuaqbW+jZyGeuXyrZGskG5b0F2
	nlE3WOvmpVLIauZxj/uMDjBnDVUPbbBbF+klpEEJUOEG/xCXB+1RhfwyBBB4Amxlo+m6
	NSKg==
X-Gm-Message-State: AG10YOTJcMmHpB33Uu8wKU+EvZS8D2HeEojSo/iSJ/P5DtMCejxZdU56++Al1/zj5WrVyQ==
X-Received: by 10.66.124.200 with SMTP id mk8mr54061671pab.43.1455052919200;
	Tue, 09 Feb 2016 13:21:59 -0800 (PST)
Received: from [10.0.0.112] ([76.126.209.57]) by smtp.gmail.com with ESMTPSA id
	79sm52720901pfr.22.2016.02.09.13.21.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 13:21:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71Wjx4UGYsRTCC+PDWrPMeLP8cO+yayvTS3g9p=VBWvtUQJg@mail.gmail.com>
Date: Tue, 9 Feb 2016 13:21:58 -0800
Message-Id: <B633F743-147D-46DD-B371-782F118A921F@gmail.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
	<4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
	<CAJTo0LaLWz6=kt2D7B4q_9B5atfBEoTt7Og+_HqBoB98ax+RFA@mail.gmail.com>
	<CAMKF1srP19D1Vg1Nvg5nbcqGp_xGLw=m8XFRiF6x659ixKZJBg@mail.gmail.com>
	<CAP71Wjx4UGYsRTCC+PDWrPMeLP8cO+yayvTS3g9p=VBWvtUQJg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Tue, 09 Feb 2016 21:21:59 -0000
X-Groupsio-MsgNum: 77886
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7E268FC7-188F-4DB6-91D6-C74186DD272D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7E268FC7-188F-4DB6-91D6-C74186DD272D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 9, 2016, at 11:41 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
> On Tue, Feb 9, 2016 at 8:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Think of crypto policy point of view
>=20
> why not. this is probably a good thing. But I don't think we should
> block the current patches as they are. If we want to add a
> DISTRO_FEATURES the patches we did in mesa and xserver are needed
> anyways. Once every possible 'crypto' config are available as
> PACKAGECONFIG we simply need to add one line to pick the one we need
> based on DISTRO_FEATURE content. So I think we should merge them, and
> discuss/plan how to add crypto as a distro policy.

Thats ok. However, if there is a time to do something to consolidate =
crypto backend
policy then such instances are the right one. I know you have a solution =
for your problem.


--Apple-Mail=_7E268FC7-188F-4DB6-91D6-C74186DD272D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla6WHoACgkQuwUzVZGdMxSNDwCfZREyXyFNi/7NVvt6kLAwjAGw
EscAnRV6IfQOqbBdmAIUVI9bqCH97HzX
=y3NS
-----END PGP SIGNATURE-----

--Apple-Mail=_7E268FC7-188F-4DB6-91D6-C74186DD272D--
