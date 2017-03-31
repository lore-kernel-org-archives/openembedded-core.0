Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3A5560017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 01:56:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2V1udwv026299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 30 Mar 2017 18:56:39 -0700
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 30 Mar 2017 18:56:38 -0700
To: Andre McCurdy <armccurdy@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1490897180-19715-1-git-send-email-armccurdy@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <4314035d-6938-85d6-5c7b-8e01b1e02896@windriver.com>
Date: Fri, 31 Mar 2017 09:57:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1490897180-19715-1-git-send-email-armccurdy@gmail.com>
X-Originating-IP: [128.224.162.201]
Subject: Re: [PATCH] busybox: drop unmaintained _git recipe
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
X-List-Received-Date: Fri, 31 Mar 2017 01:56:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/31/2017 02:06 AM, Andre McCurdy wrote:
> The busybox _git recipe is not formally tested or kept up to date.
> The gstreamer _git recipes were recently removed from oe-core and the
> justifications for that change apply to the busybox _git recipe too.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta/recipes-core/busybox/busybox_git.bb | 52 --------------------------------
>   1 file changed, 52 deletions(-)
>   delete mode 100644 meta/recipes-core/busybox/busybox_git.bb
>
> diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
> deleted file mode 100644
> index c2ee3e6..0000000
> --- a/meta/recipes-core/busybox/busybox_git.bb
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -require busybox.inc
> -
> -SRCREV = "1b7c17391de66502dd7a97c866e0a33681edbb1f"
> -# Lookout for PV bump too when SRCREV is changed
> -PV = "1.25.0+git${SRCPV}"
> -
> -S = "${WORKDIR}/git"
> -
> -SRC_URI = "git://busybox.net/busybox.git \
> -           file://busybox-udhcpc-no_deconfig.patch \
> -           file://find-touchscreen.sh \
> -           file://busybox-cron \
> -           file://busybox-httpd \
> -           file://busybox-udhcpd \
> -           file://default.script \
> -           file://simple.script \
> -           file://hwclock.sh \
> -           file://mount.busybox \
> -           file://syslog \
> -           file://syslog-startup.conf \
> -           file://syslog.conf \
> -           file://busybox-syslog.default \
> -           file://mdev \
> -           file://mdev.conf \
> -           file://mdev-mount.sh \
> -           file://umount.busybox \
> -           file://defconfig \
> -           file://busybox-syslog.service.in \
> -           file://busybox-klogd.service.in \
> -           file://fail_on_no_media.patch \
> -           file://run-ptest \
> -           file://inetd.conf \
> -           file://inetd \
> -           file://login-utilities.cfg \
> -           file://recognize_connmand.patch \
> -           file://busybox-cross-menuconfig.patch \
> -           file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
> -           file://mount-via-label.cfg \
> -           file://sha1sum.cfg \
> -           file://sha256sum.cfg \
> -           file://getopts.cfg \
> -           file://resize.cfg \
> -           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
> -           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
> -           file://inittab \
> -           file://rcS \
> -           file://rcK \
> -           file://runlevel \
> -"
> -SRC_URI_append_libc-musl = " file://musl.cfg "
> -
> -DEFAULT_PREFERENCE = "-1"

Hi Andre,

This git recipe is maintained as far as I know. It was added so that it 
would be easier to hack with busybox. As busybox is broadly used in our 
project, an easier way to hack with it seems reasonable.

Best Regards,

Chen Qi



