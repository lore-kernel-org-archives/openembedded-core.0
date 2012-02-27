Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S26q3-0003ot-SR
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 21:06:27 +0100
Received: by bkcjg15 with SMTP id jg15so1679620bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 11:58:01 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.42.72 as permitted sender) client-ip=10.112.42.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.42.72 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.42.72])
	by 10.112.42.72 with SMTP id m8mr6419216lbl.10.1330372681456 (num_hops
	= 1); Mon, 27 Feb 2012 11:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=EyilRvHpUvaPskHDAf4UC86gZPvL9cQjaEftdbrp2ok=;
	b=caqP6WDhIW3by1iKQV3RVexGXRAiHzObclR4P51JxfF1uZwwq5FM0EHuIW2jDFmS7q
	mtq74/fKkbBNEppe2Q2i2itkukfgqc/uXzjpbsOnBbFXT2bxMplYhMCjQqk9JdIcz4M0
	k4BzT63rVg5Is7d8iL2XKp+E8ZWxQwbwAoguY=
Received: by 10.112.42.72 with SMTP id m8mr5380174lbl.10.1330372681371; Mon,
	27 Feb 2012 11:58:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 27 Feb 2012 11:57:31 -0800 (PST)
In-Reply-To: <cover.1330053959.git.raj.khem@gmail.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Feb 2012 11:57:31 -0800
Message-ID: <CAMKF1sq-b9zTxETKDvqnhKrQ2Cg2AZZq-oVkuFowFynJ=a7isQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] stash gcc-cross buildtree and add recipe class override
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
X-List-Received-Date: Mon, 27 Feb 2012 20:06:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 7:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Add recipe class to overrides
> Prepare gcc for 4.7 changes
> missing DEPENDS found during individual recipe builds
> Add emptry DISTRO to oe-core
>

I have rebased the tree on top of todays master there were some conflicts w=
.r.t
gcc patch.

> The following changes since commit a1f23a7cc527afdd1ce6cc7cd6083ee78fde09=
b3:
>
> =C2=A0update-rc.d.bbclass: do nothing for extended cross packages (2012-0=
2-24 00:47:44 +0000)
>
> are available in the git repository at:
> =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/misc
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dkraj/misc
>
> Khem Raj (4):
> =C2=A0glib-networking: Add intltools-native to DEPENDS
> =C2=A0classes: Add recipe class to overrides
> =C2=A0default-distrovars: Add empty weak definition for DISTRO variable
> =C2=A0gcc: Stash the gcc-cross builddir to reuse in libgcc and gcc-runtim=
e
>
> =C2=A0meta/classes/base.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0meta/classes/cross-canadian.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/classes/cross.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0meta/classes/crosssdk.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0meta/classes/native.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A0meta/classes/nativesdk.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-
> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-
> =C2=A0meta/conf/distro/include/default-distrovars.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A07 ++++
> =C2=A0.../glib-networking/glib-networking_2.28.7.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-4.6.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc | =C2=A0 =C2=A03=
 --
> =C2=A0.../recipes-devtools/gcc/gcc-configure-runtime.inc | =C2=A0 24 ++++=
++++++------
> =C2=A0meta/recipes-devtools/gcc/gcc-cross-initial.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-package-cross.inc =C2=A0 =C2=A0| =C2=
=A0 14 +--------
> =C2=A0meta/recipes-devtools/gcc/libgcc_4.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 30 ++++++++++++++++----
> =C2=A015 files changed, 58 insertions(+), 40 deletions(-)
>
> --
> 1.7.5.4
>


