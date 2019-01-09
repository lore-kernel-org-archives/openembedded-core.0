Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2296D74B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 11:59:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b16so5831171ior.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 03:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3w+leKm3sBeouDEmylhKpjWjgUbCpx30k8DSTOIxTrE=;
	b=XdeFeKQOrqESDZ7FAyhQIRiXbY5O0nPsgqsVvElWKo/PA4E5KdM16vzJKVC/+UKfO+
	AVfjGn40HZ8Vvnx8Ovmb0mPiS1BbJ9zvp7EAkBdM3vSq/Qwep/6Vrfb/y2CWnZw5zdVE
	5lnvjZNEyRwhWEkVF9C806G3cvQT0j7WXWpeW+KXr5ujbgu5G/rjPvTh7wSUALLujiSZ
	rlXk3lIkn96SpttffR0Hixml/phR96S7C2TzQSLtDfAw/TNh6wSnU8/BSmoOeg9TTKRV
	hfHRo3Q0GuCrwFOCaGn4CgYFoGxJAE5Js/Rzb8ABjOgdDBFMoDHCkAjBGGz5VWWW6WnB
	7WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3w+leKm3sBeouDEmylhKpjWjgUbCpx30k8DSTOIxTrE=;
	b=b9HgJcBZHfuh0EZjLSOBaGOlSkL+PK72hZjm6kunt3grDJz6eaiZdia8Gre1AYKN1i
	H8XF1eCtvsLkQyAiBVLBWSx7d+dOw7H4URyWa2qJE9O4Y4OWHeb9pf9YS6qTyQ3eubKj
	r7eJP4L47xGjuI43MYNGFxPVWkeMv2TO4RCRVnCwukWpkafPkbtwmVRflHYHWCm1Ms3w
	G2z/y7Oc9YqYLBfXhBf8pqshsX4orQlNp0Ao0g6ErVcMZQKv3oZEZhUyI9Fzhhd00Wxw
	p1ncNtvYE3IEEzltArMI7jsmQNtrESTNmMAGK8OyLBZfe2zu9HQEElv0V4xcItXHWG7e
	sOCA==
X-Gm-Message-State: AJcUukdF4j+dETbzYYggfqpOSeYaCAk8zoQLQ4Mc18HGDM61BBDmhqXj
	kG/5BfOVlA8TDZ1VohnTaS0mAyy6bCR8hCqy4ieiYN3j6jI=
X-Google-Smtp-Source: ALg8bN5w/wVbhhIer6yl5Ne55pSAElViaZ1ZhI1Nfp8JejCF0rKmkdQ01bcby9jvvBDLkmXFDDo5ZPQ06yKL1qsvi2o=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr3168924iog.270.1547035169335; 
	Wed, 09 Jan 2019 03:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20190109015224.14076-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190109015224.14076-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2019 11:59:18 +0000
Message-ID: <CAJTo0LaKXugCRMnqSgSOmX-DVLAAy7gpdiLDxmMzkxH6cxAdew@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] dbus:upgrade to 1.13.6
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
X-List-Received-Date: Wed, 09 Jan 2019 11:59:28 -0000
Content-Type: text/plain; charset="UTF-8"

From dbus web site:

"The current stable branch is dbus 1.12.x. This is the recommended
version for most purposes. "

"The current development branch is  dbus 1.13.x, which will lead to a
1.14.x stable branch in future"

This is why the recipe inherits upstream-version-is-even.  We should
upgrade to 1.12.12 instead.

Ross

On Wed, 9 Jan 2019 at 01:53, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade dbus from 1.12.10 to 1.13.6.
> 2.Upgrade dbus-test from 1.12.10 to 1.13.6.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../dbus/{dbus-test_1.12.10.bb => dbus-test_1.13.6.bb}        | 4 ++--
>  meta/recipes-core/dbus/{dbus_1.12.10.bb => dbus_1.13.6.bb}    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-core/dbus/{dbus-test_1.12.10.bb => dbus-test_1.13.6.bb} (95%)
>  rename meta/recipes-core/dbus/{dbus_1.12.10.bb => dbus_1.13.6.bb} (97%)
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.13.6.bb
> similarity index 95%
> rename from meta/recipes-core/dbus/dbus-test_1.12.10.bb
> rename to meta/recipes-core/dbus/dbus-test_1.13.6.bb
> index 25b9395120..695e8d736d 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.13.6.bb
> @@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>             file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
>             "
>
> -SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
> -SRC_URI[sha256sum] = "4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7"
> +SRC_URI[md5sum] = "aeee1cbbed4d0f2b57fce5bf44828bda"
> +SRC_URI[sha256sum] = "b533693232d36d608a09f70c15440c1816319bac3055433300d88019166c1ae4"
>
>  S="${WORKDIR}/dbus-${PV}"
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
> diff --git a/meta/recipes-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbus/dbus_1.13.6.bb
> similarity index 97%
> rename from meta/recipes-core/dbus/dbus_1.12.10.bb
> rename to meta/recipes-core/dbus/dbus_1.13.6.bb
> index d71f7f7042..50859152a8 100644
> --- a/meta/recipes-core/dbus/dbus_1.12.10.bb
> +++ b/meta/recipes-core/dbus/dbus_1.13.6.bb
> @@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>             file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
>  "
>
> -SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
> -SRC_URI[sha256sum] = "4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7"
> +SRC_URI[md5sum] = "aeee1cbbed4d0f2b57fce5bf44828bda"
> +SRC_URI[sha256sum] = "b533693232d36d608a09f70c15440c1816319bac3055433300d88019166c1ae4"
>
>  inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
>
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

