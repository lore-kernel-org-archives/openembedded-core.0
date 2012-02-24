Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0yZ1-000697-MX
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:04:11 +0100
Received: from mail29-am1-R.bigfish.com (10.3.201.233) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Feb 2012 16:55:48 +0000
Received: from mail29-am1 (localhost [127.0.0.1])	by mail29-am1-R.bigfish.com
	(Postfix) with ESMTP id A2BAC180579	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:55:48 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail29-am1 (localhost.localdomain [127.0.0.1]) by mail29-am1
	(MessageSwitch) id 1330102546649719_22907;
	Fri, 24 Feb 2012 16:55:46 +0000 (UTC)
Received: from AM1EHSMHS006.bigfish.com (unknown [10.3.201.254])	by
	mail29-am1.bigfish.com (Postfix) with ESMTP id 90A382C0046	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:55:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS006.bigfish.com
	(10.3.207.106) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Feb 2012 16:55:46 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Fri, 24 Feb 2012 10:55:44 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Luo Zhenhua-B19537
	<B19537@freescale.com>
Thread-Topic: [OE-core] Using external source trees with OE-Core
Thread-Index: AQHM8xUmFjkmqUF3KU6/yhONOVV3hw==
Date: Fri, 24 Feb 2012 16:55:44 +0000
Message-ID: <CAEsOVNe0Fe5qyzYWK3Tf5P1=oYMnB3n-LoOVdE5bk-EkHdPf3A@mail.gmail.com>
References: <1330088135.32006.14.camel@ted>
In-Reply-To: <1330088135.32006.14.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Using external source trees with OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 24 Feb 2012 17:04:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <76F0288A2501C9428A96F7553D38A2D7@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Richard,

We do something very similar to this currently. I've pushed what we
are using here:

https://github.com/mattsm/meta-fsl-local-sdk

It would be nice to consolidate all the required bits upstream... =3D)

-M

On Fri, Feb 24, 2012 at 6:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Someone recently asked me about using external source trees with
> OE-Core. I was aware of srctree.bbclass in OE-Classic and did start
> looking at it but it has various elements I wasn't so keen on. I
> therefore wondered if I could improve upon it. I did start from that
> code base but came up with:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/a0&=
id=3Dac8a54c18c33aaab6758c34a3d6093d3d3384cee
> [patch inline below]
>
> which I've called externalsrc.bbclass since it behaves a bit
> differently. In particular, all the usual task targets are available.
>
> As an example usage with the above patch applied:
>
> cd ~
> tar -xvzf $DL_DIR/libfm-0.1.17.tar.gz
> (creates libfm-0.1.17 in my homedir)
>
> edit libfm_0.1.17.bb and add:
>
> inherit externalsrc
> S =3D "/home/richard/libfm-0.1.17"
>
> bitbake libfm
>
> and it does what you'd expect. You can also -c clean and it will wipe
> out WORKDIR but it won't touch ${S}. I picked libfm effectively at
> random. It won't remove the autoreconf changes from configure but I'm
> not sure I care much about that.
>
> Admittedly, I did have to fix one Makefile.am which did '-I../' instead
> of "-I$(srcdir)/../" but that is a bug in libfm.
>
> Obviously this won't work quite as well with some recipes like
> linux-yocto which manipulate ${S} a lot more but it should work in most
> cases. I also found it very hard to remove tasks from the anonymous
> python, we probably need to improve the API for this.
>
> Opinions on including this class?
>
> Cheers,
>
> Richard
>
>
>
> From ac8a54c18c33aaab6758c34a3d6093d3d3384cee Mon Sep 17 00:00:00 2001
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Fri, 24 Feb 2012 12:29:36 +0000
> Subject: externalsrc.bbclass: Add class for handling external source tree=
s
>
> This is loosly based upon srctree.bbclass from OE-Classic but with some
> changes appropriate to OE-Core.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> new file mode 100644
> index 0000000..7e00ef8
> --- a/dev/null
> +++ b/meta/classes/externalsrc.bbclass
> @@ -0,0 +1,53 @@
> +# Copyright (C) 2012 Linux Foundation
> +# Author: Richard Purdie
> +# Some code and influence taken from srctree.bbclass:
> +# Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +#
> +# externalsrc.bbclass enables use of an existing source tree, usually ex=
ternal to
> +# the build system to build a piece of software rather than the usual fe=
tch/unpack/patch
> +# process.
> +#
> +# To use, set S to point at the directory you want to use containing the=
 sources
> +# e.g. S =3D "/path/to/my/source/tree"
> +#
> +# If the class is to work for both target and native versions (or with m=
ultilibs/
> +# cross or other BBCLASSEXTEND variants), its expected that setting B to=
 point to
> +# where to place the compiled binaries will work (split source and build=
 directories).
> +# This is the default but B can be set to S if circumstaces dictate.
> +#
> +
> +SRC_URI =3D ""
> +SRCTREECOVEREDTASKS ?=3D "do_patch do_unpack do_fetch"
> +B =3D "${WORKDIR}/${BPN}-${PV}/"
> +
> +def remove_tasks(tasks, deltasks, d):
> + =A0 =A0for task in tasks:
> + =A0 =A0 =A0 =A0deps =3D d.getVarFlag(task, "deps")
> + =A0 =A0 =A0 =A0for preptask in deltasks:
> + =A0 =A0 =A0 =A0 =A0 =A0if preptask in deps:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0deps.remove(preptask)
> + =A0 =A0 =A0 =A0d.setVarFlag(task, "deps", deps)
> + =A0 =A0# Poking around bitbake internal variables is evil but there app=
ears to be no better way :(
> + =A0 =A0tasklist =3D d.getVar('__BBTASKS') or []
> + =A0 =A0for task in deltasks:
> + =A0 =A0 =A0 =A0d.delVarFlag(task, "task")
> + =A0 =A0 =A0 =A0if task in tasklist:
> + =A0 =A0 =A0 =A0 =A0 =A0tasklist.remove(task)
> + =A0 =A0d.setVar('__BBTASKS', tasklist)
> +
> +python () {
> + =A0 =A0tasks =3D filter(lambda k: d.getVarFlag(k, "task"), d.keys())
> + =A0 =A0covered =3D d.getVar("SRCTREECOVEREDTASKS", True).split()
> +
> + =A0 =A0for task in tasks:
> + =A0 =A0 =A0 =A0if task.endswith("_setscene"):
> + =A0 =A0 =A0 =A0 =A0 =A0# sstate is never going to work for external sou=
rce trees, disable it
> + =A0 =A0 =A0 =A0 =A0 =A0covered.append(task)
> + =A0 =A0 =A0 =A0else:
> + =A0 =A0 =A0 =A0 =A0 =A0# Since configure will likely touch ${S}, ensure=
 only we lock so one task has access at a time
> + =A0 =A0 =A0 =A0 =A0 =A0d.appendVarFlag(task, "lockfiles", "${S}/singlet=
ask.lock")
> +
> + =A0 =A0remove_tasks(tasks, covered, d)
> +}
> +
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



