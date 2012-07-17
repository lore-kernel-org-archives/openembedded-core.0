Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Sr9L8-0008At-Dn
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 17:05:30 +0200
Received: by pbbrq2 with SMTP id rq2so817597pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=UGj9FWx+21ZNWB5bgDKsfsS5lh79/43i0Bx1a9+DhoI=;
	b=lusJAM3fMPVbGebq8quGByH2pKwMrTFSTZXZEcvDwpszvkyWC7CORg/PCFZr6k2IMB
	IosuoT82dR7b1fj//Vt3LtHUHwA8tZEkyYs13ceMSbAzZgEG1pvuyg7qji2Vgw892uks
	+tYnZol4X+IMM5HZvvF79NYkaUFV7AFxHN0zrriropQXYL90qnN05DCemBHySDevQ9Wo
	F+yDqWcYof+PEpYsVk+Y0uVRbLqRC8hZF4MnsvYI5+1f6HCT3ni0lNLFEM0Zu9UCNAuy
	nJAIZhwBGm8IKS3HifnLe7DTW8WsC5dlAwy4FNqtJoe8teQSCyJlMYjDjg5wFx0r7x3r
	0iwA==
MIME-Version: 1.0
Received: by 10.68.231.233 with SMTP id tj9mr7141069pbc.39.1342536848842; Tue,
	17 Jul 2012 07:54:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Tue, 17 Jul 2012 07:54:08 -0700 (PDT)
In-Reply-To: <1342519612-24566-1-git-send-email-alexandru.damian@intel.com>
References: <1342519612-24566-1-git-send-email-alexandru.damian@intel.com>
Date: Tue, 17 Jul 2012 11:54:08 -0300
X-Google-Sender-Auth: s-C3AlJM8uXdoOk4UYI1ZCCnUhM
Message-ID: <CAP9ODKp9SAh_pxXMSHuepBMJP5qFNJag60dakVaONVe0nQ_aog@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: upgrade to 182
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
X-List-Received-Date: Tue, 17 Jul 2012 15:05:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 17, 2012 at 7:06 AM, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This is the final upgrade of udev. Futher upgrades will only
> come in conjunction with systemd.

Nice!

>  .../initscripts/initscripts-1.0/volatiles          |    2 +-

You missed a PR bump in initscripts.

>  meta/recipes-core/udev/udev.inc                    |   13 +++--
>  ...yboard_force_release.sh-shell-script-path.patch |   30 ++++++++++++
>  meta/recipes-core/udev/udev/init                   |   14 +++---
>  meta/recipes-core/udev/udev/udev-166-v4l1-1.patch  |   50 --------------------
>  meta/recipes-core/udev/udev/udev-cache             |    2 +-
>  meta/recipes-core/udev/udev_164.bb                 |    8 ----
>  meta/recipes-core/udev/udev_182.bb                 |    9 ++++
>  8 files changed, 57 insertions(+), 71 deletions(-)
>  create mode 100644 meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
>  delete mode 100644 meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
>  delete mode 100644 meta/recipes-core/udev/udev_164.bb
>  create mode 100644 meta/recipes-core/udev/udev_182.bb
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index b2ae279..e0741aa 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -36,4 +36,4 @@ f root root 0664 /var/log/wtmp none
>  f root root 0664 /var/run/utmp none
>  l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>  f root root 0644 /var/run/resolv.conf none
> -
> +l root root 0755 /run /var/run
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index 3e72515..ebd760b 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -6,9 +6,10 @@ LICENSE = "GPLv2.0+ & LGPLv2.1+"
>  LICENSE_${PN} = "GPLv2.0+"
>  LICENSE_libudev = "LGPLv2.1+"
>  LICENSE_libgudev = "LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> -                    file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
> +                    file://src/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
> +
>
>  DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native"
>  RPROVIDES_${PN} = "hotplug"
> @@ -16,6 +17,7 @@ RRECOMMENDS_${PN} += "udev-extraconf usbutils-ids pciutils-ids"
>  RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
> +           file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
>             file://run.rules \
>             file://udev.rules \
>             file://devfs-udev.rules \
> @@ -32,7 +34,8 @@ inherit autotools pkgconfig update-rc.d
>
>  # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
>  sbindir = "${base_sbindir}"
> -libexecdir = "${base_libdir}/udev"
> +#adamian - now udev appends the /udev for itself
> +libexecdir = "${base_libdir}"

This comment might be dropped from the source code but added to the commit log.

> diff --git a/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> new file mode 100644
> index 0000000..cbd807f
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> @@ -0,0 +1,30 @@
> +From 0f8290c943da298abd269ca60fd8375dfb219971 Mon Sep 17 00:00:00 2001
> +From: Alexandru DAMIAN <alexandru.damian@intel.com>
> +Date: Thu, 12 Jul 2012 12:54:48 +0300
> +Subject: [PATCH] Fixing keyboard_force_release.sh shell script path
> +
> +With the introduction of rootprefix, the keyboard-force-release.sh.in
> +was modified to be executed with @rootprefix@/bin/sh, which is wrong
> +because @rootprefix@ defaults to /usr (which is correct), but the
> +shell is always at /bin/sh (IEEE Std 1003.2-1992).
> +
> +Therefore the interpreter for shell scripts needs to be /bin/sh at all times.
> +
> +Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>

Missing Upstream-Status header on the patch.


> -       /sbin/udevadm trigger --action=add
> -       /sbin/udevadm settle
> +       /usr/bin/udevadm trigger --action=add
> +       /usr/bin/udevadm settle
>  fi

This might cause problem for separated /usr partitions. Note that I
don't use this but Yocto seems to want to support it and thus this
needs to be adjusted.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


