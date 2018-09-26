Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by mail.openembedded.org (Postfix) with ESMTP id D7706795FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:26:04 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id p125-v6so4360146oic.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kbyhekN5HzX9673VZDIxY3B8Nt8/JIziIVwOETIx3Dc=;
	b=gLIwDS4PCmiJhH7YJsQJPA6FjaLWNo7vTsSnjhshRaSW70s/V1zeY4TCukpLLwBot1
	1QEEM1vbe+ZZoaxZvbp1FeQ/ImcRkCB3GQhdOHpYli0gMcts9y2V4cISq8Qs7Qqt94SY
	yFd4/LrTwl8I7ci9rC0+Gtdj7op8h7ldWeXVcKz1HeTzlJ+LfG93vrpkc5/ElrM+dR/s
	mdJuUi+W5Q/1fIPKg3o9vCnZ5GrnxWueIuwwn1TvHEgzYf/2oGtmO1aGOqQj29OJ6SGM
	Yp6HNjgOH3yDeC2JXCJvlCAfllI4zESOypomLnXdM9IyqB95AA/vRPmKQJokygWXSDz/
	IJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kbyhekN5HzX9673VZDIxY3B8Nt8/JIziIVwOETIx3Dc=;
	b=jVm5v13ZKxAaxsKw4An1QlGTM5qjseVyP+h5+eWCRdVQDyyUDu5fNzxNFCqxmsFnnv
	3SdcR5WQ5izbSRXYcUcEcS+l9kZf7NsjqQE/jGABX9aKxvS5eHRz/tYf4Gb9NmRX8Iar
	NFMzTUhxLfW70bq8m0gdnoF/wkP7+FWIjRMr5OoknMlf51pYJ84/SEP6HP0poZ5M0iin
	GZxKKnMYl4nZqkAyEBbI4bGqQ4rS2B96T1s23JIzBjnVp3DYQOBgWXV+bAm27hBr4hpg
	01jSl77R860xeHD9gIR7g6hAaP2kr8AI9u6BS9G/kB99GZ7FVmgWZUTOtZyHuypO1YTB
	6GdA==
X-Gm-Message-State: ABuFfojneZpVCLjNQKCQ/CRkivo91dzwUjs+cExD1Xa8N91Q0dkgR0BE
	HslynjKaF5MkhpBqasqYReS5w2LjEh/x4ZTjLovCnA==
X-Google-Smtp-Source: ACcGV62HxxPCSRWEAAscaibOYL7oFYZEgwmiiBGHBRub9Zv1gSo1yUH39nQFhZ4vh46uz/5FKeceNDTFcG0RS2WhwEY=
X-Received: by 2002:aca:4e96:: with SMTP id
	c144-v6mr567923oib.55.1537968365545; 
	Wed, 26 Sep 2018 06:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180926004400.28526-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180926004400.28526-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2018 14:25:54 +0100
Message-ID: <CAJTo0LYK5iDRvBb-CCEbowD2LiE3hRRik0sP-Ba9o2OczQBZWA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] adwaita-icon-theme:upgrade to 3.30.0
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
X-List-Received-Date: Wed, 26 Sep 2018 13:26:05 -0000
Content-Type: text/plain; charset="UTF-8"

Please verify the patches apply cleanly:

WARNING: adwaita-icon-theme-3.30.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-Don-t-use-AC_CANONICAL_HOST.patch
patching file configure.ac
Hunk #1 succeeded at 3 with fuzz 2.

On Wed, 26 Sep 2018 at 01:50, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade adwaita-icon-theme from 3.28.0 to 3.30.0
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../{adwaita-icon-theme_3.28.0.bb => adwaita-icon-theme_3.30.0.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.28.0.bb => adwaita-icon-theme_3.30.0.bb} (93%)
>
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.0.bb
> similarity index 93%
> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.0.bb
> index 40dd35b..464182d 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.0.bb
> @@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>             file://0001-Run-installation-commands-as-shell-jobs.patch \
>             "
>
> -SRC_URI[md5sum] = "b25b2d82cbebf2cc9cd469457b604f2c"
> -SRC_URI[sha256sum] = "7aae8c1dffd6772fd1a21a3d365a0ea28b7c3988bdbbeafbf8742cda68242150"
> +SRC_URI[md5sum] = "5ad28b28fecde7f997f56e76a903567e"
> +SRC_URI[sha256sum] = "9106729174a3e6cc183d14f74454987f5378b46f213e698a6ab2702f70e4e64b"
>
>  do_install_append() {
>         # Build uses gtk-encode-symbolic-svg to create png versions:
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

