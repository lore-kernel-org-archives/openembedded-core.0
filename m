Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDE4877DC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:08:10 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p52so21366219wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oebv8wWY+Ap8xRruyQ+UEqDhwUIsMQU4kz/2CpwF3p8=;
	b=DOw+LqbXP0cFdOLhfORrxOZd4F8C97v12fTCjO0EpY0mvCxN4ChBufzihUgGwIRWWk
	k1v+IxUvi07mSR6sLZHVC1pnNIGtQMA2RcxuSQfHjDZgTj3EV8cHeYB8DXWNXOAsgomi
	dQAJSC6nXmW2kg0xoeOiITL5t6zJCzNS9BSfPpk1pxSue0TlD+c9sbil2jSrLPJV2hrU
	P6QNSAUj1k+Lg8tw9/7zVlew0D2IfvLlz7jBy2O+ttYvKw/E/lOfwZwY8tYMaF/+kcwd
	Ydrx6vRSyVIsYBYr6p7sXbibejDYonFVlO1lgpjFKlwKVvi2uWGQdxfDWW7/zp37+HgN
	WQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oebv8wWY+Ap8xRruyQ+UEqDhwUIsMQU4kz/2CpwF3p8=;
	b=T7NVBCPgTMkGaf7wJ98mb7b99RLDlB46rEs8I+EwvUb6+dMZnPZo1Qn9WO16rk9Rx6
	gK9Hp00l1M2y+ako8m30VydLQ+LNpCDm6aDKj2uNJ8PLx1qQDTWLyDwTfG9lFeeWtdQ6
	bReOivpVRxRrvcneQdVJbGxLmeIc1Mx8pKgArtlLN/CxOdJNfdtbVO3LLXA0x1mc6/7s
	j4Oog9g25XxaekEE0jsd4DEbxR7jy+YhmodjaX1LcIsmoxRwMg4BeSQ4fvj8hrWkdm7E
	uQkCw1F84C9QLLKRYf8Wm2AQULyYdtW8DFPt6KYbOLKd1Ed1YrZCSqUjkLjUG13pTBu4
	UKFw==
X-Gm-Message-State: AFeK/H2tGbVyHILyLd1SNqrPtVLdC9YlHZk2cEM6MMfScfgvNc4jM0EjCCD9IhN/5Dma5Q==
X-Received: by 10.223.166.46 with SMTP id k43mr3588387wrc.64.1490972891640;
	Fri, 31 Mar 2017 08:08:11 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 24sm7051601wrw.46.2017.03.31.08.08.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 Mar 2017 08:08:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 31 Mar 2017 17:08:10 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170331150810.GA3897@jama>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
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
X-List-Received-Date: Fri, 31 Mar 2017 15:08:11 -0000
X-Groupsio-MsgNum: 95635
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > I'm not sure if this is the root cause, but last qemux86 build shows:
> >
> >
> > | configure: error: --enable-gallium-llvm selected but llvm-config is n=
ot
> > found
> > | ERROR: Function failed: do_configure (log file is located at
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.=
0.1-r0/temp/log.do_configure.11359)
> >
>=20
> can you point where is llvm-config installed in sysroot ? its possible
> its not in native sysroot location ${STAGING_BINDIR_NATIVE}

OE qemux86@ ~/build/oe-core $ find tmp-glibc/work/i586-oe-linux/mesa/2_17.0=
=2E2-r0/recipe-sysroot* -name llvm\*
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crosss=
cripts/llvm-config
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crosss=
cripts/llvm-config3.3
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/ll=
vm3.3
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/ll=
vm3.3/llvm-c
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/ll=
vm3.3/llvm
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/ll=
vm3.3/llvm/Config/llvm-config.h
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/lib/llvm3.3
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-provid=
ers/llvm-common
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-provid=
ers/llvm3.3
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/install=
eddeps/llvm3.3.complete
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/install=
eddeps/llvm-common.complete
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/install=
eddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/install=
eddeps/llvm-common
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/install=
eddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/install=
eddeps/llvm3.3

>=20
> >
> > I've noticed some llvm changes for meta-clang, do we need similar chang=
es
> > for meta-oe version of llvm?
> >
> >
> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On 3/11/17 1:30 PM, Khem Raj wrote:
> >> > The following changes since commit
> >> > a47e64d985a610535449730806651f5bfd75d9ec:
> >> >
> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
> >> >
> >> > are available in the git repository at:
> >> >
> >> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
> >> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dkr=
aj/pu
> >> >
> >> > Khem Raj (1):
> >> >   mesa: Contain configure search for llvm
> >> >
> >>
> >> I added another fix for mesa-gl to remove one of obsolete packageconfi=
gs
> >> and its on the same pull branch now.
> >>
> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWN5w2gAKCRA3VSO3ZXaA
HM3EAJ99i1pTEZ8W5rZ0AC3tdCJsj4mFnQCgpJR+JWu0xkgFnIfkBBI2sbFFLjU=
=cAGQ
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
