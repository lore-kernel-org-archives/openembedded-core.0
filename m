Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7497B71AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:41:04 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id x86so5001347ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=k+zru5kmxaBoGa2l0dCt6f3rpbk2emDXfC6qTfXFh6I=;
	b=BbTT3X3Igct970kzk4tGkMbr2vkT5uwD3gj0NGTyZrgbM0opaHrlY3/XxyZm39uXT+
	9xLA+ylgeG2JEXZfldPz///yEyuG8aX2NEWSFU9nu4IZXd7BS+5wmz4eRy69FtywymvH
	4SZ2EpwXmMTWnuHww+SoQEcn3be3RCz1k4WXUtBgVCFTcuRUI4TbAG+eSdIEEMNi4ktH
	ZV4+T2kDZFouAemsDakP3ckFatUSzvaoqkdTtnZpMRRN/VVhXVe6JGknKVHLDA2cauxp
	3ACpP9iwr7Elh/MBIZAZQW11/655N0mZ4Ja/PA2InVssu16s1aNn8rDv360q9WspCdr+
	XKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=k+zru5kmxaBoGa2l0dCt6f3rpbk2emDXfC6qTfXFh6I=;
	b=MkPz6RAtD5LAMCUbAq74AuD3mPU6XUygQ7lsC+P2+xPe4vvzVV/+pRfFc2P67HGIxZ
	42XLy99+n5Jyp0yZk6qLbSgqs9vHbFuQ2wp1tXdqUakZf4SXCiV3sezreHKBzoSezdyT
	g12+cMoJpZCD2VRmilW+CpwBDRGqmxWG9+xt0wRK7oZ0xPVot4tc95Bu5gEMaf+Nh3dF
	mmVucudUwqhCsFIu0GAREX1kAG0f3aaqHDungQBrc6hXbiyCK2Ke0mXQYkefO/B0Oc9i
	+duXR/dNjpPjG6XAygVHU3yo87B2L36ZGBPPJXRsb+R1H4lWl8KfOD0VNwUES7muY0Lt
	QweA==
X-Gm-Message-State: AN3rC/7ePvoVhUpo6POqu+8v5+9Du8A0dsgKPsvurRhSTEL/Jvy5rK93
	NdbE5dJ+V5QSQFY1h40=
X-Received: by 10.99.120.74 with SMTP id t71mr3881396pgc.184.1492620065175;
	Wed, 19 Apr 2017 09:41:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	r67sm5562839pfb.125.2017.04.19.09.41.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 09:41:04 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170418195705.9691-1-michael.davis@essvote.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <662a1932-0eef-926e-727e-d92a7d310893@gmail.com>
Date: Wed, 19 Apr 2017 09:41:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170418195705.9691-1-michael.davis@essvote.com>
Subject: Re: [morty][PATCH] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Wed, 19 Apr 2017 16:41:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/18/2017 12:57 PM, Davis, Michael wrote:
> From: Choong YinThong <yin.thong.choong@intel.com>
>
> fedorahosted.org was retired on March 1st, 2017. This is to
> update the SRC_URI to point to github.com.
> Update the ${PN} to ${BPN} in order to pass the autobuilder
> mulitlib enable configuration.
>
> [YOCTO #11226]
in staging
Thanks,
Armin
>
> Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> index 5f1a601..5bd3381 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Rotates, compresses, removes and mails system log files"
>   SECTION = "console/utils"
> -HOMEPAGE = "https://fedorahosted.org/logrotate/"
> +HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
>   LICENSE = "GPLv2"
>   
>   # TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
> @@ -10,14 +10,23 @@ DEPENDS="coreutils popt"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>   
> -SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
> +# When updating logrotate to latest upstream, SRC_URI should point to
> +# a proper release tarball from https://github.com/logrotate/logrotate/releases
> +# and we have to take the snapshot for now because there is no such
> +# tarball available for 3.9.1.
> +
> +S = "${WORKDIR}/${BPN}-r3-9-1"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
> +
> +SRC_URI = "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
>              file://act-as-mv-when-rotate.patch \
>              file://update-the-manual.patch \
>              file://disable-check-different-filesystems.patch \
>               "
>   
> -SRC_URI[md5sum] = "4492b145b6d542e4a2f41e77fa199ab0"
> -SRC_URI[sha256sum] = "022769e3288c80981559a8421703c88e8438b447235e36dd3c8e97cd94c52545"
> +SRC_URI[md5sum] = "8572b7c2cf9ade09a8a8e10098500fb3"
> +SRC_URI[sha256sum] = "5bf8e478c428e7744fefa465118f8296e7e771c981fb6dffb7527856a0ea3617"
>   
>   PACKAGECONFIG ?= "\
>       ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \


