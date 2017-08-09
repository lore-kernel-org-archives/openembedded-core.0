Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0B071DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 19:09:35 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id m85so3669440wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 12:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oiH7V/BAR3K3EjXoRg73pzg384ftQEYhi7nXOCjCo4w=;
	b=nChl/varoa/YsWQZKfZbtF+P+hiZKuG3CO8xePneY3nvJyj59KGonPWFcx7IcKAnDH
	Cmnz15tyyrSgURxSwDjFDHFyaJ/byIopFuIU1IkTi8Fwf0yKsz8Ku4yRtH/gsL/pKbzs
	EE1r65IJlwD5Hy9llorZFxssqWKiT0cmiIf5/P3TdUEFoP3BlYn9IGMJrcFoO4lgv6FH
	qBfa4/5Y0nfGZQ/ERfgyid/9GPS8m9bA7gfINipNyjp6G2++9DbzJ1xIVgTg6DHGCXxX
	QdMyTWou7ERio2zJKc609JUa+MqSgVohOt0Yy7nJ9UhdDn5zdfIqDg9doSv1eYdkgEU7
	QpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oiH7V/BAR3K3EjXoRg73pzg384ftQEYhi7nXOCjCo4w=;
	b=MJQp7fB25aOok7jrUFTQEzgfyBFA2biOn051uz9HLji2/7DX1YZGLptVzyBWXDsa1c
	UKCfY8qVvC0ziv3uXYD+yXTA08EcShMRTN7FsUrY1dLI1NtLHnEU62YB2t12sEkoh2aF
	V8BhmXlpDQJ8gx/U8rzPUMzte3J6n48eMDq0e9YzxZWvW9C616lTvTio4z9sMUltahDD
	7+Z5JTqZcwRMBGPHLWh9qBz9tqL9YOkI95hFpZIzSHUMbcD5ALqj1xH5N+z926nAleMP
	mp4Bb9MZ3N9PqxqFF4C0LyCB37tPMNNPX+U5BeYvgj3QlSQuS/hN4vv9CDYa4KqISJHd
	6HZg==
X-Gm-Message-State: AHYfb5i2E6hU79UHqWWjSRogjoa/o/Veb4zQtIUoDToiIHPx9WNGn80N
	z5FypOLKp2m8WH/YNtEln7hZOhcSww==
X-Received: by 10.28.21.72 with SMTP id 69mr5513830wmv.75.1502305776223; Wed,
	09 Aug 2017 12:09:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 9 Aug 2017 12:09:35 -0700 (PDT)
