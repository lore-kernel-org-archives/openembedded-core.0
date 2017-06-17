Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5C187846F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jun 2017 01:12:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 70so7595115wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cXcaC2cnvXHc3FPECPlACqylcK4BzVtuwCie1Dg8O04=;
	b=ncHPAwIewOjpaNl1H4DJ8q/b8EdDW/W2Qp5RCjNBd0DXNyzYvDPsZFfkBAVnWm2uvk
	uBLDz47H7ZJ1y6JhPMJ0y/apA3ZGPQYNXv5rrsAtaeiVLANlb51clnH6uhpXIJw091ZH
	OuCO/MNnOOub5C+cCRrlruIBgqYAB56GbUXGTtcpgPPzkSelvwGOZxsof5zRV34XvEI+
	edVQSZ39m6dNdNjRFgLPKdvsaYbGHJyxjqVyh976TbZb+Wwf4zaj0E7g8U+9CbPCEDCO
	S2asHztmjbLVkHw3zH4C9v67JPBOeEx4wJrSnzbwJndJ4EJ5Ktmn+2TNakbJicOQ4EDt
	Pd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cXcaC2cnvXHc3FPECPlACqylcK4BzVtuwCie1Dg8O04=;
	b=PKFqMCNTzaNKXYJHor3Gax/DucU/ydJkrS/GxJXCcl67102IhonZqHSY8GdAbOxg2Q
	W9Jcy1OeN/P27wbFZ37TDNxCHKJcwIK1fwdWskJyl3+FJ9ckdDGnHRxriTeqa3rwe59A
	N6VLwr2r1ITGYyKgDs+QSF9GpSZH4XgjegZ5go6XDILmRbz7s72CfEStPit14t3GHtw1
	7N/mKtpueCwjUSfGZgkGG/kGIitj/HDAq61J7gKOrt8b9JOuohCQCPhi+6CutSDklS3y
	pavtEoB0oM5bny6VnOPrXdjykWT4uvgMW6HSB/jPRe7VfUztSEmB0UG1AEIrAm8zeEoP
	67wA==
X-Gm-Message-State: AKS2vOxoJ+kkLqAzzXx+5hNrRbILh1cI/vxOiPhCoE0qc6UF0jb1NZPV
	kLsnuSr6FgumiLAKmZ1HuxoLXXSqEA==
X-Received: by 10.80.131.6 with SMTP id 6mr8883869edh.178.1497661936610; Fri,
	16 Jun 2017 18:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Fri, 16 Jun 2017 18:11:45 -0700 (PDT)
In-Reply-To: <1497640847-9108-1-git-send-email-ross.burton@intel.com>
References: <1497640847-9108-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Jun 2017 18:11:45 -0700
Message-ID: <CAMKF1so4Lz2T5Gc1NNCWKLAjV9N_BVEdJFDUxKFqTAzdUyNAfw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] epiphany: remove unused intltool build-dependency
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
X-List-Received-Date: Sat, 17 Jun 2017 01:12:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 16, 2017 at 12:20 PM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-gnome/epiphany/epiphany_3.24.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
> index b51f54f..77c1933 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
>            gsettings-desktop-schemas gnome-desktop3 libxml2-native \
> -          intltool-native glib-2.0 glib-2.0-native json-glib"
> +          glib-2.0 glib-2.0-native json-glib"
>

is https://bugzilla.yoctoproject.org/show_bug.cgi?id=9374
no more relevant then ?

>  inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
>  REQUIRED_DISTRO_FEATURES = "x11"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

