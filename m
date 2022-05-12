Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557E2C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 07:46:11 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1577.1652341566945763548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 00:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oo1oDsb6;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id g6so8531412ejw.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZJ3Rqankrfq3nE8EUgFMNSTIKoseGD3S8Nf3uXohb4=;
        b=oo1oDsb61jSTdbPFlX/AVMqthNMSyi4fgAHZ9TInV7TCN6jj8oTM+VXs3kGvdR3ngr
         957KTvrOih/C2SVzcgcrFDZzpbK4Ecwg0QOri+hT8kPQWbBG++r0VnO5tDTYZU8SBqUf
         iyBbY8SECzM/G8XjcKWxMAwzBFqyrbdPmWMmnpqyW4d0Xh7CJLLxM3gB8HbjH/GoxqN/
         k4mALAujJEWNzm6kF5oA8dRe7QjUoI9hBAfpr/zBKqboqwEWWYs3mMIuvM7Ccdf13R54
         EaFC2bWMemf5F/qIDpIiZJGkKdmx9CeTEUlBu2GJR1SWuYLRLtuYsmX4dSXv3b0iT6m0
         P7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZJ3Rqankrfq3nE8EUgFMNSTIKoseGD3S8Nf3uXohb4=;
        b=Hoc+Z53o52tP1SUFBOR/ut/HijiupgewILyclpLQJU1zo0obdNkexbU+67KwCBtX1J
         1yAd89LrD29qSzpnrtFEj897pV2l+0bcZsBA/e7De/Zac75XI+2PcFwl8BkuJ256R2dz
         nP2jf+/qDelrea7rlWpkYniiDtYwr+7esgfun45neOZV6RCD3wvLgJUTQU5HaRw62Q3u
         rzny5JiUTS3ifTAGNiQx14cD/2nuP0uIGl/1pfZs65UrmltoToj1RF0UJeMqJYx1RDi7
         dOfmqNaiq9P5qX9h0cYuAsz/A7Hmw6Z0q9vRqQgTc1c3+zjMYom3EsUDXoxBNc0aJi+G
         JnyA==
X-Gm-Message-State: AOAM532/7ZdPEyhwnenZAjoc3sluQbAUqk9tybNdZr0kyQv8FsLn1FWJ
	MwTq2O5+euwiz1Ytz9w5y8VS2N+SYiAlZhuZEpo=
X-Google-Smtp-Source: 
 ABdhPJyUpS/J4Q4bKn7UtTEr0bFdUevAZTXoo9GiXCTREXyK0T8gO1YbdWlnNSv1xw6bdax6UsozLyzwaz6vnFuQJJo=
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr28121030ejc.610.1652341565076; Thu, 12
 May 2022 00:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220512054303.429208-1-changqing.li@windriver.com>
In-Reply-To: <20220512054303.429208-1-changqing.li@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 12 May 2022 08:45:52 +0100
Message-ID: 
 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 07:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165535

On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> dev in modules.devname should be populated in /dev on boot.
> remove create static mode from udevd will make these devices
> cannot be populated. When use sysVinit, devices like /dev/net/tun
> will not be created.
>
> more info:
> udevd in systemd also remove create static mode in udevd, but using
> service kmod-static-nodes.service and
> systemd-tmpfiles-setup-dev.service in systemd to create these node, so
> systemd works well.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++++
>  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
>  2 files changed, 116 insertions(+)
>  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
>
> diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> new file mode 100644
> index 0000000000..19611f4e89
> --- /dev/null
> +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> @@ -0,0 +1,115 @@
> +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 10 May 2022 14:04:35 +0800
> +Subject: [PATCH] eudev: create static nodes from modules
> +
> +Revert commit <src/udev/udevd.c: remove create static nodes from modules>
> +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Upstream intentionally remove create static nodes from modules, it is
> +expected handled by tmpfiles services, refer [1].
> +[1] https://github.com/eudev-project/eudev/issues/229
> +
> +For yocto, when start with sysVinit, to enable systemd distro feature,
> +and install systemd-tmpfiles is not proper, so revert this commit.
> +

