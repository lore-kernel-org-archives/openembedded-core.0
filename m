Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 113B878673
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 12:03:20 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k61so20188914wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 04:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=9UWa926jLHmoaCv0APWduFdp2eC3XunYzgZudEbXSTM=;
	b=tzko/zh7VIpjfeHANM4QWct6dNMIU67EoMtymnsZxAVXLY9jJm0srHxO4x3G3ahvIZ
	8BLi66YNLqKoXJBGDY8AA68k6jpp66Jfuuy5tORzbdvGsQLcgDyc2vSblV2VGJ/gG/RN
	HCcr1O8Dh+B1Xn4qEzCmNQtEcXS+C77BznVapKQVk/dZJPfQnV3oyYH8wp7bSf/bg6T9
	R6qj1NRN+xdilJoSeaShlX97VVEwxgZLc4YIR2DWcGsNcwvnrIObhkB6PBshZk0ZlRy4
	j+RMbgvQu0ojzXN9CZV3pG7FkqNNoVZpLc0hn6OzXINiYNkeuy7iFm5cWNTed80OnOut
	OsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=9UWa926jLHmoaCv0APWduFdp2eC3XunYzgZudEbXSTM=;
	b=Xj2nA2znQPdoA7numCZoskfZ0ZQl9tGE6B9L8okMT4A9II/hGtI2GhKsQCcI5HGR1k
	kbmczjh9KIybUoorqhwgBIovq3816qL5zctYDfY4UI/unO1AgTKawQlGYgYYbLtnn5Uw
	zr+tHEeFV89AI/J/WQOH0QkisDwc8WN9fk/wH1bhdC4jIc0EbryOgjfrkaH+200rxvII
	2NKCwTT3RUGhTu4JCry6jwjw+wMHQUWJvEbIC7mkY8hVjpw1tMsneO3q17ZWDlQYVHvX
	s+KjITMQraIFhr+45CpZgs36iba+hVndUnat6eqwWWF4iS3VwxEodTbdluOwTqCvj4mG
	4bJg==
X-Gm-Message-State: AJaThX5ZBe5zZZcryHcNkOOBYBiZEWdNFrrwAuQ/EAdrP6ytvyI+xxrQ
	KVeqhMA0xLYWimBHmfdfp8c6
X-Google-Smtp-Source: AGs4zMZ8w7tDDOaqp+ayBZCOdD7cfZg8BgNADFXo/N9TXsjg+dUeYRTB6JmZWlwUWp2Civo7qCxwfA==
X-Received: by 10.223.145.230 with SMTP id 93mr4276534wri.190.1511525001881;
	Fri, 24 Nov 2017 04:03:21 -0800 (PST)
Received: from pohly-mobl1 (p54BD57A0.dip0.t-ipconnect.de. [84.189.87.160])
	by smtp.gmail.com with ESMTPSA id
	p132sm1521909wmb.0.2017.11.24.04.03.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Nov 2017 04:03:20 -0800 (PST)
Message-ID: <1511524999.5979.62.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Maxin B. John" <maxin.john@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Nov 2017 13:03:19 +0100
In-Reply-To: <1497280222-11549-3-git-send-email-maxin.john@intel.com>
References: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
	<1497280222-11549-3-git-send-email-maxin.john@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] connman: correct the systemd boot in read only rootfs
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
X-List-Received-Date: Fri, 24 Nov 2017 12:03:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-06-12 at 18:10 +0300, Maxin B. John wrote:
> connman fails to start in systemd based read-only images while
> creating links:
> 
> Jun 08 12:53:56 qemux86-64 systemd[1]: Starting Create Volatile Files
> and Directories...
> Jun 08 12:53:56 qemux86-64 systemd-tmpfiles[366]:
> [[0;1;31msymlink(/var/run/connman/resolv.conf, /etc/resolv.conf)
> failed:
> Read-only file system[[0m
> 
> Fix this failure and make connman co-exist with systemd-resolved.
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc      | 15 ++++++++++-
>  ...vice-stop-systemd-resolved-when-we-use-co.patch | 29
> ++++++++++++++++++++++
>  meta/recipes-connectivity/connman/connman_1.34.bb  |  1 +
>  3 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/connman/connman/0001-
> connman.service-stop-systemd-resolved-when-we-use-co.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc
> b/meta/recipes-connectivity/connman/connman.inc
> index cc2d469..ab18f2f 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -13,7 +13,7 @@ LICENSE  = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://src/main.c;beginline=1;endline=20;md5=486
> a279a6ab0c8d152bcda3a5b5edc36"
>  
> -inherit autotools pkgconfig systemd update-rc.d bluetooth
> +inherit autotools pkgconfig systemd update-rc.d bluetooth update-
> alternatives
>  
>  DEPENDS  = "dbus glib-2.0 ppp readline"
>  
> @@ -69,6 +69,11 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
>  SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>  SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
>  
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_${PN} ="resolv-conf"
> +ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-
> conf.connman"
> +ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
> +
>  do_install_append() {
>  	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true',
> 'false',d)}; then
>  		install -d ${D}${sysconfdir}/init.d
> @@ -89,6 +94,14 @@ do_install_append() {
>  	# Automake 1.12 won't install empty directories, but we need
> the
>  	# plugins directory to be present for ownership
>  	mkdir -p ${D}${libdir}/connman/plugins
> +
> +    # For read-only filesystem, do not create links during bootup
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','fals
> e',d)}; then
> +        if ${@bb.utils.contains('IMAGE_FEATURES','re
> ad-only-rootfs','true','false',d)}; then
> +            echo "d    /var/run/connman    - - - -" >
> ${D}${sysconfdir}/tmpfiles.d/connman_resolvconf.conf
> +        fi
> +        ln -sf ../run/connman/resolv.conf ${D}${sysconfdir}/resolv-
> conf.connman
> +    fi
>  }

This check for 'IMAGE_FEATURES' is bogus: that's a per-image recipe
variable, which can't be assumed to be set consistently for all images
in the base configuration and therefore the connman recipe can't depend
 on it. The effect is that the tmpfiles.d entry doesn't get created
when setting IMAGE_FEATURES only for some images.

It still works for me (refkit, based on OE-core Rocko at the moment).
Something has created /var/run/connman (perhaps connman itself?) and
the resolv.conf inside it, so /etc/resolv.conf -> /etc/resolv-
conf.connman -> ../run/connman/resolv.conf = /run/connman/resolv.conf
exists.

But the bogus lines should be removed nonetheless, because it causes
the connman recipe to depend on IMAGE_FEATURES.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



