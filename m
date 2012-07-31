Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SwAhD-0001al-04; Tue, 31 Jul 2012 13:33:03 +0200
Received: by bkcik5 with SMTP id ik5so2515822bkc.6
	for <multiple recipients>; Tue, 31 Jul 2012 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yZnU8ZIvqT+eaOxlHUzTad7pOimiB6aVwm7QA0GmH84=;
	b=Rr072FPycc4inu2nYlQDwNU/EBiNMUAc5EAVo1VmobG3QnF1GIGOFVHpmgZxIeyRyt
	HTMyjxmc3go1Ve3Qbip/6gnogfTQPOlWXJu2WjTy5dds+GZPFK7/4J83S/FqkqQ3aKh0
	CaMYV8Tl+6MbDP4KYJPAzLeaHz9AYljkS0wVlskr4bur1tYCZIQTnjU4O3cHOmyTDvWA
	/qL+NgcXsDmrWwrl96QskyFfRE/6gbkgp5+SjnEvUEjXoUhGdy0KJ4j9etvGJ3qhWMiv
	ixmoM2gpHMWaZ5vIo98HfDPkwf4pMVHm5aYbVqfSPxjkzTVfcyulXE6ubghJf+FWWUbs
	vH/w==
Received: by 10.204.157.18 with SMTP id z18mr5298034bkw.16.1343733685948;
	Tue, 31 Jul 2012 04:21:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm5175075bkc.3.2012.07.31.04.21.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 04:21:24 -0700 (PDT)
Date: Tue, 31 Jul 2012 13:21:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120731112120.GS3261@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
	<20120628213215.GC3961@jama.jama.net>
	<CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
	<20120629060037.GD3961@jama.jama.net>
	<CADkTA4MxhVtYtH0Y==R64A7bnSaMjmrSM6RqekBU5PxuJNK0jA@mail.gmail.com>
	<20120723084908.GB3271@jama.jama.net>
	<CADkTA4N=CGskq0oiOxVLa_8rzLyLziyxCyEq-3Zt4t8_TYiABQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4N=CGskq0oiOxVLa_8rzLyLziyxCyEq-3Zt4t8_TYiABQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: add buildall and robustness fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 11:33:03 -0000
X-Groupsio-MsgNum: 26559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aJ74fq0Y6SrIeKCM"
Content-Disposition: inline

--aJ74fq0Y6SrIeKCM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 08:46:06AM -0400, Bruce Ashfield wrote:
> On Mon, Jul 23, 2012 at 4:49 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Jun 29, 2012 at 09:04:54AM -0400, Bruce Ashfield wrote:
> >> On Fri, Jun 29, 2012 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Thu, Jun 28, 2012 at 07:31:45PM -0400, Bruce Ashfield wrote:
> >> >> On Thu, Jun 28, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >> >> > On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.or=
g wrote:
> >> >> >> Module: openembedded-core.git
> >> >> >> Branch: master
> >> >> >> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
> >> >> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3Dbe3cff86d55db6255e036d68e943e527802b4f4c
> >> >> >>
> >> >> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> >> >> Date:   Fri Jun 15 15:26:44 2012 -0400
> >> >> >>
> >> >> >> kern-tools: add buildall and robustness fixes
> >> >> >>
> >> >> >> Updating the kern-tools SRCREV to pickup the following functiona=
lity:
> >> >> >>
> >> >> >>  - buildall: provides the ability to build all kernel branches
> >> >> >>              without a build system, only a cross compiler and c=
onfigme
> >> >> >>              are required.
> >> >> >>
> >> >> >>  - robustness/cleanups: obselete/unused code removal and general=
 robustness
> >> >> >>                         fixes from Paul Gortmaker and Bruce Ashf=
ield
> >> >> >
> >> >> > is this expected with latest kern-tools/linux-yocto and qemux86-6=
4?
> >> >> >
> >> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d=
0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_=
configcheck: Start
> >> >> > ed
> >> >> > NOTE: validating kernel configuration
> >> >> > find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-l=
inux/linux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a5=
33cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match a=
nything because it ends with /.
> >> >> > This BSP sets 1 kernel options that are possibly non-hardware rel=
ated.
> >> >> > The full list can be found in your kernel src dir at:
> >> >> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
> >> >> >
> >> >> > There were 1 instances of config fragment errors.
> >> >> > The full list can be found in your kernel src dir at:
> >> >> > meta/cfg/standard/common-pc-64/fragment_errors.txt
> >> >> >
> >> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d=
0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_=
configcheck: Succeeded
> >> >> >
> >> >> >
> >> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/l=
inux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720=
c452c3965eaec3ec2c
> >> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/specif=
ied_non_hdw.cfg
> >> >> > CONFIG_BLOCK
> >> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/l=
inux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720=
c452c3965eaec3ec2c
> >> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragme=
nt_errors.txt
> >> >> > Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple times=
 within fragment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
> >> >> > CONFIG_NET_CLS_CGROUP=3Dy
> >> >> > CONFIG_NET_CLS_CGROUP=3Dy
> >> >>
> >> >> It is, only because I was waiting for my other queued changes to ge=
t pulled
> >> >> before sending another batch:
> >> >>
> >> >> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit=
/?id=3D0329bbc053c97f9b250454ff6a60727f75973706
> >> >
> >> > Ah OK, from those validation messages it wasn't very clear if it's
> >> > info/warning/error/fatal.
> >
> > First warning/error/.. is still there with latest linux-yocto
> > NOTE: package
> > linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e=
4c1d57e1063bfce297c2e12392348598559-r4.0:
> > task do_kernel_configcheck: Started
> > NOTE: validating kernel configuration
> > find: warning: -path
> > /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git6=
+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e12392=
348598559-r4.0/linux/
> > will not match anything because it ends with /.
> > This BSP sets 1 kernel options that are possibly non-hardware related.
> > The full list can be found in your kernel src dir at:
> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
> >
> > NOTE: package
> > linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e=
4c1d57e1063bfce297c2e12392348598559-r4.0:
> > task do_kernel_configcheck: Succeeded
> >
> > OE @ ~/openembedded-core $ cat
> > /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git6=
+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e12392=
348598559-r4.0/linux/meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
> > CONFIG_BLOCK
> >
> > wasn't this supposed to be fixed by those changes?
>=20
> Not that one, it's being covered by the kernel config updates that are pa=
rt
> of yocto 1.3, which are in the upcoming M3 milestone. The one I mentioned
> in that other email was CONFIG_NET_CLS_CGROUP.

And that warning from find?
find: warning: -path
/OE/oe-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.6+git1+7ff4=
8aa47c50b6455d60ca93bc81260ce8fe1a1b_1+19f7e43b54aef08d58135ed2a897d77b624b=
320a-r4.0/linux/
will not match anything because it ends with /.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aJ74fq0Y6SrIeKCM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAXv7AACgkQN1Ujt2V2gBz62ACghVdlS3Ysze2RTT6YkSQsXti9
TJoAn2JYALpICzII2B/FqR3wjNc4J3Iw
=o67q
-----END PGP SIGNATURE-----

--aJ74fq0Y6SrIeKCM--
