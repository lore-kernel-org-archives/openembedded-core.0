Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 04D02606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:08:10 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id e201so135095195wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rzQuthyKcqKsjTlZj89XxHtnxQVsuX0AiNBrwWaD1kk=;
	b=wev9cUlUM97da3gQ8L5969cAgXNAqStlqwryCe2fJEK47enuztshyDkrWLkTVfebH2
	fBL215H+UocwaT8ytacV/pIquu+34T9xZTvdTj9qYFE53HfFYv5sNiWk7ExnNw4hKGpu
	4qiLY16bY9Z4CxRizLmo0JpU5DsDsEDfJghnAzgW0SnBcs6uKpcI8vxFqUKSg6em/gVe
	05C8mx1yMpHAs4FddXpUKfhxAIYecdeUUzwXdDkn9K6yc5qsP7qgKAhR90BqlKf6lchR
	0+9NMT+tIUf4CjYnlqyN5Vgjto/DXJjjvT0F5NxTRtRWE+yhMp5b0p0+/g2A13ZRx3w2
	jv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rzQuthyKcqKsjTlZj89XxHtnxQVsuX0AiNBrwWaD1kk=;
	b=BFSQ8JScDXi0MSr6Ha+NtNNbKKAw4zkictV0UV2DFWEcb312eQ66zBZlb9NxGCBJcY
	p0Fqyb+gTy9zktUlxETTVFgcgUHzmidytp/kLo9HmOiAYFcoHu3nrnoFqVgCMR3E7I5G
	KUqivdt5SYCRMEPhe5j7iEl+EZMD1AizlX2p+v02lyun+er4qZ7sFtXFWY9OhK5qlIL6
	oVkLdZT3u6x8Ill1BMe+VHptTjqGGHMwNRxSlFe0tCyMhBfeRzLgEGUMBro/g08ivUhA
	j5ME7Raib4l1ra1D9XuyfFqs6EZSIYrB/lC2AER4Y41xH+MAsl5zo/Y5gsx1skeUziyu
	R7Dw==
X-Gm-Message-State: AOPr4FVnTs9V55XGisDIL3WAM/A8vOp3N8F13nIn2NV2eZh3ydG2E0W8CA25GpvUnXG7aw==
X-Received: by 10.28.216.83 with SMTP id p80mr23492826wmg.49.1462262891003;
	Tue, 03 May 2016 01:08:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q77sm23127640wmd.12.2016.05.03.01.08.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 01:08:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 May 2016 10:09:13 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160503080913.GA2851@jama>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
	<CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
	<A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Tue, 03 May 2016 08:08:12 -0000
X-Groupsio-MsgNum: 81491
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2016 at 02:37:43PM -0700, Khem Raj wrote:
>=20
> > On May 2, 2016, at 1:37 PM, Christopher Larson <kergoth@gmail.com> wrot=
e:
> >=20
> >=20
> >=20
> > On Mon, May 2, 2016 at 8:34 PM, Khem Raj <raj.khem@gmail.com <mailto:ra=
j.khem@gmail.com>> wrote:
> >=20
> > > On May 2, 2016, at 1:09 PM, Christopher Larson <kergoth@gmail.com <ma=
ilto:kergoth@gmail.com>> wrote:
> > >
> > > From: Christopher Larson <chris_larson@mentor.com <mailto:chris_larso=
n@mentor.com>>
> > >
> > > We explicitly set the hash style to gnu in our LDFLAGS. Setting the d=
efault to
> > > this in the toolchain, while convenient, actually hides bugs, as a fa=
ilure to
> > > obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to =
how we
> > > poison the sysroot -- rather than relying on the default, notice righ=
t away if
> > > somoeone isn't obeying the needed flags.
> > >
> > > This will result in a failure to obey LDFLAGS causing a GNU_HASH QA f=
ailure,
> > > which is what's often seen with external toolchains. This brings us a=
ll on the
> > > same page, and makes sure a failure to obey LDFLAGS is seen early.
> > >
> >=20
> >=20
> > Default or gnu linkers is to use sysv for legacy reasons and by passing=
 this option
> > to configuring the toolchain we want to make sure that components are u=
sing sane defaults
> > even if they have not configured these options.
> >=20
> > But that's not what we want. We want to know when we're not passing arg=
uments we need to be passing. For example, the sysroot is poisoned today, s=
o we *know* when the user is trying to run it without --sysroot=3D.
>=20
> application makefiles can ignore environment e.g. CC, CXX, LD etc and get=
 into same situations.
> as an application writer I may not be interested in using cross compilati=
on specific nuances.  We may not
]> be able to solve it completely
>=20
> >=20
> > if you do not pass the right linker flags from compiler driver and also=
 ignore
> > the LDFLAGS then you now have a safe pass for the app to build without =
GNU hash
> > while I understand it will spread the external toolchain=E2=80=99s pain=
s into internal toolchain
> > I fail to understand the benefit of doing this otherwise.
> >=20
> > Silently ignoring the fact that recipes ignore LDFLAGS is not good defa=
ult behavior, and this is precisely what oe-core is doing today. If you kno=
w of a better way to detect that in another QA check, I'm certainly open to=
 hearing it.
>=20
> linker would emit .hash for sysv and .gnu.hash section for gnu hash in fi=
nal ELF, may be adding a QA check for that would be enough ?

But that doesn't detect if it was set to gnu thanks to respecting
LDFLAGS or thanks to gnu being the default in oe-core built toolchain
(from --with-linker-hash-style) - which means that builds with
external toolchain are still affected if they don't use
--with-linker-hash-style=3Dgnu.

After fixing couple recipes used by our internal builds (which are
using external toolchain) and wondering why nobody else reported
those I agree with Chris, that to detect this early (with current
QA check which already reports when the used hash style doesn't match
with LDFLAGS).

It would be nice to really poison the value if possible
--with-linker-hash-style=3DYOU_NEED_TO_RESPECT_LDFLAGS
to cause linker call to fail when someone is using oe-core toolchain
outside OE itself (so might ignore LDFLAGS, but without running the
QA check).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcoXKgACgkQN1Ujt2V2gBxLWQCdETiPnRu/p5kOd02dAM3Z+89v
BboAoJkzQjGUwgvofonwKp9b+efuZpHM
=cKL+
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
