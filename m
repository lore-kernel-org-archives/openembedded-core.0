Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2067F304
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 16:58:39 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id b11so14204400qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uNwLV3Fr+294CD+1GV7P2cyeLwRMNlV+Veq1mAO+g8c=;
	b=Ryqjl5Tfvrlw6kcrcWgDTLNq6+I74khIuHXGDNTiLjG8LHyqU9PbfD3fsq7SmwkcJ0
	Er/YF9N3GoiIvRo1LAqhE1ZawbcMVlvy4ijfiiw0ew6/SEd/w8pZ2ZPuNgARSWzCKfM1
	kaeeR4yt/+7orfrPw3Dywa7VqWKYQ5hRcqKz5llsTtFkf180C6TSzsASCWFVBdWwwcuD
	opwlNf9iNJgerNTNom7Whpgj6VYeRD9V6U8j8JNR8sOAZV4QVkgBBwQs/Wb1OpqsVBpH
	QHKpfQxgDToQl+sKHMjE54YVOZnqzqILew9tc33udHtOVsU6/jpKHB2QKdn9jP+3+GrA
	3TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uNwLV3Fr+294CD+1GV7P2cyeLwRMNlV+Veq1mAO+g8c=;
	b=MC9IJSL2pTVp040CW6CJlxI3BIEGCZ94NVVPK1vlU53n2z8GaXRNvOGH1bimkI1hmD
	Ytit7suXMkwy+DOFt7wqJbdi16d2NX+7VJ2gAmHo5whc4Y4labqgUqC+gfigfzXoxkXE
	QSg/JyPTEd4Boh1+oT2E3uP+KTnTvF4lX1Y62ADdO57+Wk0+vvURo9r7tIrFqJw5xb75
	YoxmU2mhSFkh2TLjq7c0RJC+5KBx+Y2pB/70d/eJBwEqRAyzGOR5B+esadLrQRVqUn5c
	q58XtA3YU4xbdEw9R9tP7ZL1oOPSJKZopuHj5qdMsu6Tf+wu5FzQL/OjZpUeoWUSEn+q
	wMhQ==
X-Gm-Message-State: APjAAAXxf/YDoLSCouo/J8BgTxkD+/F3OEqTSh4/msHwoxsIolmX+cH0
	w5ntifWXduF8OvpA68hYsX2hC60ztDmIWz9cUyA=
X-Google-Smtp-Source: APXvYqw7xbapQPJZ2l3Id5AOJxoXvErkfUH1h69+t4UHY/NRDjsTn2IXdsCZ4zwMqfqEYwStopS9IvHTpRCxjwUaYvo=
X-Received: by 2002:ac8:7445:: with SMTP id h5mr7011246qtr.53.1566665920696;
	Sat, 24 Aug 2019 09:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-10-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1566593504-21918-10-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 09:58:14 -0700
Message-ID: <CAMKF1spuYVJsW9GQECgv9GZR2Jx0efJbYxrwyk4=OXUi1GA=QA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/13] update-rc.d.bbclass: support VIRTUAL-RUNTIME_init_manager == busybox
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
X-List-Received-Date: Sat, 24 Aug 2019 16:58:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 23, 2019 at 1:54 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/update-rc.d.bbclass | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index 1366fee..bf86bfa 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -1,6 +1,13 @@
>  UPDATERCPN ?= "${PN}"
>
> -DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', ' update-rc.d initscripts', '', d)}"
> +def get_target_depends(d):
> +    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
> +        return 'update-rc.d initscripts'
> +    if d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox':
> +        return 'update-rc.d'
> +    return ''
> +

checking init_manager seems more appropriate here than mixing
DISTRO_FEAUTURE and init_manage check.

> +DEPENDS_append_class-target = " ${@get_target_depends(d)}"
>
>  UPDATERCD = "update-rc.d"
>  UPDATERCD_class-cross = ""
> @@ -50,7 +57,6 @@ if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
>  fi
>  }
>
> -
>  def update_rc_after_parse(d):
>      if d.getVar('INITSCRIPT_PACKAGES', False) == None:
>          if d.getVar('INITSCRIPT_NAME', False) == None:
> @@ -62,7 +68,12 @@ python __anonymous() {
>      update_rc_after_parse(d)
>  }
>
> -PACKAGESPLITFUNCS_prepend = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'populate_packages_updatercd ', '', d)}"
> +def get_packagesplit_funcs(d):
> +    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox':
> +        return 'populate_packages_updatercd'
> +    return ''
> +
> +PACKAGESPLITFUNCS_prepend = "${@get_packagesplit_funcs(d)} "
>  PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
>
>  populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_postinst"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

