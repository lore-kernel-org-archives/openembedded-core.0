Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RscrY-0007KG-Tt
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 17:16:49 +0100
Received: by lahc1 with SMTP id c1so729357lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=imKxwq1Xof6kR4igjxHqKP3PpWrbyaCmdNqRTPvzwKc=;
	b=aT1/Cm0RY9CKpB9RtPX/+yfjGz2D0vzsRqd5qaMfRFvuCP+XS3T7A1sjDeFP0eveGr
	D9PLJMIj77y6OkigdEra21xgX1J4NM0kjWYjjt4qL6GVIOTpNvrs65GghRtdhylXASjq
	uc6KQRlEp6PrmZPiAYu8ZtwuaOON33FalOsjs=
Received: by 10.152.146.163 with SMTP id td3mr13510326lab.6.1328112532279;
	Wed, 01 Feb 2012 08:08:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 08:08:22 -0800 (PST)
In-Reply-To: <0de11fff1e41291501f20a26e4611142aa17a94d.1328057677.git.josh@linux.intel.com>
References: <cover.1328057677.git.josh@linux.intel.com>
	<0de11fff1e41291501f20a26e4611142aa17a94d.1328057677.git.josh@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 08:08:22 -0800
Message-ID: <CAMKF1sqEk-esgBaYq8bPrzp7O2vSY=v-=dfG8L0b35a3d2b_vA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] pciutils: fix configure script for dash
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
X-List-Received-Date: Wed, 01 Feb 2012 16:16:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 4:58 PM, Joshua Lock <josh@linux.intel.com> wrote:
> configure.patch was missing a closing quote in a sed expression which
> causes script execution to error on less forgiving shells such as dash.
>
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

coincidently I have same patch locally and it works :)

> ---
> =C2=A0.../pciutils/pciutils-3.1.9/configure.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch b/m=
eta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
> index 658e597..66c9f91 100644
> --- a/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
> +++ b/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
> @@ -67,7 +67,7 @@ diff -r af2b10cc3c14 lib/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu=3D`/usr/sbin/l=
sattr -F value -l $proc -a type | sed 's/_.*//'`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu=3D`uname -m |=
 sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^B=
eMac$/powerpc/;s/^BeBox$/powerpc/'`
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu=3D${4:-`uname -m |=
 sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^B=
eMac$/powerpc/;s/^BeBox$/powerpc/`}
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu=3D${4:-`uname -m |=
 sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^B=
eMac$/powerpc/;s/^BeBox$/powerpc/'`}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "$sys" =3D "GNU/kFreeBSD" -o "$sys" =3D "=
DragonFly" ]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0then
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


