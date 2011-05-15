Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLiHy-0005tU-NN
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 22:51:46 +0200
Received: by eye27 with SMTP id 27so1143179eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=jk5EaFO2FpaybScu7jnIX3S0+S8gAKz4JEteAVW3HnE=;
	b=xBCu3UEwM+fhU+dUUIXI0CpeLamRpb1lIkpaar+tEy+TH2mARND2qPCmBDdlhoQG2v
	FcT5hDJEUlOdHgS1iFPJwBzbqKSIXI4Su0Ej4a21Sm3hmPXTgzrNNAEEUHLP0MZ1zE9a
	iq93h9RNK3qlfNgvWfs5DvUW+ODCLFbN9GhRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LVmof4oEiCsU3p7e74Qvb+sO8JBKMuRf3THZZdbNY3hWo7CKCgPst+N/5phXkF0Nmt
	fx/bEw2oncu6al5Ydxfp8gwkoaZhfnNadzB1cEZ1IQaPK1G0VNQWp+U9SaV1DoypV68i
	J9F9IM8jSfc/fibvh8cCwsvfGFFq0giSb1NsY=
Received: by 10.14.9.18 with SMTP id 18mr1481999ees.236.1305492535273; Sun, 15
	May 2011 13:48:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Sun, 15 May 2011 13:48:25 -0700 (PDT)
In-Reply-To: <2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 May 2011 13:48:25 -0700
Message-ID: <BANLkTikP2DEjqVfw36bjFAn7y6ordKTA6Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] conf/distro/include/default-distrovars.inc: Create set of default 'distro' variable values
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
X-List-Received-Date: Sun, 15 May 2011 20:51:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 7:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/conf/distro/defaultsetup.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0meta/conf/distro/include/default-distrovars.inc | =C2=A0 43 +++++++=
+++++++++++++
> =C2=A0meta/conf/distro/poky.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 48 +----------------------
> =C2=A03 files changed, 46 insertions(+), 46 deletions(-)
> =C2=A0create mode 100644 meta/conf/distro/include/default-distrovars.inc
>
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
> index af5ef7b..8da6c0a 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -1,5 +1,6 @@
> =C2=A0include conf/distro/include/default-providers.inc
> =C2=A0include conf/distro/include/default-versions.inc
> +include conf/distro/include/default-distrovars.inc
> =C2=A0include conf/distro/include/world-broken.inc
>
> =C2=A0TARGET_VENDOR ?=3D "-oecore"
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> new file mode 100644
> index 0000000..ab26a30
> --- /dev/null
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -0,0 +1,43 @@
> +QA_LOGFILE =3D "${TMPDIR}/qa.log"
> +
> +IMAGE_ROOTFS_SIZE_ext2 ?=3D "131072"
> +
> +OEINCLUDELOGS ?=3D "yes"
> +KERNEL_CONSOLE ?=3D "ttyS0"
> +
> +require conf/distro/include/preferred-xorg-versions.inc
> +
> +PCMCIA_MANAGER ?=3D "pcmciautils"
> +
> +IMAGE_LINGUAS ?=3D "en-us en-gb"
> +LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
> +ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
> +LOCALE_UTF8_ONLY ?=3D "0"
> +
> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhost =
wifi nfs zeroconf pci"
> +
> +DISTRO_EXTRA_RDEPENDS +=3D "task-core-boot"
> +DISTRO_EXTRA_RRECOMMENDS +=3D "kernel-module-af-packet"
> +


others can be overridden but the above two are a problem. they are forcing
distros to have these in RDEPENDS and RRECOMMENDS e.g. a distro
which does not want kernel-module-af-packet will have to have some way
to remove it. My opinion is do not add them to policy

-Khem


