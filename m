Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 253656C102
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:03:52 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id n78so3513203itb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W6vfn8GJMudRmMR3sq4FqTgZPqreMr2S5Q7tMpu07ls=;
	b=w9Ucc95SrlyV1UY3YiYXI/Se3OVPbXCjcN+8jwHHCeR3cV7ZXAVbjI2U3n8l6wjt/I
	5pGSJbDmf8tJVaSl4EfssCkBwvX2pEW3EhAPdip9yY3Qa4jr9+YOtK5gandGw8kxBdK4
	/GzYTFigR4QjjynMmdKWri2JlLIroDfej/YJ++05w9KydZAaEEB7TOeLxRPLglh/xIBr
	RLAAkSKbi62y2rsITzYfWW5DlVre6h7QVV3Kz6XuJTbEaT8Y/8N6smx6xLKIRjZMNre5
	yNbQ8UW7JmMhquyxG8+bgIYB8dNv/QnRz10qmeGzmsWqMX3EK6yE10+cK77clEMSgWy0
	8oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W6vfn8GJMudRmMR3sq4FqTgZPqreMr2S5Q7tMpu07ls=;
	b=jKMLQaqaINVMNha7dRikjxoXI0ylV4t80CVECrTTFLqkDfe0t3JDLJPDYdvC015aAg
	So9fOK0VqrjrGIzGzrx6LPwDLXKLEFjg0/TDXehoq0W+F+GaS2CrhzLcvIqXo+GspcEz
	vTSuICi/2HhPDSlbVeEIOs6GavDSQFtBdBml3Qb3L7SGcE1szAIi1Jttk1CsloJpCEIT
	d188WED8OSMF7qj5a70lJpeACriiP8I5b0sd/ZheXLHemWzMZF5mtiAKPAOki1HvLhDX
	/YEZ0RbjG7IyoHMisQgyBFZ74nPaGSVOVXUoim7WpAEIIl09G4TcN2arQfaTdSj0cAeD
	d6hw==
X-Gm-Message-State: APjAAAXoBH48tWPxcsOI2D4j9UzEv9htTACPyqndlfoPOVri8RLSq+nT
	dRxlmVDFjVmOXQy8/TB0slnCH0SKZv5nSX/rlKqsiA==
X-Google-Smtp-Source: APXvYqwYN/d3udLH4AMeGEG7F8/KHwlfvrNvJlmTPgLG18mYMb1R1f3KL1ZSuqVaSMs5Dekf2jJ+Llj8gbmH3XdlWOM=
X-Received: by 2002:a24:52c5:: with SMTP id
	d188mr15407854itb.130.1554116634064; 
	Mon, 01 Apr 2019 04:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190328012606.18550-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190328012606.18550-1-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 11:03:43 +0000
Message-ID: <CAJTo0LbmYz0v9ce44H65+vxFffiC3wnmGNXB9XoxeR6-v0TnEQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ethtool:upgrade 4.19 -> 5.0
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
X-List-Received-Date: Mon, 01 Apr 2019 11:03:53 -0000
Content-Type: text/plain; charset="UTF-8"

 WARNING: ethtool-5.0-r0 do_patch:
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
Applying patch avoid_parallel_tests.patch
patching file configure.ac
Hunk #1 succeeded at 2 with fuzz 1.

Another patch is already on the list that doesn't have this problem,
but please fix all warnings.

Ross

On Thu, 28 Mar 2019 at 01:25, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Upgrade from ethtool_4.19.bb to ethtool_5.0.bb
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../ethtool/{ethtool_4.19.bb => ethtool_5.0.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/ethtool/{ethtool_4.19.bb => ethtool_5.0.bb} (88%)
>
> diff --git a/meta/recipes-extended/ethtool/ethtool_4.19.bb b/meta/recipes-extended/ethtool/ethtool_5.0.bb
> similarity index 88%
> rename from meta/recipes-extended/ethtool/ethtool_4.19.bb
> rename to meta/recipes-extended/ethtool/ethtool_5.0.bb
> index 74e255c24b..76cdf9c4e7 100644
> --- a/meta/recipes-extended/ethtool/ethtool_4.19.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_5.0.bb
> @@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
>             file://avoid_parallel_tests.patch \
>             "
>
> -SRC_URI[md5sum] = "a533db1d202724822c4ef297643fac12"
> -SRC_URI[sha256sum] = "e8e88f5a79c78e542cd84fee60b67dbf29cee63e4760e8d61544fea74c761ad1"
> +SRC_URI[md5sum] = "8998c9eb7e491b0aec420a807ce52ba6"
> +SRC_URI[sha256sum] = "cc53a6d4d5643f8993ef20d6b638f88d9035529a9e777e222073c3a5b9237178"
>
>  inherit autotools ptest
>  RDEPENDS_${PN}-ptest += "make"
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

