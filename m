Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E20B2606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 09:12:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5I9CDbW013973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 02:12:14 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 18 Jun 2015 02:12:13 -0700
Message-ID: <55828B6C.7080600@windriver.com>
Date: Thu, 18 Jun 2015 17:12:12 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][v4] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Thu, 18 Jun 2015 09:12:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-R

On 2015年06月03日 09:24, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> AM_CFLAGS in Makefile includes -D_FORTIFY_SOURCE=2 which will lead
> to building failure when DEBUG_BUILD is 1.
> Cancel the definition of _FORTIFY_SOURCE by passing -U_FORTIFY_SOURCE
> via CFLAGS
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index bdb4fed..dfe8902 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -13,6 +13,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branc
>
>   S = "${WORKDIR}/git"
>
> +CFLAGS += "-U_FORTIFY_SOURCE"
> +
>   do_install() {
>       install -d ${D}${bindir}
>       install -m 0755 mmc ${D}${bindir}
>

-- 
Best Reagrds,
Roy | RongQing Li

