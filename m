Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C8AC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 15:23:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.30216.1657553018000006030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 08:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LabMTn8z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v16so7443140wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=ddKgYZvazU7xKgYs/REjyrJz2i8Gxp6Ax2I4IMBNRwc=;
        b=LabMTn8zbgX5PxYeDpiV0YoYopBfJAeLwn+hAmKli87IIqoWr8IvBpuh1H5jk6vluK
         EuC5CBHvKeUKsk0SSvAxOCVJc6JS1Hj6ozvs98I6pvnb4NFmDZ3Bq4OxwTIGCPtJGBPF
         d+7fukM70sJyxkII7stRgZret+mZOM15xncmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=ddKgYZvazU7xKgYs/REjyrJz2i8Gxp6Ax2I4IMBNRwc=;
        b=3FseevVIBu8MFRPjVf/xcI+lwVeSZMC6gKkiTVZq0Z3zk1SWblCStAP37hI5Y1mGLk
         3bj1FaCV3fZBLvITFQQG9xNB90Dv1OOgH3SK/t0Pca5FnWdZrEPWGALe0Yc/HJu18orL
         Tvpri3PO8CB/XiDy4I0E/IGUr0svTKyrlGoSqXmfEtWKlMNZxaJbYpL+hXhZcaury1pC
         PZW0qVnpYvyOBLJegcqArkBOfdit5kOE6OZDJlbLtXAIg8fIh8nmOII58mfH7YajSE8X
         0a3UTs9b4SGb2gHleRAEF26/BbcIvBqZWYojDUnqxy+ZNumQhbY1IkdGyB3ZWl+oExSG
         LWcQ==
X-Gm-Message-State: AJIora82hoV94xnJ7ON8+NCOF746d1Jdz2o+s8dpDaQK9dyOmdXn9ij/
	FIc/Bb7MXvRujANyaDIHggk+Aw==
X-Google-Smtp-Source: 
 AGRyM1uTp5C+/vQ1M1KulT7e9/2Vmw5wpl+zwUo7PmMUv9grAKEgJs+fQml9i4S7RLvOIb7BWGW0fA==
X-Received: by 2002:a5d:5986:0:b0:21d:8779:8220 with SMTP id
 n6-20020a5d5986000000b0021d87798220mr17531781wri.165.1657553016290;
        Mon, 11 Jul 2022 08:23:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f9ee:ac79:b0a:1aa9?
 ([2001:8b0:aba:5f3c:f9ee:ac79:b0a:1aa9])
        by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c410900b003a02cbf862esm6919123wmi.13.2022.07.11.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:23:35 -0700 (PDT)
Message-ID: 
 <81ec35e85e7dd36525b92b2d3166a2162c417349.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][kirkstone][PATCH]
 cve-extra-exclusions.inc: Use conditional override
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akash.hadke@kpit.com, openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Date: Mon, 11 Jul 2022 16:23:35 +0100
In-Reply-To: <20220711150832.8360-1-akash.hadke@kpit.com>
References: <20220711150832.8360-1-akash.hadke@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 15:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167874

On Mon, 2022-07-11 at 17:08 +0200, akash hadke via
lists.openembedded.org wrote:
> Use conditional override for CVE_CHECK_IGNORE variable
> to whitelist CVEs for specific recipe.
>=20
> After including cve-extra-exclusions.inc all CVEs from
> file are getting shown in ignored list for every component even
> if that CVE is not related to it.
>=20
> This change can help to set actual ignored CVEs for
> the recipe.
>=20
> Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
> ---
>  .../distro/include/cve-extra-exclusions.inc   | 42 ++++++++++++-------
>  1 file changed, 26 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
> index 8b5f8d49b8..2f9735f700 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -19,7 +19,8 @@
>  # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-000=
6
>  # CVE is more than 20 years old with no resolution evident
>  # broken links in CVE database references make resolution impractical
> -CVE_CHECK_IGNORE +=3D "CVE-2000-0006"
> +CVE_CHECK_IGNORE:pn-strace +=3D "CVE-2000-0006"
> +CVE_CHECK_IGNORE:pn-strace-native +=3D "CVE-2000-0006"
> =20
>  # epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2005-0=
238
>  # The issue here is spoofing of domain names using characters from other=
 character sets.
