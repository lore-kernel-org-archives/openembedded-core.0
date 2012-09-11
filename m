Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBQmm-00048I-VP
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 15:45:53 +0200
Received: by eaad12 with SMTP id d12so247067eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uyo03XRf0NHmSuZ8DNjuA0Cy9bo/+CqGWX/gISuBs9s=;
	b=XbMfQmapoWuBFETxU2NcWqAuBDLfV8D55BbM99Dr3CUP4dgUw8rl3ZnmaE4/VjsvJN
	LS2PbL4FEBCcv7kApip//LSlmtwDITuMAInLugRpLVE8PLIZDq/Hk20bKDbpl4+tDk80
	eglWDLDkzzliKrK2GXXEIM6Qmcoy+6JDl5+X1Z8D8BB6AhGz4hAljDFlYuEdyqzB3nL9
	5X46/m+nCWWFAchmFH2Ge1L3X8XnNuJTfdZr2eGxckIvD2cKQ2h4ZXCVz9kJH7HOCIgB
	NPt1MFRGU9mQGuPNCnwH2oNzUzerZy5NTTuLrBQDhYQv2ZpQqMYjDw4J+BF7AUmqG0tQ
	eMxg==
Received: by 10.205.118.14 with SMTP id fo14mr4871637bkc.130.1347370402135;
	Tue, 11 Sep 2012 06:33:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm9634856bkv.8.2012.09.11.06.33.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 06:33:20 -0700 (PDT)
Date: Tue, 11 Sep 2012 15:33:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120911133320.GE14077@jama.jama.net>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
	<CA+chaQeP7GESLdd7zKEbSZ78xRn4ketJUDzzn5ChmcO84XzQQQ@mail.gmail.com>
	<504F2F2E.3080507@windriver.com>
	<20120911123707.GB14077@jama.jama.net>
	<504F3C56.8030808@windriver.com>
MIME-Version: 1.0
In-Reply-To: <504F3C56.8030808@windriver.com>
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
X-List-Received-Date: Tue, 11 Sep 2012 13:45:53 -0000
X-Groupsio-MsgNum: 29033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zaRBsRFn0XYhEU69"
Content-Disposition: inline