In-Reply-To: <1502300913-40295-12-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-12-git-send-email-juro.bystricky@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 Aug 2017 12:09:35 -0700
Message-ID: <CAJ86T=VcCoshvFmm9ACcKo8gD=hNzCHHS52DrVg6OvuO8ZEN0g@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 11/11] poky-reproducible.conf: Initial version
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
X-List-Received-Date: Wed, 09 Aug 2017 19:09:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 10:48 AM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> Simplify building reproducible images by using
>
> DISTRO="poky-reproducible"
>
> Sets some variables to reasonable values so users do not
> have to set them in local.conf.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta-poky/conf/distro/include/reproducible-group  | 50 +++++++++++++++++++++++
>  meta-poky/conf/distro/include/reproducible-passwd | 25 ++++++++++++
>  meta-poky/conf/distro/poky-reproducible.conf      | 38 +++++++++++++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 meta-poky/conf/distro/include/reproducible-group
>  create mode 100644 meta-poky/conf/distro/include/reproducible-passwd
>  create mode 100644 meta-poky/conf/distro/poky-reproducible.conf
>
> diff --git a/meta-poky/conf/distro/include/reproducible-group b/meta-poky/conf/distro/include/reproducible-group
> new file mode 100644
> index 0000000..4213d4e
> --- /dev/null
> +++ b/meta-poky/conf/distro/include/reproducible-group
> @@ -0,0 +1,50 @@
> +root:x:0:
> +daemon:x:1:
> +bin:x:2:
> +sys:x:3:
> +adm:x:4:
> +tty:x:5:
> +disk:x:6:
> +lp:x:7:
> +mail:x:8:
> +news:x:9:
> +uucp:x:10:
> +man:x:12:
> +proxy:x:13:
> +kmem:x:15:
> +input:x:19:
> +dialout:x:20:
> +fax:x:21:
> +voice:x:22:
> +cdrom:x:24:
> +floppy:x:25:
> +tape:x:26:
> +sudo:x:27:
> +audio:x:29:pulse
> +dip:x:30:
> +www-data:x:33:
> +backup:x:34:
> +operator:x:37:
> +list:x:38:
> +irc:x:39:
> +src:x:40:
> +gnats:x:41:
> +shadow:x:42:
> +utmp:x:43:
> +video:x:44:
> +sasl:x:45:
> +plugdev:x:46:
> +staff:x:50:
> +games:x:60:
> +shutdown:x:70:
> +users:x:100:
> +crontab:x:993:
> +sshd:x:994:
> +avahi:x:995:
> +rpcuser:x:996:
> +rpc:x:997:
> +messagebus:x:998:
> +netdev:x:999:
> +tracing:x:1000:
> +pulse:x:1001:pulse
> +nogroup:x:65534:
> diff --git a/meta-poky/conf/distro/include/reproducible-passwd b/meta-poky/conf/distro/include/reproducible-passwd
> new file mode 100644
> index 0000000..876195e
> --- /dev/null
> +++ b/meta-poky/conf/distro/include/reproducible-passwd
> @@ -0,0 +1,25 @@
> +root:x:0:0:root:/home/root:/bin/sh
> +daemon:x:1:1:daemon:/usr/sbin:/bin/sh
> +bin:x:2:2:bin:/bin:/bin/sh
> +sys:x:3:3:sys:/dev:/bin/sh
> +sync:x:4:65534:sync:/bin:/bin/sync
> +games:x:5:60:games:/usr/games:/bin/sh
> +man:x:6:12:man:/var/cache/man:/bin/sh
> +lp:x:7:7:lp:/var/spool/lpd:/bin/sh
> +mail:x:8:8:mail:/var/mail:/bin/sh
> +news:x:9:9:news:/var/spool/news:/bin/sh
> +uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
> +proxy:x:13:13:proxy:/bin:/bin/sh
> +www-data:x:33:33:www-data:/var/www:/bin/sh
> +backup:x:34:34:backup:/var/backups:/bin/sh
> +list:x:38:38:Mailing List Manager:/var/list:/bin/sh
> +irc:x:39:39:ircd:/var/run/ircd:/bin/sh
> +gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
> +pulse:x:993:1001::/var/run/pulse:/bin/false
> +distcc:x:994:65534::/dev/null:/bin/sh
> +sshd:x:995:994::/var/run/sshd:/bin/false
> +avahi:x:996:995::/var/run/avahi-daemon:/bin/false
> +rpcuser:x:997:996::/var/lib/nfs:/bin/false
> +rpc:x:998:997::/:/bin/false
> +messagebus:x:999:998::/var/lib/dbus:/bin/false
> +nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
> diff --git a/meta-poky/conf/distro/poky-reproducible.conf b/meta-poky/conf/distro/poky-reproducible.conf
> new file mode 100644
> index 0000000..c94f673
> --- /dev/null
> +++ b/meta-poky/conf/distro/poky-reproducible.conf
> @@ -0,0 +1,38 @@
> +require conf/distro/poky.conf
> +DISTRO = "poky-reproducible"
> +
> +BUILD_REPRODUCIBLE_BINARIES = "1"
> +REPRODUCIBLE_TIMESTAMP_ROOTFS ?= "1483228802"
> +LDCONFIGDEPEND = ""

Perhaps this should be disabling the ldconfig distro feature instead?

(Which implies the value of LDCONFIGDEPEND set in image.bbclass should
be updated to be conditional on the ldconfig distro feature too).

> +do_image_cpio[depends] += "cpio-replacement-native:do_populate_sysroot"
> +EXTRANATIVEPATH += "cpio-native"
> +IMAGE_CMD_CPIO = "cpio --ignore-devno --reproducible "
> +
> +IMAGE_CMD_TAR = "tar -v --sort=name "
> +
> +PACKAGE_CLASSES ="package_deb"
> +
> +# For reproducibility, we need to consistently assign the UID/GID values.
> +# Use the static uid and gid mechanism from OE-core for that:
> +# http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#ref-classes-useradd
> +#
> +# Dynamically assigned IDs are detected and lead to an error during
> +# the build.
> +#
> +# Developers who need to add new entries should add their own mapping
> +# file to USERADD_UID_TABLES and/or USERADD_GID_TABLES, either in a
> +# derived distro config or in their local.conf.
> +#
> +# It is also possible to disable the mechanism by modifying USERADD_ERROR_DYNAMIC:
> +# "warn" merely prints a warning, empty value silently allows dynamic
> +# ID allocation.
> +#
> +# The actual files for UID/GID values come from core-image-minimal-sdk
> +# /etc/group
> +# /etc/passwd
> +
> +USERADDEXTENSION = "useradd-staticids"
> +USERADD_ERROR_DYNAMIC ??= "error"
> +USERADD_UID_TABLES += "conf/distro/include/reproducible-passwd"
> +USERADD_GID_TABLES += "conf/distro/include/reproducible-group"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

