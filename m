Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2CB782AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 21:39:41 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 77so14901876wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CqcwUxgloqEyMs88BBBO4IGztsV93jDZMdAgxrc/7II=;
	b=WvqInpymukQkeSdr9XB34NH32VHOPdIZWzVN6DR9xMe1/v1eodyLjRPuwLQ+t0Lz/b
	Axy/ClnqlomWMfRM8rsOp1OEqvBLkOtp5lpBwTsuwKF818l3HbmGNb5ca7X8ZO3XFK9h
	fTJB5bFWFiefdpdskVxK6nJU7qujIMOhnDhNwFFTq5utQeccfEwvFxnXCFxErINT34j/
	81JYB0YlTlzhOmQ6S8a3S9G1EsIkDqx7OOPM4jGhA+v7QsKiktUPVH8jXYQo9Ni+fb4B
	2Se1LL/cVA3/du3sI9cloCoUDZ8f5RpT0838/+8QxbVWnAvLTBIXBvUCYpHZwAAK/6Mq
	teiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CqcwUxgloqEyMs88BBBO4IGztsV93jDZMdAgxrc/7II=;
	b=JJhR98b9ERm4mWJDB3TX+nz5q43rNJwQ2UYvoLUpmPv17lH6DUwP4n1b6Hp0PlcGMW
	Lz+xilx4g9JZJ3fDnnLzzUUCJjVXihrcWWJEsS4LoTk+oY6S6S29q2gFeqyjZlRmCWqC
	ucl0d6Vf+ySjcHdPbSP0tg+UzuAyC0YOZ8Swr+k/lVHCEj+ZT8UnP2CcxfgWGrLixO8O
	201oW19yn4WQxYcEKgdYThlUD9EelpULdHxjFDXB74mCUYErLP/bav1Vn/sxFvxmLENe
	Z376XrnYBAwM5Omb4KxCnvX0oFFNid9C9oUD5Oqm0vN4YUnXWnVd9I4YGC0fHvD9LHXu
	a0Ng==
X-Gm-Message-State: AKS2vOwWUulut7mFpMd5xhcyJcADVaXwqLUC+z0yjg2fH6p9Nmjpch4G
	mDfgsoyYIajNqA==
X-Received: by 10.28.19.206 with SMTP id 197mr4302707wmt.70.1497389981972;
	Tue, 13 Jun 2017 14:39:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p17sm17550123wrc.66.2017.06.13.14.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Jun 2017 14:39:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Jun 2017 23:39:40 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170613213940.GC3088@jama>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
	<20170331150810.GA3897@jama>
	<CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
	<CA+chaQdj48R74vNax1XPzc_mB6EQe7y+bgwXmOW417BQxtguoQ@mail.gmail.com>
	<CAMKF1sozG3W+axiBRVLs7ht+ficrp1Wj45SW38cJEB3bGZNx6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sozG3W+axiBRVLs7ht+ficrp1Wj45SW38cJEB3bGZNx6Q@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Tue, 13 Jun 2017 21:39:41 -0000
X-Groupsio-MsgNum: 98697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline

--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2017 at 08:21:16AM -0700, Khem Raj wrote:
> On Fri, Mar 31, 2017 at 10:52 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > Why is it needed?
>=20
> If you have clang/llvm installed on your build host then it defaults to t=
hat
> thats why its needed.

And where does meta-clang install it? Because if it doesn't match with
the location used by meta-oe's llvm then we cannot have the same flag
which suits both providers.

As it is now I still have this change reverted in my branches and I've
noticed some layers which just use EXTRA_OECONF_remove to just remove
this with-llvm-prefix to unblock the builds with Pyro and Rocko.

> > Without this change mesa was finding llvm-config correctly, that's why =
I've
> > just reverted this to continue building.
>=20
>=20
> >
> > On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >> > On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
> >> >> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gmail.=
com>
> >> >> wrote:
> >> >> > I'm not sure if this is the root cause, but last qemux86 build sh=
ows:
> >> >> >
> >> >> >
> >> >> > | configure: error: --enable-gallium-llvm selected but llvm-confi=
g is
> >> >> > not
> >> >> > found
> >> >> > | ERROR: Function failed: do_configure (log file is located at
> >> >> >
> >> >> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa=
/2_17.0.1-r0/temp/log.do_configure.11359)
> >> >> >
> >> >>
> >> >> can you point where is llvm-config installed in sysroot ? its possi=
ble
> >> >> its not in native sysroot location ${STAGING_BINDIR_NATIVE}
> >> >
> >> > OE qemux86@ ~/build/oe-core $ find
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot* -name =
llvm\*
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin=
/crossscripts/llvm-config
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin=
/crossscripts/llvm-config3.3
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/inc=
lude/llvm3.3
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/inc=
lude/llvm3.3/llvm-c
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/inc=
lude/llvm3.3/llvm
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/inc=
lude/llvm3.3/llvm/Config/llvm-config.h
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/lib=
/llvm3.3
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot=
-providers/llvm-common
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot=
-providers/llvm3.3
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/=
installeddeps/llvm3.3.complete
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/=
installeddeps/llvm-common.complete
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/=
installeddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/=
installeddeps/llvm-common
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/=
installeddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
> >> >
> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/=
installeddeps/llvm3.3
> >> >
> >>
> >> so it seems it should point to <recipe-sysroot>/usr/bin/crossscripts
> >> can you try changing -with-llvm-prefix to point to this dir ?
> >>
> >> >>
> >> >> >
> >> >> > I've noticed some llvm changes for meta-clang, do we need similar
> >> >> > changes
> >> >> > for meta-oe version of llvm?
> >> >> >
> >> >> >
> >> >> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com>
> >> >> > wrote:
> >> >> >>
> >> >> >>
> >> >> >>
> >> >> >> On 3/11/17 1:30 PM, Khem Raj wrote:
> >> >> >> > The following changes since commit
> >> >> >> > a47e64d985a610535449730806651f5bfd75d9ec:
> >> >> >> >
> >> >> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
> >> >> >> >
> >> >> >> > are available in the git repository at:
> >> >> >> >
> >> >> >> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
> >> >> >> >
> >> >> >> > http://cgit.openembedded.org/openembedded-core-contrib/log/?h=
=3Dkraj/pu
> >> >> >> >
> >> >> >> > Khem Raj (1):
> >> >> >> >   mesa: Contain configure search for llvm
> >> >> >> >
> >> >> >>
> >> >> >> I added another fix for mesa-gl to remove one of obsolete
> >> >> >> packageconfigs
> >> >> >> and its on the same pull branch now.
> >> >> >>
> >> >> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >> >
> >> >> >> --
> >> >> >> _______________________________________________
> >> >> >> Openembedded-core mailing list
> >> >> >> Openembedded-core@lists.openembedded.org
> >> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >> >
> >> >> >
> >> >
> >> > --
> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWUANTgAKCRA3VSO3ZXaA
HOtMAKCifAy7v75HpWPlRFGXYqy2FvIVCgCgii0STv3zK9ZUXbV0sPMeA+jpP3s=
=Szru
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
