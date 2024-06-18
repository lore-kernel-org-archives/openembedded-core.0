Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D439FC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 07:31:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.80993.1718695869925104174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 00:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RQzj/vGx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD96124000D;
	Tue, 18 Jun 2024 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718695868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A01+gIjG+m5ClH/UmQRnR0lyCRuYFhEH0IsHEPyap8g=;
	b=RQzj/vGxgEwGp3ILieyEpfzWGTVhyoQB8fkVqVyTxMw04CP+ZMeCJEggaMmnWXcIsVPpdp
	71GHjNLVI3dTN7htR9smQe/j33OtH3i4leNulMgqHUEDwVjbsz3N9HTqxnFs6rvx0zMnTq
	y3WG3hh19DNpPMj3/drLq04QX5inbmXigivhEyE8SJ4A5m6BkcmP5d6oY5RLax2qiI1702
	+CjHvm11b++3ZjJQczkezGzCuOhkkACoyBAxGEXEz8iVo/lTPCi3tKG36u1XVaT0hEtgKR
	GHYTCe5S8sFBQbIClEkK9FDUx82jR1bfQl2WLya9M85seQWRTguQG3bFbKwuGg==
Date: Tue, 18 Jun 2024 09:31:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Hundeb?ll <martin@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] ofono: add ptests
Message-ID: <20240618073107435760ba@mail.local>
References: <20240617133643.1856546-1-martin@geanix.com>
 <20240617133643.1856546-3-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617133643.1856546-3-martin@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200858

ERROR: /home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono_2.8.bb: Unable to get checksum for ofono SRC_URI entry run-ptest: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono-2.8/poky/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono/poky/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/files/poky/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono-2.8/qemux86-64/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono/qemux86-64/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/files/qemux86-64/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono-2.8/qemuall/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono/qemuall/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/files/qemuall/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono-2.8/x86-64/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono/x86-64/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/files/x86-64/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono-2.8/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/ofono/run-ptest
/home/pokybuild/yocto-worker/a-full/build/meta/recipes-connectivity/ofono/files/run-ptest
ERROR: Parsing halted due to errors, see error messages above

On 17/06/2024 15:36:42+0200, Martin Hundeb?ll wrote:
> Install and run the unit tests already provided by ofono. Test execution
> time is about a second.
> 
> Signed-off-by: Martin Hundeb�ll <martin@geanix.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc |  1 +
>  meta/recipes-connectivity/ofono/ofono_2.8.bb    | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index c60575a45cc2..60cbea0f19e9 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -53,6 +53,7 @@ PTESTS_FAST = "\
>      lzo \
>      m4 \
>      nettle \
> +    ofono \
>      opkg \
>      pango \
>      popt \
> diff --git a/meta/recipes-connectivity/ofono/ofono_2.8.bb b/meta/recipes-connectivity/ofono/ofono_2.8.bb
> index 809485d42178..f54367848f05 100644
> --- a/meta/recipes-connectivity/ofono/ofono_2.8.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
> @@ -10,10 +10,11 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
>  SRC_URI = "\
>      ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>      file://ofono \
> +    file://run-ptest \
>  "
>  SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
>  
> -inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
> +inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data ptest
>  
>  INITSCRIPT_NAME = "ofono"
>  INITSCRIPT_PARAMS = "defaults 22"
> @@ -28,11 +29,20 @@ PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
>  
>  EXTRA_OECONF += "--enable-test --enable-external-ell"
>  
> +do_compile_ptest() {
> +    oe_runmake buildtest-TESTS
> +}
> +
>  do_install:append() {
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 0755 ${UNPACKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
>  }
>  
> +do_install_ptest() {
> +    install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/unit -executable -type f)
> +    install -m644 -Dt ${D}${PTEST_PATH}/unit ${B}/unit/test-provision.db
> +}
> +
>  PACKAGES =+ "${PN}-tests"
>  
>  FILES:${PN} += "${systemd_unitdir}"
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200838): https://lists.openembedded.org/g/openembedded-core/message/200838
> Mute This Topic: https://lists.openembedded.org/mt/106720606/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

