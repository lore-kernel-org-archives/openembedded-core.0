Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4837CE73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 12:06:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2SC6Ukw024548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Mar 2019 05:06:30 -0700 (PDT)
Received: from [128.224.162.190] (128.224.162.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 28 Mar 2019 05:06:30 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
	<20190327140922.109867-6-alex.kanavin@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <21d76d15-fb59-6b0c-cad6-814236b66616@windriver.com>
Date: Thu, 28 Mar 2019 20:16:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190327140922.109867-6-alex.kanavin@gmail.com>
X-Originating-IP: [128.224.162.190]
Subject: Re: [PATCH 6/8] binutils: fix upstream version check
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
X-List-Received-Date: Thu, 28 Mar 2019 12:06:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexander,

I just sent out a patch to change the PV to "2.32".
If it's 2.32, does this var still needs to be set?

Best Regards,
Chen Qi

On 03/27/2019 10:09 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-devtools/binutils/binutils-2.32.inc | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
> index 74239868151..15406441241 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.32.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
> @@ -14,6 +14,11 @@ def binutils_branch_version(d):
>       pvsplit = d.getVar('PV').split('.')
>       return pvsplit[0] + "_" + pvsplit[1]
>   
> +# Actual upstream version is 2.32 (without the .0), so we have to set
> +# UPSTREAM_VERSION_UNKNOWN to avoid the version check failure. The line can
> +# be removed when a new version of binutils is released (if the PV is then
> +# correctly set to match the upstream version tag).
> +UPSTREAM_VERSION_UNKNOWN = "1"
>   PV = "2.32.0"
>   BINUPV = "${@binutils_branch_version(d)}"
>   #BRANCH = "binutils-${BINUPV}-branch"



