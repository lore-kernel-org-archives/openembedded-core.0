Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6D16FFFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 22:08:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so11361583wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=muUyWZoZ0egc1Mb+tTGhAT7a5owA6sq4IDsWTDY+5tA=;
	b=RKQGxgz7Nv7kbpZFmrh3OpeCFwxZcyj+JXPJWCrYFf0RuGAvl6DXC1gqPn6jw25av8
	OV2HwlhpR919q4A/+4cGoplTDphuNKBo6AHOBPleGJRKhYxOCfHqiDmNhmxwkScUB9Wh
	fUVZ7wOkpvimla33/Ptri4195oYsBWhCp5eeFv8u0UuxV2T5SfZ5ujBoKAkvYEm6dCIN
	KyzNumXDGMifW4UNWHsSUCI16AQiqaGP9FCgOLSBNxIoB7TdcS2DH5taxR0hIyuQ5Mm/
	HiCS5Q3oxbMT9JsRxxtKDOmEsoaq7DITsPhXHtvhPLnaJapEfhxGal4uM6M1doZGL5Wx
	O2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=muUyWZoZ0egc1Mb+tTGhAT7a5owA6sq4IDsWTDY+5tA=;
	b=Ct/SUz2IhiVhapIahDqyh7bjNWNAX1zbbrIUpEJsPvaARPlDhr3LoCmVUKPnW8QTay
	6qKu2S+av+Phux0AxT6BH1jjlJKFBZcPJhX/D1exLBwXL+l5PpQRLBVLV+UQgH6l9GKl
	Cl9Lqz/ejU26OrTn/rf4F8ozEC6kEUkMwIiECVnvYjE8e+QpoZgUQLM4rdfz+b7wvNj2
	R2Elv1WE0hXZnZu3y9Gurzd8WORUGeKTNBlCLKBxkg1f1YpYwTSdVCoblr1xlqIJWrJg
	jMnaMxvdIkc8/sgvD6KBYBfnx4t4JROv1o7M98z2F2sLWQpCnXLgT3x6XMuk5VTBaa1A
	KT6g==
X-Gm-Message-State: AN3rC/7Zv7AZcT1DSSDFGJ+3GBCjsBfO4B9SvTr7NjFk5CkE/HFaN7sV
	1kZ3rXkSl5YuFgCMjFbUIrx15CNFSAnd
X-Received: by 10.28.221.212 with SMTP id u203mr10306529wmg.101.1492466936887; 
	Mon, 17 Apr 2017 15:08:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Mon, 17 Apr 2017 15:08:26 -0700 (PDT)
In-Reply-To: <1492436338-32048-8-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
	<1492436338-32048-8-git-send-email-ferlandm@amotus.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Apr 2017 15:08:26 -0700
Message-ID: <CAMKF1soCmB0adGVRU9G+_4OCPDyuY3XPFzaf=S_dw1pqevHd4A@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 7/8] bluez5: cleanup tabs and spaces
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
X-List-Received-Date: Mon, 17 Apr 2017 22:08:57 -0000
Content-Type: text/plain; charset=UTF-8

python code uses spaces but shell code uses tabs for OE-Core. I know
its confusing but thats how it is see the style guide for more details

http://www.openembedded.org/wiki/Styleguide

On Mon, Apr 17, 2017 at 6:38 AM, Marc Ferland <ferlandm@amotus.ca> wrote:
> Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 56 ++++++++++++++---------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 47d8f22..98fb9b3 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -52,29 +52,29 @@ NOINST_TOOLS = " \
>  "
>
>  do_install_append() {
> -       install -d ${D}${INIT_D_DIR}
> -       install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
> -
> -       install -d ${D}${sysconfdir}/bluetooth/
> -       if [ -f ${S}/profiles/network/network.conf ]; then
> -           install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
> -       fi
> -       if [ -f ${S}/profiles/input/input.conf ]; then
> -           install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
> -       fi
> -
> -  if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
> -    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
> -  fi
> -
> -       # Install desired tools that upstream leaves in build area
> -        for f in ${NOINST_TOOLS} ; do
> -           install -m 755 ${B}/$f ${D}/${bindir}
> -       done
> -
> -        # Patch python tools to use Python 3; they should be source compatible, but
> -        # still refer to Python 2 in the shebang
> -        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
> +    install -d ${D}${INIT_D_DIR}
> +    install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
> +
> +    install -d ${D}${sysconfdir}/bluetooth/
> +    if [ -f ${S}/profiles/network/network.conf ]; then
> +        install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
> +    fi
> +    if [ -f ${S}/profiles/input/input.conf ]; then
> +        install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
> +    fi
> +
> +    if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
> +        sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
> +    fi
> +
> +    # Install desired tools that upstream leaves in build area
> +    for f in ${NOINST_TOOLS} ; do
> +        install -m 755 ${B}/$f ${D}/${bindir}
> +    done
> +
> +    # Patch python tools to use Python 3; they should be source compatible, but
> +    # still refer to Python 2 in the shebang
> +    sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
>  }
>
>  PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
> @@ -84,8 +84,8 @@ FILES_${PN} += " \
>      ${systemd_unitdir}/ ${datadir}/dbus-1 \
>      ${libdir}/cups \
>  "
> -FILES_${PN}-dev += "\
> -  ${libdir}/bluetooth/plugins/*.la \
> +FILES_${PN}-dev += " \
> +    ${libdir}/bluetooth/plugins/*.la \
>  "
>
>  FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
> @@ -115,10 +115,10 @@ INITSCRIPT_NAME_${PN} = "bluetooth"
>  EXCLUDE_FROM_WORLD = "1"
>
>  do_compile_ptest() {
> -        oe_runmake buildtests
> +    oe_runmake buildtests
>  }
>
>  do_install_ptest() {
> -        cp -r ${B}/unit/ ${D}${PTEST_PATH}
> -        rm -f ${D}${PTEST_PATH}/unit/*.o
> +    cp -r ${B}/unit/ ${D}${PTEST_PATH}
> +    rm -f ${D}${PTEST_PATH}/unit/*.o
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

