Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAanT-0004rO-Mn
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 08:15:07 +0200
Received: by eekb57 with SMTP id b57so423697eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Sep 2012 23:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cH5J4yoaDmlDl3YqmPq2yw4DSCuq8/eSqrSud3DZ/Ps=;
	b=0qRL8F31Ce2aeDtaD6m6/j/P7O+Fg+N5pSK8NXjw3U2/IWL/ZuJrdo9C4NBRBctAki
	NpSkOhlXHTyvu7PwqekC9akLs6kjzu+yspcGCzsR7vJSBAeDYsmDE/yAS9pxFrQZ+A9R
	5Cl7nmGe7gul+YkCnT33gh9Tp07tJ80IuBjAylvWGb1JdrFOR8yfC/hCgoTZT6d6Yn3N
	pjeK9xGSHByDdXs5AcqkX8kdZegrx+sDvYd1gxPEZ5nWyq+zpVDD0xVw26Z1mug9QtLi
	pDjoFxVCz7g8q0iGihSBAZ4VcgyvSyDPsOPH7q/Uv7BO6QRg4hsZMJ/ZxeCBkptHc+Td
	9Hsg==
Received: by 10.14.211.3 with SMTP id v3mr14178052eeo.43.1347170559830; Sat,
	08 Sep 2012 23:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sat, 8 Sep 2012 23:02:09 -0700 (PDT)
In-Reply-To: <cover.1346905978.git.raj.khem@gmail.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Sep 2012 23:02:09 -0700
Message-ID: <CAMKF1sph_p+VPXoMVppnB5Z7o_ZmCm-mxZA_AEhhAOOtVP=C8A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] GCC fixes and updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Sep 2012 06:15:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 5, 2012 at 9:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This patchset switches us back to using svn for SRC_URI
> and fixes building for armv4 and ppc soft float targets
> Finally fixes for libgcc to build with new build sequence
> such that its same with gcc-cross and gcc-cross-initial
>

I have pushed update to this patchset

1. Add upstream status to new patches
2. Replace the ppc Os hack patch with upstream back port


> The following changes since commit 610f8c0c0cab8e258919689fd641faec28b58caf:
>
>   adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:27:31 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-updates
>
> Khem Raj (4):
>   gcc: Switch SRC_URI to use svn
>   gcc-4.7: Fix build for armv4/EABI and ppc/Os
>   arch-armv4.inc: On armv4 add --fix-v4bx to linker flags for kernel
>   gcc-4.7: Backport libgcc fixes to appease the new build sequence
>
>  meta/conf/machine/include/arm/arch-armv4.inc       |    1 +
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |   14 +--
>  ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 ++++++++++++++++++++
>  ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 +++++++++++
>  .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   29 ++++++
>  .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   21 +++++
>  6 files changed, 202 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
>
> --
> 1.7.9.5
>


