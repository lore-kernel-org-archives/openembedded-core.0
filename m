Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB9E731F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 04:08:45 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id us13so4918340pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 21:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=qJYSA0e+xwp94fYg+Hbuhd4qXSTJ3DW2JfJ1509a1hI=;
	b=MC5Xguz9Hu75Bwhohz3iK63mNNe+ZCBtd6gbrA5aiKJZG7eKT4V4iW+NHyW1Wu6NUD
	ygNDfXfxAGmyiWf7vtCKSDMtO2P2oGMgL8XUp9mGgfxQQ36VdRVwF3RGc8wbeSeA6+z8
	Yzn7TcnbdH/6sSUbf8/mbMFApZvjIF+R8YYNofPd2QayKbn59A5Gmck8vtfNEKeAvo3v
	kUq3w8TvXd0DXDYcGsGyKrmNDjvyZH3morDyHDL5xQxG1crs4tNBT9C/3cCqdHDuTuma
	cxdp65mMQAECQoMgx3jBhsygjiLULl1PvmDqcma81gcR1FQJ+8Oq0rlZN6/jtacdTF52
	zEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qJYSA0e+xwp94fYg+Hbuhd4qXSTJ3DW2JfJ1509a1hI=;
	b=X2Ffbkx+RFGzGU7PhaArFTvZ3HVl3icQkg83y7AF35JslPbSgQVyhrokQ/rx1Wbo/R
	MiVGYntav5gWPHVIyDoj/KLcfF/6inrD4reMhN/t1gaTEibVe0fzMnvNyM2Vc2z/50gx
	Wapird/WhLD84BdrWlNwFEcirfqQUHKsI/xXv0QUq06qQvvQ5to2+rapVQ2SMOuUJeAr
	uxKnYL0J7x7BTyXsQagmyr1Dev1GyeXyhRYCvbUEhvjdo9d/WFJU0D7jJ4paWdsHFxsZ
	L2n7mCqG+vB5NqbNlyt7GHzGZ44THSAa012W2e4nTPUXn8djTYYc22obysHcOX/FY28d
	m8ag==
X-Gm-Message-State: ALyK8tKnUWURZn/1wAXHZv0IUG55XDCgL8IfE1l1RW3yJQequxv/rq9o6HcEw1aAH/X1aQ==
X-Received: by 10.66.255.7 with SMTP id am7mr9396781pad.75.1466136525470;
	Thu, 16 Jun 2016 21:08:45 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	bw1sm56586200pab.17.2016.06.16.21.08.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2016 21:08:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <fb177ff9d5c3e56fdbce5ab3182b476a1cc0e9d4.1466134498.git.Qi.Chen@windriver.com>
Date: Thu, 16 Jun 2016 21:08:37 -0700
Message-Id: <065DE437-B9FA-43F4-A8BF-940F66231E77@gmail.com>
References: <cover.1466134497.git.Qi.Chen@windriver.com>
	<fb177ff9d5c3e56fdbce5ab3182b476a1cc0e9d4.1466134498.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] systemd: upgrade to 230
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
X-List-Received-Date: Fri, 17 Jun 2016 04:08:49 -0000
X-Groupsio-MsgNum: 83543
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0E24297D-8920-4EF5-B7E9-39678800DED2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0E24297D-8920-4EF5-B7E9-39678800DED2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 16, 2016, at 8:36 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>=20
> diff --git a/meta/recipes-core/systemd/systemd_229.bb =
b/meta/recipes-core/systemd/systemd_230.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_229.bb
> rename to meta/recipes-core/systemd/systemd_230.bb
> index 4b726f3..9afdfa8 100644
> --- a/meta/recipes-core/systemd/systemd_229.bb
> +++ b/meta/recipes-core/systemd/systemd_230.bb
> @@ -35,7 +35,6 @@ SRC_URI +=3D " \
>            file://0020-check-for-uchar.h-in-configure.patch \
>            =
file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
>            =
file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
> -           =
file://0023-build-sys-fix-build-with-libgrcypt-disabled.patch \
>            file://udev-re-enable-mount-propagation-for-udevd.patch \
> "

0023* patch is removed from SRC_URI but not deleted.

--Apple-Mail=_0E24297D-8920-4EF5-B7E9-39678800DED2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldjd8sACgkQuwUzVZGdMxRGVgCgj1/wqngO85zYo9IGgrYWwe4w
8DUAnA72wka7EZAeza6ZtJVo5uhjDm+N
=js7l
-----END PGP SIGNATURE-----

--Apple-Mail=_0E24297D-8920-4EF5-B7E9-39678800DED2--
