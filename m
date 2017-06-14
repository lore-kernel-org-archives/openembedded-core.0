Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id D4E2C606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 06:56:18 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 77so27128138wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4xTOO4sfaaBpY3dlrBrsk48X+c46/fChKHjvHKLEzIM=;
	b=hd/aM5pyjM3CWjojYuMAH29hAI2POkyam0NvvxEA5hGnhzytqHzMl/zzwezIBZd8Dt
	xdnnBHonRH7ZlVfVD16Rh9SZvmMivZwdWdieU6dy+CQygDT9HrMpZeytVg6+RQ+ctLtH
	qsxnQ99qmg5tS3ZNh5Fp3HGIdQO5e4nzEvr7/qNN1XxcRiNjcYJ/Uxg+oXM8vN96tCHl
	iRERFkzwVw+Zlw8Hg+fv2NtlCTdX36IK+dbiEXxKKm7g9DE1D0FYgOwUdGHFxVD/2KrA
	U2RInc40LAYVwRsphvIxnrnDxAKnC9qnrqoU8GVSeEZ/U8UCq+MonFNse02SauhlvR6m
	K+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4xTOO4sfaaBpY3dlrBrsk48X+c46/fChKHjvHKLEzIM=;
	b=SUIcJjvVyzi8M6TgDn+UPJg5hkrCQlnVSuEZ82SNqIMhba0/ep4QwSUlUN/eF/pdBM
	CfsQpwTBhDA0Qn5TbBTzovLcj/K+nfJ6QPo3icXSSoEtBJBJYfaIDegpKnDUZ4TrXT11
	WhToq2CBkjX4t0IP/wmP+M2DkAaPAOackpNW/1NJZ2MvfxsCW5zWaPwqSchylC5usxZb
	jEc2o0ReSm8VEBt2Yw4E79/3cRiRu6y74OJ+UHRP4273whcqQa24HL+VlxTTrI7wdQRH
	oGNBw5n8m+cTQxouG6tJIh3JdXzDMPb2320zVYs/Q+NL3RZ+ZMe/KIxmXCHN4GEWfI7j
	eOFA==
X-Gm-Message-State: AKS2vOxUOL9qy6E0nh1A1MxllFdT1d5IXtUiyenKbZja4JLRwtuKv18X
	6om4tU9+ssrwrw==
X-Received: by 10.28.24.207 with SMTP id 198mr13774040wmy.86.1497423379529;
	Tue, 13 Jun 2017 23:56:19 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r130sm12248538wmg.4.2017.06.13.23.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Jun 2017 23:56:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Jun 2017 08:56:18 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170614065618.GD3088@jama>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
	<20170331150810.GA3897@jama>
	<CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
	<CA+chaQdj48R74vNax1XPzc_mB6EQe7y+bgwXmOW417BQxtguoQ@mail.gmail.com>
	<CAMKF1sozG3W+axiBRVLs7ht+ficrp1Wj45SW38cJEB3bGZNx6Q@mail.gmail.com>
	<20170613213940.GC3088@jama>
	<CAMKF1soTEa9paNsyPjNbrfNCY2OxydNp3s5KA5DcUjO01R5rMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soTEa9paNsyPjNbrfNCY2OxydNp3s5KA5DcUjO01R5rMQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 14 Jun 2017 06:56:19 -0000
X-Groupsio-MsgNum: 98705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline

--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 03:13:01PM -0700, Khem Raj wrote:
> On Tue, Jun 13, 2017 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Sat, Apr 01, 2017 at 08:21:16AM -0700, Khem Raj wrote:
> >> On Fri, Mar 31, 2017 at 10:52 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> >> > Why is it needed?
> >>
> >> If you have clang/llvm installed on your build host then it defaults t=
o that
> >> thats why its needed.
> >
> > And where does meta-clang install it? Because if it doesn't match with
> > the location used by meta-oe's llvm then we cannot have the same flag
> > which suits both providers.
> >
> > As it is now I still have this change reverted in my branches and I've
> > noticed some layers which just use EXTRA_OECONF_remove to just remove
> > this with-llvm-prefix to unblock the builds with Pyro and Rocko.
> >
> >> > Without this change mesa was finding llvm-config correctly, that's w=
hy I've
> >> > just reverted this to continue building.
>=20
> The problem is mainly when you have clang/llvm installed on build host
> now that we prune hosttools this might not be an issue anymore, although
> this needs to be tested.

I'm not using meta-clang anywhere, can you please answer where
meta-clang installs llvm-config and if it's different path than what
meta-oe recipe does, can we unify them?

Unifying them was also discussed here:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg94=
412.html
but as I'm using meta-oe's llvm just for mesa I cannot help much with
that.

Regards,

> >> > On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa <martin.jansa@gmail.c=
om>
> >> >> wrote:
> >> >> > On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
> >> >> >> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gma=
il.com>
> >> >> >> wrote:
> >> >> >> > I'm not sure if this is the root cause, but last qemux86 build=
 shows:
> >> >> >> >
> >> >> >> >
> >> >> >> > | configure: error: --enable-gallium-llvm selected but llvm-co=
nfig is
> >> >> >> > not
> >> >> >> > found
> >> >> >> > | ERROR: Function failed: do_configure (log file is located at
> >> >> >> >
> >> >> >> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/m=
esa/2_17.0.1-r0/temp/log.do_configure.11359)
> >> >> >> >
> >> >> >>
> >> >> >> can you point where is llvm-config installed in sysroot ? its po=
ssible
> >> >> >> its not in native sysroot location ${STAGING_BINDIR_NATIVE}
> >> >> >
> >> >> > OE qemux86@ ~/build/oe-core $ find
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot* -na=
me llvm\*
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/=
bin/crossscripts/llvm-config
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/=
bin/crossscripts/llvm-config3.3
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/=
include/llvm3.3
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/=
include/llvm3.3/llvm-c
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/=
include/llvm3.3/llvm
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/=
include/llvm3.3/llvm/Config/llvm-config.h
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/=
lib/llvm3.3
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysr=
oot-providers/llvm-common
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysr=
oot-providers/llvm3.3
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-nati=
ve/installeddeps/llvm3.3.complete
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-nati=
ve/installeddeps/llvm-common.complete
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-nati=
ve/installeddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-nati=
ve/installeddeps/llvm-common
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-nati=
ve/installeddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
> >> >> >
> >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-nati=
ve/installeddeps/llvm3.3
> >> >> >
> >> >>
> >> >> so it seems it should point to <recipe-sysroot>/usr/bin/crossscripts
> >> >> can you try changing -with-llvm-prefix to point to this dir ?
> >> >>
> >> >> >>
> >> >> >> >
> >> >> >> > I've noticed some llvm changes for meta-clang, do we need simi=
lar
> >> >> >> > changes
> >> >> >> > for meta-oe version of llvm?
> >> >> >> >
> >> >> >> >
> >> >> >> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com>
> >> >> >> > wrote:
> >> >> >> >>
> >> >> >> >>
> >> >> >> >>
> >> >> >> >> On 3/11/17 1:30 PM, Khem Raj wrote:
> >> >> >> >> > The following changes since commit
> >> >> >> >> > a47e64d985a610535449730806651f5bfd75d9ec:
> >> >> >> >> >
> >> >> >> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
> >> >> >> >> >
> >> >> >> >> > are available in the git repository at:
> >> >> >> >> >
> >> >> >> >> >   git://git.openembedded.org/openembedded-core-contrib kraj=
/pu
> >> >> >> >> >
> >> >> >> >> > http://cgit.openembedded.org/openembedded-core-contrib/log/=
?h=3Dkraj/pu
> >> >> >> >> >
> >> >> >> >> > Khem Raj (1):
> >> >> >> >> >   mesa: Contain configure search for llvm
> >> >> >> >> >
> >> >> >> >>
> >> >> >> >> I added another fix for mesa-gl to remove one of obsolete
> >> >> >> >> packageconfigs
> >> >> >> >> and its on the same pull branch now.
> >> >> >> >>
> >> >> >> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >> >> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >> >> >
> >> >> >> >> --
> >> >> >> >> _______________________________________________
> >> >> >> >> Openembedded-core mailing list
> >> >> >> >> Openembedded-core@lists.openembedded.org
> >> >> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-c=
ore
> >> >> >> >
> >> >> >> >
> >> >> >
> >> >> > --
> >> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> >
> >> >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWUDeEQAKCRA3VSO3ZXaA
HIYNAKC1o8pre3IvbGobAp/Hft4M+BJC0wCeJmkM3+Tqla21JHffMttPhvsP1E4=
=Rglm
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
