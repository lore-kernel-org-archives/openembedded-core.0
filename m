Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWtso-0002J5-20
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 19:00:18 +0100
Received: by lagj5 with SMTP id j5so1679236lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Dec 2011 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=GaVIaZHDDjyX/RdMxeG/BEvHWuWkVxmCIlIU4fu8jdI=;
	b=mnPxcxkP80QsKC6836fMnxCjtq0ADdXWRDCMkL5jJHo2ebqPd2n95uU+OZzbmhS0oX
	8hEoAW9uNEgZVfv/ljN5vSMC/jhinWNOTfY1WrrUFpfjQR55pQnKJKvfyMjUqrCscIUT
	mjs9e+9AZU5DzQCLTKeWymznzQuobCD1G4jUc=
Received: by 10.152.105.67 with SMTP id gk3mr1909803lab.48.1322934811437; Sat,
	03 Dec 2011 09:53:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 3 Dec 2011 09:53:00 -0800 (PST)
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
	<a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Dec 2011 09:53:00 -0800
Message-ID: <CAMKF1spYoZgjmUDiiLnRL_8E6WBFxr8gyMi7zmPPvzLwke36vg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: hjl.tools@gmail.com
Subject: Re: [PATCH 01/11] gst-fluendo-mpegdemux: rework the CC hack
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
X-List-Received-Date: Sat, 03 Dec 2011 18:00:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2011 at 12:19 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This fixes bug: [YOCTO #1403]
>
> Earlier hack was breaking compiler parameters set by tune settings. And t=
hat caused x32
> build failure. Now previous CC parameters are kept intact while adding ne=
w -L parameter.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0meta/recipes-multimedia/gstreamer/gst-fluendo.inc | =C2=A0 =C2=A02 =
+-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/rec=
ipes-multimedia/gstreamer/gst-fluendo.inc
> index 203bdba..9615454 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> @@ -14,5 +14,5 @@ FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.la ${l=
ibdir}/gstreamer-0.10/*.a"
> =C2=A0EXTRA_OECONF =3D "--disable-debug --disable-valgrind"
>
> =C2=A0# Hack to get STAGING_LIBDIR into the linker path when building
> -CC =3D "${CCACHE} ${HOST_PREFIX}gcc -L${STAGING_LIBDIR}"
> +CC +=3D "-L${STAGING_LIBDIR}"

This looks like part of LDFLAGS more than CC to me.


