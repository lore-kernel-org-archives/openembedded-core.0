Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A58DC70A7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 01:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t511bPIf015622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 May 2015 18:37:25 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 31 May 2015 18:37:24 -0700
Message-ID: <556BB753.10808@windriver.com>
Date: Mon, 1 Jun 2015 09:37:23 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1431476040-29583-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1431476040-29583-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][V3] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Mon, 01 Jun 2015 01:37:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年05月13日 08:14, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> AM_CFLAGS in Makefile includes -D_FORTIFY_SOURCE=2 which will lead
> to building failure when DEBUG_BUILD is 1.
> So Redefine AM_CFLAGS, input it from the environment to overrides
> variable in makefile
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index bdb4fed..d6d77d9 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -11,6 +11,8 @@ PV = "0.1"
>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${BRANCH} \
>              file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
>
> +EXTRA_OEMAKE = 'AM_CFLAGS="-D_FILE_OFFSET_BITS=64"'
> +
>   S = "${WORKDIR}/git"
>
>   do_install() {
>

-- 
Best Reagrds,
Roy | RongQing Li

