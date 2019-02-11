Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 602646D749
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 12:08:47 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id v201so4071870ywa.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 04:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Xzkh3FV7ezQ0i5DEllJ7vLdClYYTDV/M9N0VF/o7/xE=;
	b=OAnE6r037l6Gwg1palJ4kab3SWrEeaU6dEz0y2r3OHicBjQ7LV/nhDzB0YS9NDJAKn
	Oe/OteuWuVIWgseu9C+H9ebKrTvp3fDWz6+UXrp1eLfnpINW6tDbgITiywywJ7yuBXQJ
	YY9pvNLYE8d+Ii5bZuCuDqnlF6nWENY3lGZWadWPw4SFCTTtBT5oBPfeTxLD9ZhAwQH9
	9UoUsNBMbVf/ZkqlTCAXI9SoMSUiUalpYrlzP6zKpGvslrxF4wjJHwUEJ0grw6O8PSRw
	bh9iZARZxNe2wR7ekrDdOGmYlYYTLLHOCwjPBlsYkDzKv18PnQknT3Klt99gQR3wmdK9
	wzqg==
X-Gm-Message-State: AHQUAuY+vpMcNDeHBnMeX0bSMYYXoCGOexWiMVbxHvL/EEw1j6mi5YrZ
	XK3jX3loIGAl/+YBgqS/ndPfNO08
X-Google-Smtp-Source: AHgI3IbC/htUpnvIaEsTHjRAlH9fMpVYEApSccNX4tYL01d0TGAhOLBSAs6rStgfhXmZtN+8pJWLUw==
X-Received: by 2002:a81:298e:: with SMTP id
	p136mr29060824ywp.168.1549886928164; 
	Mon, 11 Feb 2019 04:08:48 -0800 (PST)
Received: from bluvision ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id p66sm2506064ywf.0.2019.02.11.04.08.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 04:08:47 -0800 (PST)
Message-ID: <b5314b5aba8fc6e7ec104246463769932469576e.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 12:08:46 +0000
In-Reply-To: <20190211120433.16148-1-git@andred.net>
References: <20190211120433.16148-1-git@andred.net>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Mon, 11 Feb 2019 12:08:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Please ignore this patch. Looks like a red-herring. Sorry for the noise.

On Mon, 2019-02-11 at 12:04 +0000, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> It looks like there is an implicit dependency on util-linux'
> umount - as otherwise when using busybox' umount we see a
> long delay on shutdown / reboot.
> 
> [YOCTO #13058]
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> 
> ---
> this should only be merged with or after the util-linux
> packaging rework
> ---
>  meta/recipes-core/systemd/systemd_239.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-
> core/systemd/systemd_239.bb
> index f843f588bd..e2dfe639b3 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -556,7 +556,7 @@ FILES_${PN} = " ${base_bindir}/* \
>  
>  FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-
> 1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>  
> -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})
> util-linux-agetty util-linux-fsck"
> +RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (=
> ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
>  RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-
> generator', '', 'systemd-serialgetty', d)}"
>  RDEPENDS_${PN} += "volatile-binds update-rc.d systemd-conf"
>  


