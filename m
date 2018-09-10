Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3FB7979C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 15:48:56 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id g197-v6so14677436qke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 08:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V/vPgUWlPXFVwFERPpZVKIUKaD0vYdpaaPkNYlFDE+4=;
	b=KcHtqGCXogz/+mCW7C7APWUaJ5SkxbIzvlHWVq4PVERGtVA2j60wAKqDWAxtpzO11O
	t9cI3buANDsuS+IfwQSAdHM6QYQJzw2UJxaGiszo9SIfuZtOpEpF8KednpxHMQ9PWQcC
	1uoRNBg4V4JLv9ycVmiqeI0Bin48Xi9fcCw60FPxvlYPrd2Rt+dF/ByGiCqQTxkTlV/t
	4wLW8G7oy7VgUwerGEEw5NezVDjCOWDwCOd+Ymt4Bm2ihUVi9DkE4ew6G5Khxymq4OBa
	nwEuCVH6N0rayuC6Uhp6pcSVI1jSdwRg1PddzH6kDdgckkIFUthI7KNsuuJ+KTYujwkA
	dpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V/vPgUWlPXFVwFERPpZVKIUKaD0vYdpaaPkNYlFDE+4=;
	b=Gx0XvUuQRgdOnmjmIRPTaBAGBkEODlqp0YcEyGPZ1sX7o9jzriWy/jwGUI7jdbG1dx
	JXOaIKG7ayhoKS7d0s7Cle9f7IAcZ6TSCw7v7SdH5nBdJyJCOE0L2wBvzstQ9L6XMD0D
	180gHCjsc9Bidl5p9LOvnZMlJ/hi2MzbXcQy9RBZbCqS4ADcWHS3mvquSNzMV0HC+F9m
	mpLs9krd15voxo8RVatpufDzNig+5oSeNVyIgQiEbSvaUxdnPjhWpJ8Lo0JTxhisho/+
	k8/XbsbpjLOPa0Rl31w7fNR3Hep7MrGTkpqEtex4bzSnyBsIbOdibp8/NkB/DD2u21a6
	oV6Q==
X-Gm-Message-State: APzg51Cif/tlJjD92Bp0VqwfywUCeqRfUaCtjpOjaL3HS7HvrFHaf9I+
	8b1MvVWuO9ND+JZ1coj81UXvlQnlPIQzH87qoZc=
X-Google-Smtp-Source: ANB0VdYVZEFLnoZFm3H0/fhi6LoL1mvSqKj8JIBNCuk+cL7IKfCKHbwB+WkRiFzIbs7hW5jtLQNueaF73jY6Xp/z+IQ=
X-Received: by 2002:a37:c5d2:: with SMTP id
	k79-v6mr15840296qkl.206.1536594537203; 
	Mon, 10 Sep 2018 08:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180910151449.9133-1-baptiste.durand@gmail.com>
In-Reply-To: <20180910151449.9133-1-baptiste.durand@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 08:48:30 -0700
Message-ID: <CAMKF1srQ94o==a-i2mYWaH2-CELJ2gbVVxC=ZbVTrwqqrKvYZw@mail.gmail.com>
To: Baptiste Durand <baptiste.durand@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] minidlna: restore & fix recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 15:48:56 -0000
Content-Type: text/plain; charset="UTF-8"

this should be in meta-multmedia layer.
On Mon, Sep 10, 2018 at 8:15 AM Baptiste Durand
<baptiste.durand@gmail.com> wrote:
>
> Restore minidlna recipe and bump it to v1.2.1
>
> Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
> ---
>  .../recipes-multimedia/minidlna/minidlna.inc  | 41 +++++++++++++++++++
>  .../0001-Update-Gettext-version.patch         | 34 +++++++++++++++
>  .../minidlna/minidlna_1.2.1.bb                |  4 ++
>  3 files changed, 79 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
>
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> new file mode 100644
> index 000000000..187ff536a
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> @@ -0,0 +1,41 @@
> +DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
> +being fully compliant with DLNA/UPnP-AV clients."
> +LICENSE = "GPL-2.0|BSD"
> +DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag libvorbis"
> +
> +# because it depends on libav which has commercial flag
> +LICENSE_FLAGS = "commercial"
> +
> +inherit gettext autotools-brokensep update-rc.d systemd
> +
> +SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
> +           file://minidlna-daemon.init.d \
> +           file://minidlna.service \
> +           file://0001-Update-Gettext-version.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +# This remove "--exclude=autopoint" option from autoreconf argument to avoid
> +# configure.ac:30: error: required file './ABOUT-NLS' not found
> +EXTRA_AUTORECONF = ""
> +
> +do_install_append(){
> +    install -d ${D}${sysconfdir}
> +    install -m 0755 minidlna.conf ${D}${sysconfdir}
> +
> +# Systemd script
> +    install -d ${D}${nonarch_base_libdir}/systemd/system
> +    install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
> +
> +# Sysvinit script
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
> +
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "minidlna.service"
> +
> +INITSCRIPT_NAME = "minidlna"
> +INITSCRIPT_PARAMS = "defaults 90"
> +
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
> new file mode 100644
> index 000000000..c18095d42
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
> @@ -0,0 +1,34 @@
> +From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 2001
> +From: Baptiste Durand <baptiste.durand@gmail.com>
> +Date: Sun, 9 Sep 2018 20:50:41 +0200
> +Subject: [PATCH] Update Gettext version
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index f343d21..a556b33 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -14,7 +14,7 @@
> + # License along with MiniDLNA; if not, write to the Free Software
> + # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> + # USA.
> +-AC_INIT(MiniDLNA,1.1.3,,minidlna)
> ++AC_INIT(MiniDLNA,1.2.1,,minidlna)
> + #LT_INIT
> +
> + AC_CANONICAL_TARGET
> +@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [AC_USE_SYSTEM_EXTENSIONS])
> +
> + AM_ICONV
> + AM_GNU_GETTEXT([external])
> +-AM_GNU_GETTEXT_VERSION(0.18)
> ++AM_GNU_GETTEXT_VERSION(0.19)
> +
> + # Checks for programs.
> + AC_PROG_AWK
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
> new file mode 100644
> index 000000000..fe6bebce2
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
> @@ -0,0 +1,4 @@
> +require ${BPN}.inc
> +
> +SRCREV = "v1_2_1"
> +LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

