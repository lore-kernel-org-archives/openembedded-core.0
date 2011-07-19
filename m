Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QiyYW-0002pJ-Iv
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:54:26 +0200
Received: by pvf24 with SMTP id 24so3427596pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ekiw3JEUIVq/gxezVGvD0gvVsVTLxcbAFLTrSyMdhI8=;
	b=ZC0qs0bGev6yIG1C9FCgEfYR51B8fKgD8KCHwE9BVHcRQRRzGjrKr0SeyYZAw/ErvL
	S6vr9MBANRyhKso9GYdfPsMuWSRVwAytUMDLtiBcU2jHk5K8sMLhvZtOOP5NEBHbOovy
	aspQBm2ecnbbe2Oty1fpi2nIGvKRGXLdMDpDA=
Received: by 10.68.28.1 with SMTP id x1mr8058173pbg.77.1311036461052; Mon, 18
	Jul 2011 17:47:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Mon, 18 Jul 2011 17:47:11 -0700 (PDT)
In-Reply-To: <aeaf3f15ab9f47906c77fa591982c0e35510507a.1311035762.git.dongxiao.xu@intel.com>
References: <cover.1311035762.git.dongxiao.xu@intel.com>
	<aeaf3f15ab9f47906c77fa591982c0e35510507a.1311035762.git.dongxiao.xu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jul 2011 17:47:11 -0700
Message-ID: <CAMKF1soE1bcoCseq-dDyh1sSqpwBa+6e1113_Or2Z2Xhp1U9oA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] alsa-tools: Fix recipe build error.
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
X-List-Received-Date: Tue, 19 Jul 2011 00:54:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2011 at 5:37 PM, Dongxiao Xu <dongxiao.xu@intel.com> wrote:
> Remove some elements in alsa-tools to avoid build error and further
> dependency on new recipes.
>
> [YOCTO #1038]
>
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
> =C2=A0.../alsa/alsa-tools-1.0.24.1/autotools.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 34 ++++++++++++++++++++
> =C2=A0.../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb | =C2=A0 =C2=A07=
 +++-
> =C2=A02 files changed, 39 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1=
/autotools.patch
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.p=
atch b/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
> new file mode 100644
> index 0000000..c7bc2d6
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
> @@ -0,0 +1,34 @@
> +Add parameters to autoreconf to support cross compile.
> +Remove some sub-components which needs further recipe support.
> +
> +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.=
1/ld10k1/gitcompile
> +--- alsa-tools-1.0.24.1-orig//ld10k1/gitcompile =C2=A0 =C2=A0 =C2=A0 =C2=
=A02011-07-06 11:27:40.227665002 +0800
> ++++ alsa-tools-1.0.24.1/ld10k1/gitcompile =C2=A0 =C2=A0 =C2=A02011-07-14=
 13:26:18.017665004 +0800
> +@@ -1,6 +1,6 @@
> + #!/bin/bash
> +
> +-autoreconf -fi || exit 1
> ++autoreconf $ACLOCAL_FLAGS -fi || exit 1
> + export CFLAGS=3D'-O2 -Wall -pipe -g'
> + echo "CFLAGS=3D$CFLAGS"
> + echo "./configure $@"
> +diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefil=
e
> +--- alsa-tools-1.0.24.1-orig//Makefile 2011-07-06 11:27:40.207665000 +08=
00
> ++++ alsa-tools-1.0.24.1/Makefile =C2=A0 =C2=A0 =C2=A0 2011-07-14 15:08:0=
8.877665009 +0800
> +@@ -1,9 +1,8 @@
> + VERSION =3D 1.0.24.1
> + TOP =3D .
> +-SUBDIRS =3D ac3dec as10k1 envy24control hdsploader hdspconf hdspmixer \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0mixartloader pcxhrloader rmedigicontrol sb1=
6_csp seq sscape_ctl \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0us428control usx2yloader vxloader echomixer=
 ld10k1 qlo10k1 \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmixvolume
> ++SUBDIRS =3D ac3dec as10k1 hdsploader mixartloader pcxhrloader sb16_csp =
\
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq sscape_ctl us428control usx2yloa=
der vxloader ld10k1 \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmixvolume

does --disable-envy24control etc. work ?


