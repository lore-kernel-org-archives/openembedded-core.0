Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYYdy-0005qC-Kg
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 08:43:50 +0100
Received: by lahd3 with SMTP id d3so566552lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 23:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=G+0vhK3bCglJRfPS8+Bkk8lLC/TvO/wyykQDHyb/cmc=;
	b=XKriqGHKiFdKVsCwwRCb/90t5lf9l4bFXxVMiIehaGAMwLYZfvPUUGdvkECGuoCJel
	D0ENNLtDY8gMW+CW2zmCSsEKO9CKAWV2xAfWMlzmWrKzsc57v0Ja3IG8+G95vCieOELS
	AmolFX6u45ce73XP5oaRLpqtG1YnIvojsxmQw=
Received: by 10.152.106.115 with SMTP id gt19mr1145757lab.27.1323329821300;
	Wed, 07 Dec 2011 23:37:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 7 Dec 2011 23:36:30 -0800 (PST)
In-Reply-To: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2011 23:36:30 -0800
Message-ID: <CAMKF1sre+EU+iSEY24+o9TNhrEpJpxq5iozVi=2oaFUBN+kxaw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: hjl.tools@gmail.com
Subject: Re: [PATCH 01/11] gst-fluendo.inc: remove unneccessary hack
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
X-List-Received-Date: Thu, 08 Dec 2011 07:43:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 9:48 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This fixes bug: [YOCTO #1403]
>
> the custom definition of CC was causing build isuses with x32 toolchain.
> And also I found out that the hack is not neccessary anymore. the
> affected gst-fluendo-mpegdemux recipe builds fine without the CC hack.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0meta/recipes-multimedia/gstreamer/gst-fluendo.inc | =C2=A0 =C2=A04 =
----
> =C2=A01 files changed, 0 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/rec=
ipes-multimedia/gstreamer/gst-fluendo.inc
> index 203bdba..8b24cf7 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> @@ -12,7 +12,3 @@ FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
> =C2=A0FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.la ${libdir}/gstre=
amer-0.10/*.a"
>
> =C2=A0EXTRA_OECONF =3D "--disable-debug --disable-valgrind"
> -
> -# Hack to get STAGING_LIBDIR into the linker path when building
> -CC =3D "${CCACHE} ${HOST_PREFIX}gcc -L${STAGING_LIBDIR}"
> -

this needs a PR bump


