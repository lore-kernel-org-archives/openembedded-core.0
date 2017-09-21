Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 04FFD71A65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:23:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j16so3517608pga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oo1jP1XWu+Wxb4Cv8S5v5T/3lu4xHRynfvv4gpDzWRA=;
	b=F5XYRZTF1nH8UBj2uPIzCtYD7kFKmu30Vy4C8Y8SGBYSujZsojDdQR78P0X5tOU74T
	XdXiwNU5GYtW65Rs5EKCZQ02tUyjaiZAdmXEG06glJbRqzYPi3h1K4ZoJ3vCUmjL4tMX
	9Cl51q8E73ebNU6I7/tEPpumhkPuF3g8VktcOKrOrYDH5byeh82tR4dhsxWajbBpBgEv
	P7h9ElFn4g6ap19FOOyHzmupSncfjTSzEdM3duNE6wVZV5Bc0rdl5wJJ7SSA3QSzskA1
	RpFrCJQ+l+AjpMD2LXOwC5gZBqClbCL6UGdcs/iy4oQZq31X0wrtEgclca6lL8602Tyq
	Qhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oo1jP1XWu+Wxb4Cv8S5v5T/3lu4xHRynfvv4gpDzWRA=;
	b=PQRbxZwXIlP3ZdmDaugLEB020OVObPhP80/f2WmILZ2abcY00WmkUAnWKFnXHcNVHp
	aLUwFeT7KKeJi9Puxurt7Xzg3uxke+F+0qn8+Ak0l1rEWFs27udO5x2+yaeZY7hpOSs8
	4Y/tg2WYUwE1irygFf6MXv/IGgBR5WH5mxzBXpppfQoXyg7bI9ttYRyCV/zkRee2LymG
	8QYOMbj0w8LdTo0CZRriHrt9+cu/P+UDHOCcg3J7wnuhK8Yr21ufzkug8O9gu5wtwjac
	UK8O+eVWmQPT3Dh/rWzsvN9Qx4BimaMH8yBwwbxym1Vpm5lJUUWxs0j+OxK7Q4G1Ayd3
	1WuQ==
X-Gm-Message-State: AHPjjUiMC1VYV5126zqhRfyzR+aoOpjsl+Zxo6V8rIGAt2dAnVmOZ73j
	EWx/ttnZRGgdswvUX0Qk1G2XKn/Dw1pW+9q8rlg=
X-Google-Smtp-Source: AOwi7QDSVuZHYs3Ec+VsEPEa8NVHn0+Ua/VvpKPra6fMvaZQ1zVaKVsVuc431pCIvRSw+f2+S6Ke+hmd7R45yc30no0=
X-Received: by 10.101.86.196 with SMTP id w4mr4106884pgs.341.1506003806244;
	Thu, 21 Sep 2017 07:23:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 21 Sep 2017 07:22:55 -0700 (PDT)
In-Reply-To: <20170919182734.15741-3-sgw@linux.intel.com>
References: <20170919182734.15741-1-sgw@linux.intel.com>
	<20170919182734.15741-3-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Sep 2017 07:22:55 -0700
Message-ID: <CAMKF1soAwV66YPAUKotL4XESZN2X28k4fXbpkJc6nEWZtB5CLg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] wic: remove systemd-boot for x32
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
X-List-Received-Date: Thu, 21 Sep 2017 14:23:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 19, 2017 at 11:27 AM, Saul Wold <sgw@linux.intel.com> wrote:
> Currently systemd-boot actually incorporates libgcc, since the
> systemd-boot needs to be built with 64bit instructions it can not
> use the x32 based libgcc.
>
> Use the new override to ensure it gets overriden, linux-gnux32 could
> not be used because x86-64 has higher priority.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image_types_wic.bbclass | 1 +
>  meta/recipes-core/meta/wic-tools.bb  | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index b825b47ce5..b9503c69c5 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -45,6 +45,7 @@ WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native cdrtools-native bt
>  WKS_FILE_DEPENDS_BOOTLOADERS = ""
>  WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
>  WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"
> +WKS_FILE_DEPENDS_BOOTLOADERS_x86_x32 = "syslinux grub-efi"

this will confuse with x86 ovrride. shouldnt this be x86-32 ?

>
>  WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
>
> diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
> index 57dd37a440..09eb409e87 100644
> --- a/meta/recipes-core/meta/wic-tools.bb
> +++ b/meta/recipes-core/meta/wic-tools.bb
> @@ -10,6 +10,7 @@ DEPENDS = "\
>             "
>  DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
>  DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
> +DEPENDS_append_x86-x32 = " syslinux grub-efi"
>
>  INHIBIT_DEFAULT_DEPS = "1"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

