Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 67EFD7E26C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 17:37:29 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d10so11599854qko.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 10:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6TR29ZoRo9XP9BUSVa7rY59hmLCpe14kREXwe1AIGKs=;
	b=sPQBoem9qJExYCO4o8hDbYtAM+/xviwbFc4DlnEQBJyHhtf4oQPoLT4YSTpHlQQfJi
	Gepr1/qGFPwrIoX7e5sRU5FmnoERCvBESx4B8EPoZLTLQaUIED+MxRiK0gA/y9XOYuxu
	vlZWFdka/yiZdPaVMg120MwZ04ZaEAlJ52ySd9tPHb9Hqp4X6K9QnJ1YmUM6oF1k0r0H
	3rdnvoAbWHXUEU2c+CwokML3qCVvV7RJW3VYk9d3LuGWo84Oa4EbUHcoXdQsjitOPsoL
	9mdCPrpjV6EEiqO05Kf9v0tNP95ySKnN/NfbAyBgZgXpw7UUmwasrcKr5i2R6psRwTKy
	6BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6TR29ZoRo9XP9BUSVa7rY59hmLCpe14kREXwe1AIGKs=;
	b=XTXajHsszNLrVQGhf4/EyEzuOaGdyEWpNTIXfy15/yfhMu4sxDUTV9v+qVI4RPwWgR
	j/FJWHHCQzn+KR/zxRm/z+RvRoubbEEnHd0TM6FzQzgBbfumyUi0WxSGfwk47sFl1jJE
	Q7aNjWS8rvg+swGNVoKL/yXFxdhPRYsmpPs5A/UMUDlDjwEm2HvSFFWmbQFeiJSd9+MB
	NzuWMuyuvD6Fb2Tth4RbC16K3lm0+h7iqC1HGXLRRnM3z6rNWKz6baxNq4du2LwrQ2IG
	DQ60rghOP/v47jHTxr8zml/yXoq4oNkUQAfotJ5qwsgqcC7vkM56Z7lc4incxh74igIg
	k4Qw==
X-Gm-Message-State: APjAAAVMOUTZM1l37rYGiWYHt2VM+RsZ4o3uD36lxQ0XVuJvnMxe1/di
	DFJ66hFC31cQmHF5kGSOXfqosYRuEDFXjVdsjII=
X-Google-Smtp-Source: APXvYqxdcG9+36NyrncCiJapDHqXG8ur5lbrggNEQbFUjcAvyCpWyPygNGKQS5J/cRYm13Wyk45NgYQ/dEIph/dIsRQ=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr65354693qkb.24.1558460249988;
	Tue, 21 May 2019 10:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190521092249.175461-1-kai.kang@windriver.com>
	<20190521092249.175461-2-kai.kang@windriver.com>
In-Reply-To: <20190521092249.175461-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 10:37:04 -0700
Message-ID: <CAMKF1srDq6skmDUZqYSE2rYnFQC4DCrdP3Oc4xifOHsSiWbW3A@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Tue, 21 May 2019 17:37:29 -0000
Content-Type: text/plain; charset="UTF-8"

just copy paste from meta-yoe, that has been long working.

On Tue, May 21, 2019 at 2:23 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Add a configure file for systemd.networkd to configure wired network
> interfaces with dhcp. It works with common network interfaces such eth0
> and eno1.
>
> Refer to
> https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd
>
> [YOCTO #13057]
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-conf/dhcp.network | 9 +++++++++
>  meta/recipes-core/systemd/systemd-conf_242.bb       | 5 +++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-conf/dhcp.network
>
> diff --git a/meta/recipes-core/systemd/systemd-conf/dhcp.network b/meta/recipes-core/systemd/systemd-conf/dhcp.network
> new file mode 100644
> index 0000000000..253aee9382
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-conf/dhcp.network
> @@ -0,0 +1,9 @@
> +[Match]
> +Name=en* eth*

I think this is better put
Name=en*
Name=eth*

> +
> +[Network]
> +DHCP=yes
> +
> +[DHCP]
> +RouteMetric=10
> +ClientIdentifier=mac
> diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
> index 96beea53a7..105ee3ceed 100644
> --- a/meta/recipes-core/systemd/systemd-conf_242.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_242.bb
> @@ -10,12 +10,16 @@ SRC_URI = "\
>      file://logind.conf \
>      file://system.conf \
>      file://system.conf-qemuall \
> +    file://dhcp.network \

better to call it wired or something

>  "
>
>  do_install() {
>         install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
>         install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
>         install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
> +       if ${@bb.utils.contains('OVERRIDES', 'qemuall', 'false', 'true', d)}; then
> +               install -D -m0644 ${WORKDIR}/dhcp.network ${D}${systemd_unitdir}/network/80-dhcp.network
> +       fi
>  }
>
>  # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
> @@ -29,4 +33,5 @@ FILES_${PN} = "\
>      ${systemd_unitdir}/journald.conf.d/ \
>      ${systemd_unitdir}/logind.conf.d/ \
>      ${systemd_unitdir}/system.conf.d/ \
> +    ${systemd_unitdir}/network/ \
>  "
> --
> 2.20.0
>

