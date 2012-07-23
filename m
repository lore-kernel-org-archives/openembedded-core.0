Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StEVI-0006Lw-Ek; Mon, 23 Jul 2012 11:00:36 +0200
Received: by bkcik5 with SMTP id ik5so3827205bkc.6
	for <multiple recipients>; Mon, 23 Jul 2012 01:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z1ivADdUr7hZJkujSuaQ5LgjRrH7j8zTBMf8JvOcPqQ=;
	b=cea1+z/wotL23UCNrnj3I++HNelDgeXuNIJ8xlHWwAfzirjd6OGdN0FL2twuJp1Gxm
	R8UmdVfaG1XZiOFFjC3sbiCd0hUVb6/1nWfB3oEWxwit1xZdzKRlSfWjSNftwhiVW0kC
	RTT/2oiug3ZeTGEu7r5Gw5HFvG7N/wa/tDFLDJ4Qy1jirjNcRMggSABhFwX4O2NM+shz
	P628G/jcJjq+4fXJf+jAijAJcpDPNLrSkAQnQTj0ZUHCiMUHjcIytOtt7izHR2olElOS
	JDMVbozpmRppQBO2tcG8T1yRD8dCY0nVN5SqM0tD9TtpEAQQWiufKfl1OiImOCM2SXqa
	PiPg==
Received: by 10.204.157.10 with SMTP id z10mr7404144bkw.63.1343033349816;
	Mon, 23 Jul 2012 01:49:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm6453414bkv.14.2012.07.23.01.49.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 01:49:08 -0700 (PDT)
Date: Mon, 23 Jul 2012 10:49:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120723084908.GB3271@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
	<20120628213215.GC3961@jama.jama.net>
	<CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
	<20120629060037.GD3961@jama.jama.net>
	<CADkTA4MxhVtYtH0Y==R64A7bnSaMjmrSM6RqekBU5PxuJNK0jA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MxhVtYtH0Y==R64A7bnSaMjmrSM6RqekBU5PxuJNK0jA@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Jul 2012 09:00:36 -0000
X-Groupsio-MsgNum: 25974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2012 at 09:04:54AM -0400, Bruce Ashfield wrote:
> On Fri, Jun 29, 2012 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Jun 28, 2012 at 07:31:45PM -0400, Bruce Ashfield wrote:
> >> On Thu, Jun 28, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.org w=
rote:
> >> >> Module: openembedded-core.git
> >> >> Branch: master
> >> >> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
> >> >> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&=
a=3Dcommit;h=3Dbe3cff86d55db6255e036d68e943e527802b4f4c
> >> >>
> >> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> >> Date: =A0 Fri Jun 15 15:26:44 2012 -0400
> >> >>
> >> >> kern-tools: add buildall and robustness fixes
> >> >>
> >> >> Updating the kern-tools SRCREV to pickup the following functionalit=
y:
> >> >>
> >> >> =A0- buildall: provides the ability to build all kernel branches
> >> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0without a build system, only a cross com=
piler and configme
> >> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0are required.
> >> >>
> >> >> =A0- robustness/cleanups: obselete/unused code removal and general =
robustness
> >> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fixes from Paul Gor=
tmaker and Bruce Ashfield
> >> >
> >> > is this expected with latest kern-tools/linux-yocto and qemux86-64?
> >> >
> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa=
84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_con=
figcheck: Start
> >> > ed
> >> > NOTE: validating kernel configuration
> >> > find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linu=
x/linux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533c=
d0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match anyt=
hing because it ends with /.
> >> > This BSP sets 1 kernel options that are possibly non-hardware relate=
d.
> >> > The full list can be found in your kernel src dir at:
> >> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
> >> >
> >> > There were 1 instances of config fragment errors.
> >> > The full list can be found in your kernel src dir at:
> >> > meta/cfg/standard/common-pc-64/fragment_errors.txt
> >> >
> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa=
84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_con=
figcheck: Succeeded
> >> >
> >> >
> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linu=
x-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c45=
2c3965eaec3ec2c
> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/specified=
_non_hdw.cfg
> >> > CONFIG_BLOCK
> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linu=
x-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c45=
2c3965eaec3ec2c
> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragment_=
errors.txt
> >> > Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple times wi=
thin fragment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
> >> > CONFIG_NET_CLS_CGROUP=3Dy
> >> > CONFIG_NET_CLS_CGROUP=3Dy
> >>
> >> It is, only because I was waiting for my other queued changes to get p=
ulled
> >> before sending another batch:
> >>
> >> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?i=
d=3D0329bbc053c97f9b250454ff6a60727f75973706
> >
> > Ah OK, from those validation messages it wasn't very clear if it's
> > info/warning/error/fatal.

First warning/error/.. is still there with latest linux-yocto
NOTE: package
linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d=
57e1063bfce297c2e12392348598559-r4.0:
task do_kernel_configcheck: Started
NOTE: validating kernel configuration
find: warning: -path
/OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git6+949=
fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e123923485=
98559-r4.0/linux/
will not match anything because it ends with /.
This BSP sets 1 kernel options that are possibly non-hardware related.
The full list can be found in your kernel src dir at:
meta/cfg/standard/common-pc-64/specified_non_hdw.cfg

NOTE: package
linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d=
57e1063bfce297c2e12392348598559-r4.0:
task do_kernel_configcheck: Succeeded

OE @ ~/openembedded-core $ cat
/OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git6+949=
fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e123923485=
98559-r4.0/linux/meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
CONFIG_BLOCK

wasn't this supposed to be fixed by those changes?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlANEAQACgkQN1Ujt2V2gByydACff1yhQAEndUXFIXuz3DsEr103
I+0AoIM5/5kslCPlY1vO7OEsWaNl6GqH
=578g
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