--zaRBsRFn0XYhEU69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 09:27:50AM -0400, Bruce Ashfield wrote:
> On 12-09-11 08:37 AM, Martin Jansa wrote:
> > On Tue, Sep 11, 2012 at 08:31:42AM -0400, Bruce Ashfield wrote:
> >> On 12-09-11 02:59 AM, Martin Jansa wrote:
> >>> On Mon, Sep 10, 2012 at 8:11 PM, Bruce Ashfield
> >>> <bruce.ashfield@windriver.com>   wrote:
> >>>> Updating to 3.4.10 which has been soaking for a bit now, as well
> >>>> as picking up the following meta commits from Tom Z:
> >>>>
> >>>>     a82db2f meta: have systemtap use kprobes and uprobes feature
> >>>>     d5d5b80 meta: add kprobes support to ktypes/standard
> >>>>     b32d373 meta: add kprobes feature
> >>>>     d40ed99 meta: have uprobe feature use uprobe.cfg
> >>>>     a69d1db meta: add uprobe.cfg
> >>>>
> >>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> >>>> ---
> >>>>    meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
> >>>>    meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--=
------
> >>>>    2 files changed, 12 insertions(+), 12 deletions(-)
> >>>>
> >>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/=
recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >>>> index b2620ea..3b36378 100644
> >>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >>>> @@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
> >>>>    KBRANCH =3D "standard/preempt-rt/base"
> >>>>    KBRANCH_qemuppc =3D "standard/preempt-rt/qemuppc"
> >>>>
> >>>> -LINUX_VERSION ?=3D "3.4.9"
> >>>> +LINUX_VERSION ?=3D "3.4.10"
> >>>>    LINUX_KERNEL_TYPE =3D "preempt-rt"
> >>>>
> >>>>    KMETA =3D "meta"
> >>>>
> >>>> -SRCREV_machine ?=3D "9032b1e9daf5b4396f939981c3be95f67802d18c"
> >>>> -SRCREV_machine_qemuppc ?=3D "08ce190232f89303772b6591ca7daaf2820eb7=
4e"
> >>>> -SRCREV_meta ?=3D "463299bc2e533e1bd38b0053ae7b210980f269c3"
> >>>> +SRCREV_machine ?=3D "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
> >>>> +SRCREV_machine_qemuppc ?=3D "85a1190530cb5749f5f831670976b163438dc3=
01"
> >>>> +SRCREV_meta ?=3D "d9d5fc63d8b38705036e946ea77d971d95de11ad"
> >>>>
> >>>>    PR =3D "${INC_PR}.0"
> >>>>    PV =3D "${LINUX_VERSION}+git${SRCPV}"
> >>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/rec=
ipes-kernel/linux/linux-yocto_3.4.bb
> >>>> index 06bcb9a..7258cba 100644
> >>>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> >>>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> >>>> @@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
> >>>>    KBRANCH_DEFAULT =3D "standard/base"
> >>>>    KBRANCH =3D "${KBRANCH_DEFAULT}"
> >>>>
> >>>> -SRCREV_machine_qemuarm ?=3D "84d8ee32265eea5d60f57a2f70bd3b9a0fb921=
3d"
> >>>> -SRCREV_machine_qemumips  ?=3D "ba0e336d4527080233c3c410989d4f351529=
ee4e"
> >>>> -SRCREV_machine_qemuppc ?=3D "e82b8a111430e3820b11f507863c4b8e8734ed=
8e"
> >>>> -SRCREV_machine_qemux86 ?=3D "0985844fa6235422c67ef269952fa4e765f252=
f9"
> >>>> -SRCREV_machine_qemux86-64 ?=3D "0985844fa6235422c67ef269952fa4e765f=
252f9"
> >>>> -SRCREV_machine ?=3D "0985844fa6235422c67ef269952fa4e765f252f9"
> >>>> -SRCREV_meta ?=3D "463299bc2e533e1bd38b0053ae7b210980f269c3"
> >>>> +SRCREV_machine_qemuarm ?=3D "b15e7b1e9b58b9863bd87778775f86cd8d8880=
ea"
> >>>> +SRCREV_machine_qemumips  ?=3D "8d5b98f263b5119af2dc30223f311be17173=
bab9"
> >>>> +SRCREV_machine_qemuppc ?=3D "b9a720ca38d298ed457f37d099c85771f9164b=
19"
> >>>> +SRCREV_machine_qemux86 ?=3D "46d8c757b3be1953f30d6745505d24436e2d68=
44"
> >>>> +SRCREV_machine_qemux86-64 ?=3D "46d8c757b3be1953f30d6745505d24436e2=
d6844"
> >>>> +SRCREV_machine ?=3D "46d8c757b3be1953f30d6745505d24436e2d6844"
> >>>> +SRCREV_meta ?=3D "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
> >>>
> >>> Doesn't different SRCREV_machine for each MACHINE cause LOCALCOUNT in
> >>> SRCPV incrementing on each MACHINE switch?
> >>>
> >>> They are stored under same key:
> >>> sqlite>   select * from BB_URI_LOCALCOUNT where key like '%linux-yoct=
o-3.4%';
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/base-linux-yocto=
_rev|84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/base-linux-yocto=
_count|16
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto_rev|4632=
99bc2e533e1bd38b0053ae7b210980f269c3
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto_count|9
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/common-pc-64/bas=
e-linux-yocto_rev|19f7e43b54aef08d58135ed2a897d77b624b320a
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/common-pc-64/bas=
e-linux-yocto_count|7
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/preempt-rt/base-=
linux-yocto-rt_rev|9032b1e9daf5b4396f939981c3be95f67802d18c
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/preempt-rt/base-=
linux-yocto-rt_count|10
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto-rt_rev|4=
63299bc2e533e1bd38b0053ae7b210980f269c3
> >>> git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto-rt_count=
|8
> >>>
> >>> So I guess if you build linux-yocto-3.4 for qemuarm, qemux86-64, then
> >>> switch back to qemuarm you'll see linux-yocto built again, same
> >>> source, but different SRCPV (LOCALCOUNT).
> >>
> >> That does look to be the case, and it matches what I've observed
> >> over time. I'm not sure of an alternative at the moment, since the
> >> fetcher is such a cranky beast with respect to fetching changes to
> >> the right machine branches.
> >
> > Why not remove it from SRCREV_FORMAT, keep only meta SRCPV and just bump
> > PR when SRCREV of some machine kbranch is changed?
>=20
> I like the sound of it, but as far as I know, wouldn't that fix the
> package revision, but cause the fetcher problems ? I've added Richard
> to the cc, since I'm not sure what the current status of the fetcher
> is in this regard.
>=20
> If I don't bump the SRCREV for the machines, and just bump the PR,
> there's nothing in place to trigger the fetcher when only machine
> changes have been made to one of the branches, and conversely there's

PR bump will trigger recipe rebuild and while rebuilding fetcher will
download revision set by SRCREV, why shoudln't it?

Only disadvantage I see is that PR bump is "global" so all machines get
rebuilt when you bump it only because of one machine changing SRCREV,
but that's still better then rebuilding without any change in sources at
all.

Cheers,

> no explicit value set to inhibit a machine's SRCREV when you don't
> want the end of the branch to be built (I always build the end, but
> other layers inhibit SRCREV frequently to throttle their updates).
>=20
> If there's a better way that keeps the rebuilds to a minimum, but
> doesn't break the fetcher and those other use cases .. I'm more than
> happy to switch to it :)
>=20
> Bruce
>=20
> >
> > Current SRCREV_FORMAT doesn't show which branch it was so it doesn't
> > make it much worse to find what sources were used to build.
> >
> > Cheers,
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zaRBsRFn0XYhEU69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPPaAACgkQN1Ujt2V2gBxqcgCggkk+sYGHRdr9xKP7/WsnnKpU
W0oAnRkx+QiKh5rkxAZ8Ytwi+oOBuxs+
=6wcy
-----END PGP SIGNATURE-----

--zaRBsRFn0XYhEU69--
