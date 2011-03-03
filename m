Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvF3g-0000DP-H0
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:23:36 +0100
Received: by fxm8 with SMTP id 8so1508851fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 12:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=fP42dDUjHZuW/PM9WLXKSYhjZYq+5lZaA1BEul7JJZ8=;
	b=LPVZopWHci8aD2QFcIN45KHYAaCMsu+AwEAGEoGoKjy+CRsiy9J788QJav5Jm5LPJ6
	4Sj7E3tdtREAPE32CNBcApPpfr6rzJjD56FKvi9HjXFGGjbsX88TmBV40FPDdbf5ZnAC
	+OoGeAHzfhJS12/9yK0k5StXg9Kk6CnXkpqwU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=BITM8qdHqytKa+DrGzhpD3+/6+MQ8GVjCnRQSuYrKKZbcGXllNtRWqFCUII7wnrjHn
	tpwQ+jXaB2IvX1YFAvaU2ym9nxkZzmASWuranip+3WcQXeu+q7ukFE+7g5LJKERVM4My
	3CM4E3Cn/M/PhLRbhlym7/7DH+zi8NmP2XYf0=
Received: by 10.223.83.142 with SMTP id f14mr2045957fal.0.1299183707674; Thu,
	03 Mar 2011 12:21:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 12:21:25 -0800 (PST)
In-Reply-To: <af28e7139251d0eb06247c9118c4c713e90e9c40.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
	<af28e7139251d0eb06247c9118c4c713e90e9c40.1299182375.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 12:21:25 -0800
Message-ID: <AANLkTinDTLiqzRTQvOSR+RRe850yRzdy2VHu5KarnHm+@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 02/10] x11vnc: Fix the start failure
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
X-List-Received-Date: Thu, 03 Mar 2011 20:23:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
>
> Default parameter "-gui" and "-rfbport" make x11vnc failed to start if no
> "wish" installed.
>
> [BUGID #781] got fixed.
>
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
> =C2=A0.../x11vnc/files/starting-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 18 ++++++++++++++++++
> =C2=A0meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A03 ++-
> =C2=A02 files changed, 20 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta/recipes-graphics/x11vnc/files/starting-fix.=
patch
>
> diff --git a/meta/recipes-graphics/x11vnc/files/starting-fix.patch b/meta=
/recipes-graphics/x11vnc/files/starting-fix.patch
> new file mode 100644
> index 0000000..f59e801
> --- /dev/null
> +++ b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
> @@ -0,0 +1,18 @@
> +"-gui" & "-rfbport" require "wish" installed, or else x11vnc fails to st=
art.
> +Removing these 2 parameters makes x11vnc works well on poky sato image.
> +
> +
> +Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> +Index: x11vnc-0.9.12/x11vnc/x11vnc.desktop
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- x11vnc-0.9.12.orig/x11vnc/x11vnc.desktop =C2=A0 2011-03-03 10:33:18.=
000000000 +0800
> ++++ x11vnc-0.9.12/x11vnc/x11vnc.desktop =C2=A0 =C2=A0 =C2=A0 =C2=A02011-=
03-03 10:35:20.000000000 +0800
> +@@ -1,7 +1,7 @@
> + [Desktop Entry]
> + Name=3DX11VNC Server
> + Comment=3DShare this desktop by VNC
> +-Exec=3Dx11vnc -gui tray=3Dsetpass -rfbport PROMPT -bg -o %%HOME/.x11vnc=
.log.%%VNCDISPLAY
> ++Exec=3Dx11vnc -bg -o %%HOME/.x11vnc.log.%%VNCDISPLAY
> + Icon=3Dcomputer
> + Terminal=3Dfalse
> + Type=3DApplication
> diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb b/meta/recipes=
-graphics/x11vnc/x11vnc_0.9.12.bb
> index 87cda2c..129343b 100644
> --- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
> +++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26=
c6900a926b62aada5f \
>
> =C2=A0DEPENDS =3D "openssl virtual/libx11 libxext avahi jpeg zlib"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc-${PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc-${PV}.tar.gz\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://starting-fix.patch;patch=3D1"

if it is a patch file with .patch extention then bitbake is smart to
treat it as patch you dont need patch=3D1

>
> =C2=A0SRC_URI[md5sum] =3D "1498a68d02aa7b6c97bf746c073c8d00"
> =C2=A0SRC_URI[sha256sum] =3D "60a7cceee2c9a5f1c854340b2bae13f975ac5590623=
7042f81f795b28a154a79"
> --
> 1.7.1.1
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


