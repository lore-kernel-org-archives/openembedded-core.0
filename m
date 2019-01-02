Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6EA5607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 18:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x02Id41Y009322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Jan 2019 10:39:05 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.20.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 2 Jan 2019 10:39:04 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jan 2019 13:39:03 -0500
Message-ID: <25783268.MQFnVprAOB@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <1545320094-21504-1-git-send-email-mark.asselstine@windriver.com>
References: <1545320094-21504-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] man-pages: use alternatives to resolve crypt.3 conflict
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
X-List-Received-Date: Wed, 02 Jan 2019 18:39:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, December 20, 2018 10:34:54 AM EST Mark Asselstine wrote:
> From: mark asselstine <masselst@yow-cube2.wrs.com>
> 
> To fix:
> 
>   Error: Transaction check error:
>     file /usr/share/man/man3/crypt.3 conflicts between attempted installs
>     of libcrypt-doc-4.4.1-r0.core2_64 and man-pages-4.16-r0.core2_64
> 
> This issue came about after commit 59be9254df9f [libxcrypt: Upgrade to
> 4.4.1 release].
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---

This issue is still persisting. Any reason for this not being picked up yet?

Mark

>  meta/recipes-extended/man-pages/man-pages_4.16.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/man-pages/man-pages_4.16.bb
> b/meta/recipes-extended/man-pages/man-pages_4.16.bb index a64587c..1f14c89
> 100644
> --- a/meta/recipes-extended/man-pages/man-pages_4.16.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_4.16.bb
> @@ -31,6 +31,7 @@ FILES_${PN} = "${mandir}/*"
>  inherit update-alternatives
> 
>  ALTERNATIVE_PRIORITY = "100"
> -ALTERNATIVE_${PN} = "passwd.5 getspnam.3"
> +ALTERNATIVE_${PN} = "passwd.5 getspnam.3 crypt.3"
>  ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
>  ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
> +ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"





