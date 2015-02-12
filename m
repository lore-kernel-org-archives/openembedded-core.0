Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6828462252
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:27:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1C1R6hY006023
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Feb 2015 17:27:06 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 11 Feb 2015 17:27:06 -0800
Message-ID: <54DC0167.6070904@windriver.com>
Date: Thu, 12 Feb 2015 09:27:03 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
References: <cover.1423649385.git.Chong.Lu@windriver.com>
	<9f72fbe11fba8d12216ff3ebceec36a12124e355.1423649385.git.Chong.Lu@windriver.com>
In-Reply-To: <9f72fbe11fba8d12216ff3ebceec36a12124e355.1423649385.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V4 1/2] bitbake.conf: Add two variables for layer index
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
X-List-Received-Date: Thu, 12 Feb 2015 01:27:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 02/11/2015 06:12 PM, Chong Lu wrote:
> Add BITBAKE_LAYERINDEX_URL variable that bitbake-layers can use to find layer index.
> Add LAYER_FETCH_DIR variable that bitbake-layers can use to specify fetch directory.

Please ignore this one. I will change this commit log and resend one.

Best Regards
Chong

>
> [YOCTO #5348]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/conf/bitbake.conf | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d22e9e8..a1c6b70 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -549,6 +549,12 @@ SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
>   BUILD_OPTIMIZATION = "-O2 -pipe"
>   
>   ##################################################################
> +# Settings used by bitbake-layers.
> +##################################################################
> +BBLAYERS_LAYERINDEX_URL ??= "http://layers.openembedded.org/layerindex/"
> +BBLAYERS_FETCH_DIR ??= "${COREBASE}"
> +
> +##################################################################
>   # Download locations and utilities.
>   ##################################################################
>   


