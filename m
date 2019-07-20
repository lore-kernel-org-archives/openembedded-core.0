Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 849047F101
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 18:21:51 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d23so34440376qto.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SFvBEzmMzgNA3HgDrr5+BayvtbdKfB8ZVnWOr57TLg0=;
	b=Fl5ou9ws9nYal4qMpRj950e0/3VXGXRSYsTH5zGj3M1W8j+Rg0N/VMYZIzfKt8M2GL
	DFas467B+YLVBhvhuFKT2FyUIyw1nSG9wIErCUfsAVSVBgZUNDbgEK7yiZIft/IPMOuk
	hrolkS8iOHasirnOv+JYhE+sn6Ml38v63aAcfoaWbRjUvi0weGGAPxCwMVMuk0WY6jaw
	mvo6ELbjJYS7M1VIHhgqkigqVBSou78l4f47tbaQltRd8QzQtpReoisjVqF8Gs7JQZSf
	5e1doziThNvUg5e9Gqv+9VaWisxqyyul/8D0SawM1+Uh8dpmsoNV8oruVrBviiGe/Wf8
	gAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SFvBEzmMzgNA3HgDrr5+BayvtbdKfB8ZVnWOr57TLg0=;
	b=YTNiyHiQLTsRQwKccvuWaBs4tqWWV/S6CiIMNDNbmsQb8JSfPhC0r7zLKKua+H5++6
	4mA1GtG/6LfYPM2gY2+cFZOHrHG39jna8xwnQfBnf3KPP4XAbBd4xus8KwExEi75dkEe
	TcBvb5wz/so4IV6UBB33O6PkHXWeVGszE8v6ASIfkx86Wze4Ke+1JPmAfKx4Vy32LPLN
	c7kdK5yb5EEdYJ8IZlOCKqeeVXj5thgmcpGJ1rNStU7Mg2MnHrV9UOi6CK1J1wawmAD9
	3TP+i2CpC6QgXTXxmyqEWJyxjHBZjuXbBFALCuM1JNR0wPTHjj6AxQnAmFNCLTirlqvT
	2eDA==
X-Gm-Message-State: APjAAAV5vWZ4YIxo5iJj72D9qa1FSu0UjymFEKUbfwUZNLZGM+0ZZIoy
	woML+xeYMTTu5gyS7vQ+Z3F1pDdArU3hv2+eP5RoM/9Z
X-Google-Smtp-Source: APXvYqy/YvjU0purwSoGzjzdJTwDnr3mLn5BiUc8ieyHLV3s39UL5vsrN8HBUE01jQ/1Et85TOw/yJWKnJvK2gsBla0=
X-Received: by 2002:aed:36e8:: with SMTP id f95mr41862082qtb.88.1563646912262; 
	Sat, 20 Jul 2019 11:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190720160929.31232-1-ayoub.zaki@embexus.com>
	<20190720160929.31232-2-ayoub.zaki@embexus.com>
In-Reply-To: <20190720160929.31232-2-ayoub.zaki@embexus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Jul 2019 11:21:26 -0700
Message-ID: <CAMKF1soLmNoEF3Mj0cwB7dmBiYwAwUtRAi6g=j+S3ZLX3FgX6w@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Sat, 20 Jul 2019 18:21:51 -0000
Content-Type: text/plain; charset="UTF-8"

wrong mailing list

On Sat, Jul 20, 2019 at 9:09 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
> by implementing basic whitelisting and blacklisting capabilities based on device attributes.
>
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
> ---
>  .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>
> diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> new file mode 100644
> index 000000000..a77694cc3
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
> +HOMEPAGE="https://github.com/dkopecek/usbguard"
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> +
> +SRC_URI="https://github.com/USBGuard/usbguard/archive/${PN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ddaa9ae884200c861ad946f34dfd5ab9"
> +SRC_URI[sha256sum] = "d37886508583565aae0df6a110b11524c59b39e0deb25ee49fc34274e4784f55"
> +
> +inherit autotools pkgconfig systemd bash-completion
> +
> +S= "${WORKDIR}/${PN}-${PN}-${PV}"
> +
> +DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
> +       dbus dbus-glib libqb libseccomp libcap-ng libgcrypt libsodium protobuf pegtl"
> +
> +EXTRA_OECONF += "--with-bundled-catch"
> +
> +PACKAGECONFIG ??= "libsodium \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
> +
> +PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
> +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
> +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
> +PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
> +PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
> +
> +SYSTEMD_SERVICE_${PN} = "${PN}.service"
> +SYSTEMD_PACKAGES += "${PN}"
> +
> +
> +do_install_append(){
> +
> +       sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \
> +                                               ${D}${sysconfdir}/usbguard/usbguard-daemon.conf
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

