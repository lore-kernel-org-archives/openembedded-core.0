Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKjS5-00053G-4P
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 05:54:09 +0200
Received: by ewy5 with SMTP id 5so639499ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2011 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ozoPyacfaMXlU6ABmYeF9SusNktTTPPK4p/wl8usGrs=;
	b=Sgc6/HbynQ7Br1isiAK318jGTyMkpZDpZM7kfkLHNVWnxt2XX4b1h6l2MkMBmDxsWK
	70xO5YCN4AMi4xrIHb3aXBUJLoPuD/65j23MDOcZ/xbvdYZ0tKyQTd8q3mWwZi13l7n1
	cEnU4AvMZj5WuxFPurkf+0nUIiA0WehAHjgEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=O0JOT0//Zl0Ae+8Y2ggy1doW0Hc5LVIUbTL2xyZA6st+9XJ5MG19xCPQj9To5sxbki
	4Bp3iJNpvW1Kh1F601IK6wLZPEQRfsBDjz1VFFpuVAvNS6UO6ZrVM8x7ZwR7H3dfd+Eg
	9zeI1agDLPkEZsquRdn9cN05A82ZTuEMRX5u4=
Received: by 10.14.41.193 with SMTP id h41mr412057eeb.48.1305258680404; Thu,
	12 May 2011 20:51:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Thu, 12 May 2011 20:50:50 -0700 (PDT)
In-Reply-To: <687fb20407ee32261a840c9e475b489319d8ee62.1305109178.git.leon@sidebranch.com>
References: <cover.1305109178.git.leon@sidebranch.com>
	<687fb20407ee32261a840c9e475b489319d8ee62.1305109178.git.leon@sidebranch.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2011 20:50:50 -0700
Message-ID: <BANLkTi=C-5rjKtd0675Y70VX+g4MdL64Uw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] siteinfo.bbclass: Add powerpc-linux-gnuspe.
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
X-List-Received-Date: Fri, 13 May 2011 03:54:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 3:29 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> From: Leon Woestenberg <leon@sidebranch.com>
>
> Re-add powerpc-linux-gnuspe, from OpenEmbedded. Also adds support
> to poky.conf so that minimal-core-image builds with DISTRO=3Dpoky,
>

you need to rebase this patch on latest oe-core

> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> ---
> =C2=A0meta/classes/siteinfo.bbclass | =C2=A0 =C2=A01 +
> =C2=A0meta/conf/distro/poky.conf =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A02 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclas=
s
> index df29097..731ccd1 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -47,6 +47,7 @@ def get_siteinfo_list(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-darwin": =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"endian-big bit-32 common-darwin",\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"ppc-linux": =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "endian-big bit-32 common-gli=
bc powerpc-common",\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "powerpc-linux": =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "endian-big bit-32 common-glibc powerpc-common"=
,\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "powerpc-linux-gnuspe"=
: =C2=A0 =C2=A0"endian-big bit-32 common-glibc powerpc-common",\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-linux-ucl=
ibc": =C2=A0 =C2=A0"endian-big bit-32 common-uclibc powerpc-common",\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"sh3-linux": =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "endian-little bit-32 common-=
glibc sh-common",\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"sh4-linux": =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "endian-little bit-32 common-=
glibc sh-common",\
> diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
> index 71e40de..536fdc9 100644
> --- a/meta/conf/distro/poky.conf
> +++ b/meta/conf/distro/poky.conf
> @@ -55,6 +55,7 @@ KERNEL_CONSOLE =3D "ttyS0"
> =C2=A0# Default to TARGETOS values for EABI on arm
> =C2=A0GLIBCTARGETOS =3D "linux${@['','-gnueabi'][bb.data.getVar('TARGET_A=
RCH',d,1) in ['arm', 'armeb']]}"
> =C2=A0UCLIBCTARGETOS =3D "linux${@['-uclibc','-uclibcgnueabi'][bb.data.ge=
tVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
> +GLIBCTARGETOS =3D "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_A=
RCH',d,1) in ['ppce500', 'ppce500v2']]}"
>
> =C2=A0POKYMODE ?=3D "default"
> =C2=A0require conf/distro/include/poky-${POKYMODE}.inc
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


