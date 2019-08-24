Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D7BFF7F2ED
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 17:21:38 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y26so14302555qto.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 10:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UwcfEgfh2ompGQ5dK/0Cy5fqzBMsX7Rbbk6DnzMoui4=;
	b=N18Ux92dpzYMtBrHD2tIVC8d358M9BpGGP3Ia5Trtjs5SBUPFC8r1mlYbPgUJm9o9p
	kO2vPBwG0PqX3F/FlV2d0g7qJELWDFly0aN9qIBCIExVY8cuJ785qdGHqYM7zgmQJT8t
	DR6CRErcf6LDzbPKigmOY2O93mRkINI3MXBT+EgRpWgmxaQtOQZeu/jVBIY1q4qxLSIl
	LRHu8NLvf83WY+Bcfs7xHp1uRhNevKfAPFpeZxNL586y5xXgtWDhqrXRs7Bk5+Wxh+1F
	u08jp6tjrikRALdEGcB0ryW19t5Y1ODTJu22aqCKQ+jpf2X6cKMMs935KQ/CecOFxCmw
	yW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UwcfEgfh2ompGQ5dK/0Cy5fqzBMsX7Rbbk6DnzMoui4=;
	b=sIft35JLGvXm4GEV4hEwq4gTg6Uc30VcmGqycv0ckCLCifulfV18XlFHJEdyhngck7
	HKF++hZe82v+QpaslpoUYfGo4/du5Qv3nHrr+xAKC/6Cij5zJlh00du1lHnEO9kvulZ3
	32YHvkGhaRMdbRTob06AFlZJnw4v/m8K6niPnRC8vUkBAlpXELcpW46RJohP+AVbnFpT
	7WrQdyK+U/a2nNteTOJ/OcaNmsfj8vhQ+DFVKHAjkIS9bnD5OxEBIhjNuFHYTgLwxDJm
	GqftF+E3664qSMGaTqSxt3sboqbFQqKEFfE8yWO/nSGs3D8bEVyt5zwcQf23qhxoTzCj
	+oGA==
X-Gm-Message-State: APjAAAUT0WIeYAanBVZiiSP4UltmchvBUPN3ycJIozTCmYeVtMBS0/sc
	pK/nWwaQ5SpOTwJQmEbkvJbTSG5zN+Gtrxt8nq0=
X-Google-Smtp-Source: APXvYqwbCdMkH11O0ichk59ZJMIQnPlCoSpaLliflV5QMW/ItzIbobcnBXwoMVIukmhUSwdwX5SsOSk5YKmrT02P5aw=
X-Received: by 2002:ac8:7445:: with SMTP id h5mr7117599qtr.53.1566667299402;
	Sat, 24 Aug 2019 10:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-3-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1566593504-21918-3-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 10:21:12 -0700
Message-ID: <CAMKF1sp-HU_LZ-EsUn4neh8sjwXjVyoyqYmWdT-VmcMxqmv4SQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] tune-arm1176jz-s.inc: add support for arm1176jz-s CPU specific tuning
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
X-List-Received-Date: Sat, 24 Aug 2019 17:21:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 23, 2019 at 1:53 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/machine/include/tune-arm1176jz-s.inc | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-arm1176jz-s.inc
>
> diff --git a/meta/conf/machine/include/tune-arm1176jz-s.inc b/meta/conf/machine/include/tune-arm1176jz-s.inc
> new file mode 100644
> index 0000000..c741e80
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-arm1176jz-s.inc
> @@ -0,0 +1,17 @@
> +DEFAULTTUNE ?= "arm1176jzs"
> +
> +require conf/machine/include/arm/arch-armv6.inc
> +
> +TUNEVALID[arm1176jzs] = "Enable arm1176jzs specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', ' -mcpu=arm1176jz-s', '', d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', 'armv6:', '' ,d)}"
> +
> +AVAILTUNES += "arm1176jzs"
> +ARMPKGARCH_tune-arm1176jzs = "arm1176jzs"
> +TUNE_FEATURES_tune-arm1176jzs = "arm thumb arm1176jzs"
> +PACKAGE_EXTRA_ARCHS_tune-arm1176jzs = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp} arm1176jzs arm1176jzst"
> +
> +AVAILTUNES += "arm1176jzs-be"
> +ARMPKGARCH_tune-arm1176jzs-be = "${ARMPKGARCH_tune-arm1176jzs}"
> +TUNE_FEATURES_tune-arm1176jzs-be = "${TUNE_FEATURES_tune-arm1176jzs} bigendian"
> +PACKAGE_EXTRA_ARCHS_tune-arm1176jzs-be = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp} arm1176jzsb arm1176jzstb"

There is vfp variant of arm1176jzs has well
 ARM1176JZF-S, this processor includes a Vector Floating-Point (VFP)
coprocessor.

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

