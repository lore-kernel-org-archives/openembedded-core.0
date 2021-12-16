Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2737EC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 14:41:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.11283.1639665676218848961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TfFp1c2e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t18so44551204wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CmPZ+BCQhQZxnrEfZw8E3MzXcEVfyWgFDm6O+Vd9tnQ=;
        b=TfFp1c2ex+qMPtpRzkd2xa/JAg5Ryz3SP+L9p18Hqgh6CeBJcKjBAVV7bj7DeO3RiR
         nYRsq1jOJCl4vi1oq88GhSIYF3tUzkwcUIl741nCabMYrZZ88mTT7c1Py9vUzu/rHBnx
         2tsTfTM+3FGPUG1xE9a3HyfKnKuWxVDWbqSaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CmPZ+BCQhQZxnrEfZw8E3MzXcEVfyWgFDm6O+Vd9tnQ=;
        b=4DHqMGNSe3amvhakQk/fPj6pwcWa8d4t9E2WaCcEGmiWHdaIJtL2zWvCd16xTcd9gC
         kESPhB8pCXMVKp9S+BWkeFumeDBxCKcSmRWRpjoPQcA5FnNLEE6u56rfymYupafqomUI
         F5PrAguKJyb3tZANEmS6MeQf9VjCY68s4RN9NVjgEPJBIgLBZWWeLWz/GTwJNMknswWK
         LxruI3kcYfzOKxu35x7E2PZ4M1Vc3TP2JSAH6kHTL4r2MhQKh69yk3xrOpP8rgYRxFRT
         VjhV5DbK5KrcEWZJvc2sdyJkF2MwfqZpgSndp8xaVSaYh/5MEslAMDLQCFfl/g0SH6z2
         PA+g==
X-Gm-Message-State: AOAM5324tbttxrtwmnrrwSPQfLpPESVVtuasAuB9tAyQigl7aqAg28B5
	3g2PEbl5/01mICI05bPmFPJLTQ==
X-Google-Smtp-Source: 
 ABdhPJxDNswP59yg0/rw0E6BlzqE1JHoqFvGU11wUVk4Hx/CupeRLgvINzv+BoT62Lij8nlc1/3PYw==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr8826270wrv.240.1639665674706;
        Thu, 16 Dec 2021 06:41:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828?
 ([2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828])
        by smtp.gmail.com with ESMTPSA id
 r8sm1585630wru.107.2021.12.16.06.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 06:41:14 -0800 (PST)
Message-ID: 
 <7945b4759d992c5539b6261f4a7f350405e640a7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][RFC PATCH v2 1/2] oe.lib.recipeutils: add
 get_layer_name method
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Dec 2021 14:41:13 +0000
In-Reply-To: 
 <AM9PR09MB4642AFAD1E3DA5F9022D3C1EA8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB4642AFAD1E3DA5F9022D3C1EA8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 14:41:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159786

On Wed, 2021-12-15 at 13:12 +0100, Konrad Weihmann wrote:
> so one can get the layer name from a filepath
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
> v2: order by path length to correctly map nested layer
> 
>  meta/lib/oe/recipeutils.py | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index a0c6974f04..557e0f9bd5 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -21,7 +21,7 @@ import glob
>  import bb.tinfoil
>  
>  from collections import OrderedDict, defaultdict
> -from bb.utils import vercmp_string
> +from bb.utils import vercmp_string, get_collection_res
>  
>  # Help us to find places to insert values
>  recipe_progression = ['SUMMARY', 'DESCRIPTION', 'AUTHOR', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
> @@ -928,6 +928,15 @@ def find_layerdir(fn):
>              return None
>      return layerdir
>  
> +def get_layer_name(fn, d):
> +    """ Get the layer name from a filename """
> +    pth = os.path.abspath(fn)
> +    collection = get_collection_res(d)
> +    # reverse ordering by length to catch nested layers
> +    for k, v in dict(sorted(collection.items(), key=lambda item: len(item[1]), reverse=True)).items():
> +        if re.match(v, pth):
> +            return k
> +    return ""
>  
>  def replace_dir_vars(path, d):
>      """Replace common directory paths with appropriate variable references (e.g. /etc becomes ${sysconfdir})"""


I suspect we should add something in bb.utils for this? I also think we should
probably do this at the bitbake level entirely, i.e. set some kind of variable
to the layername rather than having lots of metadata code trying to do it,
potentially badly?

Cheers,

Richard



