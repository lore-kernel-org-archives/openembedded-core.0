Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 44FE160017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 10:24:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w143so19643167wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=C/NXtwM5fmYavZFBlVl6suqwbNqxu4LS/SV2zEewhXg=;
	b=GrmBgyUfjJqJklMx8fEvHxBtF3CjtsuyUv1vHB3yAT3P7fvEBiRgrPl7dRNSmAA8Ws
	BaUmbVY9Cdyveu4WQ7hiGzHF7WkZPVMqTTbYhrS2qynnG0TtOZmTrr4cuXrrFh37U7xJ
	pDDOyVmZBKgw8y3tGhNeXBY6mJeiASTccVDG8Lkzvz+AAq23qJKRXKZmiRA5ypW/Txce
	yVWwDLfYZzf1FpT528KaTBPFDC5bDcK2a+5VSsNMiIDhyw+0NDEGpRChZEc79Xm6zfJ5
	8tifLBK6C2yRnsk++dn0u79Va1f8cFw3HSKwZNDv+AOUkgAoNm6Sd8F8eHDtd+OQBtQg
	daQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=C/NXtwM5fmYavZFBlVl6suqwbNqxu4LS/SV2zEewhXg=;
	b=H1HP+O4kvgpffCLbaesfy7qawuoQkwnUPPHLzmYS2rJUl/uoe0OD6mIvSCzTO0w/3+
	35Jfb6LqJPHIxFP9QlyofGAZ1vgl8EwAFWRaFhuxtafqJKelyOFEys8OdMNjJ1x01CJz
	nbND96FDDeMzUIeAUJ/KlfN1gY5v/DX+jiEhAkqYiFlAN8L4Ca4OC1H/m21r0qS0Mo8R
	VpQgJjQWyZIUCI6R+rVom7oJEgStV6KraA7Fx4I2kMbetGtK23PEZHKNk/ESEOuw2YTy
	1ylXCpONdCMx0Jq1NEYTNiYG3w+aawVEegq/JwODHlAGnvWHgznFIasPthoFRPCPiBKd
	bX5g==
X-Gm-Message-State: AOPr4FVH+mKZPHSXIvmILaMLWAwa35fjJwBokhSgXR6R81k7uMufhUrmAW045fk92fVpNw==
X-Received: by 10.28.157.202 with SMTP id g193mr37355716wme.46.1463653454118; 
	Thu, 19 May 2016 03:24:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xt9sm13592733wjb.17.2016.05.19.03.24.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 May 2016 03:24:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 May 2016 12:24:50 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160519102450.GA2565@jama>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com>
	<CA+chaQcuBXZ55wcAbzjCVEc1Xsq0UZ4obj=r5PsQt6bA57ZQAQ@mail.gmail.com>
	<573D8B27.9020804@windriver.com>
MIME-Version: 1.0
In-Reply-To: <573D8B27.9020804@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 10:24:16 -0000
X-Groupsio-MsgNum: 82367
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2016 at 05:45:11PM +0800, Robert Yang wrote:
> Hi Martin,
>=20
> On 05/19/2016 04:47 PM, Martin Jansa wrote:
> > As the commit says, small change in package.bbclass also causes all pac=
kages to
> > be recreated with PR bump even when the content is most likely the same.
>=20
> That is another case we need work on.

It's not another case, because the root cause is the same and you're
asking to revert one symptom of it, instead of trying to resolve the
root cause.

> > Fixing bug in gcc may at least provide different binaries so it might b=
e useful
> > to upgrade them on target (or at least distinguish if they were already=
 rebuilt
> > with fixed gcc-cross or not).
>=20
> The binary might be different when the compiler fixed a bug, but that may=
 don't
> make any sense to the end user. AFAIK, ccache doesn't check /path/to/gcc'=
s hash
> value.

That's exactly the same case as small change in package.bbclass which often=
 doesn't
change the binary output at all, which is even worse for end user to
re-download and re-install exactly the same bits just because of EXTENDPRAU=
TO bump.

