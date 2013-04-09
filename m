Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UPc01-0002pv-1r
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:06:27 +0200
Received: by mail-ve0-f171.google.com with SMTP id b10so6555573vea.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=XPDuoUHcAs0py3ph8XZ9SAjnzoHeSLqZ3eaCOYMa+cM=;
	b=KzjYbUNtdMs1Yb4XLeBfTt8rYs9zZSwTdlhDzIXM5xBaxLI4PXY/SkjRnTeRkfQayN
	wiNfFyOQW15chppxIJTR9rp2VT8C+kVDKZIvDIMyHuxIc/U24xjgRsu8AnlydbRQ1eP5
	lyt+jmEL8aMpCPZDn2sJ76WjJqvaMg2ucKGZNGKl452/HAPXNO7dFtTf5iL9yj41WeSq
	SFMT1kZsMoygyMo/8Dg0A0PU1l1NDi6fLfatBVdle/6TMih8n91yJPbw8HBQbfOSsw/7
	9HfwRrEY2tKnJ7r/Dv6/0vLKNb+6exn4m2S58uAE3EK00jrQxx4gJzLtPaWmTJXJDKjF
	KfUA==
MIME-Version: 1.0
X-Received: by 10.52.34.168 with SMTP id a8mr144383vdj.75.1365526142724; Tue,
	09 Apr 2013 09:49:02 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Tue, 9 Apr 2013 09:49:02 -0700 (PDT)
In-Reply-To: <1365517194-30916-1-git-send-email-m.cavallini@koansoftware.com>
References: <1365517194-30916-1-git-send-email-m.cavallini@koansoftware.com>
Date: Tue, 9 Apr 2013 18:49:02 +0200
Message-ID: <CALbNGRQ0y3+eMKJESmwo0LnwihNZ_H8NViE1BSr+9igjonJ3XQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Marco Cavallini <koansoftware@gmail.com>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH 1/4] xinput-calibrator: calibrate touch screen with xorg
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
X-List-Received-Date: Tue, 09 Apr 2013 17:06:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 9, 2013 at 4:19 PM, Marco Cavallini <koansoftware@gmail.com> wrote:
>  * Taken from oe-classic
>  * This patch includes pointercal-xinput
>
> Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
> ---
>  .../pointercal-xinput/pointercal.xinput            |  1 +
>  .../xinput-calibrator/pointercal-xinput_0.0.bb     | 19 +++++++++++++
>  .../xinput-calibrator/xinput-calibrator_git.bb     | 31 ++++++++++++++++++++++
>  3 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
> new file mode 100644
> index 0000000..9633fc5
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
> @@ -0,0 +1 @@
> +# replace with valid machine specific pointercal.xinput
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> new file mode 100644
> index 0000000..9b68d54
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PR = "r4"
> +
> +SRC_URI = "file://pointercal.xinput"
> +S = "${WORKDIR}"
> +
> +do_install() {
> +       # Only install file if it has a contents
> +       if [ -s ${S}/pointercal.xinput ]; then
> +               install -d ${D}${sysconfdir}/
> +               install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
> +       fi
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> new file mode 100644
> index 0000000..97f9343
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "A generic touchscreen calibration program for X.Org"
> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
> +DEPENDS = "virtual/libx11 libxi"
> +
> +PV = "0.7.5+git${SRCPV}"
> +PR = "r1"
> +
> +inherit autotools
> +
> +SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
> +SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +# force native X11 ui as we don't have gtk+ in DEPENDS
> +EXTRA_OECONF += "--with-gui=x11"
> +
> +do_install_append() {
> +        install -d ${D}${bindir}
> +        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
> +
> +        install -d ${D}${sysconfdir}/xdg/autostart
> +        sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
> +        install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
> +}
> +
> +FILES_${PN} += "${sysconfdir}/xdg/autostart"
> +RDEPENDS_${PN} = "xinput xterm"
> +RRECOMMENDS_${PN} = "pointercal-xinput"
> --
> 1.8.2.1
>
1. Is this a 'core' component?
2. If so: Why not importing from meta-oe there were several
enhancements (mainline) meanwhile?
3. I am again(still) working on this ( systemd/udev plug & play ). It
would make my life easier if we wait with this migration

Andreas


