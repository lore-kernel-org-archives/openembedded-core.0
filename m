Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA5C60116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:49:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0IGn6HA028853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jan 2016 08:49:06 -0800 (PST)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 08:49:06 -0800
To: <openembedded-core@lists.openembedded.org>, Otavio Salvador
	<otavio@ossystems.com.br>
References: <1453130337-8044-1-git-send-email-otavio@ossystems.com.br>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <569D1781.200@windriver.com>
Date: Mon, 18 Jan 2016 11:49:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453130337-8044-1-git-send-email-otavio@ossystems.com.br>
X-Originating-IP: [128.224.56.84]
Subject: Re: [PATCH] slang: Add dependency on ncorses
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
X-List-Received-Date: Mon, 18 Jan 2016 16:49:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please fix typo in shortlog:

s/ncorses/ncurses/

../Randy
On 2016-01-18 10:18 AM, Otavio Salvador wrote:
> Slang links over ncurses' terminal information library thus it
> requires it to be available for build.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>   meta/recipes-extended/slang/slang_2.2.4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
> index bfaa9a5..237e9f2 100644
> --- a/meta/recipes-extended/slang/slang_2.2.4.bb
> +++ b/meta/recipes-extended/slang/slang_2.2.4.bb
> @@ -9,7 +9,7 @@ to recode S-Lang procedures in C if you need to."
>
>   HOMEPAGE = "http://www.jedsoft.org/slang/"
>   SECTION = "libs"
> -DEPENDS = "pcre"
> +DEPENDS = "pcre ncurses"
>   PR = "r12"
>
>   LICENSE = "GPLv2"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

