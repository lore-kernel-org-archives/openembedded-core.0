Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGVf9-0001vI-8s
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:58:59 +0200
Received: by eaac1 with SMTP id c1so519555eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DgoLSFXC3ES5EMbDaUAXKPopp6FNJSbrWfKRfpFfDNc=;
	b=fvPAGnPQgAN/fVRqxObCTv+O07f9+BpjgR2hOh5MiK41DqxbKufPIdQSNyoItREUMB
	NAPCuR2bRwQ3dna2nsaI4ezW2kD+09Tu1XciaxIl9/TnqA9v0qzY7KzOne3xyaNzcfY4
	QAUa5CO9tSW91lkM8tLun9rB39mMjvLgshWxuEu9sOrVirJfbPOHWvm/l3NlvG/eL0wZ
	HmZl2rEtxLqrEn4ebRRUfJKaykBfPyxrCSSH6hIpI6eRkm4UcdWovHBWQRxnx46TSO0a
	h/3wy6+6htRxSDNhYwRWplZMng6H2eKuxYF+vz6ZdftgCZBoqqB+k8Z8Scz4HPfWiBcE
	N4qg==
Received: by 10.14.173.131 with SMTP id v3mr20024381eel.15.1348580770306; Tue,
	25 Sep 2012 06:46:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Tue, 25 Sep 2012 06:45:40 -0700 (PDT)
In-Reply-To: <1348578243.31293.72.camel@phil-desktop>
References: <1348578243.31293.72.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Sep 2012 06:45:40 -0700
Message-ID: <CAMKF1sr0-rT+ehVcyo5ucVND95h9Zf-q=4oH5kSatyst7Vn0HQ@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Don't package chkdupexe
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
X-List-Received-Date: Tue, 25 Sep 2012 13:58:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 25, 2012 at 6:04 AM, Phil Blundell <philb@gnu.org> wrote:
> The chkdupexe utility is fairly worthless and drags perl in as a build dependency
> of the whole util-linux recipe.  If anybody actually wants to use this script
> then we should package it separately, but for the time being let's just delete it.

yeah and I have 2.22 recipes where its not even built.

>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-core/util-linux/util-linux.inc       |    6 +++---
>  meta/recipes-core/util-linux/util-linux_2.21.2.bb |    6 +-----
>  2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index b2a1552..d62d406 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -31,7 +31,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>               util-linux-mount util-linux-readprofile util-linux-libblkid \
>               util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
>               util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
> -             util-linux-chkdupexe util-linux-mkfs util-linux-mcookie"
> +             util-linux-mkfs util-linux-mcookie"
>
>  EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>                  --disable-makeinstall-chown --enable-elvtune --enable-init \
> @@ -63,7 +63,6 @@ FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid
>  FILES_util-linux-lscpu = "${bindir}/lscpu"
>
>  FILES_util-linux-fsck = "${base_sbindir}/fsck*"
> -FILES_util-linux-chkdupexe = "${bindir}/chkdupexe"
>  FILES_util-linux-mkfs = "${sbindir}/mkfs"
>
>  # Util-linux' blkid replaces the e2fsprogs one
> @@ -72,7 +71,6 @@ RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
>  RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
>
>  RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
> -RDEPENDS_${PN}-chkdupexe = "perl"
>  RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
>
>  RRECOMMENDS_${PN}_virtclass-native = ""
> @@ -125,6 +123,8 @@ do_install () {
>
>         ln -sf swapon.${BPN}   ${D}${base_sbindir}/swapoff.${BPN}
>         rm -f ${D}${sbindir}/swapoff
> +
> +       rm -f ${D}${bindir}/chkdupexe
>  }
>
>  inherit update-alternatives
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> index 792730c..39e3609 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION = "2.21"
> -PR = "r4"
> +PR = "r5"
>  require util-linux.inc
>
>  # note that `lscpu' is under GPLv3+
> @@ -40,7 +40,3 @@ addtask remove_lscpu before do_configure after do_patch
>
>  CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>  EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
> -
> -do_install_append () {
> -       sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/chkdupexe
> -}
> --
> 1.7.10.4
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


