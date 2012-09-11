Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBPuN-0008SG-In
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 14:49:39 +0200
Received: by eekb57 with SMTP id b57so330671eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LqSslQ3b1L3yKDECT3WSCp4qKKAZfwSJNkIObVxARWk=;
	b=mTK8xcS6FktCE0xr6Ipk0uiFW7sSHG223JO28gl9f23Y1vZxwuocGlHF9YP44H6Nzs
	JOkiu2wXrFvhL+/ALxeA6KQsj4VwDUyckEOx5iYK5aqxoG6DiY0fbllWpymhSaz8c2yS
	eQ3nh//JFyF4yoF9oE101Imk9nz+fYl+lLo2owjQXSLUl+YZg7NrfW6bjyplzS+aLlX4
	mBrWDrey1uH91xbGzd71VD6cf8TcsWURoGodgzURuV/5/nxOQ2r44I+rmSMm+Bi23xcd
	oZYml13OJZhMd1uqAHRMeez5nR6NTSphjjDrxwlPaSTrRu/zUruUsH+iJhe8IUWLzq2l
	GEBA==
Received: by 10.204.152.145 with SMTP id g17mr4640228bkw.120.1347367028629;
	Tue, 11 Sep 2012 05:37:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm9448750bkc.5.2012.09.11.05.37.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 05:37:07 -0700 (PDT)
Date: Tue, 11 Sep 2012 14:37:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120911123707.GB14077@jama.jama.net>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
	<CA+chaQeP7GESLdd7zKEbSZ78xRn4ketJUDzzn5ChmcO84XzQQQ@mail.gmail.com>
	<504F2F2E.3080507@windriver.com>
MIME-Version: 1.0
In-Reply-To: <504F2F2E.3080507@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 12:49:39 -0000
X-Groupsio-MsgNum: 29029
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline

