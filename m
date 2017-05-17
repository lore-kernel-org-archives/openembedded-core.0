Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 59D6277E6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 19:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D2B720B49;
	Wed, 17 May 2017 19:32:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AVlT8uKtRuLR; Wed, 17 May 2017 19:32:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF115204E0;
	Wed, 17 May 2017 19:32:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8003C1624C6; Wed, 17 May 2017 15:32:26 -0400 (EDT)
Date: Wed, 17 May 2017 15:32:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20170517193226.GQ28053@denix.org>
References: <1495019861-63880-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1495019861-63880-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] libx11: 1.6.4 -> 1.6.5
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
X-List-Received-Date: Wed, 17 May 2017 19:32:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please make it a diff between the versions.

On Wed, May 17, 2017 at 07:17:41PM +0800, zhengrq wrote:
> Upgrade libx11 from 1.6.4 to 1.6.5
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb | 10 ----------
>  meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb | 10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
> deleted file mode 100644
> index caa95fb..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require libx11.inc
> -inherit gettext
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -SRC_URI += "file://disable_tests.patch \
> -           "
> -
> -SRC_URI[md5sum] = "6d54227082f3aa2c596f0b3a3fbb9175"
> -SRC_URI[sha256sum] = "b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441"
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> new file mode 100644
> index 0000000..71cbf67
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> @@ -0,0 +1,10 @@
> +require libx11.inc
> +inherit gettext
> +
> +BBCLASSEXTEND = "native nativesdk"
> +           "
> +
> +SRC_URI[md5sum] = "0f618db70c4054ca67cee0cc156a4255"
> +SRC_URI[sha256sum] = "4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d"
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