> @@ -28,31 +29,35 @@ CVE_CHECK_IGNORE +=3D "CVE-2000-0006"
>  # there is unlikely ever to be a single fix to webkit or epiphany which =
addresses this
>  # problem. Ignore this CVE as there isn't any mitigation or fix or way t=
o progress this further
>  # we can seem to take.
> -CVE_CHECK_IGNORE +=3D "CVE-2005-0238"
> +CVE_CHECK_IGNORE:pn-epiphany +=3D "CVE-2005-0238"
> =20
>  # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2010-4756
>  # Issue is memory exhaustion via glob() calls, e.g. from within an ftp s=
erver
>  # Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=3D68168=
1
>  # Upstream don't see it as a security issue, ftp servers shouldn't be pa=
ssing
>  # this to libc glob. Exclude as upstream have no plans to add BSD's GLOB=
_LIMIT or similar
> -CVE_CHECK_IGNORE +=3D "CVE-2010-4756"
> +CVE_CHECK_IGNORE:pn-glibc +=3D "CVE-2010-4756"
> =20
>  # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29509
>  # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29511
>  # The encoding/xml package in go can potentially be used for security ex=
ploits if not used correctly
>  # CVE applies to a netapp product as well as flagging a general issue. W=
e don't ship anything
>  # exposing this interface in an exploitable way
> -CVE_CHECK_IGNORE +=3D "CVE-2020-29509 CVE-2020-29511"
> +CVE_CHECK_IGNORE:pn-go +=3D "CVE-2020-29509 CVE-2020-29511"
> =20
>  # db
>  # Since Oracle relicensed bdb, the open source community is slowly but s=
urely replacing bdb with
>  # supported and open source friendly alternatives. As a result these CVE=
s are unlikely to ever be fixed.
> -CVE_CHECK_IGNORE +=3D "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-201=
5-2640 CVE-2015-2654 \
> +CVE_CHECK_IGNORE:pn-db +=3D "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 C=
VE-2015-2640 CVE-2015-2654 \
> +CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CV=
E-2015-4776 CVE-2015-4777 \
> +CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CV=
E-2015-4783 CVE-2015-4784 \
> +CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CV=
E-2015-4790 CVE-2016-0682 \
> +CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
> +CVE_CHECK_IGNORE:pn-db-native +=3D "CVE-2015-2583 CVE-2015-2624 CVE-2015=
-2626 CVE-2015-2640 CVE-2015-2654 \
>  CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CV=
E-2015-4776 CVE-2015-4777 \
>  CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CV=
E-2015-4783 CVE-2015-4784 \
>  CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CV=
E-2015-4790 CVE-2016-0682 \
>  CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
> -
> =20
>  #
>  # Kernel CVEs, e.g. linux-yocto*
> @@ -66,23 +71,23 @@ CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-34=
18 CVE-2020-2981"
>  # welcome than and then entries can likely be removed from here.
>  #
>  # 1999-2010
> -CVE_CHECK_IGNORE +=3D "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-200=
7-2764 CVE-2007-4998 CVE-2008-2544 \
> +CVE_CHECK_IGNORE:pn-linux-yocto +=3D "CVE-1999-0524 CVE-1999-0656 CVE-20=
06-2932 CVE-2007-2764 CVE-2007-4998 CVE-2008-2544 \
>                       CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
>  # 2011-2017
> -CVE_CHECK_IGNORE +=3D "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-201=
6-0774 CVE-2016-3695 CVE-2016-3699 \
> +CVE_CHECK_IGNORE:pn-linux-yocto +=3D "CVE-2011-0640 CVE-2014-2648 CVE-20=
14-8171 CVE-2016-0774 CVE-2016-3695 CVE-2016-3699 \
>                       CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE=
-2017-6264"
>  # 2018
> -CVE_CHECK_IGNORE +=3D "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CV=
E-2018-10882 CVE-2018-10901 CVE-2018-10902 \
> +CVE_CHECK_IGNORE:pn-linux-yocto +=3D "CVE-2018-1000026 CVE-2018-10840 CV=
E-2018-10876 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
>                       CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-20=
18-5873 CVE-2018-6559"
>  # 2019
> -CVE_CHECK_IGNORE +=3D "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-=
2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
> +CVE_CHECK_IGNORE:pn-linux-yocto +=3D "CVE-2019-10126 CVE-2019-14899 CVE-=
2019-18910 CVE-2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
>  # 2020
> -CVE_CHECK_IGNORE +=3D "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-=
2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
> +CVE_CHECK_IGNORE:pn-linux-yocto +=3D "CVE-2020-10732 CVE-2020-10742 CVE-=
2020-16119 CVE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2=
020-8834"
>  # 2021
> -CVE_CHECK_IGNORE +=3D "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-=
2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
> +CVE_CHECK_IGNORE:pn-linux-yocto +=3D "CVE-2021-20194 CVE-2021-20226 CVE-=
2021-20265 CVE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
>                       CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-=
4202 CVE-2021-44879 CVE-2021-45402"
>  # 2022
> -CVE_CHECK_IGNORE +=3D "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-202=
2-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
> +CVE_CHECK_IGNORE:pn-linux-yocto +=3D "CVE-2022-0185 CVE-2022-0264 CVE-20=
22-0286 CVE-2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
>                       CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-=
0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
>                       CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-2022-=
1015 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
>                       CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-202=
2-24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
> @@ -95,19 +100,24 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-0185 CVE-2022-0264 C=
VE-2022-0286 CVE-2022-0330 CVE
>  # There was a proposed patch https://lists.gnu.org/archive/html/qemu-dev=
el/2021-02/msg06098.html
>  # qemu maintainers say the patch is incorrect and should not be applied
>  # Ignore from OE's perspectivee as the issue is of low impact, at worst =
sitting in an infinite loop rather than exploitable
> -CVE_CHECK_IGNORE +=3D "CVE-2021-20255"
> +CVE_CHECK_IGNORE:pn-qemu +=3D "CVE-2021-20255"
> +CVE_CHECK_IGNORE:pn-qemu-native +=3D "CVE-2021-20255"
> +CVE_CHECK_IGNORE:pn-qemu-system-native +=3D "CVE-2021-20255"
> =20
>  # qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2019-12067
>  # There was a proposed patch but rejected by upstream qemu. It is unclea=
r if the issue can
>  # still be reproduced or where exactly any bug is.
>  # Ignore from OE's perspective as we'll pick up any fix when upstream ac=
cepts one.
> -CVE_CHECK_IGNORE +=3D "CVE-2019-12067"
> +CVE_CHECK_IGNORE:pn-qemu +=3D "CVE-2019-12067"
> +CVE_CHECK_IGNORE:pn-qemu-native +=3D "CVE-2019-12067"
> +CVE_CHECK_IGNORE:pn-qemu-system-native +=3D "CVE-2019-12067"

I don't think we should do this. There are nativesdk and some native
variants missing here and it will be a maintenance nightmare.

Cheers,

Richard


