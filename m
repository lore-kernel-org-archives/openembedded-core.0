Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9906B6EDF9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:46:22 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id y10so9051658pdj.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 23:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1eDkdlY6bV2H4Goisi5kFwA6daoobIO9mOcUshK6nGE=;
	b=D8P52KyrWdAkfBd0vSjSQLT4bswynEisyyOynIMltNoO5a4EUXDishBXY5waHvBHnb
	dZkIHsyu0RqObRru1RSBOb/C/CKWW0rtLnRE9VJK4Bk0uuNFtOLq7zrYsVLeenqACIjM
	2UCHfBe7XelvbYYQwFVNLuW8pMKeJT5KOQb7Q9yvYieZ9AqPUun8dF8iDo+eD7ksxK8u
	az0BnorUoa+uQPWT/POXtjsuX1WPfyl9ONdZysUvtt03DcQCnZQeXAItxCZba5l0LK38
	HkwU1D2YmnIPazb9nMb3Gw1Vm3FnucAItwl25nYl8pNMRk1qdBQyczTQ7NElIC0yubx7
	je6g==
X-Received: by 10.68.239.137 with SMTP id vs9mr29727909pbc.84.1396334783385;
	Mon, 31 Mar 2014 23:46:23 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	pp5sm47699903pbb.33.2014.03.31.23.46.21 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 23:46:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <001a01cf4d74$cced90e0$66c8b2a0$@com>
Date: Mon, 31 Mar 2014 23:46:20 -0700
Message-Id: <BA9C0705-4983-4FB4-8B83-F0A9A8686DAF@gmail.com>
References: <1396332774-31033-1-git-send-email-b40527@freescale.com>
	<64C886B8-D3BF-40FD-9D96-F46F37DB608F@gmail.com>
	<001a01cf4d74$cced90e0$66c8b2a0$@com>
To: Zongchun YU <b40527@freescale.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool: Add depends on binutils-cross
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
X-List-Received-Date: Tue, 01 Apr 2014 06:46:23 -0000
X-Groupsio-MsgNum: 51984
Content-Type: multipart/signed;
	boundary="Apple-Mail=_577D7162-92EC-4C16-A9B4-9897EA1E7D7A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_577D7162-92EC-4C16-A9B4-9897EA1E7D7A
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On Mar 31, 2014, at 11:37 PM, Zongchun YU <b40527@freescale.com> wrote:

> Sorry to confuse you. Sometimes libtool have been built but the
> binutils-cross have't been built yet.
> It is required by libtool.

OK is it cross, native or target recipe which has the problem ?
wouldnt it need to also depend on gcc-cross ?

--Apple-Mail=_577D7162-92EC-4C16-A9B4-9897EA1E7D7A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlM6YLwACgkQuwUzVZGdMxTmOACeIzSKxGN2hICU1zmTqKoVgnDF
rdAAn0wjGgzgdFacTrQJqFec7UmhBel7
=zfh8
-----END PGP SIGNATURE-----

--Apple-Mail=_577D7162-92EC-4C16-A9B4-9897EA1E7D7A--
