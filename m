Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 989C67970E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Sep 2018 22:43:11 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j7-v6so22202636qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Sep 2018 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VsrCaYv9qyPRd8Pc2gkW8E67O2iP6ot5mKXgbd6RvEo=;
	b=vOKJOwIZFZDrS9yBikqSLgWPTRMk00DlLLODZS0J6VDpPlH03aih3blwK/6BDbCmJx
	FMXSRApntdXi+20Nkum3+NvGiuFcEL1WzbYTn7dJbdV/bvCGN7oK3fk0aq7mnkXJy8z5
	dwAe50IzaqryI7iOTvpXHxU9YVdGClAcXdyAhff+A8AXmv198zM3h7OmBPshXKl6J50J
	Fb9rG5idtQOi3ul9xOadnTLxCSs2LqD6uBPlarBM7SmEEw00TOujHeyghr4s6wsNJFmK
	odMr1FHrDuvsHpG51Dk21ZjfsTyxTVDCS16M8pKo0Vz0PQK0LtcqwjhhguG/A1tzsbJJ
	YyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VsrCaYv9qyPRd8Pc2gkW8E67O2iP6ot5mKXgbd6RvEo=;
	b=HdwdDzbTUFOxvquxOa1Xzgfu/z58gWDWmSNnIZ7enih7Sw0RbJVp7M6qdBj/N1rGgr
	AAiIPzEpLk+67E6PnDDN7eY0nqT4qaTkyaqbCkikhA9ovYPz/TVr2ujVfVJ3Ipv0itMP
	3swlanLww6LQVOGyBD1RwgvscdH7fC3tq6IeHsxCHKrysY837Ye2mJRWxQnOyUP5c6iJ
	w5Ks9IUJCinNVBXJhBQxrccPJJEaELtULxVnBIgIPEcPfHE+aEcjo75JoNO9vgXrkd9+
	cst9fxJdy0anXVOasxOMFL0C8LDVMZZiwRPXmh7k2x+leeQsCwU9ULAq0bcu1jgCd9Y3
	7tFA==
X-Gm-Message-State: APzg51CcSlIyg8vch6aQ8m3MlS1onJQeU/wcXljMbvTg5qmfyzPAFB6Y
	/TYmjkhR1A4SqJAcC9Mkvbq16iAshKX6i2vzhco=
X-Google-Smtp-Source: ANB0VdbudAkbfCUg85zBlKDGIkQLdoRIR7qKz0kyqDgZtxL3Fe45KY1+0XtnxVna/mkAN+7+gVbaprj370vTK4HeQ/A=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr12912421qvo.50.1536532992122; 
	Sun, 09 Sep 2018 15:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180909191114.32349-1-baptiste.durand@gmail.com>
In-Reply-To: <20180909191114.32349-1-baptiste.durand@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2018 15:42:45 -0700
Message-ID: <CAMKF1sr5YaC5-cwPd4THuoSc1XdsQ7Sp9eRLo=y2rOpGXmLvDA@mail.gmail.com>
To: baptiste.durand@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] minidlna: restore & fix recipe
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
X-List-Received-Date: Sun, 09 Sep 2018 22:43:11 -0000
Content-Type: text/plain; charset="UTF-8"

please send patch for meta-oe to oe-devel ml.
On Sun, Sep 9, 2018 at 12:12 PM Baptiste Durand
<baptiste.durand@gmail.com> wrote:
>
> Restore minidlna recipe and bump it to v1.2.1
>
> Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
> ---
>  .../recipes-multimedia/minidlna/minidlna.inc  | 41 +++++++++++++++++++
>  .../0001-Update-Gettext-version.patch         | 32 +++++++++++++++
>  .../minidlna/minidlna_1.2.1.bb                |  4 ++
>  3 files changed, 77 insertions(+)
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
> index 000000000..d6de9f164
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
> @@ -0,0 +1,32 @@
> +From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 2001
> +From: Baptiste Durand <baptiste.durand@gmail.com>
> +Date: Sun, 9 Sep 2018 20:50:41 +0200
> +Subject: [PATCH] Update Gettext version
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