> > Reverting the commit doesn't fix the issue that sstate handler cannot c=
ompare if
> > the change in signature produced "significantly different" binaries. If=
 it's
> > reverted in oe-core I'll just revert the revert in our builds, because =
we care
> > about reproducible builds and we already gave up on working upgrade pat=
hs, which
> > are broken too often anyway.
>=20
> Be less or more stricter is a hard problem, so we'd better let's leave th=
is
> choice to the end user, something like DROP_NATIVE_SIG ? =3D "0/1" would =
help.
>=20
> I'm afraid that there is nearly nothing we can do to enhance PR server's
> user experience based on the current stricter mode. Think about the
> distros like Debian, CentOS, Opensuse and so on, their
> "apt-get/yum/yast upgrade" never re-install all the pkgs, but the distros
> built out by oe-core usually does (especially, when a patch is applied to
> a native recipe, then all pkgs are downloaded and re-installed, it's very=
 hard
> to explain such a problem to the distro's user).
>=20
> // Robert
>=20
> >
> > Reflash of "system" partitions and storing user data/configuration some=
where
> > else is faster and safer since the sstate was invented (since we stoppe=
d using
> > OE classic). You can find some rant e-mails from me about this e.g.
> > http://lists.openembedded.org/pipermail/openembedded-core/2011-November=
/051354.html
> > and the Yocto bug I gave you.
> >
> > Regards,
> >
> > On Thu, May 19, 2016 at 4:33 AM, Robert Yang <liezhi.yang@windriver.com
> > <mailto:liezhi.yang@windriver.com>> wrote:
> >
> >
> >     Hi Martin,
> >
> >     I found this patch in the bug:
> >
> >     http://git.openembedded.org/openembedded-core/commit/meta/lib/oe/ss=
tatesig.py?id=3D336a7897e39b9e42dcfcba9e2520ea96b0c6a8d6
> >
> >     Too many PR bumps and rebuildings are caused by this patch. I'm
> >     not very sure about what this patch tries to fix, it seems that
> >     it is trying to fix problems when 32bit and 64bit uses the same
> >     sstate cache? Would you please provide a simple reproducer, please?
> >
> >     Things will become much better after revert this patch. Be less
> >     stricter or more is a hard problem, if we still need the patch,
> >     can we leave such a choice to the end user? We can add some vars
> >     like DROP_NATIVE_SIG ? =3D "0/1". This would be good to the end user
> >     who uses stable release like jethro or krogoth to make their
> >     distributions, and PR Service really matters here. Even if they
> >     switch the build between 32 and 64 builds (This is unlikely to
> >     happen for production environment) and got problems, they still
> >     can fix the problem by rebuilding, this is still much better than
> >     current status: run a "smart/opkg/apt-get upgrade" on the target,
> >     *all* of the packages are downloaded and installed again after a
> >     CVE patch applies on native recipes like pseudo-native or rpm-nativ=
e,
> >     but in fact, nothing is changed on the target this is really a bad
> >     experience.
> >
> >     // Robert
> >
> >
> >     On 05/18/2016 06:15 PM, Martin Jansa wrote:
> >
> >         On Wed, May 18, 2016 at 05:31:09PM +0800, Robert Yang wrote:
> >
> >
> >
> >             On 05/18/2016 05:20 PM, Martin Jansa wrote:
> >
> >                 On Wed, May 18, 2016 at 04:03:58PM +0800, Robert Yang w=
rote:
> >
> >                     Hi Martin,
> >
> >                     On 05/18/2016 03:39 PM, Martin Jansa wrote:
> >
> >                         See:
> >                         https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D5970
> >
> >                         Just using recipe checksum wont work, because t=
he main
> >                         reason for PR bumps is to
> >                         automatically upgrade the packages when one of =
the
> >                         dependencies changes .so
> >                         version, which you won't detect from recipe che=
cksum of
> >                         the app which is just
> >                         using the library.
> >
> >
> >                     For the development branch like master, yes, that w=
ould
> >                     happen. But for
> >                     the stable release like jethro and krogoth, it is u=
nlikely
> >                     that would
> >                     happen, and if if does, the user can manually bump =
the
> >                     impacted recipe's
> >                     PR to fix the problem. The current problem is that =
when
> >                     *all* recipes'
> >                     PR are bumped, there is no way to fix the problem.
> >
> >
> >                 You can still stop using PR service and start doing man=
ual PR
> >                 bumps, but
> >
> >
> >             We can't stop PR service and start doing manual PR bumps si=
nce we
> >             need keep
> >             update to date with upstream, the changes from upstream don=
't do the
> >             manual
> >             PR, and I don't think that we have to if they can be done a=
utomatically.
> >
> >                 it's quite annoying if you need to bump a lot of recipe=
s you don't
> >                 control :).
> >
> >
> >             What's your opinion about only consider RDEPENDS for PR ser=
vice's
> >             checksum,
> >             please ?
> >
> >
> >         I would like to have separate handler as described in that bug,=
 option
