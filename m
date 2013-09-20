Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 404C661118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 23:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8KNNLnx016356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 16:23:21 -0700 (PDT)
Received: from [128.224.22.210] (128.224.22.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 20 Sep 2013 16:23:20 -0700
Message-ID: <523CD8E6.5030302@windriver.com>
Date: Fri, 20 Sep 2013 19:23:18 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<086c32308bdd8d212afe0c8fa4e614a2617fc4ba.1377792006.git.Martin.Jansa@gmail.com>
In-Reply-To: <086c32308bdd8d212afe0c8fa4e614a2617fc4ba.1377792006.git.Martin.Jansa@gmail.com>
X-Originating-IP: [128.224.22.210]
Subject: Re: [WIP][PATCH 11/20] wget: Add dependency on libpcre
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
X-List-Received-Date: Fri, 20 Sep 2013 23:23:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-29 12:02 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-extended/wget/wget.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> index de9b620..7af55c4 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
>   SECTION = "console/network"
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -DEPENDS = "openssl zlib"
> +DEPENDS = "openssl zlib libpcre"
>
>   INC_PR = "r16"
>
>


I haven't looked at the other patches yet but this seems
to be valid since my image construction failed with:

Computing transaction...error: Can't install wget-1.14-r16.0.0@core2: no 
package provides libpcre >= 8.33

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

