Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4674771633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 15:57:30 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so66832226pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=soNbf1vB/hzGLGV0PCb5QAjDXe/WxMYcASsP6eOnyvY=;
	b=Eu30UUwLoyZ9xVNpVeN3aXfgxUCQuD79r4rGgOYmD3SUi/z9P2oqUUS2unDRl6oFyA
	855iu2otY1ME6WeZnGO18j4MkBWK3Hbyae1uYe5tg0K0btiVh/2gwI9fO6F1qDoY+pq3
	rUcUY4YjD5ASnVdB3szFpY68puJ5/S9NiiXnezcsLMSAHMCm/4ef7bU3y/cBw08gZ7b0
	3XHEMLAq0owofrw112JxXfBJfnlmRrnOB+ZRJ166UERwAtlQQgr1eOxzNtZe5vdS90yc
	pblK+sskcVmr6hrnqfemIULalH8Xnl/CkwTEMrAeHWQn77MOhUovCzhp6vWS5SHYfaqh
	AZXQ==
X-Received: by 10.66.233.1 with SMTP id ts1mr16114928pac.128.1440777450918;
	Fri, 28 Aug 2015 08:57:30 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by smtp.gmail.com with ESMTPSA id d4sm6153362pdc.93.2015.08.28.08.57.29
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Aug 2015 08:57:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <146137d99b3de1a21886a68cfa1cb470fb9e6f4a.1440763946.git.alexander.kanavin@linux.intel.com>
Date: Fri, 28 Aug 2015 08:57:19 -0700
Message-Id: <E8C8E474-0AB1-48C9-AE1B-7EF333E5DA63@gmail.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
	<cover.1440763946.git.alexander.kanavin@linux.intel.com>
	<146137d99b3de1a21886a68cfa1cb470fb9e6f4a.1440763946.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] dpkg: update to 1.18.2
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
X-List-Received-Date: Fri, 28 Aug 2015 15:57:31 -0000
X-Groupsio-MsgNum: 70248
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FFA456FB-A92C-40E0-A637-7489A48F11AF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FFA456FB-A92C-40E0-A637-7489A48F11AF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 28, 2015, at 5:18 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> check_snprintf.patch has been dropped, because it seems to fix a =
problem
> that doesn't anymore exist, and doesn't have any description of what =
the
> problem was and how was it fixed.

it is redundant. should be fine



--Apple-Mail=_FFA456FB-A92C-40E0-A637-7489A48F11AF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXghOgACgkQuwUzVZGdMxQ0wACfeXJQ7SJ3GqnHeiL7NzBafO9V
StkAnj/G6ihhZz5lPPWQz9gPNm1X6Gic
=6uwn
-----END PGP SIGNATURE-----

--Apple-Mail=_FFA456FB-A92C-40E0-A637-7489A48F11AF--
