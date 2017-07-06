Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id C440D71C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 13:20:55 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id g21so327795lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dNz1KTgNWk42qYCylvBEXKR6sjUKPHdzrNNdR5+o33I=;
	b=l7saB9MJx9pE3BkCO49wG1kFVuMIHLTGISKxvz0+WlfFT2ZUoGSsNgHk7f5HYZJ5pw
	jXOnWm3Hb0FGkgfxYT2ATrWYEp+jl1pbdRVQnddsscLrmZTAjrtjvwNrmlBl72tXwpTb
	wfmpHWJZhr0Ok71fxBCi2oZa86HJexRDYyw/fIbuH6rPckwSPQkqBNsgYN94VFPBzszR
	/DxNHJquiqCnSmI3d4i98VGeqf/Vy0evF0Z5u07lnl6y6hdpcVhm0Bho1FtBoP4QQ93/
	DPxKTWzYirQxNMdOGa41IQeBLJvab/K8ytmzbulkL6UCZO8/gm89B/VJ7zH0vOCCnjqi
	zeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dNz1KTgNWk42qYCylvBEXKR6sjUKPHdzrNNdR5+o33I=;
	b=JeZ1AgtzYcRyYMg7/glrdl90m3pZIApE3J0WG4trEYCu4FTeTBCSbsQtkhh1r9/6aR
	VAMwg77QHanheoTj3I0YyWOBn3TxONotDcM2B6/gEyWz1mdQSkNTcfRkLpWHOtNJ4x13
	gcsykSaGKFANAgFjmpX1Yw7nSDc0iVjibgoVNmgr6GPF08i3JNHL/IbKV8AJ1Jr7uzqz
	rWKXfArJF5xbWY2/5BrIPds2hsTGx4Ag8Kbm02FzaTAI7vsWnPgmF5RC5+Ur3SiXXAV3
	XZFmGJfgaBBeq4/AOaWQKOgWA1c+1xm077FeELJhesWz3PT+28tOVDVpKYV9W3RSjd1Q
	O6CQ==
X-Gm-Message-State: AKS2vOw9NXwwYNpPLD4Zwq0pWx+L+Me/uLAEfNdCjqCBciKUzJeq2PTl
	ZWdM83eeGXUd3fJe0X69IW1IPmO4tA==
X-Received: by 10.80.151.49 with SMTP id c46mr26413017edb.30.1499347256464;
	Thu, 06 Jul 2017 06:20:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Thu, 6 Jul 2017 06:20:25 -0700 (PDT)
In-Reply-To: <389044c992c3a59a17433f1fe18ba3ec702f0546.1499327365.git.jussi.kukkonen@intel.com>
References: <cover.1499327365.git.jussi.kukkonen@intel.com>
	<389044c992c3a59a17433f1fe18ba3ec702f0546.1499327365.git.jussi.kukkonen@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jul 2017 06:20:25 -0700
Message-ID: <CAMKF1sovPb1thvdedRg2jCYgBbPY+c6pkLXRoE1=exs2gmggpg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/6] assimp: Add as dependency of vulkan-demos
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
X-List-Received-Date: Thu, 06 Jul 2017 13:20:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 12:54 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Asset import library used by Sascha Willems Vulkan demos.
>

when this is merged into core please remove it from other layers
too especially. meta-oe

https://layers.openembedded.org/layerindex/branch/master/recipes/?q=assimp

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-graphics/vulkan/assimp_git.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-graphics/vulkan/assimp_git.bb
>
> diff --git a/meta/recipes-graphics/vulkan/assimp_git.bb b/meta/recipes-graphics/vulkan/assimp_git.bb
> new file mode 100644
> index 0000000..c519458
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/assimp_git.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Open Asset Import Library"
> +LICENSE = "BSD-3-Clause"
> +DEPENDS = "zlib"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271 \
> +                    file://code/Assimp.cpp;endline=41;md5=717f847b6e8f43c64cdbafcfea109923"
> +
> +SRC_URI = "git://github.com/assimp/assimp.git"
> +SRCREV = "b38ba233f530fdb103d3ede3df5126121af78b10"
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +EXTRA_OECMAKE = "-DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF"
> +FILES_${PN}-dev += "${libdir}/cmake/assimp-3.3"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

