Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1E872B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 22:14:27 +0000 (UTC)
Received: by wibgn9 with SMTP id gn9so59636107wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 15:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YTTIf3RYhyuGz1XcdywqzN8PsPTA1TsUZkmgokUFAYs=;
	b=RkVhd3jDHATEi0ghvq4F2/PD2Cpq6sDheJjAHhIwJ0hXgEHMNG70G/GUo/mPIx+cmV
	zSaFaJID0Dp4oK0boHKBAXahyBe9zER40qC4rwMinEaaril+5Yj3BO4nIVeVXLB20Bv5
	OXe4x8aOR0vXNAb0Sgq2HlP1lyMj+q11QedR+Ky41Rg125NtKqEXtljtcSRFYndFreYq
	2aXZSgVBBlsM2MvBjMN/uEjOy2VIUhrTNZKqX0ohy41SCIVwQu5i82I3MjDEuDnGxmsa
	XBlYuQrBn8a+bOA9Ohn4Pgi+lG5LNFIC0h67K2utCNtSKw8HZznbck50LjlCa8zGOjz+
	riiQ==
X-Received: by 10.194.121.68 with SMTP id li4mr22461130wjb.138.1427321668263; 
	Wed, 25 Mar 2015 15:14:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hl8sm5558713wjb.38.2015.03.25.15.14.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 15:14:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Mar 2015 23:14:41 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150325221441.GN3904@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama>
	<CAJTo0LZV65-iZ3XDy7aaSyRayNOZ3trVpCfZMwe_=qrq8SUG-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZV65-iZ3XDy7aaSyRayNOZ3trVpCfZMwe_=qrq8SUG-A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Wed, 25 Mar 2015 22:14:30 -0000
X-Groupsio-MsgNum: 63728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8c07nsHwQobhlezh"
Content-Disposition: inline

--8c07nsHwQobhlezh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2015 at 04:18:49PM +0000, Burton, Ross wrote:
> On 25 March 2015 at 16:12, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Oh, thanks for pointer. I was seeing the same issue in dizzy and master
> > build, but this change can explain why I wasn't able to reproduce it in
> > master yesterday.
> >
>=20
> Sounds like we should backport that to dizzy (CCing Armin).

yes, I've verified that I can reproduce this issue in master after
reverting this change and that it resolves the issue in dizzy if I
backport it with one other change (just to apply it cleanly with
additional bugfix), I've referenced the fontcache.bbclass fix, these
3 should go in only together.

My bigger image build is still running, but this fix is definitely
helping.

Thanks,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8c07nsHwQobhlezh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUTM1EACgkQN1Ujt2V2gBzhEgCff2CV0pion+6YHLVC3EF8e70I
Q4IAnRz8IgF0G5b291Ygn8Nhe4vTsGt4
=WtH5
-----END PGP SIGNATURE-----

--8c07nsHwQobhlezh--
