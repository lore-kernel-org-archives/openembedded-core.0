Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1825E65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 01:34:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t441YnQ8027415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 May 2015 18:34:49 -0700 (PDT)
Received: from [128.224.162.142] (128.224.162.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 3 May 2015 18:34:48 -0700
Message-ID: <5546CCB7.4020804@windriver.com>
Date: Mon, 4 May 2015 09:34:47 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1429759127-1927-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1429759127-1927-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Mon, 04 May 2015 01:34:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-R

On 2015年04月23日 11:18, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Remove -D_FORTIFY_SOURCE=2 from AM_CFLAGS when DEBUG_BUILD is 1
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/mmc/mmc-utils_git.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index bdb4fed..2b61745 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -13,6 +13,9 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branc
>
>   S = "${WORKDIR}/git"
>
> +export FORITY="${@base_conditional( "DEBUG_BUILD", "1", "", "-D_FORTIFY_SOURCE=2", d )}"
> +EXTRA_OEMAKE = 'AM_CFLAGS="-D_FILE_OFFSET_BITS=64 ${FORITY}"'
> +
>   do_install() {
>       install -d ${D}${bindir}
>       install -m 0755 mmc ${D}${bindir}
>

-- 
Best Reagrds,
Roy | RongQing Li

