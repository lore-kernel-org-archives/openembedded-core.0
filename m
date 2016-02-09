Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFD460119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:54:47 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ho8so94693722pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 09:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=zAV2OH0BATW+4PjwsqjBZB0UxACPnoDEFj3HUQP87nA=;
	b=Ovn9dhr1DDcJ8ftTGiznv0qeabfwmi7KDpeiQNZ5/ScvmiOWPN8Aoa1EjF2aUc9ixB
	fTfotcgWtmEJNi7IOMZC/OumSD8fP4jHJzKG1PmnkvcVDnA3Cmm+bhdLDdkTsfKiGpIN
	5trwXIgG73JDFbKQnkgwrhzA1Rt7v47EzSPFM2nhnDm52wYSNGZRr7O8lzE7OZ6f5qg2
	imApOC+qFPcShE1LcJ3D8REgtiiMR1Dpc5SLbcTEayPWAlyVQNcu6ybLyywI3UXPQbNu
	tc+x8klzF19czEkQJntErGb5wvLopZZygKgC/Ulcy/sMZ7Q51rMSSGTkDHKzzf3Qrb6D
	2ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=zAV2OH0BATW+4PjwsqjBZB0UxACPnoDEFj3HUQP87nA=;
	b=d+ag+E0NIhWOkBn01BvPKTEI+ubBPNc7t4rYB7bKpv4J/IcpdZttrcpCFNgZlz/Y+Y
	VntQKhQD7A8+FG3N199ksX0wwHSKvBeEYMKxw/s3IwhnmmzWtGWn6Qta6aMyaVvOAuZR
	+JjgESuTNglw8P9yFqje0LJi+K72Ebeo/KYJIdZvI4IH3UP+LxgEJqpbw6xreIqm4Oun
	0X8mB00wyrON4dXoEOe/Z1wdWD6FQC3oavVe1wEeOuBejmKLAb3S29ibbBQa0YxgACd/
	J1iVon5MMpdXTaMTJO4zYkic6Ar9OMP/Co5Tn15R/rPs6SdDn8eG9pRP3nq+11q+WyZY
	9MNQ==
X-Gm-Message-State: AG10YOTkx+fqgNSmTT/OmU85kKS42AioCEew532VFXb23X+AYZYaY4pzSLUI36sig3CBwg==
X-Received: by 10.66.148.167 with SMTP id tt7mr53019199pab.62.1455040488184;
	Tue, 09 Feb 2016 09:54:48 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:b9ee:5c31:ac9c:2c66?
	([2601:646:8802:5d5c:b9ee:5c31:ac9c:2c66])
	by smtp.gmail.com with ESMTPSA id
	tp3sm52155007pac.16.2016.02.09.09.54.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 09:54:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
Date: Tue, 9 Feb 2016 09:54:46 -0800
Message-Id: <4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
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
X-List-Received-Date: Tue, 09 Feb 2016 17:54:48 -0000
X-Groupsio-MsgNum: 77874
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6EADD375-DFD2-4571-B2AD-31B58D93FD80";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6EADD375-DFD2-4571-B2AD-31B58D93FD80
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 9, 2016, at 1:39 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
> On Tue, Feb 9, 2016 at 10:24 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>> Default to libcrypto (openssl) as before.
>>=20
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>=20
> Looks good to me. this is the same implementation I used in the mesa
> patch.. so we need to make sure that any review feedback is applied to
> both before merging the too,

since its spans multiple recipes would it be better to control it with
a global knob instead of packageconfig.

> should we get any review feedback.. but
> in any case:
>=20
> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_6EADD375-DFD2-4571-B2AD-31B58D93FD80
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla6J+YACgkQuwUzVZGdMxTJuwCfeL5TAu2Ll8l02WDk/tJYEiD4
aeAAn3iLAFFUUrm0DapzcXuQ6+kMs4OZ
=0DOy
-----END PGP SIGNATURE-----

--Apple-Mail=_6EADD375-DFD2-4571-B2AD-31B58D93FD80--
