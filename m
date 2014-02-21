Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D59B36E9AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 18:28:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Feb 2014 10:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,520,1389772800"; d="scan'208";a="459584478"
Received: from unknown (HELO [10.255.14.1]) ([10.255.14.1])
	by orsmga001.jf.intel.com with ESMTP; 21 Feb 2014 10:28:15 -0800
Message-ID: <53079ABF.2090204@linux.intel.com>
Date: Fri, 21 Feb 2014 10:28:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>
In-Reply-To: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>
Subject: Re: [PATCH] x264: SPE is not compatible with Altivec
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
X-List-Received-Date: Fri, 21 Feb 2014 18:28:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/21/2014 05:56 AM, David Nyström wrote:
> Signed-off-by: David Nyström <david.c.nystrom@gmail.com>
> ---
>   meta/recipes-multimedia/x264/x264_git.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
> index 5ebf885..782c26e 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -23,6 +23,7 @@ inherit lib_package pkgconfig
>   X264_DISABLE_ASM = ""
>   X264_DISABLE_ASM_armv4 = "--disable-asm"
>   X264_DISABLE_ASM_armv5 = "--disable-asm"
> +X264_DISABLE_ASM_e500v2 = "--disable-asm"
>
I think that this change really belongs in the e500v2 BSP, it's not 
generic enough to include in core.

Thanks
	Sau!


>   EXTRA_OECONF = '--prefix=${prefix} \
>                   --host=${HOST_SYS} \
>

