Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39FE274591
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 10:18:22 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id q11-v6so137796oic.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cu22mkI98IyznkW+GbQjOF90cY/UYv0eAWcOySDFUaM=;
	b=lcetvAyIgAKxZmaAoG4NQCnKTOGkQbqvJqjIpJMLMQZhas8XcXE5AvldEVTm6KEcFX
	pMcB8YoMuAiBdbRE4QdhM/OORb4Q8jjNJ0z4Opz+GhC7ZdSXobiAxPdqlqFh6Tj8N53F
	FMBE/2M7Gm2ARByc00adY/AsNWLtm9gfUmgZ0Z3Y+PsHTq0GLzMMbgbzPFKdQO0FsQFh
	xsj0HmxYBSTnUyK4QU6cgNaMtKMN3lf/GxmKHs1KPVere+ekUntIxyJA7L1O5liryAod
	gmen5GWO2F7UFuEXgMKbT8cIXeIFR7n3k1XzootDZwCDgcCC6V5tg3ZrWSdp+DIfuq8d
	Fb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cu22mkI98IyznkW+GbQjOF90cY/UYv0eAWcOySDFUaM=;
	b=JBAlx3oRcCIq50ZGqD6l1puvSCMArJX9uiHSL4GyD5Say1QUjmXo9Ll9k3b4b/ajx0
	5CB96+mbEHe7qHP/AZ6hu+4czYnv5F4vlzeHwBaMNikbqNVSg+4366EtG3r+y/aqbmP6
	vp4nYcrAU6FREygsoGIYobDnLOWDVnaM77PtsdMTXjz7rEhvAnAB4hEPc8qmW4KTYT0U
	i44Ct2yKsoSRN7uw+c7nEe8fvlD0gAhK16+QJZ4AhKMlmyDEqcDW5TFG+ygtDr/hPqTa
	V3jZJXlQxaU1uQ1KgunLIJa1++xp3Vsc8CStCSZGlNEXfaEtdNIWwDf3K5GbFzc5IH6f
	iN9w==
X-Gm-Message-State: AOUpUlEOB8lfyizgtdSbbxvCxzu1qFJnV5l7hcLgDbhdzyh+oGBKUkwZ
	lbMQBmCMSkpr/g21USdn59QBCgmG7hQhbZDZ2UbX4z6i
X-Google-Smtp-Source: AAOMgpfcwakyZB90UvtNJLalwiBVqXhwTfjBQyppO5BXnliXPVAh9DQWQ1xkF13yGBsJ18wrvW5SX+zNSQOtZOGgZl8=
X-Received: by 2002:aca:3f41:: with SMTP id m62-v6mr364801oia.18.1532341103088;
	Mon, 23 Jul 2018 03:18:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 03:18:02
	-0700 (PDT)
In-Reply-To: <1532336544-107337-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1532336544-107337-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2018 11:18:02 +0100
Message-ID: <CAJTo0LZTO7OxZokj2pymX7PaLqBRq5KiyyBij3Ncq8j59YrE7w@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] sshd: add sshd.service
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
X-List-Received-Date: Mon, 23 Jul 2018 10:18:22 -0000
Content-Type: text/plain; charset="UTF-8"

Still no explanation why you'd want to do this and not use socket activation.

Ross

On 23 July 2018 at 10:02, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> Add sshd.service for user to start the sshd daemon.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/sshd.service | 16 ++++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb     |  6 ++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd.service
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/meta/recipes-connectivity/openssh/openssh/sshd.service
> new file mode 100644
> index 0000000..2d2717d
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=OpenSSH server daemon
> +Wants=sshdgenkeys.service
> +After=sshdgenkeys.service
> +
> +[Service]
> +Environment="SSHD_OPTS="
> +EnvironmentFile=-/etc/default/ssh
> +ExecStart=-@SBINDIR@/sshd -i $SSHD_OPTS
> +ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
> +KillMode=process
> +Restart=on-failure
> +RestartSec=42s
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> index b3da5f6..b4f4c6d 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> @@ -17,6 +17,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://ssh_config \
>             file://init \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> +           ${@bb.utils.contains('SSHD_DAEMON', 'service', '${SSHD_DAEMON_SRC_URI}', '', d)} \
>             file://sshd.socket \
>             file://sshd@.service \
>             file://sshdgenkeys.service \
> @@ -30,6 +31,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>
>  PAM_SRC_URI = "file://sshd"
>
> +SSHD_DAEMON_SRC_URI = "file://sshd.service"
> +
>  SRC_URI[md5sum] = "68ba883aff6958297432e5877e9a0fe2"
>  SRC_URI[sha256sum] = "d73be7e684e99efcd024be15a30bffcbe41b012b2f7b3c9084aed621775e6b8f"
>
> @@ -111,6 +114,9 @@ do_install_append () {
>         echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>
>         install -d ${D}${systemd_unitdir}/system
> +       if [ "${@bb.utils.filter('SSHD_DAEMON', 'service', d)}" ]; then
> +               install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_unitdir}/system
> +        fi
>         install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
>         install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
>         install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