> >         c).
> >
> >         Not only because of unnecessary EXTENDPRAUTO bumps, but also un=
necessary
> >         rebuilds.
> >
> >                         On Wed, May 18, 2016 at 8:09 AM, Robert Yang
> >                         <liezhi.yang@windriver.com
> >                         <mailto:liezhi.yang@windriver.com>
> >                         <mailto:liezhi.yang@windriver.com
> >                         <mailto:liezhi.yang@windriver.com>>> wrote:
> >
> >                                The PRServer bumps PR according to do_pa=
ckage's
> >                         task hash, that
> >                                causes it bumps *all* packages' PR when =
recipes
> >                         like pseudo-native
> >                                and rpm-native is changed. It is a very =
bad user
> >                         experience when we
> >                                run "smart/opkg upgrade" on running targ=
et, for
> >                         example, when we apply
> >                                a CVE patch to pseudo-native or rpm-nati=
ve, or do
> >                         some slight changes
> >                                in their do_compile, "smart/opkg upgrade=
" will
> >                         download/install *all*
> >                                the packages since all of the packages' =
PR are
> >                         bumped.
> >
> >                                Here are some rough suggestions to fix t=
his
> >                         problem, and please feel
> >                                free to give your suggestions.
> >                                1) Do not use do_package's task for bump=
ing PR,
> >                         the easiest way
> >                                    is simulate manually bump PR -- only=
 bump PR
> >                         when the recipe
> >                                    itself's checksum is changed.
> >
> >                                2) Add a new task for PRServer, redefine=
 its task
> >                         hash for bumping
> >                                    PR, for example, this task hash only
> >                         considers RDEPENDS (no
> >                                    DEPENDS), and drop any native depend=
encies.
> >
> >                                I prefer the first way, and an alternati=
ve way
> >                         maybe add a var so that
> >                                the user can configure it:
> >                                PR_CHECKSUM =3D "${BB_TASKHASH}" (curren=
t way)
> >                                Or
> >                                PR_CHECKSUM =3D "<recipe checksum>"
> >
> >                                --
> >                                Thanks
> >
> >                                Robert
> >                                --
> >                                ________________________________________=
_______
> >                                Openembedded-core mailing list
> >                         Openembedded-core@lists.openembedded.org
> >                         <mailto:Openembedded-core@lists.openembedded.or=
g>
> >                                <mailto:Openembedded-core@lists.openembe=
dded.org
> >                         <mailto:Openembedded-core@lists.openembedded.or=
g>>
> >                         http://lists.openembedded.org/mailman/listinfo/=
openembedded-core
> >
> >
> >
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc9lHAACgkQN1Ujt2V2gBztYwCfaK2uMzr0KosW/ci3S8AB0ok/
RsIAoIirdfsee2g5/Um4aWe/9vtYLbsD
=A7CQ
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
