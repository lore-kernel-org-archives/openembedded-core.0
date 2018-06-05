Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95E7371993
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 07:26:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w557Pt15012803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 00:26:11 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 5 Jun 2018 00:25:44 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1526632968-107460-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <ca814488-7ba1-fa34-a8dd-75362b623fc3@windriver.com>
Date: Tue, 5 Jun 2018 15:25:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1526632968-107460-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] gmp: do the multilib_header magic for gmp.h
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
X-List-Received-Date: Tue, 05 Jun 2018 07:26:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping

On 05/18/2018 04:42 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Add multilib support feature for this recipe
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-support/gmp/gmp.inc      | 2 +-
>   meta/recipes-support/gmp/gmp_6.1.2.bb | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
> index abac8cf..948b892 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -3,7 +3,7 @@ DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operati
>   HOMEPAGE = "http://gmplib.org/"
>   SECTION = "devel"
>   
> -inherit autotools texinfo
> +inherit autotools texinfo multilib_header
>   
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
> diff --git a/meta/recipes-support/gmp/gmp_6.1.2.bb b/meta/recipes-support/gmp/gmp_6.1.2.bb
> index b008710..c745dbb 100644
> --- a/meta/recipes-support/gmp/gmp_6.1.2.bb
> +++ b/meta/recipes-support/gmp/gmp_6.1.2.bb
> @@ -25,6 +25,10 @@ EXTRA_OECONF_mipsarchr6_append = " --disable-assembly"
>   PACKAGES =+ "libgmpxx"
>   FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
>   
> +do_install_append() {
> +	oe_multilib_header gmp.h
> +}
> +
>   do_install_prepend_class-target() {
>           sed -i \
>           -e "s|--sysroot=${STAGING_DIR_HOST}||g" \

-- 
BRs

Sandy(Li Changqing)
+861084778653


