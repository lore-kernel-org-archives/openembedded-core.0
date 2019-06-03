Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38B2D7DD6D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 09:01:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5390aMI002159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jun 2019 02:00:47 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 3 Jun 2019 02:00:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <1557890276-2264-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <b0f72b51-152c-b8b2-0941-9f0ccf406b8f@windriver.com>
Date: Mon, 3 Jun 2019 17:00:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557890276-2264-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] grub/grub-efi: fix unrecognized command line option '-pipe-Wno-error' in CFLAGS
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
X-List-Received-Date: Mon, 03 Jun 2019 09:01:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping

//Hongxu
On 5/15/19 11:17 AM, Hongxu Jia wrote:
> Since commit [330fc83 grub: Use -Wno-error instead of doing this
> on a per-warning basis] applied in oe-core, it missed a space
> in append.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-bsp/grub/grub2.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 7d8c280..bac2d7d 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -60,7 +60,7 @@ BUILD_CFLAGS = ""
>   BUILD_CXXFLAGS = ""
>   BUILD_LDFLAGS = ""
>   
> -CFLAGS_append = "-Wno-error"
> +CFLAGS_append = " -Wno-error"
>   
>   do_configure_prepend() {
>   	# The grub2 configure script uses variables such as TARGET_CFLAGS etc