Reading the upstream issue, I'm not sure this really is an
"Inappropriate" upstream. eudev has dropped this commit, because you
can use systemd-tmpfiles ("as it works without systemd and can be
compiled individually" - presumably using our unsupported musl
patches...) or opentmpfiles (which is dead and points you back to
systemd-tmpfiles).

Feels like this is an engage with upstream rather than carry a patch
forever which just causes us to be perpetually divergent.

> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/udev/udevd.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 71 insertions(+)
> +
> +diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> +index 7ffd174..ff53fe4 100644
> +--- a/src/udev/udevd.c
> ++++ b/src/udev/udevd.c
> +@@ -993,6 +993,76 @@ static void handle_signal(struct udev *udev, int signo) {
> +         }
> + }
> +
> ++static void static_dev_create_from_modules(struct udev *udev) {
> ++        struct utsname kernel;
> ++        char modules[UTIL_PATH_SIZE];
> ++        char buf[4096];
> ++        FILE *f;
> ++
> ++        if (uname(&kernel) < 0) {
> ++                log_error("uname failed: %m");
> ++                return;
> ++        }
> ++
> ++        strscpyl(modules, sizeof(modules), ROOTPREFIX "/lib/modules/", kernel.release, "/modules.devname", NULL);
> ++        f = fopen(modules, "re");
> ++        if (f == NULL)
> ++                return;
> ++
> ++        while (fgets(buf, sizeof(buf), f) != NULL) {
> ++                char *s;
> ++                const char *modname;
> ++                const char *devname;
> ++                const char *devno;
> ++                int maj, min;
> ++                char type;
> ++                mode_t mode;
> ++                char filename[UTIL_PATH_SIZE];
> ++
> ++                if (buf[0] == '#')
> ++                        continue;
> ++
> ++                modname = buf;
> ++                s = strchr(modname, ' ');
> ++                if (s == NULL)
> ++                        continue;
> ++                s[0] = '\0';
> ++
> ++                devname = &s[1];
> ++                s = strchr(devname, ' ');
> ++                if (s == NULL)
> ++                        continue;
> ++                s[0] = '\0';
> ++
> ++                devno = &s[1];
> ++                s = strchr(devno, ' ');
> ++                if (s == NULL)
> ++                        s = strchr(devno, '\n');
> ++                if (s != NULL)
> ++                        s[0] = '\0';
> ++                if (sscanf(devno, "%c%u:%u", &type, &maj, &min) != 3)
> ++                        continue;
> ++
> ++                mode  = 0600;
> ++                if (type == 'c')
> ++                        mode |= S_IFCHR;
> ++                else if (type == 'b')
> ++                        mode |= S_IFBLK;
> ++                else
> ++                        continue;
> ++
> ++                strscpyl(filename, sizeof(filename), "/dev/", devname, NULL);
> ++                mkdir_parents_label(filename, 0755);
> ++                mac_selinux_create_file_prepare(filename, mode);
> ++                log_debug("mknod '%s' %c%u:%u", filename, type, maj, min);
> ++                if (mknod(filename, mode, makedev(maj, min)) < 0 && errno == EEXIST)
> ++                        utimensat(AT_FDCWD, filename, NULL, 0);
> ++                mac_selinux_create_file_clear();
> ++        }
> ++
> ++        fclose(f);
> ++}
> ++
> + /*
> +  * read the kernel command line, in case we need to get into debug mode
> +  *   udev.log-priority=<level>                 syslog priority
> +@@ -1199,6 +1269,7 @@ int main(int argc, char *argv[]) {
> +         }
> +
> +         dev_setup(NULL, UID_INVALID, GID_INVALID);
> ++        static_dev_create_from_modules(udev);
> +
> +         /* before opening new files, make sure std{in,out,err} fds are in a sane state */
> +         if (arg_daemonize) {
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
> index 841039f6d7..deb6c90a82 100644
> --- a/meta/recipes-core/udev/eudev_3.2.11.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.11.bb
> @@ -12,6 +12,7 @@ PROVIDES = "udev"
>  SRC_URI = "https://github.com/eudev-project/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
>             file://init \
>             file://local.rules \
> +           file://0001-eudev-create-static-nodes-from-modules.patch \
>  "
>
>  SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165533): https://lists.openembedded.org/g/openembedded-core/message/165533
> Mute This Topic: https://lists.openembedded.org/mt/91052396/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