--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 08:31:42AM -0400, Bruce Ashfield wrote:
> On 12-09-11 02:59 AM, Martin Jansa wrote:
> > On Mon, Sep 10, 2012 at 8:11 PM, Bruce Ashfield
> > <bruce.ashfield@windriver.com>  wrote:
> >> Updating to 3.4.10 which has been soaking for a bit now, as well
> >> as picking up the following meta commits from Tom Z:
> >>
> >>    a82db2f meta: have systemtap use kprobes and uprobes feature
> >>    d5d5b80 meta: add kprobes support to ktypes/standard
> >>    b32d373 meta: add kprobes feature
> >>    d40ed99 meta: have uprobe feature use uprobe.cfg
> >>    a69d1db meta: add uprobe.cfg
> >>
> >> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
> >>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++-----=
---
> >>   2 files changed, 12 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/re=
cipes-kernel/linux/linux-yocto-rt_3.4.bb
> >> index b2620ea..3b36378 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >> @@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
> >>   KBRANCH =3D "standard/preempt-rt/base"
> >>   KBRANCH_qemuppc =3D "standard/preempt-rt/qemuppc"
> >>
> >> -LINUX_VERSION ?=3D "3.4.9"
> >> +LINUX_VERSION ?=3D "3.4.10"
> >>   LINUX_KERNEL_TYPE =3D "preempt-rt"
> >>
> >>   KMETA =3D "meta"
> >>
> >> -SRCREV_machine ?=3D "9032b1e9daf5b4396f939981c3be95f67802d18c"
> >> -SRCREV_machine_qemuppc ?=3D "08ce190232f89303772b6591ca7daaf2820eb74e"
> >> -SRCREV_meta ?=3D "463299bc2e533e1bd38b0053ae7b210980f269c3"
> >> +SRCREV_machine ?=3D "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
> >> +SRCREV_machine_qemuppc ?=3D "85a1190530cb5749f5f831670976b163438dc301"
> >> +SRCREV_meta ?=3D "d9d5fc63d8b38705036e946ea77d971d95de11ad"
> >>
> >>   PR =3D "${INC_PR}.0"
> >>   PV =3D "${LINUX_VERSION}+git${SRCPV}"
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recip=
es-kernel/linux/linux-yocto_3.4.bb
> >> index 06bcb9a..7258cba 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> >> @@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
> >>   KBRANCH_DEFAULT =3D "standard/base"
> >>   KBRANCH =3D "${KBRANCH_DEFAULT}"
> >>
> >> -SRCREV_machine_qemuarm ?=3D "84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d"
> >> -SRCREV_machine_qemumips  ?=3D "ba0e336d4527080233c3c410989d4f351529ee=
4e"
> >> -SRCREV_machine_qemuppc ?=3D "e82b8a111430e3820b11f507863c4b8e8734ed8e"
> >> -SRCREV_machine_qemux86 ?=3D "0985844fa6235422c67ef269952fa4e765f252f9"
> >> -SRCREV_machine_qemux86-64 ?=3D "0985844fa6235422c67ef269952fa4e765f25=
2f9"
> >> -SRCREV_machine ?=3D "0985844fa6235422c67ef269952fa4e765f252f9"
> >> -SRCREV_meta ?=3D "463299bc2e533e1bd38b0053ae7b210980f269c3"
> >> +SRCREV_machine_qemuarm ?=3D "b15e7b1e9b58b9863bd87778775f86cd8d8880ea"
> >> +SRCREV_machine_qemumips  ?=3D "8d5b98f263b5119af2dc30223f311be17173ba=
b9"
> >> +SRCREV_machine_qemuppc ?=3D "b9a720ca38d298ed457f37d099c85771f9164b19"
> >> +SRCREV_machine_qemux86 ?=3D "46d8c757b3be1953f30d6745505d24436e2d6844"
> >> +SRCREV_machine_qemux86-64 ?=3D "46d8c757b3be1953f30d6745505d24436e2d6=
844"
> >> +SRCREV_machine ?=3D "46d8c757b3be1953f30d6745505d24436e2d6844"
> >> +SRCREV_meta ?=3D "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
> >
> > Doesn't different SRCREV_machine for each MACHINE cause LOCALCOUNT in
> > SRCPV incrementing on each MACHINE switch?
> >
> > They are stored under same key:
> > sqlite>  select * from BB_URI_LOCALCOUNT where key like '%linux-yocto-3=
=2E4%';
> > git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/base-linux-yocto_r=
ev|84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d
> > git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/base-linux-yocto_c=
ount|16
> > git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto_rev|463299=
bc2e533e1bd38b0053ae7b210980f269c3
> > git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto_count|9
> > git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/common-pc-64/base-=
linux-yocto_rev|19f7e43b54aef08d58135ed2a897d77b624b320a
> > git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/common-pc-64/base-=
linux-yocto_count|7
> > git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/preempt-rt/base-li=
nux-yocto-rt_rev|9032b1e9daf5b4396f939981c3be95f67802d18c
> > git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/preempt-rt/base-li=
nux-yocto-rt_count|10
> > git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto-rt_rev|463=
299bc2e533e1bd38b0053ae7b210980f269c3
> > git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto-rt_count|8
> >
> > So I guess if you build linux-yocto-3.4 for qemuarm, qemux86-64, then
> > switch back to qemuarm you'll see linux-yocto built again, same
> > source, but different SRCPV (LOCALCOUNT).
>=20
> That does look to be the case, and it matches what I've observed
> over time. I'm not sure of an alternative at the moment, since the
> fetcher is such a cranky beast with respect to fetching changes to
> the right machine branches.

Why not remove it from SRCREV_FORMAT, keep only meta SRCPV and just bump=20
PR when SRCREV of some machine kbranch is changed?

Current SRCREV_FORMAT doesn't show which branch it was so it doesn't
make it much worse to find what sources were used to build.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPMHMACgkQN1Ujt2V2gBxb9ACfSmpD53S1iG/bVsA/c8LI++dK
WL4AoJITeCjl3Xpx0x2DAhr50oBZ2iwG
=jOsU
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
